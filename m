Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AAB37D43F
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 22:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691A86ECCE;
	Wed, 12 May 2021 20:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351B16E3EE;
 Wed, 12 May 2021 20:30:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWXX+3/++fkFcMDncsPbs/kkC2QJhjdjMAytE0XCxbV37/7qtL2G3LVivIR8MKjz+u0XP3t+2+zdlHRduNHmopn44snX6NzsA0OS/+EHE6Ymg/Q3bcHVevhP9yDNiH4DVFpq5kphliPkic7vlghcCWJ/ecV5Bg3FjC0p/Ww1qHwAQB8ENUbHNdeWmPjdoc8Tq4c13pB9ThbQDV1QgI6zHzg5f/93YTTjgJTpGmBO6BFw0lSVUAJP6KvwfeP7R+ukp3gztnJy78imJv2W9DS+RO/dxGkPWo2zJkjriRb2csjYtcpCrpYSLWzQDtwQleMHoYqswArlzzy3froF39E7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqvzRWVNpeNsRRakSAPZWCUyNyhTtih2dMCPchUI2Tk=;
 b=HW3RbE5uPL881w9rKQ1BGVIUS0LtH6k5nvz+A/VpqRmnJApGFszhzcmubmyfFpZj+WoiNxeyWcullc2tMDXQh4wy8iNELSRY16jOvfflCtpAA8+rwPFnz0x4gQhDdgIJ+RrG4858IrHmFAjJbqKwsHEafZ2FmZCtNeu3tbpru55ZogPrkAvwhUb8OvqfzavwWEdgl1Jd7WpPnjhbm3jWeogYoJXN4sY8ztTwV0d2ZYP8hPfTp1EPhLmtrCQMWf1LZSUSifOc3ZV6IvYx7Lty266FcESZnIX8Jq9w5W43kOEwQgL65QKKUgMvWrjwKSbgpf+Hu6rnp0qj/2BY06KmUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqvzRWVNpeNsRRakSAPZWCUyNyhTtih2dMCPchUI2Tk=;
 b=lxUpLWlJ+MVRv2jQiS1ekEL5vPyeBGRWu0C2gFSNyXlEnPKz98OX/5u2ElOlJLVajMgrNqqSpOYTpR1ItoKk8PaVvNLdq6PtsVo+Uv15kiFCJBKTwwA2Ieb8FwMXSR287w4O8WCyHZADSwhCjKuEgj+sQ5BWErTynFj5EYaYXtQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2479.namprd12.prod.outlook.com (2603:10b6:802:29::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 20:30:36 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 20:30:36 +0000
Subject: Re: [PATCH v7 09/16] drm/amdgpu: Guard against write accesses after
 device removal
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-10-andrey.grodzovsky@amd.com>
 <CADnq5_P7stZJCnE2AyrAFLrE6Gn089gJVftRKHDFj25sAkp44Q@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <0150a6d9-f502-ad21-0832-819c95cb9e7a@amd.com>
Date: Wed, 12 May 2021 16:30:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADnq5_P7stZJCnE2AyrAFLrE6Gn089gJVftRKHDFj25sAkp44Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:3876:5646:9034:63b2]
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3876:5646:9034:63b2]
 (2607:fea8:3edf:49b0:3876:5646:9034:63b2) by
 YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.32 via Frontend Transport; Wed, 12 May 2021 20:30:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d274143-1aa0-4a98-9b0a-08d91584cc67
