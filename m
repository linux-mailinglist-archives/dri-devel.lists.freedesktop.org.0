Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1216C794D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FEC10EB87;
	Fri, 24 Mar 2023 08:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD0A10E41F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 22:44:21 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id ek18so79245923edb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 15:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679525060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Juel12PVHtU3HuwtArEzNxxW0RuVUpCwPZ6Q+krZkfA=;
 b=M1c/x/hp+69r12vS03I+OVtA0UCHB88fDw7N3WNvG7nwGEwG6BAk3Pg0vK+caAHNff
 wsinMMzbe4H2CLiCe4/XZje22P2TzWJnw23OG62mtRywdjK9NxWkGJus5ptnbTmskDJC
 M1is0NsKFvC+AvLbh1MQVmii9nkPd93+fqwcY+rFz09yvxZ84kwLAswoxM+U64zllzMp
 hGwBqBZdZZX4FoiB/exVGmAdsUSzQKasZzbmybcHhAwucxxov/W/PVchfpVdnzVbdJjp
 LxFqSrDBN5pS4cs/bWYLL9OIeQ0VUn/CdsGDGuJsBtxIoj3UxPYgWN5lKCwTvDPaTO+V
 rnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Juel12PVHtU3HuwtArEzNxxW0RuVUpCwPZ6Q+krZkfA=;
 b=MlvlOnXBKjbmg4BPwhCS8IjSgK0M7CGnqf2SO21TsRnlgCJaNd901IeI+CsgefTpJ4
 aGFF9HwWtyKe8rGs7DvGOzzt+N39nuvgBPOD01boDc9BqJX05J7WIgPaNN6I7QuRfVql
 eM2xN+srs8FnAYGbEqmDBMI85PShr/D0ys2jT8cQRXOGs9GhbzudoagH6j59S9W69NmW
 iS42GIlkmbkSNRU84/c1bDUGHvKDdReAQjLTyFKseH0PP0wRsjj42KNf3CmorHra4n74
 5kW+taqyvsDcS+3ZIvIWZmOgtcs90nx3J3daQD/3o3lC2UsjTmQaOpm04/aFOMUiyvCw
 tgIw==
X-Gm-Message-State: AO0yUKXBLl1qOkaSnZ8/7gGw22UXceLxkSu+E5aouXy2Hpbau7IuWzgm
 yozyLxBHwNb6iaPG9p3AmDx1QkPP7A==
X-Google-Smtp-Source: AK7set96Y+daRJbuXOqrMYaZe7obnxN1wTz3Pm8TFTl15NLODhJ48yFsYnZFYavbIURM9/p33mOSag==
X-Received: by 2002:a17:906:3591:b0:931:d36f:8965 with SMTP id
 o17-20020a170906359100b00931d36f8965mr8133147ejb.13.1679525060236; 
 Wed, 22 Mar 2023 15:44:20 -0700 (PDT)
Received: from calypso-fedora.. ([213.237.86.44])
 by smtp.gmail.com with ESMTPSA id
 lj24-20020a170906f9d800b00932ba722482sm6941427ejb.149.2023.03.22.15.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:44:20 -0700 (PDT)
From: Alfredo Cruz <alfredo.carlon@gmail.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	dri-devel@lists.freedesktop.org
Subject: [PATCH V2] drm/rockchip: vop2: Add error check to
 devm_regmap_init_mmio
Date: Wed, 22 Mar 2023 23:44:11 +0100
Message-Id: <20230322224411.15612-1-alfredo.carlon@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Mar 2023 08:03:32 +0000
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

devm_regmap_init_mmio() may return an invalid pointer in case of an error.
This patch adds the corresponding IS_ERR check to vop2->map.

Signed-off-by: Alfredo Cruz <alfredo.carlon@gmail.com>
---
V1 -> V2: Added description and Signed-off

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

