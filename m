Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8A4609A0
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 21:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCB76E12A;
	Sun, 28 Nov 2021 20:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F278E6E12A;
 Sun, 28 Nov 2021 20:20:01 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id p8so16970344ljo.5;
 Sun, 28 Nov 2021 12:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k4DCyz8+/Fxa9vXLn5RMQDYsGviUlWwuLm5KSdNmdZY=;
 b=gEBN9h0rjiWtK6jttU/X32i65gXZsB9Rsw6WnTNHd6QQEECoU3oVb9Fzy+QKNq+M5b
 ij4GEouoWUkj9ibEDrFkACwGhqmGsX0pfmp4KKb8WXYuqS1KIuLYMEf8JVWKUBlAOvEc
 3DmhH8haP01CUUi+cI6ZdVIxdEa31t1e0pY0YnhQAkiJD1eMD7ILnkHEUEDhe/kuXj3p
 FI3Sbf58ynZrNaPEuz1nEJUrpQNPL3rmCqJSFl1rW6iHjgaNB8zacW6xN9QXbZD75twJ
 97G+ZAd9srSAWMgu4CgNHzGkzTOI/TisJ43wLaLrhYSq/drTtrcz0nipMGXek8KtPIeH
 QGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k4DCyz8+/Fxa9vXLn5RMQDYsGviUlWwuLm5KSdNmdZY=;
 b=0xYNbXxiRSnBQGmVn3eQ1Bu1QOyQncOI1wP6Ot/LYdTTgcCxxcp3GJqYabgbFa/5o0
 bbGPD4oVmKWQok2MsB3Fk3MAZdECNHUyScKFBajoCNr6bG+d3kh/L0kWCyo0fx3r+hZ3
 yat36dyZDw+rU+UhDVBLYHcnNZJJOtspAbHBMcuG1kE44+pNWPn3N5qVsGbrvpT/OhqA
 /zd0oe03dgGm/lE/WPC//5CoYNqkndbY1lHouFK2pe4GCIHUWw7tadEcKxmT2bAW+sGh
 yMs/9zVRP6iDgdkcR8P2wa/GnLfzIN/TujTiUSyXmsEb6EGwk6Xmy6NzGaZzpq5qcFkT
 P2hA==
X-Gm-Message-State: AOAM531eh9reSGWQfO2kZ7eVEkGwuVE3YljPU0k5ieLcmx+Q+U9b2MYf
 FM5sO9lEvEl707pX+qU2XSA=
X-Google-Smtp-Source: ABdhPJxvPPnZuZKkpyL/VlLduwLNeb1FS0N0nAcE5rtjGsySNwTDTVMqW7CA+Av+gYdeEUBcSgrhfA==
X-Received: by 2002:a2e:a305:: with SMTP id l5mr45044119lje.73.1638130800165; 
 Sun, 28 Nov 2021 12:20:00 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id c25sm1136949lja.38.2021.11.28.12.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 12:19:59 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/etnaviv: constify static struct cooling_ops
Date: Sun, 28 Nov 2021 21:19:16 +0100
Message-Id: <20211128201916.10230-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only usage of cooling_ops is to pass its address to
thermal_of_cooling_device_register(), which takes a pointer to const
struct thermal_cooling_device_ops as input. Make it const to allow the
compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 06bde46df451..37018bc55810 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1658,7 +1658,7 @@ etnaviv_gpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 	return 0;
 }
 
-static struct thermal_cooling_device_ops cooling_ops = {
+static const struct thermal_cooling_device_ops cooling_ops = {
 	.get_max_state = etnaviv_gpu_cooling_get_max_state,
 	.get_cur_state = etnaviv_gpu_cooling_get_cur_state,
 	.set_cur_state = etnaviv_gpu_cooling_set_cur_state,
-- 
2.34.1

