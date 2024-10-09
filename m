Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9D9969C2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 14:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8FA10E2A0;
	Wed,  9 Oct 2024 12:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gmamKuxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2DA10E2A0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ul4wqHlWKHkxyXVn9YSvRZPRBPmspkB7b0YSbuVoyMM=; b=gmamKuxCbhOj3r0IelmNOf1oGJ
 SgzJVUksFeYnbP3aRLZfVwAhrB0MLBX18mTZpnDOOeYA27Ohgzah3FgTVRu7QwPpZ6+JPw9tcQ/f+
 uUACSBHtImoyy3RsCiKS1/XVQ52srZWVtg6zmN7VVkmqJ8uEm12+uAY0zdtSeHaQyIuU5Hu9AXUZg
 SKdDqNFCD8ySIwB7j2ITqUfdxICCM4T4KWUVH6KRQPhOAk3TnIU/scj3RwGecj57xnxnsEP6jGk7b
 h8m6O0h6ULZw4N0m64urhX5cey8/p3zTqhUeRDifn8j6yDEeQwXExkiYsKWlFd+zdRUMXi5lVAZNW
 oURQ54gQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1syVcT-006vzM-HV; Wed, 09 Oct 2024 14:16:45 +0200
Message-ID: <566ae236-77a0-4dd7-9b09-5a31172240b5@igalia.com>
Date: Wed, 9 Oct 2024 09:16:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] drm/vc4: v3d: add PM suspend/resume support
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com
References: <20241003124107.39153-1-wahrenst@gmx.net>
 <20241003124107.39153-3-wahrenst@gmx.net>
 <ce07a658-8e5c-4c9a-b0a5-77f1be54d524@igalia.com>
 <a04c4048-b8cb-4a8a-9fb7-00a5ed7bcd9d@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <a04c4048-b8cb-4a8a-9fb7-00a5ed7bcd9d@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Stefan,

On 10/8/24 13:05, Stefan Wahren wrote:
> Hi Maíra,
> 
> Am 08.10.24 um 15:49 schrieb Maíra Canal:
>> Hi Stefan,
>>
>> On 10/3/24 09:41, Stefan Wahren wrote:
>>> Add suspend/resume support for the VC4 V3D component in order
>>> to handle suspend to idle properly.
>>>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> ---
>>>   drivers/gpu/drm/vc4/vc4_v3d.c | 7 +++----
>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c
>>> b/drivers/gpu/drm/vc4/vc4_v3d.c
>>> index 2423826c89eb..8057b06c1f16 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
>>> @@ -368,7 +368,6 @@ void vc4_v3d_bin_bo_put(struct vc4_dev *vc4)
>>>       mutex_unlock(&vc4->bin_bo_lock);
>>>   }
>>>
>>> -#ifdef CONFIG_PM
>>>   static int vc4_v3d_runtime_suspend(struct device *dev)
>>>   {
>>>       struct vc4_v3d *v3d = dev_get_drvdata(dev);
>>> @@ -397,7 +396,6 @@ static int vc4_v3d_runtime_resume(struct device
>>> *dev)
>>>
>>>       return 0;
>>>   }
>>> -#endif
>>>
>>>   int vc4_v3d_debugfs_init(struct drm_minor *minor)
>>>   {
>>> @@ -507,7 +505,8 @@ static void vc4_v3d_unbind(struct device *dev,
>>> struct device *master,
>>>   }
>>>
>>>   static const struct dev_pm_ops vc4_v3d_pm_ops = {
>>> -    SET_RUNTIME_PM_OPS(vc4_v3d_runtime_suspend,
>>> vc4_v3d_runtime_resume, NULL)
>>> +    RUNTIME_PM_OPS(vc4_v3d_runtime_suspend, vc4_v3d_runtime_resume,
>>> NULL)
>>> +    SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>> pm_runtime_force_resume)
>>
>> I have a question: How can we guarantee that no jobs are running when
>> the system is forced to suspend?
> Not sure what do you mean with job. userspace task or v3d job within the
> driver?

I mean a V3D job. See, when we submit a CL to the GPU, we only know when
it's done through a IRQ. I'm thinking in the case where:

1. We submitted a CL to the GPU
2. We suspend but the job wasn't ended yet

What happens to this job? Is the GPU going to be in a unstable state
when we resume?

> 
> Do you have something specific in mind.
> 
> Why is there a difference between runtime pm and system pm?
>
As far as I can see, for system PM, we need at least to suspend V3D in
a stable state, without any jobs running and with IRQs disabled.

Best Regards,
- Maíra

> I must confess that i didn't test a system sleep while running a v3d
> application.
> 
> Best regards
> Stefan
>>
>> Best Regards,
>> - Maíra
>>
>>>   };
>>>
>>>   static const struct component_ops vc4_v3d_ops = {
>>> @@ -538,6 +537,6 @@ struct platform_driver vc4_v3d_driver = {
>>>       .driver = {
>>>           .name = "vc4_v3d",
>>>           .of_match_table = vc4_v3d_dt_match,
>>> -        .pm = &vc4_v3d_pm_ops,
>>> +        .pm = pm_ptr(&vc4_v3d_pm_ops),
>>>       },
>>>   };
>>> -- 
>>> 2.34.1
>>>
> 
