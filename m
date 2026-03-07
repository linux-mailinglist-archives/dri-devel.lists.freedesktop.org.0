Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDujC2xirGkPpQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 18:37:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EFC22D090
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 18:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACF310E045;
	Sat,  7 Mar 2026 17:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="DaJ0rSXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501CA10E045
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 17:37:44 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-c73770b3f15so754810a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 09:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1772905064; x=1773509864;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bVULmz2BxxvRJa1HnZKqRuCqEGYadbewVb4tAwIdIfM=;
 b=DaJ0rSXjzkHpcmfKM1tr+x2++eIG8fvV4avjn6tDYgoUoZssPAYyi+jKDxRGtwy/Jf
 YdXbKE3deny0JvT2a2siufSdsUgW27+GRimToNxeEqTvrLQIoX/51a/2Up/rClF1QxKm
 r5om8xWd9Hu0Cn6ZVMZMElteGeoxM/9vfQ72sHfKLTOt/3KZB3YsMTct//2nOA2y9F4I
 DyAOtqdyc+oeqNON7q2uKj4XnEgvzBtw5sjFojY+OvGFMfvqtshTSLTYpSmdIN72nkAN
 wwUlvvcQ+iDq1yZneambwlrWid59nFmRhxuQ98G/gKmijwSZBArrbEdVQZWia6XDUARX
 w8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772905064; x=1773509864;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bVULmz2BxxvRJa1HnZKqRuCqEGYadbewVb4tAwIdIfM=;
 b=gCI0v162iK9edCFtI40lajn0NQVfbI/lQounxSe1ynk7QMOmH8OfvhQW/BjvM/GZ3A
 HzKaBTXVIImWtM2+3CveMWHV7aRSaQSHvDOqYACm551UyjwbkqzNVkfusk800x+tO86g
 edQsXuIg+gguOpwhQXbk+OxTSvOEOCdMNG7oBZD1f+LsRRTrGyMn5DmpxiGoOOyGiaxS
 Slw9SfBeD4YSevm3Mefp0Hhy6/RNRIWbW6f4zIbj+94xpivrYIBzJzFFQ4aa2l6NkLiV
 3oBohYKyItqxV/VAFs7PkHm04wBSpH9KWM3F7aNSlBGKT4LAvjTALWeLyOAnMJGkSaCL
 BHHg==
X-Gm-Message-State: AOJu0Yw83pKbTh8xeYRMzYr0ixz3KBsLOSoYrDIzUzGVEHxxN6dQid7I
 gOtWYCqLHpseFsYPDLCF/Qp0tguYUEXz82UAwfE8lLjOJQLAxLOGBgMQigLdpezn98U=
X-Gm-Gg: ATEYQzzzVg44SeigkDWnm+XjWawvHOH3n4NsJCTIZhejQn+57TqqUYN9NYISkukBPBw
 /l0ENDKTV7+/BbI0AYLVMd+ZWQvrJQtmcOmXgaHBaIRfQ5ASTltp0LatxYQB8d8gUSfLs/xJ5Ng
 MMwK4Z0GZGrVER4JW8/H0ucNE7nXSDM9Hw9rH0piKd3CL81Y/W9hDoaR9WJ1+t9EjFozFdaoP/M
 V+E7RjW8FM+0c5B1ZsoMgyOYSFkaBaiRFpqkaNTm4mSlvL1AK6QwM04iWNolqkzOaUdd8q0W0OU
 mEKWbILZ/eKMm7VAML6oGpqAs48XWGx7x5gAvRLtyMvHwPI7g7gIkur96af5ty32qRBR0hy85sP
 GxE/Riu1qX7GbrQ3EcsD2U70Tnz/NEccPQX5yMTuOnivFsAnqetCvmORMyypbMlrv6omgoSXnXF
 sU3ziZuHyoG2EHZcwg5olNFSD4
X-Received: by 2002:a17:902:f541:b0:2ae:4ebc:71e4 with SMTP id
 d9443c01a7336-2ae824f4edemr44203855ad.7.1772905063710; 
 Sat, 07 Mar 2026 09:37:43 -0800 (PST)
