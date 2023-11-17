Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811EE7EF89E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 21:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDFB10E029;
	Fri, 17 Nov 2023 20:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEAF10E75F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 20:25:43 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1e9c9d181d6so1333231fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 12:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700252742; x=1700857542; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YEgY9ZT7EiPnB9BBj7vVf8RmyWGZIlUy6iEpY8nmGA=;
 b=VxgUm1ADqaE5ci3FY0WXsus1pG1+82bH0IU1A0CFKa8h7JSJIKzPKSxpK0TAuLU9Bq
 rX6lf4yAiYo1lTUyfCfXe4lpt34p4DOTXVzX9ph3szWlMF44XZi25PZv7vy+HnRXMIX8
 +zQuYlGGjCYYJRn8uvZ/l02hxXm3CZIH04Rq0ORMg7R3ptTc1jTA+Cq3hs7h/XGnx0f5
 s6ziBhMoefuYgGqxZ3XURSMzsFCSMqHSdztI5RK6XAlfUYTc7aQpsdzlLX8Lf2tqYcW/
 JmlR9NdOs2lsVRmiVNHyuH+XUzlreH3zlk6tiTXBfBzgLoPu8lscwGX2Py7A7RCAZQdg
 XMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700252742; x=1700857542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YEgY9ZT7EiPnB9BBj7vVf8RmyWGZIlUy6iEpY8nmGA=;
 b=knlkX2nAmHzXgXOhpXHWMnsKvA30lHd+3FQjrN/kOrmw7uCjWzsOzP0QjD72sVpmTw
 rA6wHOWvciTHMkhlWHDwVS/WTbXYdA4vAJXviu+4wmbGK00+oYcws0sKg/PNovRHhmHW
 uo8bstmJclxaLsI/DXCDQZQ9gxC8q2B4KaN3TNdG3oeJaodakBEmMdJgYJSD1yq1F/u9
 SuuRnzAsj/nyBAouCl3BR1zS9qcm51S5EDtsuTwVqcKAUayuk+cAkK2cK4aU+iekn/K7
 ZJ91YUCEDUMc5HiNAMog9TICPomd1bmhhDHKGOIOSKWu7gROVoVcY9gDQzjR0U5T6NsC
 ClsA==
X-Gm-Message-State: AOJu0YxV2CeYIF2OpgFXwLqC1bFI6+smlE787Cxvzk0CuRS3vUwQgAb8
 dyMetbW8UWtUyvbG88GdZAw=
X-Google-Smtp-Source: AGHT+IFjVKENFjedAKB0p8uRVXHf+/TVB7NzTGb0+zWfV0zF0I1hQzrNkznJ2oiwFcLijAaN87J0IQ==
X-Received: by 2002:a05:6870:9a8d:b0:1ea:3e52:b66e with SMTP id
 hp13-20020a0568709a8d00b001ea3e52b66emr325407oab.41.1700252742284; 
 Fri, 17 Nov 2023 12:25:42 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 zf15-20020a0568716a8f00b001f224cbbde1sm390543oab.41.2023.11.17.12.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 12:25:42 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V4 2/6] drm/panel: nv3051d: Hold panel in reset for unprepare
Date: Fri, 17 Nov 2023 14:25:32 -0600
Message-Id: <20231117202536.1387815-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117202536.1387815-1-macroalpha82@gmail.com>
References: <20231117202536.1387815-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Improve the panel's ability to restore from suspend by holding the
panel in suspend after unprepare.

Fixes: b1d39f0f4264 ("drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel")
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 79de6c886292..c44c6945662f 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -261,6 +261,8 @@ static int panel_nv3051d_unprepare(struct drm_panel *panel)
 
 	usleep_range(10000, 15000);
 
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
 	regulator_disable(ctx->vdd);
 
 	return 0;
-- 
2.34.1

