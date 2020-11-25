Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0122C46F3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 18:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65E26EA5F;
	Wed, 25 Nov 2020 17:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690046.outbound.protection.outlook.com [40.107.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9149C6E931;
 Wed, 25 Nov 2020 17:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzJy20iCDoMBodf9IHqF7sRhcUGhXd8WaA9+1sDjnsnpolE7dTS0SoEX0fnhVLAq8v2RJ6pbEFAeyD1NU9XJ5wDM/BmYERKOrTTpzoLe7LczATngt6st8+4DWJ+2emkAg4q1GJsAlE96xwPHfb1QI2wUOcbwpQMt6Z5gDXmhMO5Jc8igYGxNk6pKiU3dVqAJJ+IM9PNJqQf7qWcx7H5vbVAQxp8yFTE1C1qyNRnscC3oRKOKlTHR4x9cH83oSN8kYqazmnvvez/A1xFO7TUzGJM8Ejg79KM5kX4VtwAYvo8gFAOoMCuW2u/epphs0+vn72NCXi+n9jMZC4rDhQK+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ot3DegctJ84p8nAMiXo6nFru4AIOQRV7rac6PcaS8q4=;
 b=RDHSsSLmzd5kQPowGnw2ffIoSnelS9oud2JFRfy6IY3xKT0l+deeTZv7ltUc5VU0iA99ZHzQ8ucdjs0m1q/S3ICsxWzYZlXHQxboAdf9PkYZa+GF89TE16l9TV0cRuf2jLBG6dnm97IN1dVvsmQJXU2PU7shskodz+1bsk0XwQTVuediYwYhm44l+GDWqP77/tKs4Ybm9Noy3uPQ+HprWuJyvmE3g/MOS26Wmuc9RAn1OzdzGRGZ93EdPQqVjbal3Qm/M0ZPpjsCV67c6uvsX4kTdHtLRtQwSGsKjOEbEC3Nj0pkA/DSdpYzMBcCftSI8GC21mPVSk8wm5zFppEeNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ot3DegctJ84p8nAMiXo6nFru4AIOQRV7rac6PcaS8q4=;
 b=ok/j54SPjPIa38lYi2MglKDYp5xB1oTlC/TDDPq3YwE+2BDr+YrB2dUQ+NDgtjJUc9QYCcb2uNjIssBY5Vhnob7B1lfm+nKlmcD0hLIgTpFCCrIqSG8M62L3NUVJkJX6fkgfPSEHNw58MXH+dmaqmxsQquT7gni6h+n15tFVXmI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4943.namprd12.prod.outlook.com (2603:10b6:5:1bc::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20; Wed, 25 Nov 2020 17:39:50 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 17:39:50 +0000
Subject: Re: [PATCH v3 10/12] drm/amdgpu: Avoid sysfs dirs removal post device
 unplug
To: Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-11-git-send-email-andrey.grodzovsky@amd.com>
 <20201124144938.GR401619@phenom.ffwll.local>
 <36fdb2f8-2238-6321-201e-a25a3a828fc5@amd.com>
 <CAKMK7uE=AfP2p=UKjG=TFuFh8d0vphyHndxxEqqNNa+ouX48AQ@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <1fcc5e3a-36d8-846d-032c-25fb8defd486@amd.com>
Date: Wed, 25 Nov 2020 12:39:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <CAKMK7uE=AfP2p=UKjG=TFuFh8d0vphyHndxxEqqNNa+ouX48AQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85]
X-ClientProxiedBy: YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::8) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85]
 (2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85) by
 YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 17:39:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 963c5f18-68d2-40f4-2dd6-08d891691bc9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4943:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB49436BD826E6D7D69838A38AEAFA0@DM6PR12MB4943.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2klDS6Xy1b2sUQUxaaX9W7MMJDKPiIhzHU+UewHwljyKfgjRR/sj9qIKX6YxWs8NzygzZHaItGZP95VXg+5PVYkTYy2VB01IsfMn9chTNenciIpXVliW7kFna7wu4sT/WxT/6KHAqojjoiWgPtI0g5i748XdNadAM0PPxDJfym11hGg4HDhHHGn85qoe7ykF4U3CRvr8nJwMzXv4h8f4Jk9I4dvX0DOyP8M3cfNzdhYOOiqz5tBlco7HpA5EE11EreIN6IcT9xMLztg1T3IuQRBY/SgE0cXarjDbyJMLPrnL35wual2nw5JtiA+yxrIGypD9x1rUPkXwU1MVKmLJFh5lSorHRNQSMhbwg4BLpA9jzMjhrOfq/vO6kB6cEgfvl9eS70SfkdOST6EuVTUNuaghmKy8P0kjrMt4GfFI1v+pyMrawXGT4rjW79+2dy+5gSLZu06LxaUYZmObd/K4gtRstReFrbzGb6xJTrh2vM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(30864003)(83380400001)(966005)(53546011)(186003)(2906002)(86362001)(16526019)(166002)(6916009)(4326008)(54906003)(33964004)(316002)(31686004)(7416002)(478600001)(6486002)(8936002)(8676002)(52116002)(2616005)(5660300002)(31696002)(36756003)(66476007)(66946007)(66556008)(87944003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SlhHdEpoclQwT3NvSjhVa1E0MmRZMmFnTktjcWVscGpuRnY4TXh4ekRyRXo2?=
 =?utf-8?B?K3MvbDYzZnZPUDd0UlpsMXM3NFdKd1RnTDVBY2R6TzJzSkdJNmZCeVN6SW1V?=
 =?utf-8?B?Yk43VnBuQk1kSXJkUUFtYmlCbkphRFNHNEliS045ekEzWFRwQmplMHpSK24v?=
 =?utf-8?B?U3VlNEEzNnZNVXBXS3hISUZnWThiWXZFWkVSYlI2LzliTm11UldkQkhqWUUw?=
 =?utf-8?B?NGM5bWUrQmRaTEhGNWJMYStvQ0FvVWh5Qi9wMnp2NVBoS2h2QVpBMlAxcHR0?=
 =?utf-8?B?NXIrY25WWnVkRCtIMFQweG9oZ0hmNmR0UE9FTGlLMmxsWldXNzErZmpKazdn?=
 =?utf-8?B?Y05WK1p2TGtuNHhLWjVaZzlJcXc2UjdKRjQ3dGNHbGY3eUIrcXZlWnNOZ1Rq?=
 =?utf-8?B?VkRMY2ozZ1UrWGlaeHU3c2dJakZXUnk2WWREQVhxN2NXVVF6MEM5aGl3bUVk?=
 =?utf-8?B?UEIwUWdqRTZWVnd4SjNydHd5YUI1ZTcydmd3SXpOSzdTaTJCZEVPOXRGbGsx?=
 =?utf-8?B?UU1rbEt4U2trRDd6dUloaG5SaENiZEV5VXdpc1NFR01hTldwSUNFRGxRbk9X?=
 =?utf-8?B?aGJZb3FQbXZwbERPelFXMUFNYkUyazgyKzNYTndkNW9Ga05ocU43Y2NjYTlE?=
 =?utf-8?B?cktLaW1aWWthVEJpTUpjcHNzQmdPSGdHUGExSVd2Y3RKWXh2OVdxYlRXTWlz?=
 =?utf-8?B?c3NMRGRQK3dpc0JQbDEzSUpRNTZTb3g4cE5UUXdrUHdSSm9sNEFZd0Z5b0VX?=
 =?utf-8?B?aFUyZG1CQUhRS3BoMVlaNyt3SnpJelVlNU0wcnBjMDVnYXZmOVV6WnZvdE91?=
 =?utf-8?B?VUhJZk43VGo5VzNINW9EdzZnU3V6N0Z1V2xtWFNyaDg2eVdrM0dvNzZPaEFi?=
 =?utf-8?B?N01WMU9yem9WbnpCSXo3WmdzUTI1Yy93UmliR2tsdWNpd2xEaTRUTlVGR0pC?=
 =?utf-8?B?R1cwOWxMNnM0dmJOdUpUWi8yY0RJVm1hc1VhNFYxeWZXTE90MTEyNHM4dG5o?=
 =?utf-8?B?UmI0OU9hSnBUSy9PQW5WcTgyR0FEN0d6ZHRhMUpEZnRzc2xVUS9MNDBKdCts?=
 =?utf-8?B?bEpsOVYra2lQcEYySW5GK1NUT015YUw5VTVXNjNjVWN0SXZNWUxIS0VxaXdI?=
 =?utf-8?B?bzE4TEN5Tk94WVVLajhicitiQ21nN1lDTUhPV1FUY3EwblExUmRSNWMvT05l?=
 =?utf-8?B?YWp1eUF2YlJ6V3pGanhIVURQT2ZDV1pCclhRV0tDaGRPVWdnK1U4dXJ3Qyt1?=
 =?utf-8?B?Y0dhMndzNUE1R0hKN0RKbEd1a1N5WEhadmVLSklkRWxpTnhmRWRYK0JqejJW?=
 =?utf-8?B?cGVpY2V3ZGRmLzdqRHdRWDFJU0tOTkF2bDlKcjY5MG8vUGR0WlQyQWFCWlJa?=
 =?utf-8?B?TndmaUx2dnA4R3YwMnlRQ3VrTTR5cU4wNklLYnNPUVpRbW9Id0N1WStnOVcy?=
 =?utf-8?Q?I1A1tiDV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963c5f18-68d2-40f4-2dd6-08d891691bc9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 17:39:49.8818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HDRdxkrHdEVy7BjOV5bNbN4/4LMVCRT7l5IcYmbtRCX4MkvSQCG0Ck8xd69Yh1vEvn5SQHEWDbYbD5KKantMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4943
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1439525421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1439525421==
Content-Type: multipart/alternative;
 boundary="------------E94B1493006A219549533716"
Content-Language: en-US

--------------E94B1493006A219549533716
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/25/20 4:04 AM, Daniel Vetter wrote:
> On Tue, Nov 24, 2020 at 11:27 PM Andrey Grodzovsky
> <Andrey.Grodzovsky@amd.com> wrote:
>>
>> On 11/24/20 9:49 AM, Daniel Vetter wrote:
>>> On Sat, Nov 21, 2020 at 12:21:20AM -0500, Andrey Grodzovsky wrote:
>>>> Avoids NULL ptr due to kobj->sd being unset on device removal.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c   | 4 +++-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 +++-
>>>>    2 files changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>>>> index caf828a..812e592 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>>>> @@ -27,6 +27,7 @@
>>>>    #include <linux/uaccess.h>
>>>>    #include <linux/reboot.h>
>>>>    #include <linux/syscalls.h>
>>>> +#include <drm/drm_drv.h>
>>>>
>>>>    #include "amdgpu.h"
>>>>    #include "amdgpu_ras.h"
>>>> @@ -1043,7 +1044,8 @@ static int amdgpu_ras_sysfs_remove_feature_node(struct amdgpu_device *adev)
>>>>               .attrs = attrs,
>>>>       };
>>>>
>>>> -    sysfs_remove_group(&adev->dev->kobj, &group);
>>>> +    if (!drm_dev_is_unplugged(&adev->ddev))
>>>> +            sysfs_remove_group(&adev->dev->kobj, &group);
>>> This looks wrong. sysfs, like any other interface, should be
>>> unconditionally thrown out when we do the drm_dev_unregister. Whether
>>> hotunplugged or not should matter at all. Either this isn't needed at all,
>>> or something is wrong with the ordering here. But definitely fishy.
>>> -Daniel
>>
>> So technically this is needed because kobejct's sysfs directory entry kobj->sd
>> is set to NULL
>> on device removal (from sysfs_remove_dir) but because we don't finalize the device
>> until last reference to drm file is dropped (which can happen later) we end up
>> calling sysfs_remove_file/dir after
>> this pointer is NULL. sysfs_remove_file checks for NULL and aborts while
>> sysfs_remove_dir
>> is not and that why I guard against calls to sysfs_remove_dir.
>> But indeed the whole approach in the driver is incorrect, as Greg pointed out -
>> we should use
>> default groups attributes instead of explicit calls to sysfs interface and this
>> would save those troubles.
>> But again. the issue here of scope of work, converting all of amdgpu to default
>> groups attributes is somewhat
>> lengthy process with extra testing as the entire driver is papered with sysfs
>> references and seems to me more of a standalone
>> cleanup, just like switching to devm_ and drmm_ work. To me at least it seems
>> that it makes more sense
>> to finalize and push the hot unplug patches so that this new functionality can
>> be part of the driver sooner
>> and then incrementally improve it by working on those other topics. Just as
>> devm_/drmm_ I also added sysfs cleanup
>> to my TODO list in the RFC patch.
> Hm, whether you solve this with the default group stuff to
> auto-remove, or remove explicitly at the right time doesn't matter
> much. The underlying problem you have here is that it's done way too
> late.

