Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ABAB4FE62
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCB110E756;
	Tue,  9 Sep 2025 13:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Oc36FKc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC3B10E75F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:58:11 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso34921675e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1757426290; x=1758031090;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L1erJz90J76ySmnYtMS2wXpRKHX+DN1TSKlm4TYg6Yg=;
 b=Oc36FKc6RydblOdoc4dS4SiyPOFHkG14zcJPb26vABS2kjO1G5BjVRn5XPsbuMw5zW
 LSBaui4NYnh1JFVHDBXCNJlDNhQRmrTsc3PlVui3DUfAdTf0u/EDnfNqHOeOVPTsrW59
 jf7w5xy5uwE1IXD18gduCq21tpdyXu9has/N3S729JUpWtVQRWb4NycUEsJ4wRVVz3Ck
 JLcxk+EaU5MF4QdEj/5wIdGUMZUtX/knPxkJNjjgwU1wd3kgDv3K5KCGhYBxpMFWCZEU
 SYAYG1mf2pmYIfUsSj4XdzljH5fgwJPyAZ289uGnTZmlzOKbpNqlwGDMcBYTyAc8LdEb
 s5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757426290; x=1758031090;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L1erJz90J76ySmnYtMS2wXpRKHX+DN1TSKlm4TYg6Yg=;
 b=W2X3uuGK9wm8EguAtPTPW0u4PUvnLq7e1jDMZZsR0ZjcCNIBzlnUgScKguOU0jSFWP
 vHWjEPT8hr1VVVLjHcumN4xmmdmjEqi6LBt8Oeqk0Wp7aXld75OHPh2AQYJ9reBWf1/O
 iS+vUyopUlbxyjjmE6sgTsUDdpNHNftedK+a5r+hPJNwo0IdavQD1MRkGotfBzeQnLZE
 Q/jK1AazvOwqw3l3T/Haf51xib4RKb5tCOQLG+29saoiz43njx7rYJ7DHoWFcI8vbwAJ
 chaM2OUIPStMKyyWDnlZDAEb4mx+NXDkC2jZ/YJD/q4WfnZdvNjtStxBIux2j9yKOKwi
 LgQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUo4lG/Tp7Lugil7uiZbDHhNpJQTVSNZKVvJ/SUVKkVx/w86qPOS1SEra34rgHYrdMyH2e8UmxM3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsWcZTlbjsaBn+xVgDOQ5Dn3aBEidLLfU0eb38ometdk0dhS1g
 YEqZak3tAreBf1zJavjIgGm8I9ntBb1PvUaEYvLXVEyHlmKFzxnUddXrdLUIbyES/q8=
X-Gm-Gg: ASbGnct4U7p/pfrKHnrhy4Oa+niz1ej1fSji4JXbTts9laF61pdpOLYB5TR/GbaYjkx
 CykP58zWX0to0yNx6EOj0cTPyv2Y3W24r5eKSR/0EythqmUYizmY9By6yTYO9sKJrgMC8GS9a1O
 B1VHDd/npSjg5GLSgN7KMaOcY09+gFwrCtWVVr41+0pQt55VQ07tSyhC4n20LZwgViflIWIk1PV
 HV0fNwqI265x1ayQ71UNsmIvcuKN8Vfmm/65AgT0MsL74nXV3/HksE+HzTz28atWOThZG1EOxns
 v++L7BSsFjl4bNMztHQ27LA/4QyKfnqZgjhKJAmqVkLVI4ZOikrXJsWgXe/OT5IDMdJR8Qw7676
 l/GVHNKsXeWDgJWmNB+I7P46079PgaIO633o=
X-Google-Smtp-Source: AGHT+IFYXDY1SQ0ZFRSPcY9QHcjRh3Bp7EqgCV1JDxOPQrTaCQxW4RHJgBrU4TI7SUJ4ejwHTfrLcQ==
X-Received: by 2002:a05:600c:1c97:b0:45d:e54b:fa0c with SMTP id
 5b1f17b1804b1-45de54bfc44mr95898835e9.17.1757426289864; 
 Tue, 09 Sep 2025 06:58:09 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df16a749fsm20689425e9.19.2025.09.09.06.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 06:58:08 -0700 (PDT)
Message-ID: <cca02540-d499-41b4-988c-dd2f1ce64b1e@ursulin.net>
Date: Tue, 9 Sep 2025 14:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9 v4] drm/i915: Move struct_mutex to drm_i915_private
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net
References: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
 <20250908131518.36625-2-luiz.mello@estudante.ufscar.br>
 <b6c5dc00-ecbc-4654-9d0e-efe8d2ae36e4@ursulin.net>
 <aMAwAlp_zm4bis4x@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <aMAwAlp_zm4bis4x@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 09/09/2025 14:47, Rodrigo Vivi wrote:
