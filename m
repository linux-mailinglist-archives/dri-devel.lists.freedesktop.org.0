Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D8555014C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 02:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE6B10E296;
	Sat, 18 Jun 2022 00:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E89610E296
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 00:27:02 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id x138so5413225pfc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 17:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ei+HgXYmUs7VuH9SzfrkiDUXFHl2YpLCKGNXmwvOLnE=;
 b=EWsGb7fKekXlYZrIKe4UPS69h8iiPXw/cnxRSMzwwldkX4FkEyUTUcvp7P5lfRPTNr
 nDid7kyrMvZ3zddxkFLYpG7B7vsJROo7d73nGflocZyFwJBJpNdDBJJJSb5bAziRza3z
 gcLjjTlxLWgJJ0+mlS6JJqIGvGEOQytfZm0PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ei+HgXYmUs7VuH9SzfrkiDUXFHl2YpLCKGNXmwvOLnE=;
 b=pMB1/EufYUZ1Ze4DhkTYtRgLIlMVnYwReUPeAYAMAzFTnXluPHvH2vzBigLdpeaN9i
 8kvdu1SXrPDw71R/xwsnen/TXZdx/tcv4oCUjihVNBRtdtZN1PNBGTf2kNxaWKl+a+fL
 mksaJo9SvH0LIa9a3bREhiPUpRA6auiXehtsA4vht7Fjf7VqJ5UOnrqRk4HywJJibYWH
 WFUSvC3ztvaX5iePh+xbugUucON5ytn3ys6NttaFFtFGmVrxeKOGZ/s3f1c2Ao3LK/5y
 PiPezt3dVYS+9I2+9TraCYpXn4QDJlYfiJKY8ixvGR0RML7rGRKUUBVgLOEHqU4wNvHc
 kaeg==
X-Gm-Message-State: AJIora9rDHy4cKw2+O0gopVa0a8v8tfhgSRsDJveUIrYZI7qdtnAH6DV
 Jhebrfbe3WOVYRahZcOy8kaDtA==
X-Google-Smtp-Source: AGRyM1v/jglTlJSjuanGgPXZVW8dGNByT2BJv5Y9gHNgbkzDuTqe//AQccZr4N7r9rUR1So2ivva1A==
X-Received: by 2002:a63:360b:0:b0:40c:2d81:9a86 with SMTP id
 d11-20020a63360b000000b0040c2d819a86mr8664644pga.60.1655512021857; 
 Fri, 17 Jun 2022 17:27:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6844:cedc:a28c:44b2])
 by smtp.gmail.com with UTF8SMTPSA id
 p2-20020a62b802000000b00524fdb94c53sm66903pfe.132.2022.06.17.17.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 17:27:01 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH] drm/rockchip: vop: Don't crash for invalid duplicate_state()
Date: Fri, 17 Jun 2022 17:26:52 -0700
Message-Id: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Brian Norris <briannorris@chromium.org>,
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's possible for users to try to duplicate the CRTC state even when the
state doesn't exist. drm_atomic_helper_crtc_duplicate_state() (and other
users of __drm_atomic_helper_crtc_duplicate_state()) already guard this
with a WARN_ON() instead of crashing, so let's do that here too.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 74562d40f639..daf192881353 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1570,6 +1570,9 @@ static struct drm_crtc_state *vop_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct rockchip_crtc_state *rockchip_state;
 
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
 	rockchip_state = kzalloc(sizeof(*rockchip_state), GFP_KERNEL);
 	if (!rockchip_state)
 		return NULL;
-- 
2.36.1.476.g0c4daa206d-goog