As far as I understood correctly the default group attrs by reading this
article by Greg - https://www.linux.com/news/how-create-sysfs-file-correctly/
it will be removed together with the device and not too late like now and I quote
from the last paragraph there:

"By setting this value, you don’t have to do anything in your
probe() or release() functions at all in order for the
sysfs files to be properly created and destroyed whenever your
device is added or removed from the system. And you will, most
importantly, do it in a race-free manner, which is always a good thing."

To me this seems like the best solution to the late remove issue. What do
you think ?


>   sysfs removal (like all uapi interfaces) need to be removed as
> part of drm_dev_unregister.


Do you mean we need to trace and aggregate all sysfs files creation within
the low level drivers and then call some sysfs release function inside 
drm_dev_unregister
to iterate and release them all ?


>   I guess aside from the split into fini_hw
> and fini_sw, you also need an unregister_late callback (like we have
> already for drm_connector, so that e.g. backlight and similar stuff
> can be unregistered).


Is this the callback you suggest to call from within drm_dev_unregister and
it will be responsible to release all sysfs files created within the driver ?

Andrey


>
> Papering over the underlying bug like this doesn't really fix much,
> the lifetimes are still wrong.
> -Daniel
>
>> Andrey
>>
>>
>>>>       return 0;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>>>> index 2b7c90b..54331fc 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>>>> @@ -24,6 +24,7 @@
>>>>    #include <linux/firmware.h>
>>>>    #include <linux/slab.h>
>>>>    #include <linux/module.h>
>>>> +#include <drm/drm_drv.h>
>>>>
>>>>    #include "amdgpu.h"
>>>>    #include "amdgpu_ucode.h"
>>>> @@ -464,7 +465,8 @@ int amdgpu_ucode_sysfs_init(struct amdgpu_device *adev)
>>>>
>>>>    void amdgpu_ucode_sysfs_fini(struct amdgpu_device *adev)
>>>>    {
>>>> -    sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
>>>> +    if (!drm_dev_is_unplugged(&adev->ddev))
>>>> +            sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
>>>>    }
>>>>
>>>>    static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
>>>> --
>>>> 2.7.4
>>>>
>
>

