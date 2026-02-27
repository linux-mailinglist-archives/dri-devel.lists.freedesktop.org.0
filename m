Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEfcG1S1oWmMvgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 16:16:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D051B98F2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 16:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBE710EBBB;
	Fri, 27 Feb 2026 15:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="bRnb2yPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EF910EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 15:16:29 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso17872625e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 07:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772205388; x=1772810188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SDbmRdkKnF+R+3AIq+Y+qJnHc86/jTNbQ+TAerlSwZI=;
 b=bRnb2yPrdhTriDWcJwusJ76WXs3W0ZP88wjWcveRFtyDiPPtWXrL8yUdOpBQF2Dy63
 S/rYvp3GgEFnAwV9/RjZpO72MfqGbioz2zD8Ovxwy7eJ2TR2PcLdUeNt5PFMBfmvAGUj
 E97AfYFSxeIjzX/Fv7jbhk9ZgixlCsNaSIjG1kYXhjjMoZlpoW2SLN8173j8tNoW0nZn
 KxQbRp2AtSFI6y6wp9FoDFJKEUHy47Hak9a82wKRhwthlaG9+hGq/btYQ+bP99tJX4Ia
 zVw6OvbmKSPzokCrTpLambandb/VJXU+K7USnUhI2VIj29xJwIwnEhK1cMsF+8IvIw5h
 6KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772205388; x=1772810188;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDbmRdkKnF+R+3AIq+Y+qJnHc86/jTNbQ+TAerlSwZI=;
 b=onWgJZh4eopSsS0BTo85m+/S78Qba2LQ7MpTIPijVHyJBkQfG3EIUgat7gGW4t6m+8
 ru45Ua6IUQBfHs84SO3+AkuHcQLIBsn60b8OrPkc60dT+/ZvRmtVdPYg7haxdLt1jVcR
 JqU1SHQuu+YxjqdOjl7THUDjGtmGlhpwFOgne6/WpEXrnHlWHMF1Ibwq3tottl6I4wew
 pbzV+uNLCUPw3VmkLshY7205+bKAWJUoEjCZQgVCZwFPJGaKNLDD4+dQgs7reklKnZ2X
 YFhulpu/lHCbFzQYnX5DWVJDSOx3KACXt/UTEW5Um8RdOeIVY1eFfDdKFwq+0Drn9uVo
 cCuw==
X-Gm-Message-State: AOJu0YzrpHyFQaqlZ/V33wN557SUytYlvn7IHA64Oo4XTKlr2iEdubBJ
 HRxKjV/IXDLCLwKmJjgPcEuKgyW/CSLr83GL59/Yt71YtG7OzMloofvuUYPa7gc7VpY=
X-Gm-Gg: ATEYQzz6GTlADCExbk+2jw+y1cQ9EOAPgBtDPqwNOedN1V+V9CqgC5FcVm6jlgskPei
 LeF4+CwsWfNXrpMYGGIkl9XYpY2mwCnC/AXcBw+cmDGjTP8OAipLx9GBV/tnAJ2JqifHxG+m/jO
 v5eBF4U7/rl/RcLpiurFgT6RoVmtur25mJyeKkl0QPGLynJUeqJyc0qlge2GRT+2QGlPhUxuXW9
 L23GJobWLyCE6rTDvwpJGxyHOzwXZKgdETwmpbQZJ626nmcIP+6UjJNuwA1ctOli5CBYpORBPrU
 46ciKtrgjn6jMumZ8QWkHbMg95G/pkWNnT7JXXlD2myXjo62UTgagttWNtswzDrzqqY3ZyhHydf
 EW6UQt8Ayap4yMOl13o7bt07LKmTGlmm8jgr5dQSllm/oLKPKummzNy2yePyuFQd3KT9qUW/as4
 tEOtmPTE5nVm3gRpClRuk3TbXGsCAIU7ZAH3W1/hrFldr6
X-Received: by 2002:a05:600c:4e05:b0:483:b505:9db7 with SMTP id
 5b1f17b1804b1-483c9c0b940mr43879535e9.32.1772205387536; 
 Fri, 27 Feb 2026 07:16:27 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c76b20bsm7955985f8f.35.2026.02.27.07.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 07:16:27 -0800 (PST)
Message-ID: <79244f17-3e35-46cf-87d1-1a21dcff7812@ursulin.net>
Date: Fri, 27 Feb 2026 15:16:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20260227133113.235940-5-tzimmermann@suse.de>
 <c85eb64d-e4c2-41a2-9135-b52b3e8d7e12@ursulin.net>
 <4758c394-8c9a-4da2-a526-de06cbfa4c61@suse.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <4758c394-8c9a-4da2-a526-de06cbfa4c61@suse.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:intel-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:mid,ursulin.net:dkim,ursulin.net:email,intel.com:email]
X-Rspamd-Queue-Id: 16D051B98F2
X-Rspamd-Action: no action


On 27/02/2026 15:05, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.02.26 um 15:59 schrieb Tvrtko Ursulin:
>>
>> On 27/02/2026 13:31, Thomas Zimmermann wrote:
>>> Instead of testing import_attach for imported GEM buffers, invoke
>>> drm_gem_is_imported() to do the test. The test itself does not change.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>>> Cc: intel-gfx@lists.freedesktop.org
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/ 
>>> gpu/drm/i915/gem/i915_gem_object.c
>>> index 3f6f040c359d..798c920160cf 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> @@ -372,12 +372,12 @@ void __i915_gem_object_pages_fini(struct 
>>> drm_i915_gem_object *obj)
>>>        * and ttm_bo_cleanup_memtype_use() shouldn't be invoked for
>>>        * dma-buf, so it's safe to take the lock.
>>>        */
>>> -    if (obj->base.import_attach)
>>> +    if (drm_gem_is_imported(&obj->base))
>>>           i915_gem_object_lock(obj, NULL);
>>>         __i915_gem_object_put_pages(obj);
>>>   -    if (obj->base.import_attach)
>>> +    if (drm_gem_is_imported(&obj->base))
>>>           i915_gem_object_unlock(obj);
>>>         GEM_BUG_ON(i915_gem_object_has_pages(obj));
>>> @@ -391,7 +391,7 @@ void __i915_gem_free_object(struct 
>>> drm_i915_gem_object *obj)
>>>         bitmap_free(obj->bit_17);
>>>   -    if (obj->base.import_attach)
>>> +    if (drm_gem_is_imported(&obj->base))
>>>           drm_prime_gem_destroy(&obj->base, NULL);
>>>         drm_gem_free_mmap_offset(&obj->base);
>>
>> LGTM. Want us to merge it via i915 or you want to take the group via 
>> drm-misc?
> 
> Please merge it via i915 trees.
> 
>>
>> What is the end goal btw, just cleanup or you plan to remove/rename 
>> the member? If latter there are some other places which access it 
>> directly.
> 
> There's no further goal. It's just about making the code easier to 
> understand. I had these changes here for some time already and finally 
> wanted to get them merged..

Acknowledged and merged, thank you for the cleanup!

Regards,

Tvrtko

