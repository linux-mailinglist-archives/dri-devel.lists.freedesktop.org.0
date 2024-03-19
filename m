Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6200487FFD8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 15:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A705110FB1B;
	Tue, 19 Mar 2024 14:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5pMNsQ4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2129.outbound.protection.outlook.com [40.107.220.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93F110F91B;
 Tue, 19 Mar 2024 14:45:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY8xud1bD/QXnlTFlBUOg2htEvbpXaPV33VTVY1Idpug/E7JRM0mdx8COgGU+b/hY9z9IMsCgE4BsjW+530mrFPuhYQEckCN91wbHXyhY0tVfG984HCIxpXz2YPO15RiLVf9j9+DF29zv36n0wTT84ajjwdE35UjdALQ1KJDKvtE6sryP1FCyX2Mhlx7lt6a2U0YUg9QL3zW9HD3gr2zHGF11VX/C6v2QmW6KbNvRJkDpaP1XZ3aowfcAlJENp4rTSREP67LKnBdb1QrBYK3pCYPPmQbOFjCml4O/QwSskMNyhGwt/PanOL9Quz9+Nirj4ZzR9u5TiIZKhK9Pe38Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ8P3mUO0G2s4gA6k9QnDeuWID/05e4UukvDKp8a+yU=;
 b=iN1/EU5pr2vNCZtxGR9N6cR9VWl/gHJzNNyO7rgOsFrm6bgTroJS49wE/QpU3QLFcH9wRqUr9ulRUl2xUdz+1W+2/DgX5ONb+CsSjCN9Z4zmGPa890H50YggymHrpGl04vomvcfyJ2GjRlMh0WTHCmRH9RAy0vT5XPOq1DjiUpyIHu4QgSCOoGlBBRkL6YqiVbV34IvioxeD5GXbiCJ/7tVBATX7OnwfX6ai+rhUukhjrgaZg5JRNMhK2R9j1szKIUeUQyitXPToSgMAMnboVGtgwNLLw9OkRappETZp+Zc7vtAyuSrJaHSWV/13B7YYXdUpHuH2IE8E0R+Mq8d+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ8P3mUO0G2s4gA6k9QnDeuWID/05e4UukvDKp8a+yU=;
 b=5pMNsQ4NQYhdfTJVIcVKX4gc023CbVDOFF5/RHR+mL8TY/p8cT9j9SrMPJhXUGmUtEbhZQzSDUK+sWy1snZKpPfnx1bjEoMTvL8nDWCbsYxA2BpfPFNUxHMrfuxRn4cFQ51BT+kTS/xpGHnubJuFkd5U4tpoUoL1ob+ZOTUAqH0=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by CY8PR12MB7755.namprd12.prod.outlook.com (2603:10b6:930:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 14:45:01 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 14:45:00 +0000
Message-ID: <bffceaa0-6d08-459d-94aa-8274c0c0a4a3@amd.com>
Date: Tue, 19 Mar 2024 20:14:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: refactor code to reuse system information
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
References: <20240319142552.893674-1-sunil.khatri@amd.com>
 <5c5882f9-e1c2-46c7-82fc-5fe903ac6616@gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <5c5882f9-e1c2-46c7-82fc-5fe903ac6616@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::9) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|CY8PR12MB7755:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FBOyP8ElB3biMQga4pT8hJbNmTmqU3BwlkltCcf1dGZElSZms97QJs3wvHEW5KpZyjTourjWDo+JPSudk2g/6i75kxm1AM85AN5e3ZndVB5X9BHtPTmjPc8GKGQo9CF8MRP4667p3l4d/mLXlkBp/fM+3agTqCAnjDkS5+hYpYJYtpJ55gotT8Z17MltkBSSMGrR860QfN6CH72UydbT9X4lsfL0+3zVmO4ow8aYk55AUMtONjNJ89urQd08ttY8RPgvlZdBw07jcANYvL8iARF8kUQ8gpJHTTgT1h7N8m5+m4WkqWuAsLNONKWQonh86v3Oy4qw35QiCfvVoNtOdAVoWeDXDG/CMsfSW3hw+/ga2RgwrLAedQ2Dxm2LxLq9WPDS6QJVrl3G5Jerw1FE0HTdqDZAwxVyV22YolmEah1khSW9jFAMA2GynKb3F5x1IT96gV5Z+X71Ueg7Vg6Cmt63KxKxyuwwv1EJXyVbt5+ZzUcbbwjjLdp/385gUHVLd49bHpL+etTJkfdCDZ589mjjmbEWgLKlBB/WO110BJ8zbIlhObt3Qz6hw3JYm4MzKB6xgRGoFKbWelPkGu+z2HxQo4/pXgGFOUhrxbUwIfgcWghME1FSZ5EN6QC58YNph5t8rnsoZxgXInEwJ0jsouh+cBhWndjavfd0xt01THY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTRBRVlGb2pMU1VpYTkwVUQvRTZ3dDVwZW9PcTgvSi9ZNURCUDQ2WWIrNzBN?=
 =?utf-8?B?NUozQzNlLy9zMS9GR0dIazBHMytieXdZUTNxVURjcDZ5K0VjS21vb3lKaHkw?=
 =?utf-8?B?N2lONXJXNDIydlcvWWp2ZlEwZ2wxZE9MdXBzKy9WRXNwTDNLYzB4MGVKYzJP?=
 =?utf-8?B?b0JSemk0T0xsVUVVSmJPeTArUSswSXNHeTJzRzlmcTlBZFo2NTA4cVI0dXE0?=
 =?utf-8?B?RC95cHIvaG5mV2VwUWh6YzFBYVlCdmN6VVBtRENYeEd3ZGZtNzVPOVkrV3FO?=
 =?utf-8?B?TGJnamdpUk96ZTY0WFpXRFJKSmVmeVdwYWozU2U3TS9Jem1oNzR6Y3Jsazhz?=
 =?utf-8?B?emxTOVkxNlpwRXpSSWpKdUdUREtFQW43c05XcTFYeWlyVVc4ZU5UNWJORjJt?=
 =?utf-8?B?dVI4TEo5cUcwcThpbTg3S3djbmVYajhSV3JwT0tvNG9zSnZ4Y05yaTVZeGYz?=
 =?utf-8?B?SCszVmo4MWkzdVJISDJkdFNINTd5TjZZc2ZtQnE2VTJQM282RlJUQmdBcjNw?=
 =?utf-8?B?dEwrcVZXWm1uRVNnN2N4N0NoYjk4eEM2cHhUaXFjdEJjek1GekVpaTFxZFFr?=
 =?utf-8?B?ZjNzcmplcE40S0d1SFVlQ1loK3pVam1lQTJIam5XQ0tUQjJqZFdDWWh6ODBK?=
 =?utf-8?B?YnkvcWNQRHB4bjdJTGRMVUJOeWJEZzVGL1k5YUJ2OWVRS1VScis1M2l1dkg3?=
 =?utf-8?B?d0NTWE9QYUdONlVtODRza2R1UCtycjZEMkhLUlNJcmJTQitPaGdRS0NFcHVv?=
 =?utf-8?B?RjQ0c2VBRmxtdGR2cUtyak5ER2FkdEFiWXh1aXVLeWpzMFhTVXh1WnpLREc2?=
 =?utf-8?B?WXBkdkF1eXRHRUlFQkl3VFZoZ0JZWXErY0NEaEZkWW85TGlTMFFYSkltdnNP?=
 =?utf-8?B?c0U1aDBVVFhPUUtwcDhmS3VGKzNjSVdFbjlvdjFSUVFDZ20xRXd1R1ptT2kx?=
 =?utf-8?B?TWMxYTB2Y3d0OTQ2K3JMWFF0TzlUK21KUmNCdjIxQ05MWng1bi9XVjNCMDNF?=
 =?utf-8?B?VDRUV1JieVhsSWlHRktEdFUyUGRtNUlmODMxU0h4U3J3UzVYRjhTeEQ2Skkz?=
 =?utf-8?B?ckZsRVNUZ1p1MXY2TUFPaDh4dE9rZXg5U05NMWV6WThmNkd1dWpWZjVpUDZE?=
 =?utf-8?B?OWNTUjFVMEhjRmU2Y0lialRXV0lKWVg1aFBXdWpWQ0VRK1ZQOWZsMXZoblpI?=
 =?utf-8?B?TG5EcWNCcm5rbHJrWSs3OFhHWE1ZN3UvUHp4UHVjMHVMWnkxQlc5NUc0VmJK?=
 =?utf-8?B?VjVnVUVYQkJJNkhjN3pCTUh1Z0d3WGZJbVZQVzhoK2IzMjVrTFNjMWM4bzBo?=
 =?utf-8?B?ek1zbWZ5ajJyTnFzYytubXhEam4vOVZhV1lOd1B3a0wzcGFUaExpNEdVMzl5?=
 =?utf-8?B?MEVyY2IzRjc5Wmx0WTc5WWhhUWN5NWwwRnlxSnRraGxpRnN0Sy9JK3FvYk9W?=
 =?utf-8?B?TmhYUUtycFlPMG1qQ2RaUnM3TXk0MHlTM0pjUGFUc21ZdVR3UFdIcUR3a25z?=
 =?utf-8?B?MHNJckZhSzhTUld6SWlnWEhubFdHOGFneWUzMWIyRTUvRFh4a1FpMkRrQ2F2?=
 =?utf-8?B?eC80OVB2Z1JiUTcrbWxDNlpJMEhtMndycEhicXJXWGJkV3A3NmZOZ1JEbDJH?=
 =?utf-8?B?YjdzNWE2dzAxZXA4MUhjK2hMQmQrMHA1T0pNNk5rZ2NvMVp6MkNwWXdYbjVq?=
 =?utf-8?B?NVcrNFM0aFhtVDVqR0xQN2NSM0hldzl4WHRFUkdVRFhNOHo0Mzd1ZFNINlBV?=
 =?utf-8?B?bTB6TlZSMW03eFpDTlFuOFZzeFVieDdsRWFwbHR5OHNwaHg5V25ndlJQUjM5?=
 =?utf-8?B?aGdROWtmQy94YXhnTnpOK1FFR0hPTy9lSEhvV0t1VU5nOWVRencwcks2bmcz?=
 =?utf-8?B?a3Q5bEVnM1k4UkFrRmErR3RHa1psaXpld3BBcUl6aVg2YVFVaDQvODRZTjN4?=
 =?utf-8?B?NXB0clIvK3JJZG4weGdlNCtJbkt1cnFlVGRodDVQbFVXSDl2ZGxURVhJM2VF?=
 =?utf-8?B?UUlYUG1YbHZBNHoyZXNPekxqR3BXb2N5RkgzamRFRU5Id1lXYklLdzM2bFdv?=
 =?utf-8?B?TS9oZ2pIbFJkam5lWVBaajA0d1RXdjBYVmJ0VDNiUFZzQzJ3QUZKaWJLYnNw?=
 =?utf-8?Q?BA2WSvzXjTxdV4bC6VEsxdE8q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84500792-89eb-4a6d-f6d2-08dc4823277e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 14:45:00.5834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG8pQ7sHHbvJ1KR2OMYOu97qH/5UBJMdqzEQaZyKVynIio1W4XHXzyK3piKH3BFiW27h4IMYdEdn3Hlgr87yOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7755
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/19/2024 8:07 PM, Christian König wrote:
> Am 19.03.24 um 15:25 schrieb Sunil Khatri:
>> Refactor the code so debugfs and devcoredump can reuse
>> the common information and avoid unnecessary copy of it.
>>
>> created a new file which would be the right place to
>> hold functions which will be used between ioctl, debugfs
>> and devcoredump.
>
> Ok, taking a closer look that is certainly not a good idea.
>
> The devinfo structure was just created because somebody thought that 
> mixing all that stuff into one structure would be a good idea.
>
> We have pretty much deprecated that approach and should *really* not 
> change anything here any more.
To support the ioctl we are keeping that information same without 
changing it. The intent to add a new file is because we will have more 
information coming in this new file. Next in line is firmware 
information which is again a huge function with lot of information and 
to use that information in devcoredump and ioctl and sysfs the new file 
seems to be right idea after some discussions.
FYI: this will not be just one function in new file but more to come so 
code can be reused without copying it.
>
> Regards,
> Christian.
>
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
>>   4 files changed, 157 insertions(+), 115 deletions(-)
>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile 
>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>> index 4536c8ad0e11..05d34f4b18f5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>> @@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o 
>> amdgpu_kms.o \
>>       amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>>       amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>>       amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>> -    amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
>> +    amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o 
>> amdgpu_devinfo.o
>>     amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 9c62552bec34..0267870aa9b1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1609,4 +1609,5 @@ extern const struct attribute_group 
>> amdgpu_vram_mgr_attr_group;
>>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>   extern const struct attribute_group amdgpu_flash_attr_group;
>>   +int amdgpu_device_info(struct amdgpu_device *adev, struct 
>> drm_amdgpu_info_device *dev_info);
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>> new file mode 100644
>> index 000000000000..fdcbc1984031
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>> @@ -0,0 +1,151 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2024 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom 
>> the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>> EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>> DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>> OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>> USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + */
>> +
>> +#include "amdgpu.h"
>> +#include "amd_pcie.h"
>> +
>> +#include <drm/amdgpu_drm.h>
>> +
>> +int amdgpu_device_info(struct amdgpu_device *adev, struct 
>> drm_amdgpu_info_device *dev_info)
>> +{
>> +    int ret;
>> +    uint64_t vm_size;
>> +    uint32_t pcie_gen_mask;
>> +
>> +    if (dev_info == NULL)
>> +        return -EINVAL;
>> +
>> +    dev_info->device_id = adev->pdev->device;
>> +    dev_info->chip_rev = adev->rev_id;
>> +    dev_info->external_rev = adev->external_rev_id;
>> +    dev_info->pci_rev = adev->pdev->revision;
>> +    dev_info->family = adev->family;
>> +    dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
>> +    dev_info->num_shader_arrays_per_engine = 
>> adev->gfx.config.max_sh_per_se;
>> +    /* return all clocks in KHz */
>> +    dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>> +    if (adev->pm.dpm_enabled) {
>> +        dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, 
>> false) * 10;
>> +        dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, 
>> false) * 10;
>> +        dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) 
>> * 10;
>> +        dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true) 
>> * 10;
>> +    } else {
>> +        dev_info->max_engine_clock =
>> +            dev_info->min_engine_clock =
>> +                adev->clock.default_sclk * 10;
>> +        dev_info->max_memory_clock =
>> +            dev_info->min_memory_clock =
>> +                adev->clock.default_mclk * 10;
>> +        }
>> +    dev_info->enabled_rb_pipes_mask = 
>> adev->gfx.config.backend_enable_mask;
>> +    dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>> +        adev->gfx.config.max_shader_engines;
>> +    dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
>> +    dev_info->ids_flags = 0;
>> +    if (adev->flags & AMD_IS_APU)
>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>> +    if (adev->gfx.mcbp)
>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>> +    if (amdgpu_is_tmz(adev))
>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>> +    if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>> +
>> +    vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>> +    vm_size -= AMDGPU_VA_RESERVED_TOP;
>> +
>> +    /* Older VCE FW versions are buggy and can handle only 40bits */
>> +    if (adev->vce.fw_version && adev->vce.fw_version < 
>> AMDGPU_VCE_FW_53_45)
>> +        vm_size = min(vm_size, 1ULL << 40);
>> +
>> +    dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>> +    dev_info->virtual_address_max = min(vm_size, 
>> AMDGPU_GMC_HOLE_START);
>> +
>> +    if (vm_size > AMDGPU_GMC_HOLE_START) {
>> +        dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>> +        dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>> +    }
>> +    dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, 
>> AMDGPU_GPU_PAGE_SIZE);
>> +    dev_info->pte_fragment_size = (1 << 
>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>> +    dev_info->gart_page_size = max_t(u32, PAGE_SIZE, 
>> AMDGPU_GPU_PAGE_SIZE);
>> +    dev_info->cu_active_number = adev->gfx.cu_info.number;
>> +    dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>> +    dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>> +    memcpy(&dev_info->cu_ao_bitmap[0], 
>> &adev->gfx.cu_info.ao_cu_bitmap[0],
>> +           sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>> +    memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>> +           sizeof(dev_info->cu_bitmap));
>> +    dev_info->vram_type = adev->gmc.vram_type;
>> +    dev_info->vram_bit_width = adev->gmc.vram_width;
>> +    dev_info->vce_harvest_config = adev->vce.harvest_config;
>> +    dev_info->gc_double_offchip_lds_buf =
>> +        adev->gfx.config.double_offchip_lds_buf;
>> +    dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>> +    dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>> +    dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>> +    dev_info->num_tcc_blocks = 
>> adev->gfx.config.max_texture_channel_caches;
>> +    dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
>> +    dev_info->gs_prim_buffer_depth = 
>> adev->gfx.config.gs_prim_buffer_depth;
>> +    dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
>> +
>> +    if (adev->family >= AMDGPU_FAMILY_NV)
>> +        dev_info->pa_sc_tile_steering_override =
>> +            adev->gfx.config.pa_sc_tile_steering_override;
>> +
>> +    dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
>> +
>> +    /* Combine the chip gen mask with the platform (CPU/mobo) mask. */
>> +    pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask 
>> >> 16);
>> +    dev_info->pcie_gen = fls(pcie_gen_mask);
>> +    dev_info->pcie_num_lanes =
>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 
>> 32 :
>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 
>> 16 :
>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 
>> 12 :
>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 
>> : 1;
>> +
>> +    dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>> +    dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
>> +    dev_info->sqc_data_cache_size = 
>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>> +    dev_info->sqc_inst_cache_size = 
>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>> +    dev_info->gl1c_cache_size = 
>> adev->gfx.config.gc_gl1c_size_per_instance *
>> +                    adev->gfx.config.gc_gl1c_per_sa;
>> +    dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>> +    dev_info->mall_size = adev->gmc.mall_size;
>> +
>> +
>> +    if (adev->gfx.funcs->get_gfx_shadow_info) {
>> +        struct amdgpu_gfx_shadow_info shadow_info;
>> +
>> +        ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
>> +        if (!ret) {
>> +            dev_info->shadow_size = shadow_info.shadow_size;
>> +            dev_info->shadow_alignment = shadow_info.shadow_alignment;
>> +            dev_info->csa_size = shadow_info.csa_size;
>> +            dev_info->csa_alignment = shadow_info.csa_alignment;
>> +        }
>> +    }
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> index a66d47865e3b..c924ba14f9a4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev, 
>> void *data, struct drm_file *filp)
>>       }
>>       case AMDGPU_INFO_DEV_INFO: {
>>           struct drm_amdgpu_info_device *dev_info;
>> -        uint64_t vm_size;
>> -        uint32_t pcie_gen_mask;
>>             dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
>>           if (!dev_info)
>>               return -ENOMEM;
>>   -        dev_info->device_id = adev->pdev->device;
>> -        dev_info->chip_rev = adev->rev_id;
>> -        dev_info->external_rev = adev->external_rev_id;
>> -        dev_info->pci_rev = adev->pdev->revision;
>> -        dev_info->family = adev->family;
>> -        dev_info->num_shader_engines = 
>> adev->gfx.config.max_shader_engines;
>> -        dev_info->num_shader_arrays_per_engine = 
>> adev->gfx.config.max_sh_per_se;
>> -        /* return all clocks in KHz */
>> -        dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>> -        if (adev->pm.dpm_enabled) {
>> -            dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, 
>> false) * 10;
>> -            dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, 
>> false) * 10;
>> -            dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, 
>> true) * 10;
>> -            dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, 
>> true) * 10;
>> -        } else {
>> -            dev_info->max_engine_clock =
>> -                dev_info->min_engine_clock =
>> -                    adev->clock.default_sclk * 10;
>> -            dev_info->max_memory_clock =
>> -                dev_info->min_memory_clock =
>> -                    adev->clock.default_mclk * 10;
>> -        }
>> -        dev_info->enabled_rb_pipes_mask = 
>> adev->gfx.config.backend_enable_mask;
>> -        dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>> -            adev->gfx.config.max_shader_engines;
>> -        dev_info->num_hw_gfx_contexts = 
>> adev->gfx.config.max_hw_contexts;
>> -        dev_info->ids_flags = 0;
>> -        if (adev->flags & AMD_IS_APU)
>> -            dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>> -        if (adev->gfx.mcbp)
>> -            dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>> -        if (amdgpu_is_tmz(adev))
>> -            dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>> -        if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>> -            dev_info->ids_flags |= 
>> AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>> -
>> -        vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>> -        vm_size -= AMDGPU_VA_RESERVED_TOP;
>> -
>> -        /* Older VCE FW versions are buggy and can handle only 
>> 40bits */
>> -        if (adev->vce.fw_version &&
>> -            adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
>> -            vm_size = min(vm_size, 1ULL << 40);
>> -
>> -        dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>> -        dev_info->virtual_address_max =
>> -            min(vm_size, AMDGPU_GMC_HOLE_START);
>> -
>> -        if (vm_size > AMDGPU_GMC_HOLE_START) {
>> -            dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>> -            dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>> -        }
>> -        dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, 
>> AMDGPU_GPU_PAGE_SIZE);
>> -        dev_info->pte_fragment_size = (1 << 
>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>> -        dev_info->gart_page_size = max_t(u32, PAGE_SIZE, 
>> AMDGPU_GPU_PAGE_SIZE);
>> -        dev_info->cu_active_number = adev->gfx.cu_info.number;
>> -        dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>> -        dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>> -        memcpy(&dev_info->cu_ao_bitmap[0], 
>> &adev->gfx.cu_info.ao_cu_bitmap[0],
>> -               sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>> -        memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>> -               sizeof(dev_info->cu_bitmap));
>> -        dev_info->vram_type = adev->gmc.vram_type;
>> -        dev_info->vram_bit_width = adev->gmc.vram_width;
>> -        dev_info->vce_harvest_config = adev->vce.harvest_config;
>> -        dev_info->gc_double_offchip_lds_buf =
>> -            adev->gfx.config.double_offchip_lds_buf;
>> -        dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>> -        dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>> -        dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>> -        dev_info->num_tcc_blocks = 
>> adev->gfx.config.max_texture_channel_caches;
>> -        dev_info->gs_vgt_table_depth = 
>> adev->gfx.config.gs_vgt_table_depth;
>> -        dev_info->gs_prim_buffer_depth = 
>> adev->gfx.config.gs_prim_buffer_depth;
>> -        dev_info->max_gs_waves_per_vgt = 
>> adev->gfx.config.max_gs_threads;
>> -
>> -        if (adev->family >= AMDGPU_FAMILY_NV)
>> -            dev_info->pa_sc_tile_steering_override =
>> - adev->gfx.config.pa_sc_tile_steering_override;
>> -
>> -        dev_info->tcc_disabled_mask = 
>> adev->gfx.config.tcc_disabled_mask;
>> -
>> -        /* Combine the chip gen mask with the platform (CPU/mobo) 
>> mask. */
>> -        pcie_gen_mask = adev->pm.pcie_gen_mask & 
>> (adev->pm.pcie_gen_mask >> 16);
>> -        dev_info->pcie_gen = fls(pcie_gen_mask);
>> -        dev_info->pcie_num_lanes =
>> -            adev->pm.pcie_mlw_mask & 
>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
>> -            adev->pm.pcie_mlw_mask & 
>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
>> -            adev->pm.pcie_mlw_mask & 
>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 
>> ? 8 :
>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 
>> ? 4 :
>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 
>> ? 2 : 1;
>> -
>> -        dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>> -        dev_info->num_sqc_per_wgp = 
>> adev->gfx.config.gc_num_sqc_per_wgp;
>> -        dev_info->sqc_data_cache_size = 
>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>> -        dev_info->sqc_inst_cache_size = 
>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>> -        dev_info->gl1c_cache_size = 
>> adev->gfx.config.gc_gl1c_size_per_instance *
>> -                        adev->gfx.config.gc_gl1c_per_sa;
>> -        dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>> -        dev_info->mall_size = adev->gmc.mall_size;
>> -
>> -
>> -        if (adev->gfx.funcs->get_gfx_shadow_info) {
>> -            struct amdgpu_gfx_shadow_info shadow_info;
>> -
>> -            ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
>> -            if (!ret) {
>> -                dev_info->shadow_size = shadow_info.shadow_size;
>> -                dev_info->shadow_alignment = 
>> shadow_info.shadow_alignment;
>> -                dev_info->csa_size = shadow_info.csa_size;
>> -                dev_info->csa_alignment = shadow_info.csa_alignment;
>> -            }
>> +        ret = amdgpu_device_info(adev, dev_info);
>> +        if (ret == -EINVAL) {
>> +            kfree(dev_info);
>> +            return ret;
>>           }
>>             ret = copy_to_user(out, dev_info,
>
