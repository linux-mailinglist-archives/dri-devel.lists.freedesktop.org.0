Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653677E365
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 16:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1317E10E0EE;
	Wed, 16 Aug 2023 14:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C335A10E0C3;
 Wed, 16 Aug 2023 14:17:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQ3r3/SoKVSItwUMgXC4EYR8DRqT3CkwBITAJze3uey3+W+CzHMlUWNfK+WnNSgeyH+VY+fFskxqJGiuChn1HAkVs2pWKTeD/hhUPjYGe17QzVjBdjOWDpshM7tj1pO/LXnJx2hhajUQuCIJPZ7Jc7w+4+CLUTHZWBis4X1vx0jtaSM10orgyXIBj7ZYd1nvULLojJs24QRg2jxEv4JHepzEuhDNe0z9b4MOdr4EsJyuNasZPYW5M31lJGb9DM0wtmRuCwz1bhKSK2OjRAI2qNElPbLLxZVpKNIiUc6xRaIL0caSdFZukfPkFhjMgaWqfDlyT/WhjAiMmsk1EvYU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIlYviRfxRmoTXiged3GPLYUZ2916nMZe5U43lL/lHk=;
 b=neiwULDnCrmw0TxYfG0CrucNSSUYQczpkzCP4IouHs7QC4oDVHqE0XTP9mY0d+5rgevxAxOYRynKgwE+lCghapQ1SODfU2qtcIVnUtNWx0+1PVIPd+Ib03LwW94wDCPVTBCbHV5Oqtv4Y+la02GFj69pqNcyidJKarBgdJ9+6DZ3ngYCNlmxsvxYci++zkVvMXJuPZqXFoO/Sz+gKM1dZb2M/ne0ukvNsG8+KCK67NbPIWJa2bf4VBFWoOeUu4zy6gq8uI5r82SMWbLDodBu0hAyNncDuwF/2BbiJVlGDp7Hbyjt7+yWDp4alA1DFwY/LqswN2aBbAqHfp/pUnTFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIlYviRfxRmoTXiged3GPLYUZ2916nMZe5U43lL/lHk=;
 b=skMDGbjRKLwgMCPkByR7RnsSPX75Nm6mZeqQF4f0TgvC3lLwOFfM5OqTbMkPSHrXLexwWLrEMg3OHszqVQC/Iji4Xv8uD4CMeS0HDZQ6zIxuLy6UubdY8FyW/aYMh28ZA1wBWMeU6Yg+n0uRtsEJUAple5CfdDPXFl6oDjLgsmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7809.namprd12.prod.outlook.com (2603:10b6:806:34e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 14:17:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 14:17:42 +0000
Message-ID: <9855fa7a-dd9d-27b8-171e-b662d417b902@amd.com>
Date: Wed, 16 Aug 2023 16:17:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/amdgpu: register a dirty framebuffer callback for
 fbcon
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230815172700.255596-1-hamza.mahfooz@amd.com>
 <d1831afd-9e02-fbc9-69f7-e8f044f35ee0@gmail.com>
 <855aeab8-13e1-4dc4-841e-24d298c9c072@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <855aeab8-13e1-4dc4-841e-24d298c9c072@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 591dc7f5-4c20-41b4-5ede-08db9e638de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8K4gmMxT/D+EnRhOQdlIIkf16urzpnFHc3A9dRzM8UfQ+TWLQbIDFDB/Nj0J/EVXK1wNONRqw4yQ6phdh4cjF/iISxfZKL8o6L8MqlxrOJkQg6Sz6IFS8+OT/rbAIih3Azg9JrzyjXA/9+H3AbKAkt0T86jikZHoDV8snOTqwfN74Dl5XgYJ5wRA8iYnJpsRgSCeW9/8ThtapyX5si17/A5fWw/sty68kcI3pSPPS1QqqUqMKpYXHSbFd8x5rHr47G0DwsqoBwaeWuBRgI52hqn1EK3bgXpJ6FGXEJIKVoigvNzZ72nghbN4KyKw2e5Szzc9lo7UdDq6IqYIgAg5lTvWegpCnody5tGSJLS6YuGCOpeXnJtYAeAOU6qhn7erHfK1a9BNBDVh73hnoo6bn/6IABH6tE+cBs1UorPxEdiyr/kK0tA0DmlM+Dcv++crj12tDrMIOhbsPP7W72l/yOeyqHT6TxZIfR0DaosX5vBKIPKUYwcirLQHzyK8JaYjnu5ZL4fVu4/5FDbTiYTTP3vqD85S/QlUPAmETEx6lb92e80pluD4yBNpmwA5eJ1fvPsYUWisFXqd4asSUJwFx/3C8x/nuCHsA6ydLeGG8ATDbbroTnDRY3fpZdvUMoFIMgC3HVZnHmnOlj3zF/e2AJMnAxO4pepDEzLCzIZpj1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(66946007)(66476007)(66556008)(966005)(41300700001)(5660300002)(66574015)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(2616005)(6486002)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1YxYWZKdC9RdnduZHFYaG51TGJBK3BHMDN0ZldWUENaV2tRNlI3MFdHazhh?=
 =?utf-8?B?cHE0OER3UjllaVcrakhxUnR3R0w5UzFzVG96WDVJWU4zbThyOEd0VEQzdHRy?=
 =?utf-8?B?U095d1JRL2JxdmJrYmpPZTlDcndUQXROcEVFUFZ1R2xCcExnZkVGMmlsdXZr?=
 =?utf-8?B?cm1wVHJWT0JaU2g5MUZGMGo3KzRkRE1vSVJSZnZRL2NDNmFaQi9nZ3FBYTlq?=
 =?utf-8?B?TTR5akxKdEppc0drcDRKUmZmdWFnam14a3J6Y1dvYjY0MzBYVHdpckNiTkht?=
 =?utf-8?B?cGxUWFN4ZWt0TG9CSDY2SnFNbWRSa0JyZ2dvMDJUYTFrMlZvWE1sbnhQUURV?=
 =?utf-8?B?NFAzZUpSWHVHZWpxYlpJR1gxS1dMNTRqVFNFRmxFZE5LTVpQbml5V0s4Nnp1?=
 =?utf-8?B?anRUVVRRUjNHaTV4MWZPQ1Y1NTNXTFBhVDM4cFBud3VIMjhxd3BBdUgva3Z2?=
 =?utf-8?B?WElteU9kUk1BUmNLUkxHT1Qzc1FveDAyYkQrRFB6aFR1bXh3Qk9VMDk1ZktT?=
 =?utf-8?B?MFpIWTVOYnI5OHRsYnFORGRsYjFLMlA3MFlqbzlmaFZlNEY4SUZJVHk1QXlK?=
 =?utf-8?B?L0hXTDZZa25VZ1ZDZmZCUzZlZlprOEF6Q2FPVWhDR3Mram5KOFg5T09kdkRo?=
 =?utf-8?B?YmhrZFNnZUtzWjliYUNhek5lWUhPbFVqa2JuZmdOSzg4THQxbGpMbEhTZ2Q3?=
 =?utf-8?B?TTFwQXFUa0pqWVdlT3V5QjNNdmtndU1INGZCTHJhN2VyZWJFVFJwSDAxSHNw?=
 =?utf-8?B?Q0kyS0QzTnUybGJQQUtGNmN5Z0hWVWhJTTJ1WWhrcWpwV2t0N1d0ZG1NaWEv?=
 =?utf-8?B?UkpwVloyekNTWkFNNnRmbGxuUzhpbFpYaFRSWGF1QThCaG1QVW93R0RnYlNo?=
 =?utf-8?B?bks1T2gwUlp6bmdWR3plY3hBMWZ4VFBtVVVQaEJUK2FFbFZZaSs4clYxRmdC?=
 =?utf-8?B?Tk9TenA5SXNRT2xWdE5iMUV5WTFWZUdET0E4WXl2VTA3TFdyM3ljdDJOOE5I?=
 =?utf-8?B?K0ZOdGhwSFBYeFp0UjhIREJqUko4dHd3RDhQa2xCdTZZYzRGZjljMUlZT3N0?=
 =?utf-8?B?RHhtMzVvR29ibE1hcHhER3lNNENvcXNRdk1zN1dZdnkyU1lUMHkxNUdxZlp4?=
 =?utf-8?B?ZW0yZnNjQ0FpeG40UjB5Nzh6WStmMzlYRk9WNkhQY0d5b3BNQmtPbmtxcUov?=
 =?utf-8?B?RnQySHdrOWllZ09LR1M4d0RUSVgwZFVUMUVPaXhBYTc5TWNRaFE4MFBNeElm?=
 =?utf-8?B?UE5KS0N1OWdSMllub3NTOUZsUkVNMDJhazVrTjl2UXg0cEpybGIvTDRObTMw?=
 =?utf-8?B?azJZbzdtN3FwbEZtaVlDS0JmU1gva2tHQnQxeVI1Y0JZL3EraXExb0pwN2VL?=
 =?utf-8?B?a3V1VzRiT21SbkNvWGJVa3VUQmVwSVE5UU90Y1dlbGNRUXQ0TGM1V3UvcGFI?=
 =?utf-8?B?NVlJT2JPcllQSHM1ZXNET3M3d3FVMFhySHE0S3dtaVhoelkzeXN6UElwdC8z?=
 =?utf-8?B?SmdrN0ROUWljZndxeFJpdXB3YlBQT1g3N3BNU3NtUndKdXVyU2JOTG95cktY?=
 =?utf-8?B?US9uRlArcFI1L25nQkIrcUhkRDN5TGlOcE9VS25XTHBpS205cVFKd2h5ZGc5?=
 =?utf-8?B?cW5WeUxMcUNvczJEZjdURUQyaWZvaHB6M0hNRm9PbGdxWjVBMTRqTFBWaHJl?=
 =?utf-8?B?TmkzK2cxRnBJcFltaUFGS0Y1eFRFdUlvUm4wc3NRT2RkRXJuWUdKVnJjcGtt?=
 =?utf-8?B?SjE2RE9IaTVnT2VXRys2Q20wQmdZaXFmbWlkSlNlbm5tRUJ5MklzaFJMSEJP?=
 =?utf-8?B?L2pUeHVzVmhpY045OThKUTduNXFNSUpXek9PMWZwRzk3enhBbklCN0prSURo?=
 =?utf-8?B?aTd1NXBUbjduOVZGN0NPT0Vhc3REZUZ3ZUl6bEsxYVQzSjFuTE42SzFickVR?=
 =?utf-8?B?NDBvWlpudTZJckF1bHh6SDJBSWVETUFRNktmK0VvNWxTbE1BMWNIMGlwck9z?=
 =?utf-8?B?UkppWW1KOVdPUTUzckppQVhmb3JnUnlxZ1F4Mlk1eGtFUDV1KytyUFRKSkIv?=
 =?utf-8?B?SytycTA1eXRLQkNYelA1bTJ1REozOFJHTHEyWmRidlBFNitkaFkvMlB1eTht?=
 =?utf-8?Q?pccKKinXBPOvo81+gyvSmhe/J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591dc7f5-4c20-41b4-5ede-08db9e638de8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 14:17:42.4597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9LJEn8KJaIxOpa8Xhtsk1BQDRsk4uaCqA5Ark2Orr/jAvUtpMhyE1s7htPmHruV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7809
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.08.23 um 15:41 schrieb Hamza Mahfooz:
>
> On 8/16/23 01:55, Christian König wrote:
>>
>>
>> Am 15.08.23 um 19:26 schrieb Hamza Mahfooz:
>>> fbcon requires that we implement &drm_framebuffer_funcs.dirty.
>>> Otherwise, the framebuffer might take a while to flush (which would
>>> manifest as noticeable lag). However, we can't enable this callback for
>>> non-fbcon cases since it might cause too many atomic commits to be made
>>> at once. So, implement amdgpu_dirtyfb() and only enable it for fbcon
>>> framebuffers on devices that support atomic KMS.
>>>
>>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>> Cc: stable@vger.kernel.org # 6.1+
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2519
>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>> ---
>>> v2: update variable names
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 26 
>>> ++++++++++++++++++++-
>>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>> index d20dd3f852fc..d3b59f99cb7c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>> @@ -38,6 +38,8 @@
>>>   #include <linux/pci.h>
>>>   #include <linux/pm_runtime.h>
>>>   #include <drm/drm_crtc_helper.h>
>>> +#include <drm/drm_damage_helper.h>
>>> +#include <drm/drm_drv.h>
>>>   #include <drm/drm_edid.h>
>>>   #include <drm/drm_fb_helper.h>
>>>   #include <drm/drm_gem_framebuffer_helper.h>
>>> @@ -532,11 +534,29 @@ bool amdgpu_display_ddc_probe(struct 
>>> amdgpu_connector *amdgpu_connector,
>>>       return true;
>>>   }
>>> +static int amdgpu_dirtyfb(struct drm_framebuffer *fb, struct 
>>> drm_file *file,
>>> +              unsigned int flags, unsigned int color,
>>> +              struct drm_clip_rect *clips, unsigned int num_clips)
>>> +{
>>> +
>>> +    if (strcmp(fb->comm, "[fbcon]"))
>>> +        return -ENOSYS;
>>
>> Once more to the v2 of this patch: Tests like those are a pretty big 
>> NO-GO for upstreaming.
>
> On closer inspection it is actually sufficient to check if `file` is
> NULL here (since it means that the request isn't from userspace). So, do
> you think that would be palatable for upstream?

That's certainly better than doing a string compare, but I'm not sure if 
that's sufficient.

In general drivers shouldn't have any special handling for fdcon.

You should probably have Thomas Zimmermann <tzimmermann@suse.de> take a 
look at this.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>> +
>>> +    return drm_atomic_helper_dirtyfb(fb, file, flags, color, clips,
>>> +                     num_clips);
>>> +}
>>> +
>>>   static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
>>>       .destroy = drm_gem_fb_destroy,
>>>       .create_handle = drm_gem_fb_create_handle,
>>>   };
>>> +static const struct drm_framebuffer_funcs amdgpu_fb_funcs_atomic = {
>>> +    .destroy = drm_gem_fb_destroy,
>>> +    .create_handle = drm_gem_fb_create_handle,
>>> +    .dirty = amdgpu_dirtyfb
>>> +};
>>> +
>>>   uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>>>                         uint64_t bo_flags)
>>>   {
>>> @@ -1139,7 +1159,11 @@ static int 
>>> amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
>>>       if (ret)
>>>           goto err;
>>> -    ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
>>> +    if (drm_drv_uses_atomic_modeset(dev))
>>> +        ret = drm_framebuffer_init(dev, &rfb->base,
>>> +                       &amdgpu_fb_funcs_atomic);
>>> +    else
>>> +        ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
>>>       if (ret)
>>>           goto err;
>>

