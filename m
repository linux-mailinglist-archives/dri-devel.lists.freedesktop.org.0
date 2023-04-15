Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945F6E30D1
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 12:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A0410E23F;
	Sat, 15 Apr 2023 10:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26F610E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:47:07 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id rp27so14846835ejb.12
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 03:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681555625; x=1684147625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O04Ye2MzXp7QKEfSemVWElXkh5JGH4p8WqqP9d/MZSE=;
 b=QZ2NGevF4bpWez9gHLYQPb3kG98YPHW3Dxiczr4FnG7PJcfpWiPdmDcQOHTbP37dbF
 groLwOQ9YguDs/v1WdalPZoJz2XFoeEgSuj19V1VKwKqZE5EhYXEWh/zfw1v+9GRAPdj
 k+AevlVI1t361tdpOE77dqxw2u85ij0tefIDjWbrQimHCWj+Gavslz+V+A+2ZrO2X8Wt
 G1lY0wYGd8RYOIrCNRim9Ed4DFIVQ0u700KG/MF3AWBQjHH4nhE3GunEcp6emqfckeTy
 V8aRYSincLppnfKgTfGsBca13Kc07lCZR8nAI/dCyx/zlHxtGjd9iB3X7Foj2yi0sQru
 kxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681555625; x=1684147625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O04Ye2MzXp7QKEfSemVWElXkh5JGH4p8WqqP9d/MZSE=;
 b=FT0JJeRgv4ymvOJozrh9dI/ht6jRQzU1oq8AdNGK89DMfQOFelAc6ybelmYmIfbf5O
 8J9FjxWgPk8ivi9Kaw4DBSxTNJWAYZ1XXMqVk9049Pc2icZUSWZTAl4b98TyXRmdBuWX
 uvKlOcjb3o0uTYx8ACGXsYtIOv1whilWjJm8khlTvN170CkltDHY/+sWbSb05ZmPof1o
 XU+DR/jpWTELtyKEHRCebKRliLB0WYV6aImFkWimBZjT5XO4OO0yIulLVfKBanNvmt7G
 of4/elgCiNgroi6mLnqt9mJ8xVEGbjCtwhnqoqf/ikFmAAeiACHNd7pH9KmFBn3Cz3LD
 OTaQ==
X-Gm-Message-State: AAQBX9cX0ztbbLTyDW+MCA31KrMg3cY4r3BVZ1nMbrCVGfAAPwkzRbiA
 5NQKiC7CEhGy1mmsimwfFhE=
X-Google-Smtp-Source: AKy350bwZkPIK+M4puxUx9p8YTSxs9X8ypJVNYd5v62q6WmJKob3N+gncOYlcJY70GiMJz9RM8YuZw==
X-Received: by 2002:a17:906:ad87:b0:94a:4b7a:9886 with SMTP id
 la7-20020a170906ad8700b0094a4b7a9886mr1727708ejb.12.1681555625592; 
 Sat, 15 Apr 2023 03:47:05 -0700 (PDT)
Received: from localhost.localdomain (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 m15-20020a170906720f00b00947ab65d932sm3607034ejk.83.2023.04.15.03.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 03:47:05 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 samuel@sholland.org
Subject: [PATCH 2/3] drm/bridge: dw_hdmi: Handle snps,disable-cec property
Date: Sat, 15 Apr 2023 12:46:12 +0200
Message-Id: <20230415104613.61224-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415104613.61224-1-jernej.skrabec@gmail.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

New DT property allows to skip CEC initialization.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 603bb3c51027..e7e8199d2fb1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3615,7 +3615,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->audio = platform_device_register_full(&pdevinfo);
 	}
 
-	if (!plat_data->disable_cec && (config0 & HDMI_CONFIG0_CEC)) {
+	if (!plat_data->disable_cec &&
+	    !of_property_read_bool(np, "snps,disable-cec") &&
+	    (config0 & HDMI_CONFIG0_CEC)) {
 		cec.hdmi = hdmi;
 		cec.ops = &dw_hdmi_cec_ops;
 		cec.irq = irq;
-- 
2.40.0

