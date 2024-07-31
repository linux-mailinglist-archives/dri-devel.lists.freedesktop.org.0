Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66F94335B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 17:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747C710E65B;
	Wed, 31 Jul 2024 15:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XHuGG9nB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3676910E442
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 11:32:00 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ef2c56da6cso66267771fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 04:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722425518; x=1723030318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KLlHAYEoQUMdhQZU6kSQMssVwUMCuLr6l/hsX6VH1OM=;
 b=XHuGG9nBhEQG7zkuKc6MrH997BWARnxXGWxecBJ+uqHq4994fNwVmZZdWmBGDU0MFY
 TEg6Fn4LGG0Oj6PDO0Ycke7qZkV1bZw1LhuuaYM44qWEBkbD4hR5+nm+yKV+Xc3NzV3n
 VsppWJahYurgKpGwbUcSUk5RWdjOtCSjc+wdzH8KnM6EyO/953n0lbGomNusXnw41qrT
 sMDWUEchjXXnHEQfpmiFOEQfCIeMmdZwAU9dEn3ohMZTDz93nEdf3M5ShVLlmd1Os3Y8
 EBB7sAj/6fWyiKarRmTAHD9HJpWmg4FEtA89S9Z7Bc1RpyNPtwHflloAnVEGaIYqzQyE
 bzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722425518; x=1723030318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KLlHAYEoQUMdhQZU6kSQMssVwUMCuLr6l/hsX6VH1OM=;
 b=Yjfs2It3z4kIKa19ZVzD69FxlXDL4+RIueLDM59l5j1nvx275PQ5kBLwC/PJ3POD58
 XBgDVhOMtEGUjFGIyzTrgTcxK61tCLT5fvPnj3THSATzN0nSRuzFdsyPTbjHrrHd1zmX
 9c1ShT316mxoXoYRex/csk2Uw/kJZQhKlY9gCHEy3kkbMnfB9CHA4PJo49WUuOzQfTOb
 aP5Y6Old2xfFMvmLJne4rFOUqc+XELogPacOxV53fYZub7jAIFbLo55i/OwgzblY6tv6
 cFNXj87JTiEhsd3GvxkQhaWCp0cliKliaoarMiWtInpOWTv4yvRnjXQsaQn5tlILfbN9
 sXIw==
X-Gm-Message-State: AOJu0YyIjxNPtzsZ+zfUTpmCK8zr9mLe9SMcSfNagOnSduZHqkDV6Ffe
 ofWi4cOFsRvo14+553NsziPqt3mlTIxDYAxuZFud6Ql0e2e3yFMW0QpCHQ==
X-Google-Smtp-Source: AGHT+IHIH0VrGy/tyK1ZdY1q1Fu95+HbyGuN4+uVYLkIRgCnHOem6+N/UwSqqnnVau/MYEYtjJq1lw==
X-Received: by 2002:a2e:8198:0:b0:2ef:28ee:944 with SMTP id
 38308e7fff4ca-2f12ee2f300mr88229441fa.45.1722425517629; 
 Wed, 31 Jul 2024 04:31:57 -0700 (PDT)
Received: from localhost.localdomain (2-230-196-213.ip203.fastwebnet.it.
 [2.230.196.213]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282babaa2esm18724445e9.25.2024.07.31.04.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 04:31:57 -0700 (PDT)
From: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Marco Rodolfi <marco.rodolfi@tuta.io>
Subject: [PATCH] drm: panel-orientation-quirks: Also handle rotation for
 DeckHD equipped LCDs units
Date: Wed, 31 Jul 2024 13:30:56 +0200
Message-ID: <20240731113055.226440-2-marco.rodolfi.1992@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 31 Jul 2024 15:30:09 +0000
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

From: Marco Rodolfi <marco.rodolfi@tuta.io>

Signed-off-by: Marco Rodolfi <marco.rodolfi@tuta.io>

---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3860a8ce1e2d..32582dbdc184 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -420,13 +420,20 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
-	}, {	/* Valve Steam Deck (Jupiter) */
+	}, {	/* Valve Steam Deck (Jupiter) Stock Display */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Valve Steam Deck (Jupiter) DeckHD Display */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd1080x1920_rightside_up,
 	}, {	/* Valve Steam Deck (Galileo) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
-- 
2.46.0

