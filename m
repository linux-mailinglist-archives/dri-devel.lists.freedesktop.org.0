Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A770E7060D6
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F7710E3C0;
	Wed, 17 May 2023 07:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4A910E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:50:52 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-61b2f654b54so65823826d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684227051; x=1686819051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p37xwemRmvnMXu7zqr8qUEOysKIfWHCVcW7gNj+l5QU=;
 b=UKvp3fhWeZx9ULyqR0fJ2b8IIphHErsKHgT3ekfjUzT0dPT/72zzWYnFQ7DbKuGzdZ
 AwQcq/xH+6cQyOV90IVQKIKAGSPlMtbAdE9Q7JhXQ75Ug3qMC1+6Sn2yGQYN8dr2JN38
 EES2HGoo7uwcV4yiFFKhTejy36iH8cDQMTw4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684227051; x=1686819051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p37xwemRmvnMXu7zqr8qUEOysKIfWHCVcW7gNj+l5QU=;
 b=B9Fu23s6UqNvqinaZF1a2fDDVWDu8SMoMD7OPCJSmBHlPm5CND1jdmg3ikbMRx5Otj
 Sf/f7IDhL72gw/ocEwzyifdzBuEApdUfGhB/fpQ/HK9EapRGXY+rsTV5MeZ1Wd4AHw9y
 o5zfe9lnCDLUNoP6JFuOhYq577NQ+nbQ8YUCOXGUlImBI9p/Vvkld715UcUr0qN8w5bS
 zQSZ6/OyvF8mYdNAKyyetZt59j8NVznCy4R9C+DLYqrBEk9resML9BuIzulRFfdpbLSZ
 gJD3wIFIX1WmOmhhTPw3KF0UISF+XszHYZKz9Ba6xOY2551/DnuK/goNpmyX7pW/xx0n
 Mq+Q==
X-Gm-Message-State: AC+VfDyBfo9w8iZ70tGNA2M4xMhfF9et4yr0uosx+kbFacTKQ+lJEAlN
 xtHiuBBpiRE8mxfWefF/SLH0cHJd8/paRHF3H7LnMg==
X-Google-Smtp-Source: ACHHUZ4HrFSbd8Ul5hJPPrcQADlTXsL1z1pUBhxD4DHWR3lIZfNg3Gc5XtR0neHQgTIONuEpRzL/OQ==
X-Received: by 2002:ad4:5bcc:0:b0:623:6b1a:c5f1 with SMTP id
 t12-20020ad45bcc000000b006236b1ac5f1mr6566466qvt.4.1684227050912; 
 Tue, 16 May 2023 01:50:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (mob-5-90-62-17.net.vodafone.it. [5.90.62.17])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a0cf48b000000b005fe4a301350sm5497335qvm.48.2023.05.16.01.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:50:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: simple: fix active size for Ampire
 AM-480272H3TMQW-T01H
Date: Tue, 16 May 2023 10:50:39 +0200
Message-Id: <20230516085039.3797303-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 May 2023 07:08:54 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous setting was related to the overall dimension and not to the
active display area.
In the "PHYSICAL SPECIFICATIONS" section, the datasheet shows the
following parameters:

 ----------------------------------------------------------
|       Item        |         Specifications        | unit |
 ----------------------------------------------------------
| Display area      | 98.7 (W) x 57.5 (H)           |  mm  |
 ----------------------------------------------------------
| Overall dimension | 105.5(W) x 67.2(H) x 4.96(D)  |  mm  |
 ----------------------------------------------------------

Fixes: 966fea78adf23 ("drm/panel: simple: Add support for Ampire AM-480272H3TMQW-T01H")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/panel/panel-simple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..d8efbcee9bc1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -759,8 +759,8 @@ static const struct panel_desc ampire_am_480272h3tmqw_t01h = {
 	.num_modes = 1,
 	.bpc = 8,
 	.size = {
-		.width = 105,
-		.height = 67,
+		.width = 99,
+		.height = 58,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
-- 
2.32.0

