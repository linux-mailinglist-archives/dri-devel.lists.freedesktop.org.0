Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565F19863EF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB49310EA3C;
	Wed, 25 Sep 2024 15:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EbRIqEaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBB910EA3C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 15:43:17 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53653682246so1529862e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727278996; x=1727883796; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Au0IxjjfAh+IrGj2ay54oiQohRBhlUlTthFZL3EgcLw=;
 b=EbRIqEaYYWWM+QC0cI6tObKVWk/G8vh81mfq0m4ydnnhka52F7GC4eWn87sWncTuSX
 rBNTi/tLi1B7dJ2f7vb0dQqptbu8T4mTPa4ZummAqP3DVEZcOhaIqoXD0caq6fcNIErY
 BzdWzLvPJoYrwPfCjJvCViB4jZGz/t12ObXuZLcUgcetLiuWoAoZ+GY1aCIqJGhrzz6z
 MsizHJYupbeHnDSs7mo6KJOYiA/zKjdZrZhueTh7+nlzVHQwLQj/A1v3iR9pGreWKjnk
 Lc/b5sKFQSW1UvfoUeQ0VVgOuSGDHuJI8lXSiHmK6YAkpHXWGGX98iDR+67xHVuPLCwQ
 zV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727278996; x=1727883796;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Au0IxjjfAh+IrGj2ay54oiQohRBhlUlTthFZL3EgcLw=;
 b=bjN59dKujuHFbpV9mb8AipxK8NRdRhySHJ4QsBdMOG5xugaJeB9lcGv+KO9iI2THY5
 48d2CVxqJ2n68VXObUhCe5hLDepAgr7gSYqdqsmd5zsr8oPvL5ledgE49JMnpZKSmZCv
 QaHrWqrx5rzx8hpLiBm6D3nfFuq/w6lmC2P2k7LpsMRPeubIBI2jMRBKgXce+ohrQoe0
 bgtlAjWPeMx5sOhYtYJblHL1VdOITqnuKrN9opVDHfEtgGBnO+Lcu8Hojt+PRXKSws85
 O3y6bK550uR4vjui2xHU8vI0Fk8feZ64l9HgZypQ9rExt5Xp/fcN5/nRtFb6ib+c1Uqe
 qiFw==
X-Gm-Message-State: AOJu0YwQOJ1duV0cK7kxmQteEEDrNE62WMG/OD532g+Y2sEvi52sqNrF
 1ZRCQdQAnJhLS2dLDUp34sHO5W3Zla8Kxgo77WCn7lffiEp2xFr/
X-Google-Smtp-Source: AGHT+IFCWYzAdpSpjVAnQ4BizrMtQKpfIddRrw3ocd29W6scUx1jmeEcp42KXRhfT3R4QSqzAie8lw==
X-Received: by 2002:a05:6512:3b92:b0:535:6a83:86f9 with SMTP id
 2adb3069b0e04-538804c7028mr1863446e87.60.1727278995522; 
 Wed, 25 Sep 2024 08:43:15 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 08:43:15 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:45 +0200
Subject: [PATCH 6/6] drm/sprd: Constify struct regmap_bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-6-e609d502401b@gmail.com>
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=759;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=/dTvDzTxw0elKvCO5X9KGGNdTLXj/tisL/crl9vaUr8=;
 b=373HrRNVvIqo811qw5A1e2uUKIh5z7ThMB7W+u2ouyWfcNGoTkirPUv/a3k0By1E45+/+k9nu
 s2jBMDDp7dTCURqw9nlmEGjS03N0BqfD1AngIvdPXCsiLl6HtBQDhfN
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

`regmap_txt_io` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/sprd/sprd_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 0b69c140eab3..44a7a579660f 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -209,7 +209,7 @@ static int regmap_tst_io_read(void *context, u32 reg, u32 *val)
 	return 0;
 }
 
-static struct regmap_bus regmap_tst_io = {
+static const struct regmap_bus regmap_tst_io = {
 	.reg_write = regmap_tst_io_write,
 	.reg_read = regmap_tst_io_read,
 };

-- 
2.43.0

