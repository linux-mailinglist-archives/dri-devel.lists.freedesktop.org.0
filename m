Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59D77E2D6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 15:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2998010E36B;
	Wed, 16 Aug 2023 13:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7DC10E36B;
 Wed, 16 Aug 2023 13:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMrkH1CrXR04s/qXNv+qqlpp4ABhQAQFqc0aq4zIeqQzvFS+H9Z9kCQadPxERasfIJlE3uzziRcAcqPCCF5yW5CMyvC9sD1CazE5Io6F8J1yAoqYJkMH0nrn7C8qv1lJBebtoYqgmriYcQKCyR135zGUIGusqzVtOSpAH/ZcoKexGDYOEEv2HIgR2BSvdI4WKg3uLTrvz+U6x9dnGAGxOd9pKBePCuYv7D0S2pylCRVjfE/M38YOE/d0CzJqxX+NLPsvWbo2MRKkGlqXkn2kuRuABhj0mVp6aWCNf/87IGHnvKH0RYvfwR17pjVqs/MC06TAw5vu45wG0tooaz/ZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8L3YCLAKTA6V80l653tk0bn+5cbklpsHNwXGW0tipQ=;
 b=PUL37vOCFUGII/Ufv+Md+F82ejUKtN3DJuZ/+6HyNZUIq19O3PSemeEn57WBrmHjYFSaV/e+2xWM6ycHOCy6ZVpXxYNgWVXsshgfsxOX2neKBWbMIJ2NsoHabePb+lGSrfmA0R3+TObYesQvqxRo7/g+wdzDcuVonkj324DREL5xS3i4LClIfAl73HmfGVpVxW8LWYnHdbS0iSrYXzi+4frPfnSMviqSoaASudG/diBjy9Id/EMB9XASuIcrttdMt4i1i/6oSrKiKuNGxTEZTKrpm/N1wQu9bON7665bOQOnOW0lyVuoIGUoTy3yM+XKa+q0jhJYa9LwzcRff0GxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8L3YCLAKTA6V80l653tk0bn+5cbklpsHNwXGW0tipQ=;
 b=b412q/aG/qxxDasUu6G68K7GTcb7uvUWkKCCNwQ/nKNHI9I+ZQcoDFUwgSdj5tYLIkSzc06UMaqk6EahL76nyCP4ev4gvIp1jObkn+ePWXp6L2GAJ8SkH+kVkhpFsowyQrAD7qEkHIs7BkipRqPlmmNDH91chj7AXJAStWFTqPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SA1PR12MB7152.namprd12.prod.outlook.com (2603:10b6:806:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 13:41:24 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 13:41:24 +0000
Message-ID: <855aeab8-13e1-4dc4-841e-24d298c9c072@amd.com>
Date: Wed, 16 Aug 2023 09:41:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: register a dirty framebuffer callback for
 fbcon
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20230815172700.255596-1-hamza.mahfooz@amd.com>
 <d1831afd-9e02-fbc9-69f7-e8f044f35ee0@gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <d1831afd-9e02-fbc9-69f7-e8f044f35ee0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::10) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SA1PR12MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d84c495-8a19-4632-ca9b-08db9e5e7b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3BEnBU3FDz2zZ2KqWB9Ro73pLTPk3A99x7kIXtAaeGM+31F6ZDISa7kgTZ8LRXKQakyGV3LG/l1FjK6nmIQHGQgxl7Qn0cxAxp+WlhKa9inhCjpgsGbYhglERiUVZ8nqrqP1S+wEBOeAZnmsLHcD/Zvg4MAEale1y99jmx4CtmsQ/jECRiOriBe7jl7SFbpJOAtEZhpLBn7x8WLl7jPPJYbEeiSJh2Ytb70485yoQP9YpqGeOmZgsOi685a8Vdc1gU/BtUydguClnlOVrkDWd6vznLxM3MJxDb8jidVIsmgv7rXJxgO7F7cf4x5+l9OLRgWAJmhnOT0MUXj2dLAtIJchMDcx9faPSXU7mxGOr/WeVz1d2Nyz4mMMbpFjPaRxR+OzQeMl7SfmxRWk3qCVX/OBYfHjIj+NCstP+GNsv1dDRzyXHP4aWL86pHoTOdjS4BXe7Fhy0XVi9WLu9pCK4yfny/Vini3fyU5w7bSoinc3+M9j9wg+wk+N8J2z7K7HUERTIzNX9osHR5AMY6zmvHAs3P0wq0vQdC9Bb5ym7ofbFmSC1y3e7sGKLQPx9WJnQPlrdSlA2FmFyyt6+kOBH8vsMK5GVmO+52d10laxfo7fZ16LArfBlh5w3y1HG0vCJissphfvgExnlXEAY0BT4kCGseNjaWpTzR1PssXeScI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(66946007)(66476007)(66556008)(966005)(41300700001)(5660300002)(44832011)(66574015)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(2616005)(6486002)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEhQb3ptcmZVMmZmenlSYjBjR1h3enF5djRRUFlXWmdmOExROUQ1RHZBZFM0?=
 =?utf-8?B?dU9VSi8zQUJIVzR4bVEzeTZwWkdPdEdCVmRPeXk1Wm1DMExNcFV1Y2o2SSsy?=
 =?utf-8?B?N2pydkdSS3dwV1ZpOWJBWnd1V2ovZzIzSHd5RWN4TzBFRXllY0JFZFNob1J2?=
 =?utf-8?B?Q0R6VmthdnBoamQzQWxSaHlTUGxtUCtiTVFaZFVTYkw4U0VVMU9qazRKaS9a?=
 =?utf-8?B?bTJPdk04b0FFNmpBREZWWDNzNFJaTWI0ZUoxUUFFOVFaaVRST2d4NVFkNml2?=
 =?utf-8?B?LzVpY01oNEFtajFiYjBNMGphYVVOTVJsZGVYd3oyc2h6aWkreXh0azk3SXZE?=
 =?utf-8?B?SWtwUm1qbUJRTWtrWkpGN3MzMFRENDlyVXVmK285V2t0NDNReURHa1B2SzNt?=
 =?utf-8?B?c1hMUGVTZGF4TkMycm9xbEtWbm53MDBJTTNFRUVEOC9DenV0OEZWV3B2YXdL?=
 =?utf-8?B?bCtyaFFjV1d6NStTRGFXQkROTkJqNktkM0dMV1lvTGhCWUg2MzNhclp0TG0w?=
 =?utf-8?B?WGhjbktJMEtrU3VjVmdUQjM2OGtwYm5adVBJVzVWQTVvVzRka3dQQkZNRzh5?=
 =?utf-8?B?ZE12MjVueXZIbUR0RzJEUm05YzZGRmVzc1FwR3hpWU5yUkhSdmxvNUdvOC9K?=
 =?utf-8?B?OHh1TjJaeHp0bmJ2YXZxQTV2WFFTVjJDdUNZSkZIaGdydEVFbDMyTG5HRDF0?=
 =?utf-8?B?ZUVHcHlRaDYyTmozeUsyaldhQWxkMW5NZktRbG03WHhOSkZNYjFMcTB6aFZh?=
 =?utf-8?B?UXJjUXpzT3NmUU9sanh5emZrMC9ucnRqbXBhVFA4Z3FickY4djJuemQrY1B0?=
 =?utf-8?B?OG5DZVl4R21QSFF0OUR5eUtQbkwxZmVKSWlrLzJmTkQvWG5BOTZSbWpCY2NM?=
 =?utf-8?B?dGNKOE1UYVc2QjlaUVZlUjZLQkdmcmZxUDdpT0J0dVRkUzdtNzlqSFdUZElY?=
 =?utf-8?B?STRFOGpycHRzRFNXUWhwQTVMYXVvNERRcVF1RW9PZ25SNis3WW1WM3M1TXM4?=
 =?utf-8?B?aHk3Uk1yeUk5SEUyeHlWYVM3TTdBaTBvMCs2aFdWNyt1aGJqYnFVSmMwK016?=
 =?utf-8?B?SGZ5TnRiZG95TjhkTUdQN3hpVnhTRkVnejhrWUx5cEFiOWh0OFQ3WTUxQ0N1?=
 =?utf-8?B?NSsvWDdUYVpCbDc0T0JWaXVpblpINGhTQ2xqVDRnc1FhNHNRaDlwbkFzL29u?=
 =?utf-8?B?OW1ZZ011bWp2U1Y1UEVHSFhUVEZhajlNRktEOGI5Rnh6SkE4U1cxS1BCa3E3?=
 =?utf-8?B?QU5qYzFxTmZrMXlyMFVrRjhhN0w4bjN3U0dwcW5SbDErMDdDbWFBaWtEVzBx?=
 =?utf-8?B?UXdHb3UzTU8yVTNWZmJ2YXlxanBWSjhad2RTYW01Yk5GaHBCUm5LcTRpZzNM?=
 =?utf-8?B?M1ZMKzVHRnZNZVB6ODExUzF0ZUMzSDZ4N1ZwUFhFalRCWHJBeG0rai9ic2ZR?=
 =?utf-8?B?enJxRUErdk4wT1YvaERUYjdvTzQ1Rm82T1ltOUoxOUpEVytWZjdkem4rOVZu?=
 =?utf-8?B?ZllMQmFvVmZvdWx4em53dnVJVXgvN1JncG54QWUyQzM1RVYyVEpsRDNUOW5r?=
 =?utf-8?B?dmM0VlV6M0JHN0dSRXJqVXRnbWlHZ1o1YnFzMzZPalF6TFFvVlhMN0dGTVFq?=
 =?utf-8?B?RFVzU3MybjJrWDBJcVZFR1BqeFUzZ1lHdllYR3hncExhRjhMOTJsL3VOTjB2?=
 =?utf-8?B?NnZETW83ZzIybWVGUjNzbUVXS1lhd3BZR0ZSaEZ6ZldFQ0plZnZCOWVVelhm?=
 =?utf-8?B?Q0VPK00rV3UwNWZncEF1SE52ZU96K3NzRDRwTUdlaU1mQmVVL1Z4UFA1NXJE?=
 =?utf-8?B?S1BRQ1RWU2F5U1FVbEdtY1RaV0hSdittUkI1RThUQXExM2RMcFdLa3ZFMndX?=
 =?utf-8?B?bGhPU0FnSzNvRk1HaVRsN2JqV3FQVmFaZk5zRUcwMGJFR0g4VUFpUlh4WHlY?=
 =?utf-8?B?MytFQnhKV1FWdDBEd0dMdkNKZkVGTEE0WS9PUmgvUHlMR0xoajl6c2poeHFZ?=
 =?utf-8?B?aTJVUzZLSDhTWjk5a241am5oWXpMNzdmVGt5eDd1NENtdzNUUE8vTUNYNTZj?=
 =?utf-8?B?NzhEV0x2WUZ2YzIvbFkrVkY5dFd2WG1FR0VTK2dJbHRwWVl4ZzRXTmtJNS9l?=
 =?utf-8?Q?zAUZmtmEbgIi8XzX+Tef71cBq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d84c495-8a19-4632-ca9b-08db9e5e7b7b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 13:41:24.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dklfTVasSf/wMwgPvtz+Y8ECG6Ux7rUXYkOuxAKRip8mM0Psz65D9ju0fiAHkWYYZL6/DS4aPKVpWYPm+g1X1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7152
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/16/23 01:55, Christian König wrote:
> 
> 
> Am 15.08.23 um 19:26 schrieb Hamza Mahfooz:
>> fbcon requires that we implement &drm_framebuffer_funcs.dirty.
>> Otherwise, the framebuffer might take a while to flush (which would
>> manifest as noticeable lag). However, we can't enable this callback for
>> non-fbcon cases since it might cause too many atomic commits to be made
>> at once. So, implement amdgpu_dirtyfb() and only enable it for fbcon
>> framebuffers on devices that support atomic KMS.
>>
>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Cc: stable@vger.kernel.org # 6.1+
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2519
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>> v2: update variable names
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 26 ++++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> index d20dd3f852fc..d3b59f99cb7c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -38,6 +38,8 @@
>>   #include <linux/pci.h>
>>   #include <linux/pm_runtime.h>
>>   #include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_damage_helper.h>
>> +#include <drm/drm_drv.h>
>>   #include <drm/drm_edid.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>> @@ -532,11 +534,29 @@ bool amdgpu_display_ddc_probe(struct 
>> amdgpu_connector *amdgpu_connector,
>>       return true;
>>   }
>> +static int amdgpu_dirtyfb(struct drm_framebuffer *fb, struct drm_file 
>> *file,
>> +              unsigned int flags, unsigned int color,
>> +              struct drm_clip_rect *clips, unsigned int num_clips)
>> +{
>> +
>> +    if (strcmp(fb->comm, "[fbcon]"))
>> +        return -ENOSYS;
> 
> Once more to the v2 of this patch: Tests like those are a pretty big 
> NO-GO for upstreaming.

On closer inspection it is actually sufficient to check if `file` is
NULL here (since it means that the request isn't from userspace). So, do
you think that would be palatable for upstream?

> 
> Regards,
> Christian.
> 
>> +
>> +    return drm_atomic_helper_dirtyfb(fb, file, flags, color, clips,
>> +                     num_clips);
>> +}
>> +
>>   static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
>>       .destroy = drm_gem_fb_destroy,
>>       .create_handle = drm_gem_fb_create_handle,
>>   };
>> +static const struct drm_framebuffer_funcs amdgpu_fb_funcs_atomic = {
>> +    .destroy = drm_gem_fb_destroy,
>> +    .create_handle = drm_gem_fb_create_handle,
>> +    .dirty = amdgpu_dirtyfb
>> +};
>> +
>>   uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>>                         uint64_t bo_flags)
>>   {
>> @@ -1139,7 +1159,11 @@ static int 
>> amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
>>       if (ret)
>>           goto err;
>> -    ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
>> +    if (drm_drv_uses_atomic_modeset(dev))
>> +        ret = drm_framebuffer_init(dev, &rfb->base,
>> +                       &amdgpu_fb_funcs_atomic);
>> +    else
>> +        ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
>>       if (ret)
>>           goto err;
> 
-- 
Hamza