X-MS-TrafficTypeDiagnostic: SN1PR12MB2479:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24799A0E3159A27CB44832C4EA529@SN1PR12MB2479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qNkzccrwh2s2VgKI8nF7Yy/42Bn+f9XdxCnSdCu/Voi46GDjdIX4+XhaF/GslbaT23Ny78ir0XrFnv1B3hgfUTVPjeCY5sBdT6uFLuF5Xttz5EY+2le85tFFpt+TZ7rNr2QKdFfcaBDG4aHPzv0uXgBvbr5qaje9NhbGy1F6l+w3V/9owFYDwKvxPhIROtP2VIH7HV8635jnpcHkvMmf6jgfFcGkRXuBZBbw5cZ1Vc1d22BIE25ucng2JpqXw+j35YUZvrXa54vVevUyml7M6w2iV2un0e2bs0kXCkxptouVlbko7Tng7Dv0/AVGj19qo4ZrMbKgHVJ9db2R+wP1yzn5nsY3bynVaFou2HxPqHJ1PA5My9TYKwRg3Cmav8x4etTc1U8aTNjBYzNlECTyv0O8YUyWwdOAwWULL1z858p8C7aDO7hjMk/UMUv33bNyQ29Q+eImjBVzOGLaGi4l4LDxoZcNIJLdjGxMGNbl+57WXaqS2y0rH5Lwvtbecj6Az7jlIhKrwpSV3MqsszYo+WD50hki12LxSJLodeQWZ23M/3ZrouI6DvRAqF6fX+lB4vobk/NrVImVr8xOejnzOcBy9zNbfFTpE8b0qAZeJYHXyazNfuiRejEL32dfcVzugWlL+IHFUbjkFCVqXi+gwhvab3K7z21nnI8ccgob9GpS5wCpmhO3g7p7+8ZhWtw3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(5660300002)(2906002)(6486002)(83380400001)(54906003)(30864003)(38100700002)(186003)(316002)(66556008)(66946007)(44832011)(16526019)(31686004)(53546011)(86362001)(2616005)(52116002)(8676002)(478600001)(8936002)(36756003)(31696002)(4326008)(6916009)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cDFBWjRZNGY5cXhuRVhTT0VoeGdjcGVKd3ArVXdWY3JkN1dzTUZPZVNUek43?=
 =?utf-8?B?TkJZWjJjRDRtMjZOV0dmU0RwbzJHZFZ1elZQWlFTdGJTZTYvZFZuZ1h6bnJt?=
 =?utf-8?B?N1ZIbmVqTjU0Nk56QTVucUF5ZkxpNXVyL2F4bFd1ZEpZK3ZPMktpdFI5NHh2?=
 =?utf-8?B?YlFza2c5NjU2bzkwckNLS1RSZ0N6K1FvdWFjS0s1NnduOG04S1FuQ3NYeTVx?=
 =?utf-8?B?cVRCcy9nK29uWFh0TGJmKy9lY24ySDRLc21vODNJb2sya2RqRyszWit3dzda?=
 =?utf-8?B?WkU5TlFMVjFGRGd5SEtubTVyaDJhZXhiZ01PeHM3NW82SXRtMHZ2OExOK0FW?=
 =?utf-8?B?ZnBpV1RwRGZCcjE4Z2Z5UjZuL2o5QjI0cVRGcGJ2YVJ1Rm9oR1IyRVpWT2lS?=
 =?utf-8?B?cUg2VFhXcDU1c1NJYnhnVFkyUW9HN3kvbURFT3BHUzZvNmF2SXhuZTdpRnFu?=
 =?utf-8?B?V3R3aXNoV2ZNZXh1UUdjZkNkNHFiRkpFVERGRTRTWGV1aGVVVUZzeGphVUxi?=
 =?utf-8?B?amZhbEErSG96YUxyb3UzVWE2ZWQybVkxWXFQdzhMNXFUWWxNWWlRc2E0YnFR?=
 =?utf-8?B?YS9XOW82MmxRKzFwM0lXQWNHcHFVWHdXSnlMdlZOMlhOWjBtTU8vdlRCWXJq?=
 =?utf-8?B?QnV1YWl6MDE1dGVwaHRNbkFFUk1JbW9MT0NOTmRPQnFCSGJlUGhnQ2c0VkJw?=
 =?utf-8?B?MDBMa1hBaVJDd081a05nZitZdDE1cDBleHJrczhubVp0MGJ3SEMyUk16MUp6?=
 =?utf-8?B?YkFwV3FXYVIxSTZzaWs1OWtxN1d5R00vd3ArbTVaNTVBRk9xQiswUkNmSmxS?=
 =?utf-8?B?R1FFVW5GYmQ3SnVLbHZKZVVmeGpUM3V3N3NsTjErY1psbmhOVnFvTlRxQ2tC?=
 =?utf-8?B?L0NuTU5tMG10c1N5aERLZFhVcWs1OVU5cXcwbWgya2gxOXcxSVVwN3RJbXk5?=
 =?utf-8?B?aW1NS1hRUzZnZ0hFTnMybFJwU0pXVXA1VXVNa21rMS82VTVtOVNuUjZpdDdO?=
 =?utf-8?B?RE9scnNSQ1FoMjFjQlpOVTBJTnFkYUw4TFhzZ2I1NmNhaTl3OXRjT1lLbDB1?=
 =?utf-8?B?V1k2T25oMUdRRGU5SFgyTDNhc2c2am1tVFZOQUIyUnJBU2NWbG8zRVpUVUpY?=
 =?utf-8?B?UzBLZTd5QWdwdk1Ud1ZEczd0Z3M5SHM1WTl5YUFCMWtqRS9zRCtkNHhDRVQz?=
 =?utf-8?B?RlVIRVY5bUJRVFU5SktwdGpKUkJra2lIcFJIV3pNVzBEZnV0cU9uQ0FzT013?=
 =?utf-8?B?VHFENWtOeEpJZ25wZ21wSDA3aVkzbDVDMGNUQzBWRE9lZlBkSDJrNmxkeThY?=
 =?utf-8?B?Y2dacWs5RkgzSXZIS2IxZlRpUEsvQjBGakZQbzRuNnB6VkM1Z3R3bDZQNmov?=
 =?utf-8?B?c29jb1RwY1k4MHhHNmlQa3paOVJmbkNxd1UvbTFvelRWWFMraXZSUEVkbnpw?=
 =?utf-8?B?WnlBMjhBa0FOcFl2ak9JdXdOTkNrL1I3K3FLUUJlT0ZQckZGV25wOXQ2R0NU?=
 =?utf-8?B?cHFaRVBzUjFOZW4wNlo4ZWRMRC96Y0hDdUZYMGwraENqTm9hUXJiZjZGUDFa?=
 =?utf-8?B?NEZleW53TUlhcUVPbnp1Ri96eXoxekdyZjhYZkpobHd4UStGRTdTYkVlMjM3?=
 =?utf-8?B?WitkOXh3dzhLNXpzbWtKaXZKQUlMSnljTTI0U0Fxa3hMSmQ0Nzg0Tis5ZlN4?=
 =?utf-8?B?eTc1S2EzcjNHRnBFTVpzemFtQ2pnL2lDV3pjSXc2R21LaFRKbVFhY1pLcFVW?=
 =?utf-8?B?cm5yR0M2YjR0OHhGR294ZWo0ZTUwOElqQ1huY1ZPZ3Q5Mm8xT01EeFErK3dS?=
 =?utf-8?B?UkRsVFZrdWYraGo2dmtkNk9sQWNwK0w0SnJsaU9Pck10cE81Nm5WaVZlQmlQ?=
 =?utf-8?Q?BavtQtQw+zemB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d274143-1aa0-4a98-9b0a-08d91584cc67
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 20:30:36.1012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzhxmnCFIAYqEBHePhJHLKlNj+1QeWv9LR+KqhUqNv1mNh0XHnul5DwaMXzHmWBrB6BsSwUBrl/UwGL4xf0wkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2479
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-12 4:17 p.m., Alex Deucher wrote:
> On Wed, May 12, 2021 at 10:27 AM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> This should prevent writing to memory or IO ranges possibly
>> already allocated for other uses after our device is removed.
>>
>> v5:
>> Protect more places wher memcopy_to/form_io takes place
> 
> where
> 
>> Protect IB submissions
>>
>> v6: Switch to !drm_dev_enter instead of scoping entire code
>> with brackets.
>>
>> v7:
>> Drop guard of HW ring commands emission protection since they
>> are in GART and not in MMIO.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> 
> I think you could split out the psp_fw_copy changes as a separate
> cleanup patch.  That's a nice clean up in general.  What about the SMU
> code (e.g., amd/pm/powerplay and amd/pm/swsmu)?  There are a bunch of
> shared memory areas we interact with in the driver.

