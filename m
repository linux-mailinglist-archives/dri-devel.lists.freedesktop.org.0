Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C863746EE51
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CBB10E2F4;
	Thu,  9 Dec 2021 16:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B04A10E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 06:23:01 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id r130so4541864pfc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 22:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZB6EumHZfLPmCBlB1+11VhhFb2CYopwmNO5zELXp+vw=;
 b=n5dCX+a1yr/v0ySJVni9m4p2Mondq/yRCq0RnttRSxKNjQdkseZiEzzsE2LWPtcOd2
 Moz+moSUGcCLD7tbLvK7+1KzpTRYiFolwru/SzAYIAyfkQnMbQOWyztHfrBIyCOuGSoN
 vSyzd3Uq5WVJuq1snUUEn72FsjeLpykHWDxIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZB6EumHZfLPmCBlB1+11VhhFb2CYopwmNO5zELXp+vw=;
 b=PhpFBBIySiTq4B168i3OLCQrouQj0NxYoUZsvQL4aK4QqJx4oLSxEDyRtZbIn7VSYg
 yRjpmdgA759ZHxMF/nPa5oyzQX/iK4x9yaxQf/l0fdJJtgnNwNSUAJif/x6DRdflgiLR
 q3N6BIWWpDF60WKHHHnb6L7IoFmrsz3qOQMdlMTC7Onbfl5UiOH91/nFUn+PVMl4yH15
 bLg2WEue+5T4cT5gliCybgsp6PfES9DkLxQ28WX4YmuXTyCC2HvJP9RILwPKVXFlY2AW
 8aVNWtU2dPBS/TDh9M0WL+lDFmKFm9KYAuWL7z9pyn/8jTKnTgceUltycX526yWOAqCT
 Tc2w==
X-Gm-Message-State: AOAM5329Re8lA7cAsE8mGP1IhczH6rVhr426yGsgDeXmdo2aikZGLLda
 oMqbm7jI2UBiu/QLd2iSZgtqTQ==
X-Google-Smtp-Source: ABdhPJxA46OA9bE4pj9ZiILs+26cF+O6BpoLWGmAIVpD76RtUu0B9bGNU1ILev+x50q54U/+11hxHQ==
X-Received: by 2002:a05:6a00:1583:b0:49f:dc1c:a0fe with SMTP id
 u3-20020a056a00158300b0049fdc1ca0femr9943229pfk.46.1639030981150; 
 Wed, 08 Dec 2021 22:23:01 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j22sm5689636pfj.130.2021.12.08.22.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 22:23:00 -0800 (PST)
Date: Wed, 8 Dec 2021 22:23:00 -0800
From: Kees Cook <keescook@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/dp: Actually read Adjust Request Post Cursor2 register
Message-ID: <202112082220.81ECDC63D@keescook>
References: <20211203084354.3105253-1-keescook@chromium.org>
 <87o85r4a4f.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o85r4a4f.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 01:19:28PM +0200, Jani Nikula wrote:
> On Fri, 03 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
> > The link_status array was not large enough to read the Adjust Request
> > Post Cursor2 register. Adjust the size to include it. Found with a
> > -Warray-bounds build:
> >
> > drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
> > drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
> >    59 |         return link_status[r - DP_LANE0_1_STATUS];
> >       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
> >   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> >       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Using DP_ADJUST_REQUEST_POST_CURSOR2 has been deprecated since DP 1.3
> published in 2014, and Tegra is the only user of
> drm_dp_get_adjust_request_post_cursor().

I see POST_CURSOR2 is used here too:

drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c

Here's a version of that for tegra (untested):


diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 23f9073bc473..c9528aa62c9c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -144,16 +144,6 @@ u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
 }
 EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
 
-u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
-					 unsigned int lane)
-{
-	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
-	u8 value = dp_link_status(link_status, offset);
-
-	return (value >> (lane << 1)) & 0x3;
-}
-EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
-
 static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
 {
 	if (rd_interval > 4)
diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 70dfb7d1dec5..f5535eb04c6b 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -549,6 +549,15 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
 {
 	struct drm_dp_link_train_set *adjust = &link->train.adjust;
 	unsigned int i;
+	u8 post_cursor;
+	int err;
+
+	err = drm_dp_dpcd_read(link->aux, DP_ADJUST_REQUEST_POST_CURSOR2,
+			       &post_cursor, sizeof(post_cursor));
+	if (err < 0) {
+		DRM_ERROR("failed to read post_cursor2: %d\n", err);
+		post_cursor = 0;
+	}
 
 	for (i = 0; i < link->lanes; i++) {
 		adjust->voltage_swing[i] =
@@ -560,7 +569,7 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
 				DP_TRAIN_PRE_EMPHASIS_SHIFT;
 
 		adjust->post_cursor[i] =
-			drm_dp_get_adjust_request_post_cursor(status, i);
+			(post_cursor >> (i << 1)) & 0x3;
 	}
 }
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 30359e434c3f..28378db676c8 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1528,8 +1528,6 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
 					  int lane);
 u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
 				   int lane);
-u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
-					 unsigned int lane);
 
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf


Is that the right way to go?

-- 
Kees Cook
