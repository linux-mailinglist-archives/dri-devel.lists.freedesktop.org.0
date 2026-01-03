Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE091CF069E
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 23:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604C310E197;
	Sat,  3 Jan 2026 22:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="J2SKy2cV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BDA10E11F
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 17:48:03 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b9a2e3c4afcso476808a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 09:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1767462482; x=1768067282;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMMVHBbwwK7jtZ0OYDpGeyStVGVJxGzS7aRRfo4f/fk=;
 b=J2SKy2cVRJ1SuJeXg5KLT3CiAQOVq2Cbz85JJW4Vbje4pltDTX0i9s7vGYN62Eg4ak
 8cren695ExbdNpTliEt8UMnxIUcrN2TBVkPTZejo73JsCBRlMPZaTllkkGrOu3q9bnug
 1Qx8rADn8RQtoqGAmoXXZQsmBEjMBtA5B1a/GEmYvzM+F7HcqqDuUjW+dDq3cSEOB/aj
 SAiEgwJqjNXVcDy6fHrXBGVrwJxZYSReMGtXY5rjkblEcutvUy3MEZQcqSKCMMcSyT1v
 HbvyqH+dnGMZTDtzzre2H29GyFO9QdiLcrPEWwAAXZlm6j8g2UN1VqYN4nlK7kDuCQP/
 BWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767462482; x=1768067282;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CMMVHBbwwK7jtZ0OYDpGeyStVGVJxGzS7aRRfo4f/fk=;
 b=Is93ZppN2Wn9VinDXDZEKQArofSTBhMxseTlLmAGkW5GqTrrRD3YVtqfyrS2fbzlaA
 slwvfojTUzy/kdI0sKdy/0zmJJL1nYJrpYEWrDlJ/9dPPRqYmvk6NLuKxeIIZdSnwdny
 cyeCj83iGxzGr9vwV4H6ETdpDS8g88DxPuJmYbPvFW6ixpzghKEtIJ28cJG+UeTPYR3N
 GRFRv4urUgpP7cBATito5uzizQ0PRhgyAPZWQsTudXPeFu/quKHQIzWjTOmnPwrs+XCX
 6i6EZKxeTV/mf6ewwmA81ND1rwoKfy7cWVNEQigjgSk+DNtYFrmV8n6csK4k/2ValHgQ
 zGVw==
X-Gm-Message-State: AOJu0YzBKRsoMFUdkP3xw/gSe4OvjfZc1Hp+GkuMB4IcaEmZ/UWsjIS0
 0JYGLrvO5P64snG+iW+XoHUMNS8idSV/naI5+kjHebcE9GBAe4QUtcUBliRxccSx+5c=
X-Gm-Gg: AY/fxX4EpeYNCKOzu6ubfsoPvmg9Q1fZOTw5weQRhWRWhgV8YPW3v5rossY+ZZ8P3lZ
 1FwCWXRo0L/LtFurU1HxlbQKpjIr+GKOe8tdlmKDhkyrYR2MGKQuoEWB7VpNZqdQbX/9Z2WTnzY
 GxM5nNSFijTLXGDG5j9SPeq2KyYVecrdH5B1FP23JepPHkc73OHVGSCwqHcUbxNYt2pSGjGnw6c
 9ILdJ0vLQqdrDg1kO7yUIM2BozdbrJ5TVTha4ZeJc5f2fa0U6DcFRY41ahTMFxDZz1TGp3Py9KH
 uuTseOFVTXdwUxfD/8SGlJuCslK6KmQ7wrdOkyAeRrY3bhOohOcCWGffxtRmtVfL7jDeB8qzCto
 hdC8CVVdlFMv6HUEY9Rfo2bNtQMZb0fcWVWHygiZ1otrCnA6eWKEyVC0n7XH7nld+2XGriOz+P/
 VF0fJiUR48VTIe
X-Google-Smtp-Source: AGHT+IHSCX2Wf+wBy6KWMv8C+2VIUsJiFOtnLlLt7RcY6gOr5exQicuGvvlAxBa6mQbcQUrCVjmqHA==
X-Received: by 2002:a05:6a00:17a1:b0:7b8:bab9:5796 with SMTP id
 d2e1a72fcca58-7ff66f5fe22mr30484716b3a.3.1767462482601; 
 Sat, 03 Jan 2026 09:48:02 -0800 (PST)
Received: from [10.0.0.178] ([132.147.84.99]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e88cdaesm43266253b3a.63.2026.01.03.09.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jan 2026 09:48:02 -0800 (PST)
Message-ID: <938b5e8e-b849-4d12-8ee2-98312094fc1e@shenghaoyang.info>
Date: Sun, 4 Jan 2026 01:47:58 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/gud: fix NULL fb and crtc dereferences on USB
 disconnect
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251231055039.44266-1-me@shenghaoyang.info>
 <28c39f1979452b24ddde4de97e60ca721334eb49.camel@aol.com>
Content-Language: en-US
From: Shenghao Yang <me@shenghaoyang.info>
In-Reply-To: <28c39f1979452b24ddde4de97e60ca721334eb49.camel@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 03 Jan 2026 22:05:35 +0000
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

Hi Ruben,

On 4/1/26 01:23, Ruben Wauters wrote:

> With the elimination of these two WARN_ON_ONCEs, it's possible that
> crtc_state may not be assigned below, and therefore may be read/passed
> to functions when it is NULL (e.g. line 488). Either protection for a
> null crtc_state should be added to the rest of the function, or the
> function shouldn't continue if crtc is NULL.
> 
> Ruben
>> -	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>> -
>> -	mode = &crtc_state->mode;
>> +	if (crtc)
>> +		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>>  
>>  	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>>  						  DRM_PLANE_NO_SCALING,
>> @@ -492,6 +485,9 @@ int gud_plane_atomic_check(struct drm_plane *plane,
>>  	if (old_plane_state->rotation != new_plane_state->rotation)
>>  		crtc_state->mode_changed = true;
>>  
>> +	mode = &crtc_state->mode;
>> +	format = fb->format;

Yup - in this case I'm relying on drm_atomic_helper_check_plane_state()
bailing out early after seeing that fb is NULL (since a NULL crtc should
imply no fb) and setting plane_state->visible to false.

That would cause an early return in gud_plane_atomic_check() without
dereferencing crtc_state.

Would a more explicit check be preferred?

Thanks,

Shenghao
