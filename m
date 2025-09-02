Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F133B47828
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D1610E426;
	Sat,  6 Sep 2025 22:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mkpb7dGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3310E06E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 23:18:48 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-56088927dcbso805340e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 16:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756855126; x=1757459926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57uob1tKUp9bRNlgzldDqsGEaBj3KVp0Z4MB+bZXeZA=;
 b=mkpb7dGAEMbrSEwIhsq1ynHy5sTerSk6FU4BifhNbNmDBV9ya6IR7kTKCUsKNE7jwx
 6eECzqdBrqgj3dmJlFhafhgCjU5YfL5iNbgVOtmK5mR1auqZnzDohrpv9Gdhj1sYwF8t
 uVapy1PZcoUMCKG61xMbj1EjY9SW/lEDhPOC9TooPegnOt3BWhnF/JiYrA6KCpfGtQwj
 8abvqWYNILOeNcXLpnqgkMSKzCR/UYrMJJEalXa7xDIx6ddgq/L1OFwuCqEVnDuxQALN
 lm3wgDVAhh/F/N8GYcMAXlABeATIQxm0XA0ewWSzuBgu9S8vSpaY/HpCyvGnBYoYUge5
 WD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756855126; x=1757459926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=57uob1tKUp9bRNlgzldDqsGEaBj3KVp0Z4MB+bZXeZA=;
 b=lgRjVaN3aKoc3hs+1nsnJQQ/ZAuxF0x3/rhUY5jsdMO9DqbAnBvu1YU+gRP+d0xQ9r
 iG15wDKYqqsJ4BRiqJ/M2MYbsQ+0vBIpoINfj9K8QgJelnEI2+f0zWCLl0N+8Iob6sXI
 N1zDt6IQtZw/J8J1f3EKDw5A4cr8X8rm4ws4udJggMYwFwxlxbw3HMOyn974eqBpNPHT
 6KglwPjvlmRKQasb0clVuJs8hPe2rICnxNrkJ0g8Git+o+/PEKMjyJLX+EWJZs8taZs6
 5BM4xHMY3Bg0MDQPtoCA74S4c4o/Le+3pDuXC/HgLF+9lXhF2O0DWmF62f17Lcv7FHbq
 fUoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWOfOygOYweG/zB2prvYnZK9/4nW4wC0FYN1Qi379n+ggks2UyEuPFgXaDKD02KqtdmJDWiez/g94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBbfPQhLRldspTYSllKK899ZNsN/c/fxonC7N/Cqz+L7OoIIiz
 7pqU89LmggIUppi726zw4SUrpSUxpIkVfz6oaZ1GSnadVWnN63+hOe5D
X-Gm-Gg: ASbGncuao94CaKP1Dd7YKLPmSkCpnrhfg084YQ/6qOaSbBMk8gg6uPgwxn01mR/OkKS
 mBjlecZUvSa/Q8BDAeGLqb7SYVi3UmyFEE9p3wMNPnU8nBmPXJmNhhZC7p0YBNyi1EuVIaZSmmV
 w9NHKtmKshgTL3pQFrc5H0FXgY7ZoTDcysB9Ubrl8Mt9+2Wt1XZWisYLRrhYEeMmH0xAi20W6vJ
 sAyyRO3OfW2RThMxQJNmyThsTk0qnUpk0yFDzTXo/SCF0MMewu2J5ZixJYSiE2ks4ZuT631215e
 5jTPAoudrkqnjAoJ/AVfzmrU4iVXypf1JUN15NWiEtquTr5FzuNlGkSUE/U5VA56MW5+Zx0rUIm
 dYF/3nHlHi7y8vA2/vHtysnhTB15X8lXvtmnV6qsxqfE=
X-Google-Smtp-Source: AGHT+IFbJzWKmetRFMXIkEH7qeGXDj5AWVLSRsL0DnbS0JU+NFcr2mAVAEpsT7CruW23S4r38RAN6A==
X-Received: by 2002:a05:6512:252a:b0:55f:6964:821d with SMTP id
 2adb3069b0e04-55f708d312emr3844144e87.22.1756855126277; 
 Tue, 02 Sep 2025 16:18:46 -0700 (PDT)
Received: from vovchkir.localdomain ([95.161.221.106])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5608ab5e281sm105674e87.18.2025.09.02.16.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 16:18:45 -0700 (PDT)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: vovchkir@gmail.com
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: start wake all thread when
 call detect()
Date: Wed,  3 Sep 2025 02:18:19 +0300
Message-Id: <20250902231821.2943-2-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902231821.2943-1-vovchkir@gmail.com>
References: <20250902231821.2943-1-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

The chip does not receive an interrupt if the monitor was connected
before powering up.
Therefore, you need to wake up the task if the necessary bits are set
when calling bridge_detect() after DRM is started.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 748bed8acd2d..5051cdfe2fee 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -358,17 +358,24 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 	unsigned int reg_val = 0;
 	int ret;
 	bool connected = true;
+	bool edid_read = true;
 
 	lt9611uxc_lock(lt9611uxc);
 
 	if (lt9611uxc->hpd_supported) {
 		ret = regmap_read(lt9611uxc->regmap, 0xb023, &reg_val);
 
-		if (ret)
+		if (ret) {
 			dev_err(lt9611uxc->dev, "failed to read hpd status: %d\n", ret);
-		else
+		} else {
+			dev_dbg(lt9611uxc->dev, "detect() reg[0xb023]=0x%02X\n", reg_val);
 			connected  = reg_val & BIT(1);
+			edid_read = reg_val & BIT(0);
+			if (edid_read)
+				wake_up_all(&lt9611uxc->wq);
+		}
 	}
+	lt9611uxc->edid_read = edid_read;
 	lt9611uxc->hdmi_connected = connected;
 
 	lt9611uxc_unlock(lt9611uxc);
-- 
2.34.1