--------------E94B1493006A219549533716
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/25/20 4:04 AM, Daniel Vetter
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAKMK7uE=AfP2p=UKjG=TFuFh8d0vphyHndxxEqqNNa+ouX48AQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Nov 24, 2020 at 11:27 PM Andrey Grodzovsky
<a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 11/24/20 9:49 AM, Daniel Vetter wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Sat, Nov 21, 2020 at 12:21:20AM -0500, Andrey Grodzovsky wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Avoids NULL ptr due to kobj-&gt;sd being unset on device removal.

Signed-off-by: Andrey Grodzovsky <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a>
---
  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c   | 4 +++-
  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 +++-
  2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index caf828a..812e592 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -27,6 +27,7 @@
  #include &lt;linux/uaccess.h&gt;
  #include &lt;linux/reboot.h&gt;
  #include &lt;linux/syscalls.h&gt;
+#include &lt;drm/drm_drv.h&gt;

  #include &quot;amdgpu.h&quot;
  #include &quot;amdgpu_ras.h&quot;
@@ -1043,7 +1044,8 @@ static int amdgpu_ras_sysfs_remove_feature_node(struct amdgpu_device *adev)
             .attrs = attrs,
     };

-    sysfs_remove_group(&amp;adev-&gt;dev-&gt;kobj, &amp;group);
+    if (!drm_dev_is_unplugged(&amp;adev-&gt;ddev))
+            sysfs_remove_group(&amp;adev-&gt;dev-&gt;kobj, &amp;group);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This looks wrong. sysfs, like any other interface, should be
unconditionally thrown out when we do the drm_dev_unregister. Whether
hotunplugged or not should matter at all. Either this isn't needed at all,
or something is wrong with the ordering here. But definitely fishy.
-Daniel
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

