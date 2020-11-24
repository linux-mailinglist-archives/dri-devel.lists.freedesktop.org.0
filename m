Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12772C3400
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 23:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AF16E3D6;
	Tue, 24 Nov 2020 22:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1806E3D6;
 Tue, 24 Nov 2020 22:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDmPzb7zOzVMQMaBrt9+9Bv8NnUL4ftgVGu/L0PiWt25smk2hcjcnSIvRdnFzgvnus36J10R46u/P6c/yCjJGE+ZZEQWJ/5BzrRn69/nIZjxhvcXqNj2H8Wrzg/v8U6LBTPFwD+zvhfT2kJ9zZP+92UnoFn9bti8dtbCD+a6DVeg56LXUKBF6a1nompPGLsWB74ND2+AamPFDOrl8YLQjexi9oqHqx2opqQZmzehG8Hsa38WeZU7u6pNGBoHBOGC6KtrA2wHcvNtooTxe4DGvXcf94Ss4N2acmyOXmhv1dzJmOcfHzID9tCOUILAnosVbmJcttG8KAfFvm5bkA0Dlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbMP0EVx2thZ1h/nW2KFBbw6u28nXncbqhURXpcYrvI=;
 b=AZdui5/d7+PcNIlGsgs4p93K4Qfg91EM28tWWSIwcgvsLnLBddSjTYwB2Hp/wck4Mb5RrbTw6pCPDN89yEJ5JYE1e/3c0wDfFQljSt+ejgNYfOQOg34rsO7N+uZUZN87IebCOwf21siqYkC2hw48uqwxs46u9eBSOOkVUvIkiUnSRsYbfyTgW5WH3b9SHjDcc4Ob6ruGFknve39PhXZNRHfQ0DHkSmMQoH4Pf8p/vili5TVNo6IKXAbRF15jdqfeNGrY0ZdvadlKjHWwe1pHp0gPYS6UYT9rpJsCVk92PCBejGj7GdtKjP+Z3fYj4DkDEIs2fUB0bcjS5njIMp+myQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbMP0EVx2thZ1h/nW2KFBbw6u28nXncbqhURXpcYrvI=;
 b=4NnSb9jflgv7mOonEWK96WlW9IhYw59DXuMMvisG2+VpLzgmfBam2E5ZP4GfdiKFAUqsliLbjjgSLi6wsVkdpJYorwXFczhRiwzNvq1SB+vhyZYjQRdTt2yJLIOwGA3T2oS9L6xSmLYIvy6Oa9WiMMPFRACat43b6pH0QOCUObs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB2939.namprd12.prod.outlook.com (2603:10b6:5:18b::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21; Tue, 24 Nov 2020 22:27:44 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 22:27:44 +0000
Subject: Re: [PATCH v3 10/12] drm/amdgpu: Avoid sysfs dirs removal post device
 unplug
To: Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-11-git-send-email-andrey.grodzovsky@amd.com>
 <20201124144938.GR401619@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <36fdb2f8-2238-6321-201e-a25a3a828fc5@amd.com>
Date: Tue, 24 Nov 2020 17:27:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20201124144938.GR401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85]
X-ClientProxiedBy: YT1PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::11) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85]
 (2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85) by
 YT1PR01CA0102.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 22:27:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc30313f-0fde-4d73-fbee-08d890c829ee