Received: from [10.0.0.102] ([132.147.84.99]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83e57cb1sm53709565ad.9.2026.03.07.09.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2026 09:37:43 -0800 (PST)
Message-ID: <ac8f0d3c-6ad1-4456-b2d9-01e47a1cdea6@shenghaoyang.info>
Date: Sun, 8 Mar 2026 01:37:35 +0800
MIME-Version: 1.0
From: Shenghao Yang <me@shenghaoyang.info>
Subject: Re: [PATCH v5] drm/gud: fix NULL crtc dereference on display disable
To: Ruben Wauters <rubenru09@aol.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20260222054551.80864-1-me@shenghaoyang.info>
 <1ffb000d-8189-405d-861b-6eb449773f56@suse.de>
 <7b97e2517371b8e76cded18820090e44759bceb3.camel@aol.com>
 <e35a45c39b8d8c8e9d095ca857570b8a910c90f8.camel@aol.com>
Content-Language: en-US
In-Reply-To: <e35a45c39b8d8c8e9d095ca857570b8a910c90f8.camel@aol.com>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: 89EFC22D090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[shenghaoyang.info,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[shenghaoyang.info:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rubenru09@aol.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[aol.com,suse.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[shenghaoyang.info:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linaro.org:email]
X-Rspamd-Action: no action

Hi Ruben,

> Just as a note, it seems that 6.18 has been designated a longterm
> support release, and as such it would be a good idea/appropriate to
> also backport this to 6.18, since the bug exists in that version too.
> 
> Shenghao, Would you prefer for me to backport this on merge when it
> fails to apply it, or would you like me to add the cc stable tags, and
> on failure, for you to backport it yourself?

I'm good with either! Maybe we go with what's more convenient for you?
The backport resolution (I think) should just be a single line move: 

+       drm->mode_config.helper_private = &gud_mode_config_helpers;

Thanks,

Shenghao

On 4/3/26 21:53, Ruben Wauters wrote:
> On Wed, 2026-02-25 at 11:52 +0000, Ruben Wauters wrote:
>> On Wed, 2026-02-25 at 09:52 +0100, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 22.02.26 um 06:45 schrieb Shenghao Yang:
>>>> gud_plane_atomic_update() currently handles both crtc state and
>>>> framebuffer updates - the complexity has led to a few accidental
>>>> NULL pointer dereferences.
>>>>
>>>> Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
>>>> on USB disconnect") [1] fixed an earlier dereference but planes
>>>> can also be disabled in non-hotplug paths (e.g. display disables
>>>> via the desktop environment). The drm_dev_enter() call would not
>>>> cause an early return in those and subsequently oops on
>>>> dereferencing crtc:
>>>>
>>>> BUG: kernel NULL pointer dereference, address: 00000000000005c8
>>>> CPU: 6 UID: 1000 PID: 3473 Comm: kwin_wayland Not tainted 6.18.2-200.vanilla.gud.fc42.x86_64 #1 PREEMPT(lazy)
>>>> RIP: 0010:gud_plane_atomic_update+0x148/0x470 [gud]
>>>>   <TASK>
>>>>   drm_atomic_helper_commit_planes+0x28e/0x310
>>>>   drm_atomic_helper_commit_tail+0x2a/0x70
>>>>   commit_tail+0xf1/0x150
>>>>   drm_atomic_helper_commit+0x13c/0x180
>>>>   drm_atomic_commit+0xb1/0xe0
>>>> info ? __pfx___drm_printfn_info+0x10/0x10
>>>>   drm_mode_atomic_ioctl+0x70f/0x7c0
>>>>   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>>>>   drm_ioctl_kernel+0xae/0x100
>>>>   drm_ioctl+0x2a8/0x550
>>>>   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>>>>   __x64_sys_ioctl+0x97/0xe0
>>>>   do_syscall_64+0x7e/0x7f0
>>>>   ? __ct_user_enter+0x56/0xd0
>>>>   ? do_syscall_64+0x158/0x7f0
>>>>   ? __ct_user_enter+0x56/0xd0
>>>>   ? do_syscall_64+0x158/0x7f0
>>>>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>
>>>> Split out crtc handling from gud_plane_atomic_update() into
>>>> atomic_enable() and atomic_disable() functions to delegate
>>>> crtc state transitioning work to the DRM helpers.
>>>>
>>>> To preserve the gud state commit sequence [2], switch to
>>>> the runtime PM version of drm_atomic_helper_commit_tail() which
>>>> ensures that crtcs are enabled (hence sending the
>>>> GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE
>>>> requests) before a framebuffer update is sent.
>>>>
>>>> [1] https://lore.kernel.org/all/20251231055039.44266-1-me@shenghaoyang.info/
>>>> [2] https://github.com/notro/gud/wiki/GUD-Protocol#display-state
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/
>>>> Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with DRM atomic helpers")
>>>> Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
>>>
>>> AFAICT this looks good.
>>>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Acked-by: Ruben Wauters <rubenru09@aol.com>
>>
>> This will likely require a CC stable for 6.19 at least, possibly also
>> 6.18, though I'm not 100% sure how long that one will last with 7.0-rc1
>> being released.
> 
> Just as a note, it seems that 6.18 has been designated a longterm
> support release, and as such it would be a good idea/appropriate to
> also backport this to 6.18, since the bug exists in that version too.
> 
> Shenghao, Would you prefer for me to backport this on merge when it
> fails to apply it, or would you like me to add the cc stable tags, and
> on failure, for you to backport it yourself?
> 
> Ruben
>>
>> I can add this when I merge it.
>>>
>>> Best regards
>>> Thomas
>>>
>>>> ---
>>>> v5: Send SET_CONTROLLER_ENABLE and SET_STATE_COMMIT unconditionally on
>>>>      crtc enable
>>>> v4: Send SET_DISPLAY_ENABLE=1 unconditionally on crtc enable
>>>> v3: Dropped stable AUTOSEL opt out
>>>> v2: Moved controller and display control commands to crtc
>>>>      enable / disable functions.
>>>>
>>>> [v4]: https://lore.kernel.org/lkml/20260218054711.63982-1-me@shenghaoyang.info/
>>>> [v3]: https://lore.kernel.org/lkml/20260203172630.10077-1-me@shenghaoyang.info/
>>>> [v2]: https://lore.kernel.org/lkml/20260201095956.21042-1-me@shenghaoyang.info/
>>>> [v1]: https://lore.kernel.org/lkml/20260118125044.54467-1-me@shenghaoyang.info/
>>>>
>>>>   drivers/gpu/drm/gud/gud_drv.c      |  9 ++++-
>>>>   drivers/gpu/drm/gud/gud_internal.h |  4 +++
>>>>   drivers/gpu/drm/gud/gud_pipe.c     | 54 ++++++++++++++++++++----------
>>>>   3 files changed, 48 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
>>>> index d0122d477610..17c2dead2c13 100644
>>>> --- a/drivers/gpu/drm/gud/gud_drv.c
>>>> +++ b/drivers/gpu/drm/gud/gud_drv.c
>>>> @@ -339,7 +339,9 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
>>>>   }
>>>>   
>>>>   static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs = {
>>>> -	.atomic_check = drm_crtc_helper_atomic_check
>>>> +	.atomic_check = drm_crtc_helper_atomic_check,
>>>> +	.atomic_enable = gud_crtc_atomic_enable,
>>>> +	.atomic_disable = gud_crtc_atomic_disable,
>>>>   };
>>>>   
>>>>   static const struct drm_crtc_funcs gud_crtc_funcs = {
>>>> @@ -364,6 +366,10 @@ static const struct drm_plane_funcs gud_plane_funcs = {
>>>>   	DRM_GEM_SHADOW_PLANE_FUNCS,
>>>>   };
>>>>   
>>>> +static const struct drm_mode_config_helper_funcs gud_mode_config_helpers = {
>>>> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>>>> +};
>>>> +
>>>>   static const struct drm_mode_config_funcs gud_mode_config_funcs = {
>>>>   	.fb_create = drm_gem_fb_create_with_dirty,
>>>>   	.atomic_check = drm_atomic_helper_check,
>>>> @@ -499,6 +505,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>>>   	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
>>>>   	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
>>>>   	drm->mode_config.funcs = &gud_mode_config_funcs;
>>>> +	drm->mode_config.helper_private = &gud_mode_config_helpers;
>>>>   
>>>>   	/* Format init */
>>>>   	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
>>>> diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
>>>> index d27c31648341..a5b7e53cf79c 100644
>>>> --- a/drivers/gpu/drm/gud/gud_internal.h
>>>> +++ b/drivers/gpu/drm/gud/gud_internal.h
>>>> @@ -62,6 +62,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val);
>>>>   
>>>>   void gud_clear_damage(struct gud_device *gdrm);
>>>>   void gud_flush_work(struct work_struct *work);
>>>> +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
>>>> +			   struct drm_atomic_state *state);
>>>> +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
>>>> +			   struct drm_atomic_state *state);
>>>>   int gud_plane_atomic_check(struct drm_plane *plane,
>>>>   			   struct drm_atomic_state *state);
>>>>   void gud_plane_atomic_update(struct drm_plane *plane,
>>>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
>>>> index 4b77be94348d..587d6dd2b32e 100644
>>>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>>>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>>>> @@ -580,6 +580,39 @@ int gud_plane_atomic_check(struct drm_plane *plane,
>>>>   	return ret;
>>>>   }
>>>>   
>>>> +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
>>>> +			   struct drm_atomic_state *state)
>>>> +{
>>>> +	struct drm_device *drm = crtc->dev;
>>>> +	struct gud_device *gdrm = to_gud_device(drm);
>>>> +	int idx;
>>>> +
>>>> +	if (!drm_dev_enter(drm, &idx))
>>>> +		return;
>>>> +
>>>> +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
>>>> +	gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
>>>> +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 1);
>>>> +
>>>> +	drm_dev_exit(idx);
>>>> +}
>>>> +
>>>> +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
>>>> +			   struct drm_atomic_state *state)
>>>> +{
>>>> +	struct drm_device *drm = crtc->dev;
>>>> +	struct gud_device *gdrm = to_gud_device(drm);
>>>> +	int idx;
>>>> +
>>>> +	if (!drm_dev_enter(drm, &idx))
>>>> +		return;
>>>> +
>>>> +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 0);
>>>> +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
>>>> +
>>>> +	drm_dev_exit(idx);
>>>> +}
>>>> +
>>>>   void gud_plane_atomic_update(struct drm_plane *plane,
>>>>   			     struct drm_atomic_state *atomic_state)
>>>>   {
>>>> @@ -607,24 +640,12 @@ void gud_plane_atomic_update(struct drm_plane *plane,
>>>>   		mutex_unlock(&gdrm->damage_lock);
>>>>   	}
>>>>   
>>>> -	if (!drm_dev_enter(drm, &idx))
>>>> +	if (!crtc || !drm_dev_enter(drm, &idx))
>>>>   		return;
>>>>   
>>>> -	if (!old_state->fb)
>>>> -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
>>>> -
>>>> -	if (fb && (crtc->state->mode_changed || crtc->state->connectors_changed))
>>>> -		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
>>>> -
>>>> -	if (crtc->state->active_changed)
>>>> -		gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
>>>> -
>>>> -	if (!fb)
>>>> -		goto ctrl_disable;
>>>> -
>>>>   	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>>>   	if (ret)
>>>> -		goto ctrl_disable;
>>>> +		goto out;
>>>>   
>>>>   	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
>>>>   	drm_atomic_for_each_plane_damage(&iter, &damage)
>>>> @@ -632,9 +653,6 @@ void gud_plane_atomic_update(struct drm_plane *plane,
>>>>   
>>>>   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>>>>   
>>>> -ctrl_disable:
>>>> -	if (!crtc->state->enable)
>>>> -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
>>>> -
>>>> +out:
>>>>   	drm_dev_exit(idx);
>>>>   }

