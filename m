Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2E9AE30C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 12:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152F10E8FA;
	Thu, 24 Oct 2024 10:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qnLZDra7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522F510E8FA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 10:50:56 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso1420589a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1729767054; x=1730371854;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6qWdmaHz7Nux7p/WW92k3YpnxPIwDsMgrq5DymSLCxY=;
 b=qnLZDra7XMmD1ok8iOYNBOpyZI8uYcK5jWRFH64VlMgSJU9ZbKixerVaeJdvmyqcDl
 g6L/rL6gtXxvbOxj1DM0XAUb4SjuYtU4ITKXWksmxnlLcgLMNvEryMSxlncTOOPGVUUp
 xdFLD8iDJsbmKKWlkb16M7znfK5wN2cZrUrzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729767054; x=1730371854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6qWdmaHz7Nux7p/WW92k3YpnxPIwDsMgrq5DymSLCxY=;
 b=iQXfoocahUhf2z9WPDNzz6iXy15SIIkFY9nAjP2ibUfHXeTNh0gQiP14wf4nearAW8
 IFka/I37VDRgN4OlTPmkbfuwoWiM+/C2iKjJcJZvOZr06WIe+3efoUSTcKqnqHdYh2Ol
 sVTIXlosnb0UM+4tdllppn1b1SJZnVZCffAmSpCxLCP29aaYINK76qqlz5X0VuLPH8PV
 rcQnWhY1p4Hj05cESg2UL1/HkJhHa3u572utUd7l6YHrr9SJNptQzAg5qnYAaWc1Zvym
 4ncNSptDr55lVBSjl7fkVBFBxjpjLGS2HqTHlOnkU9w/fafdpC87AI5O2Q/SGNYxHRnz
 SCGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwwTSTmtkUE5Whee8ENeiltFck6U53AoBGlXRtVBVeGDmuafS97qgd1uKHv9mtwMWSe2rIU39EWUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvNhKuE1fMifjFwKaGBAMSyEl0hWxRj2h9K81ni8o3fdcO70yC
 OhRF0Gh9WDq/y2A4TAhrJgutfz6NcrN4jyXL6n35JxTSQvn7HZ1AMy2wCwK3ON8=
X-Google-Smtp-Source: AGHT+IHWsyISWq/FYUrYWrdlaP7r5eYT4H8Hp8tVEO31BNXzH1CneTvHOtGnGAb8Qb6yAFj15jLtQw==
X-Received: by 2002:a17:907:3faa:b0:a9a:f0e:cd4 with SMTP id
 a640c23a62f3a-a9abf964edemr607896766b.55.1729767054232; 
 Thu, 24 Oct 2024 03:50:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:f79d:49dd:b804:3f48])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370723sm601132366b.100.2024.10.24.03.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 03:50:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: synaptics-r63353: Fix regulator unbalance
Date: Thu, 24 Oct 2024 12:50:46 +0200
Message-ID: <20241024105050.3483542-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

From: Michael Trimarchi <michael@amarulasolutions.com>

The shutdown function can be called when the display is already
unprepared. For example during reboot this trigger a kernel
backlog. Calling the drm_panel_unprepare, allow us to avoid
to trigger the kernel warning.

Tested-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index 169c629746c7..17349825543f 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -325,7 +325,7 @@ static void r63353_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct r63353_panel *rpanel = mipi_dsi_get_drvdata(dsi);
 
-	r63353_panel_unprepare(&rpanel->base);
+	drm_panel_unprepare(&rpanel->base);
 }
 
 static const struct r63353_desc sharp_ls068b3sx02_data = {
-- 
2.43.0

