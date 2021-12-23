Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094647E51A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 15:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831AC10E1F5;
	Thu, 23 Dec 2021 14:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A76310E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 14:47:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id o12so12942962lfk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 06:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l5Rb/hT3SrbLZnGb7li8TRVv/aVTqOFXEylanDETmuo=;
 b=fXNE4NdesUSnSyGHezZQP8c3PVJKbNreopf07xWE4oqvWnLi0VOewdRK8sprBEo00j
 Y9HIGCNKErJ5HMK8lEt6ITNvVQxHxfzaZAnkpLeTi0MVRX4ob7e6DoV89TjMM3BIojOK
 Kn5xN2nS1+M+xXDIPJ6y3fKFoX3rYz4xw/wOU5etkuLKH7lM2MPgwtoFGml/OE6lJpKO
 NRSF+x7Z4P+uMTl9xE+4B7INPLR2OKHbsyB0cmpWiSx40zvx6tWcEyo3sZGvRw0cdpo6
 mbKCS+WVS/CMXZ18KN4PAIFNh+mY5DMR7MqkQNrKS4ChYcaxlIoYKAf8QIZnx2vhqHt8
 TIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l5Rb/hT3SrbLZnGb7li8TRVv/aVTqOFXEylanDETmuo=;
 b=R8yjP/nb9WePJkGu6u8pOt+Y6T765fe/ojUg/iM+WuUbcH3MKhJJiH3VmZfmgyZcdr
 YJkPozye3dYoySUo42fDcdFqAV+9AJtSQrk7PKCUwKSdY4vAUI2Y4hFdBvj4pVl6rR3I
 XOAjYNgVdyZfcNxV6fmHTA+yJBxifRRRUSIq9Dx6pbPSXbocLCGVT6d1egayWBBPaKbl
 q0UGiQFr45r4vE4ulG/hnBzuk2A/xbdVAMe/u8W2FHX10DDdZ/To1ZTwEVizFl6pZ0Hc
 sW0tsrnjH/7w4/eFL3YC2slZnbZNwhfiTGs27N8U1rjjO32K2x2qNEfBODK0au1xYtyr
 dATQ==
X-Gm-Message-State: AOAM5311nH7/dVvqm5gLnCqQQOkLlDgW4RE6v1TfXfsrL/I4zjEjFGxF
 Vgn+yLVy08/dM5wlb+wQgms=
X-Google-Smtp-Source: ABdhPJxNpJ0LrokNB7VeT64Z2wxM+gHQfbv7LAy0y4RRelmN/uXO/zPhy1aQhU6IQl6t/P3+IUh1Ow==
X-Received: by 2002:a05:6512:374a:: with SMTP id
 a10mr1984598lfs.103.1640270848609; 
 Thu, 23 Dec 2021 06:47:28 -0800 (PST)
Received: from localhost.localdomain (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.gmail.com with ESMTPSA id l5sm521326lfk.167.2021.12.23.06.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 06:47:28 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v1] gpu: host1x: Fix hang on Tegra186+
Date: Thu, 23 Dec 2021 17:46:50 +0300
Message-Id: <20211223144650.10335-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tegra186+ hangs if host1x hardware is disabled at a kernel boot time
because we touch hardware before runtime PM is resumed. Move sync point
assignment initialization to the RPM-resume callback. Older SoCs were
unaffected because they skip that sync point initialization.

Tested-by: Jon Hunter <jonathanh@nvidia.com> # T186
Reported-by: Jon Hunter <jonathanh@nvidia.com> # T186
Fixes: 6b6776e2ab8a ("gpu: host1x: Add initial runtime PM and OPP support")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/syncpt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index e08e331e46ae..83a16e46146b 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -137,8 +137,15 @@ void host1x_syncpt_restore(struct host1x *host)
 	struct host1x_syncpt *sp_base = host->syncpt;
 	unsigned int i;
 
-	for (i = 0; i < host1x_syncpt_nb_pts(host); i++)
+	for (i = 0; i < host1x_syncpt_nb_pts(host); i++) {
+		/*
+		 * Unassign syncpt from channels for purposes of Tegra186
+		 * syncpoint protection. This prevents any channel from
+		 * accessing it until it is reassigned.
+		 */
+		host1x_hw_syncpt_assign_to_channel(host, sp_base + i, NULL);
 		host1x_hw_syncpt_restore(host, sp_base + i);
+	}
 
 	for (i = 0; i < host1x_syncpt_nb_bases(host); i++)
 		host1x_hw_syncpt_restore_wait_base(host, sp_base + i);
@@ -352,13 +359,6 @@ int host1x_syncpt_init(struct host1x *host)
 	for (i = 0; i < host->info->nb_pts; i++) {
 		syncpt[i].id = i;
 		syncpt[i].host = host;
-
-		/*
-		 * Unassign syncpt from channels for purposes of Tegra186
-		 * syncpoint protection. This prevents any channel from
-		 * accessing it until it is reassigned.
-		 */
-		host1x_hw_syncpt_assign_to_channel(host, &syncpt[i], NULL);
 	}
 
 	for (i = 0; i < host->info->nb_bases; i++)
-- 
2.33.1

