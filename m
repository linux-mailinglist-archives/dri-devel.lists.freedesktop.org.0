Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEEBD08482
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF67210E857;
	Fri,  9 Jan 2026 09:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DvC5JuLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D0A10E857;
 Fri,  9 Jan 2026 09:43:26 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dncK73Y8Hz9stG;
 Fri,  9 Jan 2026 10:43:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767951803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IRTcUbL2sSI3XEcFhVNcJFtymGp5SzAOMEZxWhebm+o=;
 b=DvC5JuLj+sxEqPloGrg3h38dHlUUwPBKDlJCbJwBy4WEV26TmwtLldVVC30HqOYPbOzftH
 teJGcyH4zyi3u8c3v8/xAbx+nN0Nbz2I2x+BS4zB4mZyTSpS3YN9LKp5FSrmp8bLE8ImWT
 5OOITR5GpCuUCvNlRZAYJ99lFOGJwNHyhgbzJhKELAFTbD6+YzVyAI5ERfCVxaQuzzR61F
 3qUJt60gz0tdLMTE8fTQevnrKIlv/z31+hl5aBAEZDxvOXrrBwDh1Tne7a7wDKTr1FsgAH
 Te9NHsmv45ynZveI8ZHTzr3TZ9Kll61bMmbR3Y9ux9pVX38HWc6LAb+gScQs1g==
Message-ID: <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
Date: Fri, 9 Jan 2026 10:43:16 +0100
MIME-Version: 1.0
Subject: Re: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
To: Arun R Murthy <arun.r.murthy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org,
 andrealmeid@igalia.com, naveen1.kumar@intel.com, ville.syrjala@intel.com,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 05ab216b621908a0039
X-MBO-RS-META: 7bpde4kjhrjy9ffjom1bfzi985jf5xno
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

On 1/8/26 10:43, Arun R Murthy wrote:
> struct drm_crtc_state {
>          /**
>           * @async_flip:
>           *
>           * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
>           * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL
> itself yet.
>           */
>          bool async_flip;
> 
> In the existing code the flag async_flip was intended for the legacy
> PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
> As per the hardware feature is concerned, async flip is a plane feature
> and is to be treated per plane basis and not per pipe basis.
> For a given hardware pipe, among the multiple hardware planes, one can
> go with sync flip and other 2/3 can go with async flip.

FWIW, this kind of mix'n'match doesn't seem useful with current UAPI, since no new commit can be made for the async plane(s) before the previous commit for the sync plane(s) has completed, so the async plane(s) can't actually have higher update rate than the sync one(s).


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
