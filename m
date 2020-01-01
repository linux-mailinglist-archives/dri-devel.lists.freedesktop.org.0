Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12312E531
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35ADE6E05F;
	Thu,  2 Jan 2020 10:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1DA89C1A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 20:48:08 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id l35so2512628pje.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 12:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=XbMrezaMD0p4i3SGBGMVhsDuOIGR0bDHjQFGAvfTghk=;
 b=hsxj+yEFbN25j8L+Ydo66FZwz/eE6FmsuE4JZo+LvmE5pQ8fQosViIyOHOBi8CVVhO
 J6PmU80Y9MwsX7+e3BYqKc7PGfwmhiDToIO5DX35mP9M+TQDCubpt9qKAs/4MNeweXoZ
 Bv6xRTj2HxpouULBCdd+x1lMSF0JipscIeEeIFUdkUY6a1x9uZWOo9dPD3TuGEY5pze+
 J78pfzvMFsGfwns6f7LzQDsw86xyvDuWohvx9BS/cNuNurpOgd3Zt6UHO+tsQAoQnLto
 r4fFJ9duEn5NufTJ+YN/GWbC8WjCGZWwU54J/UkwlCIN4bgJ4qHr16atUn5+Ve0zUfy1
 Oziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XbMrezaMD0p4i3SGBGMVhsDuOIGR0bDHjQFGAvfTghk=;
 b=CH0VrNMqS4nLozHo8+2UeqTxTsWWq/ez7R92YHRF98mA8bHwhy/KjJ3NfO2ekywKna
 QnuKR0HUJIkmgqa9O4x3CiQd8oH21oWrXri1a4lbcSRbca8pabUt5xwO4ETCHKGfLWCI
 AjPlKnICpThvpz2VcwtbGsugTy468QS2lQqSBHsrTYSefrIQ6DsQriJhzT4DyFrtxtsM
 8L56nl2OIP2M60s3nfF+cusSHKlaIgmg0OjgVFKDQfPLtrGqL9T6iqfH4f2nRHznu+F5
 jCEVdSl8rQj6+ne03GgJC8xybt2ON3tky50h+5ZFc9l5YmSQ8k/1FMKpDYM+MmcWlfPU
 iy3Q==
X-Gm-Message-State: APjAAAUKar1wyyp02ptyd/LT+fSSwm//3NDmmKkfZmRj9CwgHSJ23qat
 ic2ECDimkh3TRERloiQoset4jg==
X-Google-Smtp-Source: APXvYqyklN6NYwHRBsqIUREWmoa0yWoQfE/+harC1DHagj85KGzfIxcsQ2V6jYhzLlxNgQ/ergDlug==
X-Received: by 2002:a17:902:74c5:: with SMTP id
 f5mr78136579plt.229.1577911688023; 
 Wed, 01 Jan 2020 12:48:08 -0800 (PST)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id z22sm53774752pfr.83.2020.01.01.12.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 12:48:07 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@siol.net
Subject: [PATCH v3 1/2] drm/sun4i: Add mode_set callback to the engine
Date: Wed,  1 Jan 2020 22:47:49 +0200
Message-Id: <20200101204750.50541-1-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

Create callback to update engine's registers on mode change.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
v2:
- Split commit in 2 parts.
- Add description to mode_set callback
- Dropped 1 line from sun4i_crtc_mode_set_nofb()
- Add struct drm_display_mode declaration (fix build warning)

v3:
- Pick reviewed-by line
- Add missing 'and' word to the mode_set callback description.
---
 drivers/gpu/drm/sun4i/sun4i_crtc.c   |  3 +++
 drivers/gpu/drm/sun4i/sunxi_engine.h | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index 3a153648b369..f9c627d601c3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -141,6 +141,9 @@ static void sun4i_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(crtc);
 
 	sun4i_tcon_mode_set(scrtc->tcon, encoder, mode);
+
+	if (scrtc->engine->ops->mode_set)
+		scrtc->engine->ops->mode_set(scrtc->engine, mode);
 }
 
 static const struct drm_crtc_helper_funcs sun4i_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index 548710a936d5..7faa844646ff 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -9,6 +9,7 @@
 struct drm_plane;
 struct drm_device;
 struct drm_crtc_state;
+struct drm_display_mode;
 
 struct sunxi_engine;
 
@@ -108,6 +109,17 @@ struct sunxi_engine_ops {
 	 * This function is optional.
 	 */
 	void (*vblank_quirk)(struct sunxi_engine *engine);
+
+	/**
+	 * @mode_set:
+	 *
+	 * This callback is used to update engine registers that
+	 * responsible for display frame size and other mode attributes.
+	 *
+	 * This function is optional.
+	 */
+	void (*mode_set)(struct sunxi_engine *engine,
+			 struct drm_display_mode *mode);
 };
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