So technically this is needed because kobejct's sysfs directory entry kobj-&gt;sd
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
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hm, whether you solve this with the default group stuff to
auto-remove, or remove explicitly at the right time doesn't matter
much. The underlying problem you have here is that it's done way too
late.</pre>
    </blockquote>
    <p>As far as I understood correctly the default group attrs by
      reading this<br>
      article by Greg -
      <a class="moz-txt-link-freetext" href="https://www.linux.com/news/how-create-sysfs-file-correctly/">https://www.linux.com/news/how-create-sysfs-file-correctly/</a><br>
      it will be removed together with the device and not too late like
      now and I quote<br>
      from the last paragraph there:</p>
    <p>&quot;<span style="color: rgb(34, 34, 34); font-family: Verdana,
        Geneva, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">By setting
        this value, you don’t have to do anything in your</span><br style="box-sizing: border-box; color: rgb(34, 34, 34);
        font-family: Verdana, Geneva, sans-serif; font-size: 15px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial;">
      <tt style="box-sizing: border-box; color: rgb(34, 34, 34);
        font-size: 15px; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial;">probe()</tt><span style="color: rgb(34, 34, 34); font-family: Verdana, Geneva,
        sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">&nbsp;or&nbsp;</span><tt style="box-sizing: border-box; color: rgb(34, 34, 34);
        font-size: 15px; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial;">release()</tt><span style="color: rgb(34, 34, 34); font-family: Verdana, Geneva,
        sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">&nbsp;functions at
        all in order for the</span><br style="box-sizing: border-box;
        color: rgb(34, 34, 34); font-family: Verdana, Geneva,
        sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial;">
      <tt style="box-sizing: border-box; color: rgb(34, 34, 34);
        font-size: 15px; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial;">sysfs</tt><span style="color: rgb(34, 34, 34); font-family: Verdana, Geneva,
        sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">&nbsp;files to be
        properly created and destroyed whenever your</span><br style="box-sizing: border-box; color: rgb(34, 34, 34);
        font-family: Verdana, Geneva, sans-serif; font-size: 15px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial;">
      <span style="color: rgb(34, 34, 34); font-family: Verdana, Geneva,
        sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">device is
        added or removed from the system. And you will, most</span><br style="box-sizing: border-box; color: rgb(34, 34, 34);
        font-family: Verdana, Geneva, sans-serif; font-size: 15px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial;">
      <span style="color: rgb(34, 34, 34); font-family: Verdana, Geneva,
        sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">importantly,
        do it in a race-free manner, which is always a good thing.&quot;</span></p>
    <p><span style="color: rgb(34, 34, 34); font-size: 15px; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; text-align:
        start; text-indent: 0px; text-transform: none; white-space:
        normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">To me this seems like the best
        solution to the late remove issue. What do<br>
        you think ?</span></p>
    <p><span style="color: rgb(34, 34, 34); font-family: Verdana,
        Geneva, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"><br>
      </span></p>
    <blockquote type="cite" cite="mid:CAKMK7uE=AfP2p=UKjG=TFuFh8d0vphyHndxxEqqNNa+ouX48AQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap=""> sysfs removal (like all uapi interfaces) need to be removed as
