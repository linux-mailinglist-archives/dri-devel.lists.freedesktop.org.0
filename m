Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B34026C1D8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 12:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590AD896FA;
	Wed, 16 Sep 2020 10:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B5D896FA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 10:44:20 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 615C15C0842;
 Wed, 16 Sep 2020 12:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1600253058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNArWwbGj5MHo0rAiqP1hr4JJZNgFtgRK84HSA98mew=;
 b=oZ4fkVjObLPQqemqIM9s5v4MSmgSuTZ9eb37aa4GkI5m56Y1A5B0anr+LUVdDEHsCMkEXt
 n6CpFe5cncznWsmlTCYqimURLPBY5L8cgsw9JVMY6INeazZx7MV2Bfka5D/+ylAalm7+uo
 aaHhle3lsVKV7x328D+U6Jvr45CZuxI=
MIME-Version: 1.0
Date: Wed, 16 Sep 2020 12:44:18 +0200
From: Stefan Agner <stefan@agner.ch>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 2/3] drm/atomic-helper: add REQUIRE_MATCHING_FB flag
In-Reply-To: <20200911085226.GP438822@phenom.ffwll.local>
References: <20200910092425.1016976-1-stefan@agner.ch>
 <20200910092425.1016976-2-stefan@agner.ch>
 <20200911085226.GP438822@phenom.ffwll.local>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <9dc5bcf24c85f5e463453577b01dee03@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: marex@denx.de, airlied@linux.ie, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-11 10:52, Daniel Vetter wrote:
> On Thu, Sep 10, 2020 at 11:24:24AM +0200, Stefan Agner wrote:
>> Add flag which checks that the framebuffer size matches the plane size
>> exactly. This is useful for display controller which can't handle
>> framebuffers other than the plane/CRTC size.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  drivers/gpu/drm/drm_atomic_helper.c               | 7 +++++++
>>  drivers/gpu/drm/selftests/test-drm_plane_helper.c | 9 +++++++++
>>  include/drm/drm_atomic_helper.h                   | 1 +
>>  3 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 755572a37f3f..8bc7f8c2e566 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -802,6 +802,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>>  	int hscale, vscale;
>>  	bool can_position = flags & DRM_PLANE_CAN_POSITION;
>>  	bool can_update_disabled = flags & DRM_PLANE_CAN_UPDATE_DISABLED;
>> +	bool require_matching_fb = flags & DRM_PLANE_REQUIRE_MATCHING_FB;
>>
>>  	WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);
>>
>> @@ -860,6 +861,12 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>>  		return -EINVAL;
>>  	}
>>
>> +	if (require_matching_fb && (drm_rect_width(src) != fb->width ||
>> +	    drm_rect_height(src) != fb->height)) {
>> +		DRM_DEBUG_KMS("Framebuffer size must match plane size.\n");
>> +		return -EINVAL;
>> +	}
> 
> I think you also want to check that the x,y src are at (0, 0).

Hm, I was thinking that is handled by CAN_POSITION, but that really is
all about src vs. dst in plane coordinates.

I guess at that point its almost nicer to create a drm_rect for fb and
use drm_rect_equals.

--
Stefan

> 
> Plus needs kerneldoc.
> 
> But aside from the details, I like.
> 
>> +
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
>> diff --git a/drivers/gpu/drm/selftests/test-drm_plane_helper.c b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
>> index 01e95b2d572f..2c81bbef830e 100644
>> --- a/drivers/gpu/drm/selftests/test-drm_plane_helper.c
>> +++ b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
>> @@ -139,6 +139,15 @@ int igt_check_plane_state(void *ignored)
>>  	FAIL_ON(!check_src_eq(&plane_state, 0, 0, 1023 << 16, 767 << 16));
>>  	FAIL_ON(!check_crtc_eq(&plane_state, 0, 0, 1023, 767));
>>
>> +	/* Check whether requiring same size framebuffer works correctly. */
>> +	set_src(&plane_state, 0, 0, 1024 << 16, 768 << 16);
>> +	set_crtc(&plane_state, 0, 0, 1024, 768);
>> +	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>> +						  DRM_PLANE_HELPER_NO_SCALING,
>> +						  DRM_PLANE_HELPER_NO_SCALING,
>> +						  DRM_PLANE_REQUIRE_MATCHING_FB);
>> +	FAIL(!ret, "Should not be able to use different size framebuffer with REQUIRE_MATCHING_FB\n");
> 
> I think also needs a negative test with src_x/y != 0, plus maybe one that
> succeeds.
> 
> Cheers, Daniel
>> +
>>  	/* Simple scaling tests. */
>>  	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
>>  	set_crtc(&plane_state, 0, 0, 1024, 768);
>> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
>> index bb9957b4f91b..244b730e84d3 100644
>> --- a/include/drm/drm_atomic_helper.h
>> +++ b/include/drm/drm_atomic_helper.h
>> @@ -43,6 +43,7 @@ int drm_atomic_helper_check_modeset(struct drm_device *dev,
>>
>>  #define DRM_PLANE_CAN_POSITION				BIT(0)
>>  #define DRM_PLANE_CAN_UPDATE_DISABLED			BIT(1)
>> +#define DRM_PLANE_REQUIRE_MATCHING_FB			BIT(2)
>>
>>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>>  					const struct drm_crtc_state *crtc_state,
>> --
>> 2.28.0
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
