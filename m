Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9609156B1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 20:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E3E10E0CF;
	Mon, 24 Jun 2024 18:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qjxhVNkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B24310E0E2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 18:53:53 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-362bc731810so4270367f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 11:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719255231; x=1719860031;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NUZJiG9Gjv4OA9J67oLpsMQlxEBxrT6DttNu0ncoRGM=;
 b=qjxhVNkZgnzEhIWbIsad9II3BKNDtADtDKJ5UGLVfnBMJvL7ysLUduFBRFRv0UkHwd
 K1k1ck9hpGPnY/9LWDak8+tNwDFdr6Gzaqyl3wmYkydJvuVFdIjCTKT29BWYCIKOAthY
 UI18csTXROOFjhP2MqaLgUW6n3sgC8xGSPihg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719255231; x=1719860031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NUZJiG9Gjv4OA9J67oLpsMQlxEBxrT6DttNu0ncoRGM=;
 b=eV1CmbvJbEbf6GROK0EBg4hHA3aRhClvRi+NT+cDbFXFpCbRWGCpHKd/3tmCDjSu5y
 LKztSvlp7qdH0BYdv3AJHOWcAr0GgUmv8DCSTK3oKDUXt9YbUxHRttJbqjWUvgPCT1aQ
 hGRRz2AvgRAPwla1RAgL2q9xEWYexYetjordQ7/a4hnVR2dpHUhaD7xmzmG4VouD04LS
 dSgFr5fiZoU8Vzley2bVq2ewOzPkAWmKGP/by/4pVFZWDNHDtgdQr+XECtokWzPKtzOR
 n1NEDJhfw87RHknPpY+DvYdIgigRfhBZloQOMRYBza/CJR26vC9USK2t1E0qnOgBu6l9
 3dww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7QTF5ABJHg6Pl9eCSLRcMApk7o+n97s97gBqS8jTVf4Bge2qWKaR4/4JrbbgnLvsPPcGTJAccRoK0D47Ydnvb9PJ7UlwN4lA1lWsq5Ks9
X-Gm-Message-State: AOJu0YxStQpebT3H6/mds7uAqg1+WaNFeQKYZ2vZR75dIVeaPkfut0df
 +cxlQfhn9PZiBFML9m0UtP8PJnbjkwOGNOAo0uqrItcNREOO87n2lXXquLBANpbRtdtyYjc4B43
 kyCY=
X-Google-Smtp-Source: AGHT+IFK8T+LlQMe+robPQRvr5T+YJtnbTOBRh3Mq0ksGTgPBWQRmT8UV0AJJEaqrqSnYPlc2/2i6w==
X-Received: by 2002:adf:fe06:0:b0:35f:1d5e:e2ca with SMTP id
 ffacd0b85a97d-366e94d9737mr4031115f8f.39.1719255231301; 
 Mon, 24 Jun 2024 11:53:51 -0700 (PDT)
Received: from panicking.home ([158.47.231.107])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366eef51a14sm4489496f8f.83.2024.06.24.11.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 11:53:50 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Michael Trimarchi <michael@amarulasolutions.com>
Subject: [RFC PATCH] drm/panel: synaptics-r63353: Fix regulator unbalance
Date: Mon, 24 Jun 2024 20:53:45 +0200
Message-ID: <20240624185345.11113-1-michael@amarulasolutions.com>
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

The shutdown function can be called when the display is already
unprepared. For example during reboot this trigger a kernel
backlog. Calling the drm_panel_unprepare, allow us to avoid
to trigger the kernel warning

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---

It's not obviovus if shutdown can be dropped or this problem depends
on the display stack as it is implmented. More feedback is required
here

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

