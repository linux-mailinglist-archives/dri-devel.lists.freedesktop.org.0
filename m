Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1B6BAA9A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 09:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBEF10E951;
	Wed, 15 Mar 2023 08:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6FC10E89A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 19:16:00 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j11so21352247lfg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678821358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UBg+fcsjxPv96f43lYhxCc+VJaBSKpuwO1Iv/a5x3Pc=;
 b=DCz+tsiXnDO01rnh+NCrSMLCXjVhR5vR/CVKeBQc8H0OUkHQ+7/2HUtSgKoiBXy99M
 k6V2wo7kuH/Dplp7YfyIH+pULxlrCMp2Is77PdZEfNNrePIqiMv86BblhzQgt202VNbZ
 bZeKK3pQfOMhcWNz7nPoD4tzbBbV0mHffuh4e5K5XYRoK95eO0wEoUNaVwomRimg2mBE
 wem0GYBdzCC2MS8sA4YZjBze9gWBD6ecGLt3koDEPtQ6M3wF9HzjWGvGWcK4GOdt5C9a
 GQkzp1ovByU2cutQAPqcEnUKSDqyfDJM+r+Rn0jM90E/14oCk4k553iHhuOr7a6V6ckZ
 vOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678821358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UBg+fcsjxPv96f43lYhxCc+VJaBSKpuwO1Iv/a5x3Pc=;
 b=r3To0YEhoFfWKBwYA6oCKVyL0sshuT/rZGZWArnCUizD4Elb9lrtbMkXUwk7MdUP1Z
 GZVYcbCaN7cLAlp/6q7FwL2jys9dDCGsOeFVFoa+9x+AyK+z6IAMki5SgpFGi091rBHt
 nNSsmkzqbis0nZbqm/UBrqKuE/zVFuLsN+TkecJBJVDBHavwiyOGE4hPcYoywccaB+N4
 B1L63d/bB50TQTUBqkXj9mKdjqCCulnuVyHaDiZ3MKPn43ETtHT7uBz1Ji7KfZG80a0h
 u71h8nDNGXfJ+M7A+YJJSNTYYY/wI2RAeTpnbs+k09E6zpMePbLK2UMjP1BdKuf9jsxv
 pjaA==
X-Gm-Message-State: AO0yUKWbv3j9IqzVDFqmjC2rymh2W2/2LeDJgV8tMnIhcFiz6l01F97z
 1jmdORsKe7k5k+CvxTDTVA==
X-Google-Smtp-Source: AK7set8Q+hVIG4LadMTvNfOxqRzFm2iecTTIVfIrojPQGrt85YigSMYGUJSYpZ4kZOM0pumNfTDs3Q==
X-Received: by 2002:ac2:5a08:0:b0:4e8:4734:a4e1 with SMTP id
 q8-20020ac25a08000000b004e84734a4e1mr1066418lfn.30.1678821358327; 
 Tue, 14 Mar 2023 12:15:58 -0700 (PDT)
Received: from calypso-fedora.. (80-62-116-106-mobile.dk.customer.tdc.net.
 [80.62.116.106]) by smtp.gmail.com with ESMTPSA id
 l4-20020ac24a84000000b004d887e0e9edsm502129lfp.168.2023.03.14.12.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 12:15:58 -0700 (PDT)
From: Alfredo Cruz <alfredo.carlon@gmail.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: vop2: add error check to devm_regmap_init_mmio
Date: Tue, 14 Mar 2023 20:15:32 +0100
Message-Id: <20230314191532.33693-1-alfredo.carlon@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Mar 2023 08:18:41 +0000
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
Cc: Alfredo Cruz <alfredo.carlon@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 03ca32cd2050..4bde2d354462 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2680,6 +2680,8 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	vop2->len = resource_size(res);
 
 	vop2->map = devm_regmap_init_mmio(dev, vop2->regs, &vop2_regmap_config);
+	if (IS_ERR(vop2->map))
+		return PTR_ERR(vop2->map);
 
 	ret = vop2_win_init(vop2);
 	if (ret)
-- 
2.39.2