part of drm_dev_unregister.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Do you mean we need to trace and aggregate all sysfs files
      creation within<br>
      the low level drivers and then call some sysfs release function
      inside drm_dev_unregister<br>
      to iterate and release them all ?</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CAKMK7uE=AfP2p=UKjG=TFuFh8d0vphyHndxxEqqNNa+ouX48AQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap=""> I guess aside from the split into fini_hw
and fini_sw, you also need an unregister_late callback (like we have
already for drm_connector, so that e.g. backlight and similar stuff
can be unregistered).</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Is this the callback you suggest to call from within
      drm_dev_unregister and<br>
      it will be responsible to release all sysfs files created within
      the driver ?</p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CAKMK7uE=AfP2p=UKjG=TFuFh8d0vphyHndxxEqqNNa+ouX48AQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Papering over the underlying bug like this doesn't really fix much,
the lifetimes are still wrong.
-Daniel

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Andrey


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
     return 0;
  }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 2b7c90b..54331fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -24,6 +24,7 @@
  #include &lt;linux/firmware.h&gt;
  #include &lt;linux/slab.h&gt;
  #include &lt;linux/module.h&gt;
+#include &lt;drm/drm_drv.h&gt;

  #include &quot;amdgpu.h&quot;
  #include &quot;amdgpu_ucode.h&quot;
@@ -464,7 +465,8 @@ int amdgpu_ucode_sysfs_init(struct amdgpu_device *adev)

  void amdgpu_ucode_sysfs_fini(struct amdgpu_device *adev)
  {
-    sysfs_remove_group(&amp;adev-&gt;dev-&gt;kobj, &amp;fw_attr_group);
+    if (!drm_dev_is_unplugged(&amp;adev-&gt;ddev))
+            sysfs_remove_group(&amp;adev-&gt;dev-&gt;kobj, &amp;fw_attr_group);
  }

  static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
--
2.7.4

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E94B1493006A219549533716--

--===============1439525421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1439525421==--
