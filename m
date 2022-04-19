Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318D506965
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 13:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259A810EF30;
	Tue, 19 Apr 2022 11:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DACF10EF30;
 Tue, 19 Apr 2022 11:05:25 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id b17so12819227qvp.6;
 Tue, 19 Apr 2022 04:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WypoIbYzDM3SGYr1aowM73aDQH7Omrk2x+2YoRxyVaU=;
 b=a6OraGettVpXcTIsVDJpQy7a4jQLUXhbFvesUjA7jmnSNd85IR4GKqgvqZNABHG0m9
 hn1WoKmmxl3+lDodvIJ9YsE/4OcAUL6hN4h7mGB559d3pQd6rFnx29F1T+IcdPn+ERad
 pfNzxbsxXX4w0fZcIlmfWn6bKAuypvSukcL9ecHM+dRn7sxAcw/8LzT1mxm0EOr60k1o
 sOR/yvTL/5ICWHcIzcRXoRtz5j3k2xyHwAwCS3+rH032Rpk6IeYoj0UrnIMy2fcBUcza
 Tf9AU//r0dC1atNVpXt7xovE6CWTGQO7krq/Uwo6E7Flge3UBfFXTTmWGlv95GWIyZb/
 Vcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WypoIbYzDM3SGYr1aowM73aDQH7Omrk2x+2YoRxyVaU=;
 b=c8muvnAHzX3C/H6MaevUnewHD2jCTd6D3tB/PHqwya/STh58rPGIId37G1+9LlOxcs
 oWkvwsCvn7SHQGWG85M8mke5fkKRB5WmcRK2VJ4LAWUOW/LhsA7TilRfkpV13xJ6l6Q3
 0Tgv4bOaKcMblJRy5J4q2nFUPiW2fn02Wfx+/acFZSS3b8btLfMiW8xQf2vvfka7w9FV
 XYlVKgNCLmtKvNh/uFMhTRlKYnYekn4FFfMhWKaEPNq5ZH01hTaUePkGna/8GDlX0PM1
 Z+nkaQGNsnWAOxlPUxwe5AwCPilJEQ9GJbYS4t0pnM+A1i/HCh8mQ0oCq4N522GQY9UI
 MQTg==
X-Gm-Message-State: AOAM531r+SzmmEJ6CghF/EjxV3AOQ0mw2s2VyzmIiRoIaTNTnU/8nsvl
 VHMJTUtLDLWwlMMi3TQVs9c=
X-Google-Smtp-Source: ABdhPJw71zFUJUfEaL8h4nWaMzHBhFcHvhWClsius2kORwDAEjXL2UUVo6ziMXBa9ls10KuXylePWg==
X-Received: by 2002:a05:6214:2309:b0:435:374d:4bbb with SMTP id
 gc9-20020a056214230900b00435374d4bbbmr10758363qvb.105.1650366324179; 
 Tue, 19 Apr 2022 04:05:24 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a05620a099600b0069e5db6be55sm6041254qkx.36.2022.04.19.04.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:05:23 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: l.stach@pengutronix.de
Subject: [PATCH] drm/etnaviv: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Date: Tue, 19 Apr 2022 11:05:18 +0000
Message-Id: <20220419110518.2574486-1-chi.minghao@zte.com.cn>
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
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux+etnaviv@armlinux.org.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. This change is just to simplify the code, no
actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..4ac009a1c4c0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1342,11 +1342,9 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 	int ret;
 
 	if (!submit->runtime_resumed) {
-		ret = pm_runtime_get_sync(gpu->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(gpu->dev);
+		ret = pm_runtime_resume_and_get(gpu->dev);
+		if (ret < 0)
 			return NULL;
-		}
 		submit->runtime_resumed = true;
 	}
 
-- 
2.25.1

