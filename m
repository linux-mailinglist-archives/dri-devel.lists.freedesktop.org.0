Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E605C78885B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 15:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1B010E695;
	Fri, 25 Aug 2023 13:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D0D10E695
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 13:22:31 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9a2185bd83cso115309366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692969750; x=1693574550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G/49YrZqjNimW06cF+vnlS/a15tY0huxh3tp9jjiGD8=;
 b=hLgoXa/3gicDXJ9UA0YdWtUO80OR8JXJ66SCx+TXsal85sBzoFLnbabUuI/MrETyrd
 nmLk9o+nyQZuNN8MCOTnpxD/KcwbU46nrSbjvZ9+MuN7F0NaF9CSTqlOklw5+gE8FVu1
 uX7tnJ5q+fKpEijPaNj3PUU1Zp0NbrAEpE5WX6t8Xm+5xCBZcBV5BmDk3CGNYpG+ezZK
 j4/uDIh7S9Esuh9sWLHcwmyq0pmeDmuKio2ulbjwVumWzDUYPpEXSwa0g36w0KVMIBym
 wFQjmsT9/BU1jC+oMCvkyVAKkVIREG6Ir7iZ/+nnNel7wdaDxL59C6M/c/b11f/j5QrP
 jucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692969750; x=1693574550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G/49YrZqjNimW06cF+vnlS/a15tY0huxh3tp9jjiGD8=;
 b=CDOViiP2QJn7gU9ZvuUb/QtAdXZQwnAFBIY/IKXsykce7SOBbD5MODP0huP7vOX8Dc
 Ha+VXZJmiyeuWNwyI3azFve2KSkVZtNjJql5waWCBUHpqAt5PHYnugh46m+2YFphL5s1
 ph1DWe1GgQR9WtoJjcvuPDW8uMz855xLji60Nxg3JNUpNh7r/RvvlyeGO64uq/cvbVv0
 FF1fBbZoVRW2NxMXHWT7onOeW1TJMmQyV75/blE3Vcytsz/P4WPbe9Qht6yBraziRVQG
 iSrL0xTAhPyf6Vz87AGVUmsHdtc8g9F7iU9i8td5nt/WJZzxH/3+1J+n8pkDkJxtaA0a
 YhmA==
X-Gm-Message-State: AOJu0Yy5A1gOZ4r0tO0GyVrexWMesy3Gejo5xkY49JFzrFWyAD7D8dwA
 /RfCyPR84ueXDntQP2y01pY=
X-Google-Smtp-Source: AGHT+IHiPTg8Yu9UyjHFcEcRp7nIs2XpiN6eegnfnsUN8QcgbybMaw3YR2oSAUPJ9uJ6EDI8vm1mLA==
X-Received: by 2002:a17:906:220f:b0:9a3:faf:7aa8 with SMTP id
 s15-20020a170906220f00b009a30faf7aa8mr2478509ejs.10.1692969749976; 
 Fri, 25 Aug 2023 06:22:29 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a1709067f0500b0099b7276235esm961691ejr.93.2023.08.25.06.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:22:29 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: Remove existing framebuffer only if we support
 display
Date: Fri, 25 Aug 2023 15:22:29 +0200
Message-ID: <20230825132229.1109445-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Tegra DRM doesn't support display on Tegra234 and later, so make sure
not to remove any existing framebuffers in that case.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index b1e1a78e30c6..7a38dadbc264 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm_mode_config_reset(drm);
 
-	err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
-	if (err < 0)
-		goto hub;
+	if (drm->mode_config.num_crtc > 0) {
+		err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
+		if (err < 0)
+			goto hub;
+	}
 
 	err = drm_dev_register(drm, 0);
 	if (err < 0)
-- 
2.41.0