X-MS-TrafficTypeDiagnostic: DM6PR12MB2939:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2939A5B754CD79EA4F5CF9CEEAFB0@DM6PR12MB2939.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t1LRyvyKMo7+k6QRm7oSrRVwgttobVdutC4yUGd/peo14LMmWc/9yOfNJZPriC2+B74KHVKz6sejmg2yH4jBtf4+o/csxp5pQGV8kTP6MYFCzHNxWJwLjywrIBMWDYpS4XnBx2OIsoGSICkMhYNrvN+xtRmpB8zGioZ7ZgLjxSH0OYK9MWsMCe32thWBTR6YEgKTwgNag7uQ6UAYet1jdMckVwo+0hw63Q+z+P07u35kAR0Dqu1ho/4Au/E8PGgGmLcUKprchJrZCXdKU0fnOUMzxyX1O+deeLizeNDOPNJAHCS0/CUY6BzRzFA/rkdKi/MdF0QK6GDr55XIuc0kIsvVWSVmflTEt8ylzOgj2yHuftCcs7ySPU+xhnoKZ+SyJeYEFmE6wPd1AzJD8AzT8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(2616005)(6486002)(8936002)(6916009)(36756003)(7416002)(53546011)(86362001)(186003)(478600001)(66476007)(316002)(4326008)(31686004)(2906002)(66946007)(66556008)(83380400001)(52116002)(5660300002)(31696002)(16526019)(8676002)(87944003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OFB1TmZ3NE1vSkhBb29zc2N6Tm5jM2hqRk5ORFZFWVlrZzFHVk1EdS9zMmNj?=
 =?utf-8?B?aVM5SzFSWm1GOWRKWGJIVS94ZTVmajFBNU9tdkltWldPcmQxQkt0TStweWFO?=
 =?utf-8?B?Q0RMVlg1ZzU0bjNlUXVvTnczWDVGaFFYOUdMa1M2TGkxRHY0eGlXTWhFZi9O?=
 =?utf-8?B?dzVwaTNMRHo2RnAydXp2N3dnMXcwNnRVTGR0b2pSN3N0VnN3R1JBTHVmaVRG?=
 =?utf-8?B?SFIzS2NDNjRDUU5xbndMVjVwUDNVSWYwdU0vRUNGb3FaZjJMaEQ2K2N0U2Y5?=
 =?utf-8?B?dFNTRDR5OUNXdUVVMExYcHExOXdaeGlRRmVMWlRKMXFUTllMVUR4RjdaVzhD?=
 =?utf-8?B?dVFtOThBS2NWU1J1OHRCbURiRmpDdjdMa2tWRlRyL1ZiK3dVMi9sZzU5Y1V6?=
 =?utf-8?B?cjYwOWZ6eEpVcXQ1c09uNVcrZ0k2dGduYnpjQTlBZmhGSzNYNGpGNXVGSldT?=
 =?utf-8?B?SkF1aWFoajdPa3pPR2J2eHJJS1lrTEVaU1pIWjhiZ1dVTEZMVjhjNEE1WERk?=
 =?utf-8?B?ZG5JZkVLL3hvSXorSzk3WitrN3dvNmRCSTRET1pDeW9xUW04WmNSNS9CYnNQ?=
 =?utf-8?B?U25vSTlySHhJVGpGS01ibjYrcXJYM296RDNLRDh4UVAwZG5uSTUxNDAyWXVs?=
 =?utf-8?B?R1NuNGVSd1VhZlJONlpxRFEvSzBNbjhqSHlvZjZFUlBkU2VUcDdnd25OVXI4?=
 =?utf-8?B?TFRDV1AwU2JiZTB3YTNYQlF3alh3MTQ5Z3h3ZlJiOXdudVdBYnlkcXVwVjll?=
 =?utf-8?B?V0dwWEQ0aGNBWGpDdHJ1YzA3V3dCcEgxTzIxVmNodVVSQVdwRUZXNXlEYmRX?=
 =?utf-8?B?ZzF6TkVVM21VRGtFZUJlSGNLZmZoTGdTT2pFYWlWeU5UbGpkbGFZcTRXYXov?=
 =?utf-8?B?b2pSMkp2Y0FCeUJXTmIyVkhQVUtlM2VSaXpWalc2Z3A1d1JHL3hweTB2eTVS?=
 =?utf-8?B?aGhOMTZSQzljYWhoTUNEN3VUbDFaT01KazdFTlR4M3lISGxjczg2SEhrRldx?=
 =?utf-8?B?ek9Da0crVjRBMGtWbXlhZGx4YjJpT2w3ZzdnazArTGkwZVJ2VUJqSmt1OWdF?=
 =?utf-8?B?VWtZejQyUGszbmdDUzU5Yjl6YjhqY1hMODIxRXYzYWcxc0oyOFBxVGFVZkZC?=
 =?utf-8?B?dStqc3ZKdmFkcjBpTlA0YXZxSENXVWdqOCtGRU9TM1VVS28yZ0pidE8wUGho?=
 =?utf-8?B?Zlg5cmtDcllVMUZKeERkODh0eEdXcnVXWkxObUhjZnNTRG1zUUh1akRHNVRQ?=
 =?utf-8?B?MEI0UHdHM3BkdFBWV3FEdlQ3Y0svbWRyYW52YUVDc1VYT2dpenYzejdvZWpo?=
 =?utf-8?B?UFVuNkdnMEJQMlFuNDkyNlhpQS9MM0JxTHlFREhRRHU2aXFBY3dvdjVFVEha?=
 =?utf-8?B?NUh3ekdpb0NyOU5xbWxmMUNGeUdhTVl0d0N4M293L0xpWk1DSHlLMU9xcE03?=
 =?utf-8?Q?kt7NY53S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc30313f-0fde-4d73-fbee-08d890c829ee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 22:27:44.6950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZ2PZ661lr7c0qxcwRHZpXgp/F1Xky2FuWB8H8EbGN8Tn4l4ZqNyKQKzDPHaWN0wF1E3kgFE95M7j9KHxXG97Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2939
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
Cc: gregkh@linuxfoundation.org, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/24/20 9:49 AM, Daniel Vetter wrote:
> On Sat, Nov 21, 2020 at 12:21:20AM -0500, Andrey Grodzovsky wrote:
>> Avoids NULL ptr due to kobj->sd being unset on device removal.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c   | 4 +++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 +++-
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> index caf828a..812e592 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> @@ -27,6 +27,7 @@
>>   #include <linux/uaccess.h>
>>   #include <linux/reboot.h>
>>   #include <linux/syscalls.h>
>> +#include <drm/drm_drv.h>
>>   
>>   #include "amdgpu.h"
>>   #include "amdgpu_ras.h"
>> @@ -1043,7 +1044,8 @@ static int amdgpu_ras_sysfs_remove_feature_node(struct amdgpu_device *adev)
>>   		.attrs = attrs,
>>   	};
>>   
>> -	sysfs_remove_group(&adev->dev->kobj, &group);
>> +	if (!drm_dev_is_unplugged(&adev->ddev))
>> +		sysfs_remove_group(&adev->dev->kobj, &group);
> This looks wrong. sysfs, like any other interface, should be
> unconditionally thrown out when we do the drm_dev_unregister. Whether
> hotunplugged or not should matter at all. Either this isn't needed at all,
> or something is wrong with the ordering here. But definitely fishy.
> -Daniel


