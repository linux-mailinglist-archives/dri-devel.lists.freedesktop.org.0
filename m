Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B8AD2A0A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCDF10E445;
	Mon,  9 Jun 2025 22:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JvEoVBDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5863B10E441
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:56:53 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so41653045e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749509812; x=1750114612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vUIYYrKTPk+CVvS6EMCl15Pl5q/Omqp4NNMhKg0oVDo=;
 b=JvEoVBDqGMeX42Tk1gC+CZLoBhZ3Dffm+gJV+k9isgLjxB2MlC9o737mjgxroKFqYc
 9Xk4E+I9mDFcxjc7zn/gMrpxAG8ZqsMA1E6t7x/cjCfObhMt99+P7hbAVcF6gzLu05ox
 zvU085uugOctquGM7flAQhavS2byri6d4iXFZfav2IZ1H4beHuGHcZlZKmeENwGVKWs1
 d+TD5UybMfEgC1lxYI1irr/wnM199ujbBolAiDEFDsaFRSTDjhlaenoJj5ay9aqGixXY
 fXHX4I5LTRYr+SUlFNiK7xBstPp200tieF6E7WwZjS7WP56/S3Pu3DiyXUcUiPnCO71J
 PV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509812; x=1750114612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vUIYYrKTPk+CVvS6EMCl15Pl5q/Omqp4NNMhKg0oVDo=;
 b=s2Y9yMP1iDptfHUl74gw3OphoOUgavehg2iCLudtuu0um8yKbbYu/VPGqN1EnE4/Cp
 +A17pCglHnNpqTOH1M+C8xvGvAeuhyY8sUTmmrZqoZ1gBf2oy/UlRZGJjFCxlYFhRkuR
 fKXO+UdMDk8chG/ouKF/Tens38lY/OdzRS0plGzc3gRaPXtQUdGj+TJ7lkvu8FQqyLT2
 c5tlihfN1BAsG4ytBvzEfWRL2l8f6ucUWNY9YNHHLTbe2+APBtVOHDBM2O6ktytpMCCe
 6PIOXruJcaj6HtkaahyktyCYaRAQX2tpGJ1kQ5H7PSN77jnbnPyg6fYOVoYqx2/+AiES
 dGpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmwe0PMJwClKV4Q2SGTDnncTAEpg+xpzppXco38UzVQHoL4OITrUVB5R/6VuRmCn22IEI2XpTExEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz1IpS8UVwB+jlvOF/rvIHTFRstTnG8wzVj2Ya7oPisxtfx8Oj
 lokN4zYDmohUXxzMvORsLmGrX+RUtnMljU+gtNTJjTLHyiCXViai5lK9
X-Gm-Gg: ASbGncu96B+0c+dJn3A5/lVRB4LP2BRf0+maHUUJy8bkueT/noJdu/wNkamNHU+kerX
 9zvN4zszDNKjSqmoeDeCeG4kmuGKwrHGYynszk5ZY+FV4SJn/nslbRjsx1+CGje+jszpNdE1Bpi
 H+U46BAfY90nniCvyi9TCR1YlsaAc1Vh9SfbkwfsLgoyIBlFmND+rvmpcpSYFJRjcm+GOA2MzJC
 KzZ/tGjC/bhg2vUHW+ltgLXdcFuh3yQYk9IQUA3+OzpG2KkQ4pCgjHp8cpd7TG9iz70B9Qe/Ui0
 92UT97lkWdP7KDVjPStTvKhqjBnX7HObr+4PkgjedwiyjMywOfmImrJSv8GVYmevd9Hf0zoHti5
 VyCM56auCIYEEmMkrdoU=
X-Google-Smtp-Source: AGHT+IGDaEoGkJ2Kkdd4CcQFgeCFfgVI+u70H9xdbs2LqYNB70EAO5hwTCA7LzgK9IfblrfKUwkBbw==
X-Received: by 2002:a05:6000:4284:b0:3a4:f510:fa77 with SMTP id
 ffacd0b85a97d-3a531cb7e8cmr11188121f8f.29.1749509811605; 
 Mon, 09 Jun 2025 15:56:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 15:56:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 5/9] drm: renesas: rz-du: mipi_dsi: Make "rst" reset
 control optional for RZ/V2H(P)
Date: Mon,  9 Jun 2025 23:56:26 +0100
Message-ID: <20250609225630.502888-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the Renesas RZ/V2H(P) SoC, make the
"rst" reset control optional in the MIPI DSI driver. The RZ/V2H(P) SoC
does not provide this reset line, and attempting to acquire it using the
mandatory API causes probe failure.

Switching to devm_reset_control_get_optional_exclusive() ensures
compatibility with both SoCs that provide this reset line and those that
do not, such as RZ/V2H(P).

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No changes

v5->v6:
- Added reviewed tag from Biju and Laurent

v4->v5:
- New patch
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 85074e0c3cc4..d4f2867e0c5f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -937,7 +937,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
-	dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
+	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
 				     "failed to get rst\n");
-- 
2.49.0

