Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658A6A14B6C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3A10EAB5;
	Fri, 17 Jan 2025 08:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E950910E1B0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:52:38 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-5f4c111991bso614322eaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042758; x=1737647558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2rFT6UPFjBzbaYoHK4JyH1XrSo+yhjpr3t2g2LL060=;
 b=Ek+3JsY+c9TZCR/sJHW9e05e4SWBlGPDr6cJn4YtfDgakI97zmpxSSJ9gwOVLZbcFU
 l+25KZhBecgGwzJKuCnFprvAQeVRzm2VfuxXyP0obgi7zNgjB7LNgK5EpgcwPov2PbY2
 0TeI4pV/9IsjMe6645kpL+8VH2Bcwa4iRh2H7gZ4S/h3khl3RYiMeagqMkzwqmicSU3t
 s/FWwZHwHSkK0uigkdFgWqFwClJn8PapOlw+BbZo75iZvcOt+6BMj8qjSJIFd5LA7XiH
 5eEZDcb965uP/YvB/4MStbNES0ViRpy4/ztYbbmBEsDbyzbPpbTo8kqEYZGMEFjbe1p/
 uHQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaTSq3YkEsogxlrMiYbNGAI61Ls4QD6JvQdTKjzM6ZC6pCRYIwuJYjggHOrrTjkfwotmnTyKVkCpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXsWxFyExowEf925Y62o3pwq2M2mNXkM2puW6PCGT9cqdkKLAw
 kkz5RIoDoGHOMwwYz4prHmJFX+vmqmZmWQf/5Qbpw91Uwi0Uu6dj
X-Gm-Gg: ASbGncuLaYvcbtSLm+nu2gjsxf9NdqCucgWE+v2PspkTDEnpacDj2tcMhQ0VwpYLoOe
 SMXKh5y8UXPoPZdPCOIc7R+b+/PZtfUQpRkfApyZlTEPQwwpSwqvipzspS+YYmLtOBhHDyvTj0O
 X5kXPi9k7gRT00d0vWcMCyOrtly/TWmpdcZCEBhujske+8WymgHVVkkcTLNhgZSgRg8IauCad2A
 0KIafIEY4fKvI8vZyb2VedbR0h8Ffx10N3VrOkmCMwxYD+dOGrUrlTtBA==
X-Google-Smtp-Source: AGHT+IH7pcLhe9rj4tBRrwB44AFwErH23sD2LBDEer7A8oTPT8B2eEoIeoVtb4vhHPfedWhvGHTVnA==
X-Received: by 2002:a05:6820:1ca1:b0:5f8:9e17:81 with SMTP id
 006d021491bc7-5f8fa6e8556mr4822052eaf.1.1737042758175; 
 Thu, 16 Jan 2025 07:52:38 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5fa35f05bbdsm70538eaf.13.2025.01.16.07.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:52:37 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrew Wyatt <fewtarius@steamfork.org>, John Edwards <uejji@uejji.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm: panel-orientation-quirks: Add support for AYANEO 2S
Date: Thu, 16 Jan 2025 15:50:45 +0000
Message-ID: <20250116155049.39647-4-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116155049.39647-2-uejji@uejji.net>
References: <20250116155049.39647-2-uejji@uejji.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 17 Jan 2025 08:46:14 +0000
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

From: Andrew Wyatt <fewtarius@steamfork.org>

AYANEO 2S uses the same panel and orientation as the AYANEO 2.

Update the AYANEO 2 DMI match to also match AYANEO 2S.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: John Edwards <uejji@uejji.net>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4a73821b8..f9c975338 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -184,10 +184,10 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
-	}, {	/* AYA NEO AYANEO 2 */
+	}, {	/* AYA NEO AYANEO 2/2S */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
-		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* AYA NEO 2021 */
-- 
2.43.0