Can you point me to it ? Are they VRAM and not GART ?
I searched for all memcpy_to/from_io in our code. Maybe missed some.

Andrey

> 
> Alex
> 
> 
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 +++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  9 ++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c    | 63 ++++++++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h    |  2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c    | 31 +++++++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c    | 11 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c    | 22 +++++---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     |  7 ++-
>>   drivers/gpu/drm/amd/amdgpu/psp_v11_0.c     | 44 +++++++--------
>>   drivers/gpu/drm/amd/amdgpu/psp_v12_0.c     |  8 +--
>>   drivers/gpu/drm/amd/amdgpu/psp_v3_1.c      |  8 +--
>>   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c      | 26 +++++----
>>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c      | 22 +++++---
>>   13 files changed, 168 insertions(+), 95 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index a0bff4713672..f7cca25c0fa0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -71,6 +71,8 @@
>>   #include <drm/task_barrier.h>
>>   #include <linux/pm_runtime.h>
>>
>> +#include <drm/drm_drv.h>
>> +
>>   MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>>   MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>>   MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
>> @@ -281,7 +283,10 @@ void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
>>          unsigned long flags;
>>          uint32_t hi = ~0;
>>          uint64_t last;
>> +       int idx;
>>
>> +       if (!drm_dev_enter(&adev->ddev, &idx))
>> +               return;
>>
>>   #ifdef CONFIG_64BIT
>>          last = min(pos + size, adev->gmc.visible_vram_size);
>> @@ -300,7 +305,7 @@ void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
>>                  }
>>
>>                  if (count == size)
>> -                       return;
>> +                       goto exit;
>>
>>                  pos += count;
>>                  buf += count / 4;
>> @@ -323,6 +328,9 @@ void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
>>                          *buf++ = RREG32_NO_KIQ(mmMM_DATA);
>>          }
>>          spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
>> +
>> +exit:
>> +       drm_dev_exit(idx);
>>   }
>>
>>   /*
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> index 4d32233cde92..04ba5eef1e88 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> @@ -31,6 +31,8 @@
>>   #include "amdgpu_ras.h"
>>   #include "amdgpu_xgmi.h"
>>
>> +#include <drm/drm_drv.h>
>> +
>>   /**
>>    * amdgpu_gmc_pdb0_alloc - allocate vram for pdb0
>>    *
>> @@ -151,6 +153,10 @@ int amdgpu_gmc_set_pte_pde(struct amdgpu_device *adev, void *cpu_pt_addr,
>>   {
>>          void __iomem *ptr = (void *)cpu_pt_addr;
>>          uint64_t value;
>> +       int idx;
>> +
>> +       if (!drm_dev_enter(&adev->ddev, &idx))
>> +               return 0;
>>
>>          /*
>>           * The following is for PTE only. GART does not have PDEs.
>> @@ -158,6 +164,9 @@ int amdgpu_gmc_set_pte_pde(struct amdgpu_device *adev, void *cpu_pt_addr,
>>          value = addr & 0x0000FFFFFFFFF000ULL;
>>          value |= flags;
>>          writeq(value, ptr + (gpu_page_idx * 8));
>> +
>> +       drm_dev_exit(idx);
>> +
>>          return 0;
>>   }
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>> index 9e769cf6095b..bb6afee61666 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>> @@ -25,6 +25,7 @@
>>
>>   #include <linux/firmware.h>
>>   #include <linux/dma-mapping.h>
>> +#include <drm/drm_drv.h>
>>
>>   #include "amdgpu.h"
>>   #include "amdgpu_psp.h"
>> @@ -39,6 +40,8 @@
>>   #include "amdgpu_ras.h"
>>   #include "amdgpu_securedisplay.h"
>>
>> +#include <drm/drm_drv.h>
>> +
>>   static int psp_sysfs_init(struct amdgpu_device *adev);
>>   static void psp_sysfs_fini(struct amdgpu_device *adev);
>>
>> @@ -253,7 +256,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>                     struct psp_gfx_cmd_resp *cmd, uint64_t fence_mc_addr)
>>   {
>>          int ret;
>> -       int index;
>> +       int index, idx;
>>          int timeout = 20000;
>>          bool ras_intr = false;
>>          bool skip_unsupport = false;
>> @@ -261,6 +264,9 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>          if (psp->adev->in_pci_err_recovery)
>>                  return 0;
>>
>> +       if (!drm_dev_enter(&psp->adev->ddev, &idx))
>> +               return 0;
>> +
>>          mutex_lock(&psp->mutex);
>>
>>          memset(psp->cmd_buf_mem, 0, PSP_CMD_BUFFER_SIZE);
>> @@ -271,8 +277,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>          ret = psp_ring_cmd_submit(psp, psp->cmd_buf_mc_addr, fence_mc_addr, index);
>>          if (ret) {
>>                  atomic_dec(&psp->fence_value);
>> -               mutex_unlock(&psp->mutex);
>> -               return ret;
>> +               goto exit;
>>          }
>>
>>          amdgpu_asic_invalidate_hdp(psp->adev, NULL);
>> @@ -312,8 +317,8 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>                           psp->cmd_buf_mem->cmd_id,
>>                           psp->cmd_buf_mem->resp.status);
>>                  if (!timeout) {
>> -                       mutex_unlock(&psp->mutex);
>> -                       return -EINVAL;
>> +                       ret = -EINVAL;
>> +                       goto exit;
>>                  }
>>          }
>>
>> @@ -321,8 +326,10 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>                  ucode->tmr_mc_addr_lo = psp->cmd_buf_mem->resp.fw_addr_lo;
>>                  ucode->tmr_mc_addr_hi = psp->cmd_buf_mem->resp.fw_addr_hi;
>>          }
>> -       mutex_unlock(&psp->mutex);
>>
>> +exit:
>> +       mutex_unlock(&psp->mutex);
>> +       drm_dev_exit(idx);
>>          return ret;
>>   }
>>
>> @@ -359,8 +366,7 @@ static int psp_load_toc(struct psp_context *psp,
>>          if (!cmd)
>>                  return -ENOMEM;
>>          /* Copy toc to psp firmware private buffer */
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -       memcpy(psp->fw_pri_buf, psp->toc_start_addr, psp->toc_bin_size);
>> +       psp_copy_fw(psp, psp->toc_start_addr, psp->toc_bin_size);
>>
>>          psp_prep_load_toc_cmd_buf(cmd, psp->fw_pri_mc_addr, psp->toc_bin_size);
>>
>> @@ -625,8 +631,7 @@ static int psp_asd_load(struct psp_context *psp)
>>          if (!cmd)
>>                  return -ENOMEM;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -       memcpy(psp->fw_pri_buf, psp->asd_start_addr, psp->asd_ucode_size);
>> +       psp_copy_fw(psp, psp->asd_start_addr, psp->asd_ucode_size);
>>
>>          psp_prep_asd_load_cmd_buf(cmd, psp->fw_pri_mc_addr,
>>                                    psp->asd_ucode_size);
>> @@ -781,8 +786,7 @@ static int psp_xgmi_load(struct psp_context *psp)
>>          if (!cmd)
>>                  return -ENOMEM;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -       memcpy(psp->fw_pri_buf, psp->ta_xgmi_start_addr, psp->ta_xgmi_ucode_size);
>> +       psp_copy_fw(psp, psp->ta_xgmi_start_addr, psp->ta_xgmi_ucode_size);
>>
>>          psp_prep_ta_load_cmd_buf(cmd,
>>                                   psp->fw_pri_mc_addr,
>> @@ -1038,8 +1042,7 @@ static int psp_ras_load(struct psp_context *psp)
>>          if (!cmd)
>>                  return -ENOMEM;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -       memcpy(psp->fw_pri_buf, psp->ta_ras_start_addr, psp->ta_ras_ucode_size);
>> +       psp_copy_fw(psp, psp->ta_ras_start_addr, psp->ta_ras_ucode_size);
>>
>>          psp_prep_ta_load_cmd_buf(cmd,
>>                                   psp->fw_pri_mc_addr,
>> @@ -1275,8 +1278,7 @@ static int psp_hdcp_load(struct psp_context *psp)
>>          if (!cmd)
>>                  return -ENOMEM;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -       memcpy(psp->fw_pri_buf, psp->ta_hdcp_start_addr,
>> +       psp_copy_fw(psp, psp->ta_hdcp_start_addr,
>>                 psp->ta_hdcp_ucode_size);
>>
>>          psp_prep_ta_load_cmd_buf(cmd,
>> @@ -1427,8 +1429,7 @@ static int psp_dtm_load(struct psp_context *psp)
>>          if (!cmd)
>>                  return -ENOMEM;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -       memcpy(psp->fw_pri_buf, psp->ta_dtm_start_addr, psp->ta_dtm_ucode_size);
>> +       psp_copy_fw(psp, psp->ta_dtm_start_addr, psp->ta_dtm_ucode_size);
>>
>>          psp_prep_ta_load_cmd_buf(cmd,
>>                                   psp->fw_pri_mc_addr,
>> @@ -1573,8 +1574,7 @@ static int psp_rap_load(struct psp_context *psp)
>>          if (!cmd)
>>                  return -ENOMEM;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -       memcpy(psp->fw_pri_buf, psp->ta_rap_start_addr, psp->ta_rap_ucode_size);
>> +       psp_copy_fw(psp, psp->ta_rap_start_addr, psp->ta_rap_ucode_size);
>>
>>          psp_prep_ta_load_cmd_buf(cmd,
>>                                   psp->fw_pri_mc_addr,
>> @@ -3022,7 +3022,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
>>          struct amdgpu_device *adev = drm_to_adev(ddev);
>>          void *cpu_addr;
>>          dma_addr_t dma_addr;
>> -       int ret;
>> +       int ret, idx;
>>          char fw_name[100];
>>          const struct firmware *usbc_pd_fw;
>>
>> @@ -3031,6 +3031,9 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
>>                  return -EBUSY;
>>          }
>>
>> +       if (!drm_dev_enter(ddev, &idx))
>> +               return -ENODEV;
>> +
>>          snprintf(fw_name, sizeof(fw_name), "amdgpu/%s", buf);
>>          ret = request_firmware(&usbc_pd_fw, fw_name, adev->dev);
>>          if (ret)
>> @@ -3062,16 +3065,30 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
>>   rel_buf:
>>          dma_free_coherent(adev->dev, usbc_pd_fw->size, cpu_addr, dma_addr);
>>          release_firmware(usbc_pd_fw);
>> -
>>   fail:
>>          if (ret) {
>>                  DRM_ERROR("Failed to load USBC PD FW, err = %d", ret);
>> -               return ret;
>> +               count = ret;
>>          }
>>
>> +       drm_dev_exit(idx);
>>          return count;
>>   }
>>
>> +void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t bin_size)
>> +{
>> +       int idx;
>> +
>> +       if (!drm_dev_enter(&psp->adev->ddev, &idx))
>> +               return;
>> +
>> +       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> +       memcpy(psp->fw_pri_buf, start_addr, bin_size);
>> +
>> +       drm_dev_exit(idx);
>> +}
>> +
>> +
>>   static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
>>                     psp_usbc_pd_fw_sysfs_read,
>>                     psp_usbc_pd_fw_sysfs_write);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
>> index 46a5328e00e0..2bfdc278817f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
>> @@ -423,4 +423,6 @@ int psp_get_fw_attestation_records_addr(struct psp_context *psp,
>>
>>   int psp_load_fw_list(struct psp_context *psp,
>>                       struct amdgpu_firmware_info **ucode_list, int ucode_count);
>> +void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t bin_size);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> index c6dbc0801604..82f0542c7792 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> @@ -32,6 +32,7 @@
>>   #include <linux/module.h>
>>
>>   #include <drm/drm.h>
>> +#include <drm/drm_drv.h>
>>
>>   #include "amdgpu.h"
>>   #include "amdgpu_pm.h"
>> @@ -375,7 +376,7 @@ int amdgpu_uvd_suspend(struct amdgpu_device *adev)
>>   {
>>          unsigned size;
>>          void *ptr;
>> -       int i, j;
>> +       int i, j, idx;
>>          bool in_ras_intr = amdgpu_ras_intr_triggered();
>>
>>          cancel_delayed_work_sync(&adev->uvd.idle_work);
>> @@ -403,11 +404,15 @@ int amdgpu_uvd_suspend(struct amdgpu_device *adev)
>>                  if (!adev->uvd.inst[j].saved_bo)
>>                          return -ENOMEM;
>>
>> -               /* re-write 0 since err_event_athub will corrupt VCPU buffer */
>> -               if (in_ras_intr)
>> -                       memset(adev->uvd.inst[j].saved_bo, 0, size);
>> -               else
>> -                       memcpy_fromio(adev->uvd.inst[j].saved_bo, ptr, size);
>> +               if (drm_dev_enter(&adev->ddev, &idx)) {
>> +                       /* re-write 0 since err_event_athub will corrupt VCPU buffer */
>> +                       if (in_ras_intr)
>> +                               memset(adev->uvd.inst[j].saved_bo, 0, size);
>> +                       else
>> +                               memcpy_fromio(adev->uvd.inst[j].saved_bo, ptr, size);
>> +
>> +                       drm_dev_exit(idx);
>> +               }
>>          }
>>
>>          if (in_ras_intr)
>> @@ -420,7 +425,7 @@ int amdgpu_uvd_resume(struct amdgpu_device *adev)
>>   {
>>          unsigned size;
>>          void *ptr;
>> -       int i;
>> +       int i, idx;
>>
>>          for (i = 0; i < adev->uvd.num_uvd_inst; i++) {
>>                  if (adev->uvd.harvest_config & (1 << i))
>> @@ -432,7 +437,10 @@ int amdgpu_uvd_resume(struct amdgpu_device *adev)
>>                  ptr = adev->uvd.inst[i].cpu_addr;
>>
>>                  if (adev->uvd.inst[i].saved_bo != NULL) {
>> -                       memcpy_toio(ptr, adev->uvd.inst[i].saved_bo, size);
>> +                       if (drm_dev_enter(&adev->ddev, &idx)) {
>> +                               memcpy_toio(ptr, adev->uvd.inst[i].saved_bo, size);
>> +                               drm_dev_exit(idx);
>> +                       }
>>                          kvfree(adev->uvd.inst[i].saved_bo);
>>                          adev->uvd.inst[i].saved_bo = NULL;
>>                  } else {
>> @@ -442,8 +450,11 @@ int amdgpu_uvd_resume(struct amdgpu_device *adev)
>>                          hdr = (const struct common_firmware_header *)adev->uvd.fw->data;
>>                          if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
>>                                  offset = le32_to_cpu(hdr->ucode_array_offset_bytes);
>> -                               memcpy_toio(adev->uvd.inst[i].cpu_addr, adev->uvd.fw->data + offset,
>> -                                           le32_to_cpu(hdr->ucode_size_bytes));
>> +                               if (drm_dev_enter(&adev->ddev, &idx)) {
>> +                                       memcpy_toio(adev->uvd.inst[i].cpu_addr, adev->uvd.fw->data + offset,
>> +                                                   le32_to_cpu(hdr->ucode_size_bytes));
>> +                                       drm_dev_exit(idx);
>> +                               }
>>                                  size -= le32_to_cpu(hdr->ucode_size_bytes);
>>                                  ptr += le32_to_cpu(hdr->ucode_size_bytes);
>>                          }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> index ea6a62f67e38..833203401ef4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/module.h>
>>
>>   #include <drm/drm.h>
>> +#include <drm/drm_drv.h>
>>
>>   #include "amdgpu.h"
>>   #include "amdgpu_pm.h"
>> @@ -293,7 +294,7 @@ int amdgpu_vce_resume(struct amdgpu_device *adev)
>>          void *cpu_addr;
>>          const struct common_firmware_header *hdr;
>>          unsigned offset;
>> -       int r;
>> +       int r, idx;
>>
>>          if (adev->vce.vcpu_bo == NULL)
>>                  return -EINVAL;
>> @@ -313,8 +314,12 @@ int amdgpu_vce_resume(struct amdgpu_device *adev)
>>
>>          hdr = (const struct common_firmware_header *)adev->vce.fw->data;
>>          offset = le32_to_cpu(hdr->ucode_array_offset_bytes);
>> -       memcpy_toio(cpu_addr, adev->vce.fw->data + offset,
>> -                   adev->vce.fw->size - offset);
>> +
>> +       if (drm_dev_enter(&adev->ddev, &idx)) {
>> +               memcpy_toio(cpu_addr, adev->vce.fw->data + offset,
>> +                           adev->vce.fw->size - offset);
>> +               drm_dev_exit(idx);
>> +       }
>>
>>          amdgpu_bo_kunmap(adev->vce.vcpu_bo);
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>> index 201645963ba5..21f7d3644d70 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>> @@ -27,6 +27,7 @@
>>   #include <linux/firmware.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <drm/drm_drv.h>
>>
>>   #include "amdgpu.h"
>>   #include "amdgpu_pm.h"
>> @@ -275,7 +276,7 @@ int amdgpu_vcn_suspend(struct amdgpu_device *adev)
>>   {
>>          unsigned size;
>>          void *ptr;
>> -       int i;
>> +       int i, idx;
>>
>>          cancel_delayed_work_sync(&adev->vcn.idle_work);
>>
>> @@ -292,7 +293,10 @@ int amdgpu_vcn_suspend(struct amdgpu_device *adev)
>>                  if (!adev->vcn.inst[i].saved_bo)
>>                          return -ENOMEM;
>>
>> -               memcpy_fromio(adev->vcn.inst[i].saved_bo, ptr, size);
>> +               if (drm_dev_enter(&adev->ddev, &idx)) {
>> +                       memcpy_fromio(adev->vcn.inst[i].saved_bo, ptr, size);
>> +                       drm_dev_exit(idx);
>> +               }
>>          }
>>          return 0;
>>   }
>> @@ -301,7 +305,7 @@ int amdgpu_vcn_resume(struct amdgpu_device *adev)
>>   {
>>          unsigned size;
>>          void *ptr;
>> -       int i;
>> +       int i, idx;
>>
>>          for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>                  if (adev->vcn.harvest_config & (1 << i))
>> @@ -313,7 +317,10 @@ int amdgpu_vcn_resume(struct amdgpu_device *adev)
>>                  ptr = adev->vcn.inst[i].cpu_addr;
>>
>>                  if (adev->vcn.inst[i].saved_bo != NULL) {
>> -                       memcpy_toio(ptr, adev->vcn.inst[i].saved_bo, size);
>> +                       if (drm_dev_enter(&adev->ddev, &idx)) {
>> +                               memcpy_toio(ptr, adev->vcn.inst[i].saved_bo, size);
>> +                               drm_dev_exit(idx);
>> +                       }
>>                          kvfree(adev->vcn.inst[i].saved_bo);
>>                          adev->vcn.inst[i].saved_bo = NULL;
>>                  } else {
>> @@ -323,8 +330,11 @@ int amdgpu_vcn_resume(struct amdgpu_device *adev)
>>                          hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
>>                          if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
>>                                  offset = le32_to_cpu(hdr->ucode_array_offset_bytes);
>> -                               memcpy_toio(adev->vcn.inst[i].cpu_addr, adev->vcn.fw->data + offset,
>> -                                           le32_to_cpu(hdr->ucode_size_bytes));
>> +                               if (drm_dev_enter(&adev->ddev, &idx)) {
>> +                                       memcpy_toio(adev->vcn.inst[i].cpu_addr, adev->vcn.fw->data + offset,
>> +                                                   le32_to_cpu(hdr->ucode_size_bytes));
>> +                                       drm_dev_exit(idx);
>> +                               }
>>                                  size -= le32_to_cpu(hdr->ucode_size_bytes);
>>                                  ptr += le32_to_cpu(hdr->ucode_size_bytes);
>>                          }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index 9f868cf3b832..7dd5f10ab570 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -32,6 +32,7 @@
>>   #include <linux/dma-buf.h>
>>
>>   #include <drm/amdgpu_drm.h>
>> +#include <drm/drm_drv.h>
>>   #include "amdgpu.h"
>>   #include "amdgpu_trace.h"
>>   #include "amdgpu_amdkfd.h"
>> @@ -1606,7 +1607,10 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>>          struct amdgpu_vm_update_params params;
>>          enum amdgpu_sync_mode sync_mode;
>>          uint64_t pfn;
>> -       int r;
>> +       int r, idx;
>> +
>> +       if (!drm_dev_enter(&adev->ddev, &idx))
>> +               return -ENODEV;
>>
>>          memset(&params, 0, sizeof(params));
>>          params.adev = adev;
>> @@ -1715,6 +1719,7 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>>
>>   error_unlock:
>>          amdgpu_vm_eviction_unlock(vm);
>> +       drm_dev_exit(idx);
>>          return r;
>>   }
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>> index 589410c32d09..2cec71e823f5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>> @@ -23,6 +23,7 @@
>>   #include <linux/firmware.h>
>>   #include <linux/module.h>
>>   #include <linux/vmalloc.h>
>> +#include <drm/drm_drv.h>
>>
>>   #include "amdgpu.h"
>>   #include "amdgpu_psp.h"
>> @@ -269,10 +270,8 @@ static int psp_v11_0_bootloader_load_kdb(struct psp_context *psp)
>>          if (ret)
>>                  return ret;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -
>>          /* Copy PSP KDB binary to memory */
>> -       memcpy(psp->fw_pri_buf, psp->kdb_start_addr, psp->kdb_bin_size);
>> +       psp_copy_fw(psp, psp->kdb_start_addr, psp->kdb_bin_size);
>>
>>          /* Provide the PSP KDB to bootloader */
>>          WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>> @@ -302,10 +301,8 @@ static int psp_v11_0_bootloader_load_spl(struct psp_context *psp)
>>          if (ret)
>>                  return ret;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -
>>          /* Copy PSP SPL binary to memory */
>> -       memcpy(psp->fw_pri_buf, psp->spl_start_addr, psp->spl_bin_size);
>> +       psp_copy_fw(psp, psp->spl_start_addr, psp->spl_bin_size);
>>
>>          /* Provide the PSP SPL to bootloader */
>>          WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>> @@ -335,10 +332,8 @@ static int psp_v11_0_bootloader_load_sysdrv(struct psp_context *psp)
>>          if (ret)
>>                  return ret;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -
>>          /* Copy PSP System Driver binary to memory */
>> -       memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
>> +       psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
>>
>>          /* Provide the sys driver to bootloader */
>>          WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>> @@ -371,10 +366,8 @@ static int psp_v11_0_bootloader_load_sos(struct psp_context *psp)
>>          if (ret)
>>                  return ret;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -
>>          /* Copy Secure OS binary to PSP memory */
>> -       memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
>> +       psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
>>
>>          /* Provide the PSP secure OS to bootloader */
>>          WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>> @@ -608,7 +601,7 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
>>          uint32_t p2c_header[4];
>>          uint32_t sz;
>>          void *buf;
>> -       int ret;
>> +       int ret, idx;
>>
>>          if (ctx->init == PSP_MEM_TRAIN_NOT_SUPPORT) {
>>                  DRM_DEBUG("Memory training is not supported.\n");
>> @@ -681,17 +674,24 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
>>                          return -ENOMEM;
>>                  }
>>
>> -               memcpy_fromio(buf, adev->mman.aper_base_kaddr, sz);
>> -               ret = psp_v11_0_memory_training_send_msg(psp, PSP_BL__DRAM_LONG_TRAIN);
>> -               if (ret) {
>> -                       DRM_ERROR("Send long training msg failed.\n");
>> +               if (drm_dev_enter(&adev->ddev, &idx)) {
>> +                       memcpy_fromio(buf, adev->mman.aper_base_kaddr, sz);
>> +                       ret = psp_v11_0_memory_training_send_msg(psp, PSP_BL__DRAM_LONG_TRAIN);
>> +                       if (ret) {
>> +                               DRM_ERROR("Send long training msg failed.\n");
>> +                               vfree(buf);
>> +                               drm_dev_exit(idx);
>> +                               return ret;
>> +                       }
>> +
>> +                       memcpy_toio(adev->mman.aper_base_kaddr, buf, sz);
>> +                       adev->hdp.funcs->flush_hdp(adev, NULL);
>>                          vfree(buf);
>> -                       return ret;
>> +                       drm_dev_exit(idx);
>> +               } else {
>> +                       vfree(buf);
>> +                       return -ENODEV;
>>                  }
>> -
>> -               memcpy_toio(adev->mman.aper_base_kaddr, buf, sz);
>> -               adev->hdp.funcs->flush_hdp(adev, NULL);
>> -               vfree(buf);
>>          }
>>
>>          if (ops & PSP_MEM_TRAIN_SAVE) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
>> index c4828bd3264b..618e5b6b85d9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
>> @@ -138,10 +138,8 @@ static int psp_v12_0_bootloader_load_sysdrv(struct psp_context *psp)
>>          if (ret)
>>                  return ret;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -
>>          /* Copy PSP System Driver binary to memory */
>> -       memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
>> +       psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
>>
>>          /* Provide the sys driver to bootloader */
>>          WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>> @@ -179,10 +177,8 @@ static int psp_v12_0_bootloader_load_sos(struct psp_context *psp)
>>          if (ret)
>>                  return ret;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -
>>          /* Copy Secure OS binary to PSP memory */
>> -       memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
>> +       psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
>>
>>          /* Provide the PSP secure OS to bootloader */
>>          WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
>> index f2e725f72d2f..d0a6cccd0897 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
>> @@ -102,10 +102,8 @@ static int psp_v3_1_bootloader_load_sysdrv(struct psp_context *psp)
>>          if (ret)
>>                  return ret;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -
>>          /* Copy PSP System Driver binary to memory */
>> -       memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
>> +       psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
>>
>>          /* Provide the sys driver to bootloader */
>>          WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>> @@ -143,10 +141,8 @@ static int psp_v3_1_bootloader_load_sos(struct psp_context *psp)
>>          if (ret)
>>                  return ret;
>>
>> -       memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>> -
>>          /* Copy Secure OS binary to PSP memory */
>> -       memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
>> +       psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
>>
>>          /* Provide the PSP secure OS to bootloader */
>>          WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> index 8e238dea7bef..90910d19db12 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> @@ -25,6 +25,7 @@
>>    */
>>
>>   #include <linux/firmware.h>
>> +#include <drm/drm_drv.h>
>>
>>   #include "amdgpu.h"
>>   #include "amdgpu_vce.h"
>> @@ -555,16 +556,19 @@ static int vce_v4_0_hw_fini(void *handle)
>>   static int vce_v4_0_suspend(void *handle)
>>   {
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -       int r;
>> +       int r, idx;
>>
>>          if (adev->vce.vcpu_bo == NULL)
>>                  return 0;
>>
>> -       if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
>> -               unsigned size = amdgpu_bo_size(adev->vce.vcpu_bo);
>> -               void *ptr = adev->vce.cpu_addr;
>> +       if (drm_dev_enter(&adev->ddev, &idx)) {
>> +               if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
>> +                       unsigned size = amdgpu_bo_size(adev->vce.vcpu_bo);
>> +                       void *ptr = adev->vce.cpu_addr;
>>
>> -               memcpy_fromio(adev->vce.saved_bo, ptr, size);
>> +                       memcpy_fromio(adev->vce.saved_bo, ptr, size);
>> +               }
>> +               drm_dev_exit(idx);
>>          }
>>
>>          r = vce_v4_0_hw_fini(adev);
>> @@ -577,16 +581,20 @@ static int vce_v4_0_suspend(void *handle)
>>   static int vce_v4_0_resume(void *handle)
>>   {
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -       int r;
>> +       int r, idx;
>>
>>          if (adev->vce.vcpu_bo == NULL)
>>                  return -EINVAL;
>>
>>          if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
>> -               unsigned size = amdgpu_bo_size(adev->vce.vcpu_bo);
>> -               void *ptr = adev->vce.cpu_addr;
>>
>> -               memcpy_toio(ptr, adev->vce.saved_bo, size);
>> +               if (drm_dev_enter(&adev->ddev, &idx)) {
>> +                       unsigned size = amdgpu_bo_size(adev->vce.vcpu_bo);
>> +                       void *ptr = adev->vce.cpu_addr;
>> +
>> +                       memcpy_toio(ptr, adev->vce.saved_bo, size);
>> +                       drm_dev_exit(idx);
>> +               }
>>          } else {
>>                  r = amdgpu_vce_resume(adev);
>>                  if (r)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> index 3f15bf34123a..df34be8ec82d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> @@ -34,6 +34,8 @@
>>   #include "vcn/vcn_3_0_0_sh_mask.h"
>>   #include "ivsrcid/vcn/irqsrcs_vcn_2_0.h"
>>
>> +#include <drm/drm_drv.h>
>> +
>>   #define mmUVD_CONTEXT_ID_INTERNAL_OFFSET                       0x27
>>   #define mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET                   0x0f
>>   #define mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET                 0x10
>> @@ -268,16 +270,20 @@ static int vcn_v3_0_sw_init(void *handle)
>>   static int vcn_v3_0_sw_fini(void *handle)
>>   {
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -       int i, r;
>> +       int i, r, idx;
>>
>> -       for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
>> -               volatile struct amdgpu_fw_shared *fw_shared;
>> +       if (drm_dev_enter(&adev->ddev, &idx)) {
>> +               for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
>> +                       volatile struct amdgpu_fw_shared *fw_shared;
>>
>> -               if (adev->vcn.harvest_config & (1 << i))
>> -                       continue;
>> -               fw_shared = adev->vcn.inst[i].fw_shared_cpu_addr;
>> -               fw_shared->present_flag_0 = 0;
>> -               fw_shared->sw_ring.is_enabled = false;
>> +                       if (adev->vcn.harvest_config & (1 << i))
>> +                               continue;
>> +                       fw_shared = adev->vcn.inst[i].fw_shared_cpu_addr;
>> +                       fw_shared->present_flag_0 = 0;
>> +                       fw_shared->sw_ring.is_enabled = false;
>> +               }
>> +
>> +               drm_dev_exit(idx);
>>          }
>>
>>          if (amdgpu_sriov_vf(adev))
>> --
>> 2.25.1
>>