So technically this is needed because kobejct's sysfs directory entry kobj->sd 
is set to NULL
on device removal (from sysfs_remove_dir) but because we don't finalize the device
until last reference to drm file is dropped (which can happen later) we end up 
calling sysfs_remove_file/dir after
this pointer is NULL. sysfs_remove_file checks for NULL and aborts while 
sysfs_remove_dir
is not and that why I guard against calls to sysfs_remove_dir.
But indeed the whole approach in the driver is incorrect, as Greg pointed out - 
we should use
default groups attributes instead of explicit calls to sysfs interface and this 
would save those troubles.
But again. the issue here of scope of work, converting all of amdgpu to default 
groups attributes is somewhat
lengthy process with extra testing as the entire driver is papered with sysfs 
references and seems to me more of a standalone
cleanup, just like switching to devm_ and drmm_ work. To me at least it seems 
that it makes more sense
to finalize and push the hot unplug patches so that this new functionality can 
be part of the driver sooner
and then incrementally improve it by working on those other topics. Just as 
devm_/drmm_ I also added sysfs cleanup
to my TODO list in the RFC patch.

Andrey


>
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>> index 2b7c90b..54331fc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>> @@ -24,6 +24,7 @@
>>   #include <linux/firmware.h>
>>   #include <linux/slab.h>
>>   #include <linux/module.h>
>> +#include <drm/drm_drv.h>
>>   
>>   #include "amdgpu.h"
>>   #include "amdgpu_ucode.h"
>> @@ -464,7 +465,8 @@ int amdgpu_ucode_sysfs_init(struct amdgpu_device *adev)
>>   
>>   void amdgpu_ucode_sysfs_fini(struct amdgpu_device *adev)
>>   {
>> -	sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
>> +	if (!drm_dev_is_unplugged(&adev->ddev))
>> +		sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
>>   }
>>   
>>   static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
>> -- 
>> 2.7.4
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
