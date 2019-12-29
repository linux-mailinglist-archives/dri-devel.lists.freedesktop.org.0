Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7912D77E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2A089C80;
	Tue, 31 Dec 2019 09:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3819898BE
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 16:28:40 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l2so31209305lja.6
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=n90E4FPbMEYNKi4XaN29BLl296r+dCfTfT/Y1plIRok=;
 b=WW0qXOjPWCCJFurZE+x1rZ4Omj+HQ93co+Hqeg7TS5QvnDaDmimiWR7WWaHTd475hq
 cj3uAGa8nL/uWp+f1KjSTbieIZSLGWYvYX0/WmVeCRoGoZWQyo4scDBAaV8w5c5IuV1c
 qQbZqQBE6pDQtPM74btaJmaWhJGo/N2jBY1Gw+qYuPL+xMSe9a2vJLszaVcbn9Tb+Vfl
 6nwG5Y6JbfZPQJFYcrdkZq9Pn3CwMq2E8LDeBMH0i+0IYZmn/OycZcxkuhyp+ioFWiIL
 cj0Tt0O1JAGbrnHYH+vqG5fEkDl+TpKoBjOKVipHxuRwBmO7mQZM3RCDFHfPAW4QNU1p
 fYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=n90E4FPbMEYNKi4XaN29BLl296r+dCfTfT/Y1plIRok=;
 b=jdDcs71v4MskmqknaFORfyPJnBw6EIyqmAB5NIt+RWkZxU1kCUK2D6gKbOG4wi4bJq
 3i6+KIZAIYkskRV3QptTz6Y+m9cJJPPlQj9wNHfnpdIdrP+zdCcDAisbw8EatssFckym
 hSEDkXw3jZyFFtus+oCKEzMsUdYqIP584lmIP7w2MOYgjfB+ikn5F06q3jmq5eYc8ofn
 sbJEUr2ODBPyGqjLtiC4TmL2OqTpAj77JHMoJqL9LB/8o/s6NOQf/3GUYGnaeE46TW+g
 P5N8i0DYU81klWg2DLYUwBWmn5WhvUayJmZSn/jvwY/oFgrInsF8oWBXnMJYOyB+hqaz
 zImA==
X-Gm-Message-State: APjAAAUdfqrgB9mKU0ayB1cjMfJxGB8RrrjXMNhCmnJQj2sNNhwFS9yS
 wO+31r1kDAvXcvY0LRFHW9Fzgg==
X-Google-Smtp-Source: APXvYqxbn4rVVr9RPZY6bZ86mkyDYpAjqj5/2yMqaK0Sq0geQzws1uE/LI+k0Yoh1YydtyDzAJDWew==
X-Received: by 2002:a2e:94d5:: with SMTP id r21mr36217156ljh.33.1577636919083; 
 Sun, 29 Dec 2019 08:28:39 -0800 (PST)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id u13sm17284858lfq.19.2019.12.29.08.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 08:28:38 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@siol.net
Subject: [PATCH v2 2/4] drm/sun4i: Add mode_set callback to the engine
Date: Sun, 29 Dec 2019 18:28:26 +0200
Message-Id: <20191229162828.3326-2-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229162828.3326-1-roman.stratiienko@globallogic.com>
References: <20191229162828.3326-1-roman.stratiienko@globallogic.com>
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
---
v2:
- Split commit in 2 parts.
- Add description to mode_set callback
- Dropped 1 line from sun4i_crtc_mode_set_nofb()
- Add struct drm_display_mode declaration (fix build warning)
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
index 548710a936d5..44102783ee3c 100644
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
+	 * responsible for display frame size other mode attributes.
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
