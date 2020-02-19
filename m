Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD21641CC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FE86EB6A;
	Wed, 19 Feb 2020 10:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3429C6EB5F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c84so6137443wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HvFBn5C1ybJ3Jl6cvECGju7iOD2DUuUpqtaZAjKhPo=;
 b=PJzH6ke5ACy+gnyH1H0O/EOH30mw1GGgrDUmk5BBrZ/PUN2lMzraTEUZ80YFeUJy4i
 BT0R8EBhS9ae4DJVQVeEUw4g7yETEV2yMkMheO3s0PZmlK2E8r1Rt8aaMMGH+iMrxZ2+
 6Km7jEfY3B17urqmHlHLEOm/FfWvNqws8o+K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HvFBn5C1ybJ3Jl6cvECGju7iOD2DUuUpqtaZAjKhPo=;
 b=k2Ao2IKJtkchRsD2LJgEfRbnjtf/NNd25Jbxww6dB4Z7B1ttcOXGEed/M4vpuKGaR/
 zWR5QJ29nZ/VHEMO1ghu3Ct6ghy7HayVlenfcdYRt1AomwZVL+00sjzAWZaCNymyoAus
 oHcEwk5u7cd0/qYvsEFYnP/fFLwSsYKPlfDUV220ibqStolMNX15Q08XDjHxEf472spS
 z1FxKhrBbcrtV2hxGGO9apsQIJv1l6h19w7m7Sc1oo7eLtYtGEg+kv0jANqKjV0Ik0Li
 UUoZiGjkYoe8E7sgyuwa0jdxxfibicGR3gkkxQmClpMpZrFyU/YHOu3xlQZkU/bPTJJ6
 Gyvw==
X-Gm-Message-State: APjAAAUWNRw+y3Q+qyX3RpLoH9d6glq6Rbuf2rMKGu1Yw+QZEqV5oksc
 0iGeCIIrebzuyBCle2lNRIe04AC6BRo=
X-Google-Smtp-Source: APXvYqwwkb8pYBRO6k0sbQ0TfL7rK6fN22BCq0dEtf+gNB0N9I1n8/PTpRHwumXVfIV0/n6efkAHzg==
X-Received: by 2002:a1c:4905:: with SMTP id w5mr4798090wma.129.1582107733246; 
 Wed, 19 Feb 2020 02:22:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 35/52] drm/meson: Drop explicit drm_mode_config_cleanup call
Date: Wed, 19 Feb 2020 11:21:05 +0100
Message-Id: <20200219102122.1607365-36-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's right above the drm_dev_put().

Aside: This driver gets its devm_ stuff all wrong wrt drm_device and
anything hanging off that. Not the only one unfortunately.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index b5f5eb7b4bb9..ae94d14ab7bc 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -284,7 +284,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	/* Remove early framebuffers (ie. simplefb) */
 	meson_remove_framebuffers();
 
-	drm_mode_config_init(drm);
+	ret = drm_mode_config_init(drm);
+	if (ret)
+		goto free_drm;
 	drm->mode_config.max_width = 3840;
 	drm->mode_config.max_height = 2160;
 	drm->mode_config.funcs = &meson_mode_config_funcs;
@@ -379,7 +381,6 @@ static void meson_drv_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 	drm_irq_uninstall(drm);
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 	drm_dev_put(drm);
 }
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