> On Mon, Sep 08, 2025 at 02:32:28PM +0100, Tvrtko Ursulin wrote:
>>
>> On 08/09/2025 14:15, Luiz Otavio Mello wrote:
>>> Move legacy BKL struct_mutex from drm_device to drm_i915_private, which
>>> is the last remaining user.
>>>
>>> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_drv.c                  |  2 --
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
>>>    drivers/gpu/drm/i915/i915_driver.c         |  2 ++
>>>    drivers/gpu/drm/i915/i915_drv.h            | 11 +++++++++++
>>>    drivers/gpu/drm/i915/i915_irq.c            |  4 ++--
>>>    include/drm/drm_device.h                   | 10 ----------
>>>    6 files changed, 17 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index cdd591b11488..ad3aee354ba3 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -694,7 +694,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>>>    	mutex_destroy(&dev->master_mutex);
>>>    	mutex_destroy(&dev->clientlist_mutex);
>>>    	mutex_destroy(&dev->filelist_mutex);
>>> -	mutex_destroy(&dev->struct_mutex);
>>>    }
>>>    static int drm_dev_init(struct drm_device *dev,
>>> @@ -735,7 +734,6 @@ static int drm_dev_init(struct drm_device *dev,
>>>    	INIT_LIST_HEAD(&dev->vblank_event_list);
>>>    	spin_lock_init(&dev->event_lock);
>>> -	mutex_init(&dev->struct_mutex);
>>>    	mutex_init(&dev->filelist_mutex);
>>>    	mutex_init(&dev->clientlist_mutex);
>>>    	mutex_init(&dev->master_mutex);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>>> index 09a64f224c49..65ffcaeee4b9 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>>> @@ -677,7 +677,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>>>    	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
>>>    		return -EINVAL;
>>> -	mutex_lock(&i915->drm.struct_mutex);
>>> +	mutex_lock(&i915->struct_mutex);
>>>    	if (log->level == level)
>>>    		goto out_unlock;
>>> @@ -695,7 +695,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>>>    	log->level = level;
>>>    out_unlock:
>>> -	mutex_unlock(&i915->drm.struct_mutex);
>>> +	mutex_unlock(&i915->struct_mutex);
>>>    	return ret;
>>>    }
>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>>> index c6263c6d3384..d1559fd8ad3d 100644
>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>> @@ -233,6 +233,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>>>    	intel_sbi_init(display);
>>>    	vlv_iosf_sb_init(dev_priv);
>>> +	mutex_init(&dev_priv->struct_mutex);
>>>    	mutex_init(&dev_priv->sb_lock);
>>>    	i915_memcpy_init_early(dev_priv);
>>> @@ -291,6 +292,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
>>>    	i915_workqueues_cleanup(dev_priv);
>>>    	mutex_destroy(&dev_priv->sb_lock);
>>> +	mutex_destroy(&dev_priv->struct_mutex);
>>>    	vlv_iosf_sb_fini(dev_priv);
>>>    	intel_sbi_fini(display);
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>> index 4e4e89746aa6..15f66a7d496d 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -222,6 +222,17 @@ struct drm_i915_private {
>>>    	bool irqs_enabled;
>>> +	/*
>>> +	 * Currently, struct_mutex is only used by the i915 driver as a replacement
>>> +	 * for BKL.
>>
>> It's not a replacement for the BKL (i915 does not use the "good old" BKL
>> since who knows when), but just a mutex (ab)used by the GuC logging and IVB
>> parity interrupt work.
>>
>> At least the comment should be improved, or even better, if not too much
>> work, consider splitting into two separate mutexes. One could probably live
>> in the i915->l3_parity and other in struct intel_guc_log.
>>
>> [comes back later]
>>
>> Never mind, I see that by the end of the series you get exactly there. I'd
>> say series is a bit churny and typically you wouldn't be adding and changing
>> so much just to remove it, but I can live with it in this instance.
> 
> Yeap, I had made same comment and got to the same conclusion.
> 
> Can I get your ack Tvrtko so I gen merge the gem/gt related patches in this
> series through drm-intel-next? or do you prefer to take this to gt-next?

Yes, that is fine by me.

Regards,

Tvrtko

> 
> I have confirmed that this version is the same one that I had submitted to
> CI and got positive results.
> 
> We just need to add the missing acks from Thomas in the both patches
> touching drm files.
> 
> Thanks,
> Rodrigo.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +	 *
>>> +	 * For this reason, it is no longer part of struct drm_device.
>>> +	 */
>>> +	struct mutex struct_mutex;
>>> +
>>> +	/* LPT/WPT IOSF sideband protection */
>>> +	struct mutex sbi_lock;
>>> +
>>>    	/* VLV/CHV IOSF sideband */
>>>    	struct {
>>>    		struct mutex lock; /* protect sideband access */
>>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>>> index 191ed8bb1d9c..cdfb09464134 100644
>>> --- a/drivers/gpu/drm/i915/i915_irq.c
>>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>>> @@ -167,7 +167,7 @@ static void ivb_parity_work(struct work_struct *work)
>>>    	 * In order to prevent a get/put style interface, acquire struct mutex
>>>    	 * any time we access those registers.
>>>    	 */
>>> -	mutex_lock(&dev_priv->drm.struct_mutex);
>>> +	mutex_lock(&dev_priv->struct_mutex);
>>>    	/* If we've screwed up tracking, just let the interrupt fire again */
>>>    	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
>>> @@ -225,7 +225,7 @@ static void ivb_parity_work(struct work_struct *work)
>>>    	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
>>>    	spin_unlock_irq(gt->irq_lock);
>>> -	mutex_unlock(&dev_priv->drm.struct_mutex);
>>> +	mutex_unlock(&dev_priv->struct_mutex);
>>>    }
>>>    static irqreturn_t valleyview_irq_handler(int irq, void *arg)
>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>> index a33aedd5e9ec..016df5529d46 100644
>>> --- a/include/drm/drm_device.h
>>> +++ b/include/drm/drm_device.h
>>> @@ -188,16 +188,6 @@ struct drm_device {
>>>    	/** @unique: Unique name of the device */
>>>    	char *unique;
>>> -	/**
>>> -	 * @struct_mutex:
>>> -	 *
>>> -	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
>>> -	 *
>>> -	 * TODO: This lock used to be the BKL of the DRM subsystem. Move the
>>> -	 *       lock into i915, which is the only remaining user.
>>> -	 */
>>> -	struct mutex struct_mutex;
>>> -
>>>    	/**
>>>    	 * @master_mutex:
>>>    	 *
>>

