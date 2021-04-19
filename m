Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE884363C91
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029D6894D4;
	Mon, 19 Apr 2021 07:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AA28926D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:33:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so19922498wmy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=;
 b=NxXHEJGDikQ8Z9gwWWHAZBvLF63JKD5m8/wy4XbGV9oVmxbhPmetFs9Zze9uKo5IvS
 5JhQ+0QPB1uRqGrBXSffE4M7SeW7jT22k2wLOA6dVlE9Eu7Qh/BmPgtRbmM538F2UXRD
 4V3RYJypYSCUvBrFtHrNMGByj+KEiShw7rJIWXaT1CD84l+ThS4Q0lBJdyLYLtv9UlQp
 +oHWfLbbZ0MpprqDTw855tChXKLgJIOxq0+I7DZXYXepgNb+Kq1ODHpddxomIUze1S7p
 4YlOyCnqgUmh/Fga0kgUHF2bdk4QQBQwbJDtyPDbqAS23jUBP8eCO2LSLGU2bNR485Va
 f8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=;
 b=cTSv5TsvxcnSxRoxmsRrjSoK/LFznPsX8JHfIEr3Z1OJ0I6vFKMD3YsiLb0Fj3cYwP
 bTru/+DH8mx4GiP6TOrRQE0GrHS11JNgiCK7ze20NbE26UWwNnBOjC/uQxVYd3Ze5zUA
 Oq1QOwV7GlF1xf4HCH/sQsJjdeVvHlzUO69q0hhsZLfxzu08HhwpApYeA6KN5POnqeP+
 579+93taQ6ruLyn0Dmyi/mOQX/GFp8MVLiqMsJuk2hli8K9WreeTZSTNz6i4B+rsaraT
 Q/hDxadHI/yzkV5An5nL4EqFinKKfE7bhSYDAUnXY1QO2PhYRKKIOhnN2SDrOixzQcFw
 Ha4w==
X-Gm-Message-State: AOAM533PYnLrbDVxJ9ttRuQEXdzNju7wz5/615+JHpIXu81thlFIp0qh
 S+9AzXIG/PTtXx1h5PCbl0TLGg==
X-Google-Smtp-Source: ABdhPJw0d7BQTNzJ5es+sguom1+qdvQWC5lAGSwxNOAjaTAytr4cn3xUUFf2qM4dVwLHnn7ppXDrDg==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr20761875wmj.2.1618817583230;
 Mon, 19 Apr 2021 00:33:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:33:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Subject: [PATCH v3 3/5] gpu/drm: mediatek: hdmi: add check for CEA modes only
Date: Mon, 19 Apr 2021 09:32:42 +0200
Message-Id: <20210419073244.2678688-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=8hZCU8l60f4io5DjF0ScarfKg+RXuxNEKXbnKgyzEvU=;
 m=p9m3qQg9ro9SNdO45JuikwvmDNAXyAV1Ql4r4DZfEGY=;
 p=3uqgx9h0NLat9GhpnH/7lHx4Omxj//rcVoYK6CVuKP0=;
 g=19421281216f8c01edb5b08ac035741d73dddc53
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9MgwACgkQd9zb2sjISdFStg/7Bfk
 iMsl/JsD8ylGFg39AeUNYyCs6C4eUkyDyeEhc22g66p2B11Zff/gIQ24FSdUu38vmW6pQm0zlw8h6
 bUoAA45N3tGtxKBJbsJg3rj8tU9AyajQjTbHTMXslGiMEk/8T6WOti7jedTAv1yB2jKbwEyMyGqfD
 vB6gC6m8TBs877WfOIbnGq/z7Kj+JY9TrIsPu/4CoidUSDGXSvewYpfO01CtNDRqHPnxO03ep7Wgl
 XcvVp4y7+BnxpiD06evJzQEmoBGpITlAnJQVKWePqM0qB9jCGet2rLlrpe+QMX38kSMmnVRkT2FLd
 vVcO3cr2DyiHTugOcFZGdY4Prf/Mwd+fZ5F73EEGFH9KGBwm8b5PnmhlzX40/OROWEVZjpJUQtcl9
 nbwb80rprYYQbo84X9gLJMn1ZeafTScj+nkzVkZc9IFFRiEKHovgoRcAM9sawmJ6fbIh+w29XTZ3X
 LNABEzq4WsLoT5tDsp5zJ6elpRgj2qzPwLrgZTAtH5CwPYMEVBYZBTgeFPBl/r/qaecngE5hyNq2b
 ovTVqV5d0ip55pZGxXINUGt1WAG4W5yqCKHeOl5V+Qw5L284AlhBykZCwCgbH2jid4gEvfIRLEeJk
 o28EAt6n9FDaUxCv3hXXaLCpRwdaBcER8KtE0hORVvjcpEEGbx+47CNddJ9S9YJM=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some SoCs like the MT8167 are not validated and supported for HDMI modes
out of HDMI CEA modes, so add a configuration boolean to filter out
non-CEA modes.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index dea46d66e712..0539262e69d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -148,6 +148,7 @@ struct hdmi_audio_param {
 
 struct mtk_hdmi_conf {
 	bool tz_disabled;
+	bool cea_modes_only;
 };
 
 struct mtk_hdmi {
@@ -1222,6 +1223,9 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_BAD;
 	}
 
+	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
+		return MODE_BAD;
+
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
