Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC586A974D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B17E10E5C9;
	Fri,  3 Mar 2023 12:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D6A10E5C9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:33:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso1148079wmp.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Avma0LmG3fMmIscRMsl03VxGDuG4kqyX0ebqajTjKu4=;
 b=op6CjDXgDJ8a3+SDEW4qqMibSd2A7N87rbpRy0+ig5Ka2OsHB58hCe9vIdPQNmI3iC
 tqGR9j+dXu95LJYj7a39UPGPMnW2jXsN1htZ4XH4ww8B7u4jDfj9NH4jp1KSG0PAhxEj
 2YBkjgbmVYy3/1Q2ODMkrp6ghd8lEZTdyR4z7W0HyBmB9CQ80av8pPk6EvriYfWa/Oc+
 liiFN7UtGEhsZdhGJLCekO7uuhBEG7Fzu2PykVstObcy0FrnLcuu1cNcM+33ILxOzreT
 ehtEpoKXAabODtiDvCieyMfxU1ISOz6VE7niJuQThx5Hlg1FL4YymwtPvonXcneMwh4R
 lOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Avma0LmG3fMmIscRMsl03VxGDuG4kqyX0ebqajTjKu4=;
 b=kyiGfObX8FJMut3m9ZNDlNy9zB1c+tVlf1JqfGE3qj1hqQWv+c7UaS4CW8vTww9UmZ
 UjGXU+iIZPeBp37PdzM33+hBYqX2VzhWIwmY+D8HUETWAEVk79+OvRg2LPjk/asKxDWK
 cANlmSxzIu1z+CL6SWXI/j/mpWQ7c9mjBcZ98NbBN1os/sTrTW9pk7fCzUnl4Jh1nFKo
 iTFc4R+/B41Zt4XP5yj/TaA/5rVijwHl0xEta2/v4zmvCbsZJzjhjNM19AwhjMOBhsmY
 IraQ1l7Uuxj/OkzTy4+IGLs7WDvyeq52VTpZSZ8pfRW1PEYjlwFnNNc4b3sHO8/CDdMH
 iypw==
X-Gm-Message-State: AO0yUKXgfC7hbsV+Oyqt9CnbsoSGsBUNyMTVB/tUW0tliLoFaFscWWzE
 bOl3LIGTAmbeUmt3vVEiBWk=
X-Google-Smtp-Source: AK7set/VvJ0ig87ojREiKZi3IdQswYQr5HOSJLhyb99jMuarDimDTnncr/lSElyahvpK/qQE9qMubg==
X-Received: by 2002:a05:600c:4f90:b0:3ea:d620:57a0 with SMTP id
 n16-20020a05600c4f9000b003ead62057a0mr1430142wmq.3.1677846796891; 
 Fri, 03 Mar 2023 04:33:16 -0800 (PST)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003eb192787bfsm2258437wme.25.2023.03.03.04.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:33:16 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/meson: fix 1px pink line on GXM when scaling video
 overlay
Date: Fri,  3 Mar 2023 12:33:12 +0000
Message-Id: <20230303123312.155164-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Playing media with a resolution smaller than the crtc size requires the
video overlay to be scaled for output and GXM boards display a 1px pink
line on the bottom of the scaled overlay. Comparing with the downstream
vendor driver revealed VPP_DUMMY_DATA not being set [0].

Setting VPP_DUMMY_DATA prevents the 1px pink line from being seen.

[0] https://github.com/endlessm/linux-s905x/blob/master/drivers/amlogic/amports/video.c#L7869

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Change since v1:
This time I sent the right patch from the correct branch; the wording in
v1 is incorrect and the change to meson_registers.h is not required.

 drivers/gpu/drm/meson/meson_vpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_vpp.c b/drivers/gpu/drm/meson/meson_vpp.c
index 154837688ab0..5df1957c8e41 100644
--- a/drivers/gpu/drm/meson/meson_vpp.c
+++ b/drivers/gpu/drm/meson/meson_vpp.c
@@ -100,6 +100,8 @@ void meson_vpp_init(struct meson_drm *priv)
 			       priv->io_base + _REG(VPP_DOLBY_CTRL));
 		writel_relaxed(0x1020080,
 				priv->io_base + _REG(VPP_DUMMY_DATA1));
+		writel_relaxed(0x42020,
+				priv->io_base + _REG(VPP_DUMMY_DATA));
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		writel_relaxed(0xf, priv->io_base + _REG(DOLBY_PATH_CTRL));
 
-- 
2.34.1

