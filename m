Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F6D9D988F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3747A10E1CF;
	Tue, 26 Nov 2024 13:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="jH9q2gfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2448410E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID; bh=BAOgYh5j+SwhH6if2YDkf+cLk18YFHVIqBQI2gqekAg=; b=jH9q2g
 fpav4/Xv0+OPZFBUl80Ui6EaVsSTNnRONJnzH8v2l98vyBaMIz8KF8gGtlXxGatJEWN/Aqt65O4PF
 kDVlk4qu6t2uggymvlx6V9TM1JQ62SDkaN8dcWEVd2c/tDzC1GKShrpCRzE52rj4W1lUvL/XlTNqz
 7t+dlP4I/2lv+CweUmGrhdNxYn+yWNBrKnMxWjEncChobYMmYh9TeWZ2u/86geXxbrP57peTGDZih
 V1R3V5SqHRwvcZ25izIkFIfmCrNrGKe++E0PhMtJdNHPG927Qt/TRbs5axJ5xCiycV2fE+nq1I+N2
 J2lN9BwRaCost6IjzKjr0pHUQ9Sw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1tFveZ-0007CU-RO; Tue, 26 Nov 2024 14:30:55 +0100
Received: from [185.17.218.86] (helo=Seans-MacBook-Pro.local)
 by sslproxy02.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1tFveY-0003aF-26;
 Tue, 26 Nov 2024 14:30:54 +0100
Date: Tue, 26 Nov 2024 14:30:53 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <tzcjzgp7xalhhezcv5hfa7cjscxg44phqcw2ap54lesly4gk6o@6dtco2d3jahj>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27469/Tue Nov 26 10:58:20 2024)
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

Hi Maxime,

On Tue, Nov 26, 2024 at 08:36:01AM +0100, Sean Nyekjaer wrote:
> Hi Maxime,
> 

[...]

> > 
> > We probably need some kunit tests here too.
> 
> Good idea, will be my first :)
> 

Would something like this work?

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 294773342e71..26e4ff02df85 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1364,6 +1364,7 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_connector_state *conn_state;
 	struct drm_display_info *info;
 	struct drm_display_mode *preferred;
+	enum drm_mode_status mode_status;
 	unsigned long long rate;
 	struct drm_connector *conn;
 	struct drm_device *drm;
@@ -1408,6 +1409,9 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	mode_status = drm_mode_check_pixel_clock(preferred, rate);
+	KUNIT_ASSERT_EQ(test, mode_status, MODE_OK);
+
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);

/Sean
