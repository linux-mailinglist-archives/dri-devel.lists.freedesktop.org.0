Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C27C4FA1DF
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 05:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586E10E1FE;
	Sat,  9 Apr 2022 03:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953FE10E18B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 03:00:12 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id t4so7675186ilo.12
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 20:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7RUgxB5lUnMf0m/8cJBKRpGrEmDxJAR3LLco6CCvSoQ=;
 b=XOXBEPeFHHNN7CMBaD7IyFVzbQgjm8LkaxzYx1ftFJNSXV6gS4JkUd3UW9t/qvpKhZ
 3YqwXfBtp1ZwgTxM8bHyhRab4zRiuVR5U+P86722emmM0Z+rkuRzVSFGXbMwxf2YJvKl
 +5dSv5E54VhyCQS6z4Uh87JCJvbgeNU+ztiegdXow7rIUt5CJjZoj06jKgDKGpMWuWnb
 n/KBhqUHRdJDauCFwQJvFZFx2l2LR25EQ9ZFShh+AOVFcx7jcsznU5rQXBoxfpgyU55e
 s9nDMzZP93lBA1F/g2jfVaETN4k5Hdh3hrL9THd1tFNTPAMlkAfqw/kwODL0inMrukXH
 RsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7RUgxB5lUnMf0m/8cJBKRpGrEmDxJAR3LLco6CCvSoQ=;
 b=XRs0+7NYSgVtTM14kbTQSHnYZUxQwkcc4SmAKBvQ6BOP8UBf3ay/mGew1ebbuyjX+m
 biIaf+vba7eVF183vb/mJttPK8eWenyMpv/6Vvtcr3jklAcVrMyHA5x+ulymbFfJr6Ef
 /WG5+yx+eELZaAurtOvhjRH//IilYqiZZJNFK47D7Kw157tqS7aA10JhIf2Okk2nrCUY
 NE0wfuDxEWEiI3TJNqoC5hIBDVgiTTfCwLPTvoVsGTsIyY2IsNgB0Pm11N5goEYXAQyq
 IbbQgUdc4ns9pUHBkINAkkwb/ItTogQk5ERT82qq5vUwOqKCD8abd99xFunNTe0wy4pE
 rN3Q==
X-Gm-Message-State: AOAM532H/iVgoA9E1mc1bpm3YbrwBq2RpHW32a3KRtBlnYphrWALdkks
 Dm5zbvdQAxB2ZdPmPTp+PTK7HCjQpC338w==
X-Google-Smtp-Source: ABdhPJwrhxj/LWZYAEPg4H8QbXHQjFpoQ8f4XNumCm8a/VGKhnV20+mtj6vY1XGvloXnr8hnu3nTqQ==
X-Received: by 2002:a05:6e02:1c41:b0:2ca:8a04:ad8d with SMTP id
 d1-20020a056e021c4100b002ca8a04ad8dmr2527592ilg.195.1649473211662; 
 Fri, 08 Apr 2022 20:00:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 y8-20020a920908000000b002ca38acaa60sm10314731ilg.81.2022.04.08.20.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 20:00:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gma500: select framebuffer dependency
Date: Fri,  8 Apr 2022 20:59:48 -0600
Message-Id: <20220409025948.3179636-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, James Hilliard <james.hilliard1@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This appears to be needed for video output to function correctly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/gpu/drm/gma500/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 0cff20265f97..ff8c7b6e87f5 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -7,6 +7,8 @@ config DRM_GMA500
 	select ACPI_VIDEO if ACPI
 	select BACKLIGHT_CLASS_DEVICE if ACPI
 	select INPUT if ACPI
+	select FB
+	select FB_EFI if EFI
 	help
 	  Say yes for an experimental 2D KMS framebuffer driver for the
 	  Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
-- 
2.25.1

