Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8624236DDCD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED286EC82;
	Wed, 28 Apr 2021 17:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61336EC82
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:04:24 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id y32so45173964pga.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=Oh1pOQY3nDNpYWg6CBPvoxbwz9Lp5/mgbvExVmkdIhmJlVZGash3DmwrmBb4CIKHon
 qhIf723E2NT3KLDzilpKerGauzvnOHbY+s/nFoAFNFIGUDyS721zHl0d0K2csd5vwIJO
 eIVQuYBad9ZmHQ0iSC96gsmAMu/m1PJWWkJCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=eRUHcWD7L34e/pqvM/YjHDw0A6Ya+PNOUVo01JjXdgMP5M5Sj4coRhOkKeTbH6aktB
 nsX4M/zJcE1LZ9pKZYMjWZE1BC+D8+ki4WHQxp5Zp60JIeYhenXbQPD+xWSqzZAaCPU7
 X1tqNz2NMgpUwrqXbDNDzUW0Hjv/67AghvJeYhnNyJ+GKMriRy1om524rnHTSaMJsB5U
 e8RtgOK7uTAqqaTZ+1XbsU/c4Kl5OllUE0KtnG0nj+I1uPVD3K4lJ3BJzXr15vusFUUu
 KKYVhCHhqn9xZmsCXIFXcfOFaLmZ2HmqHsmb1b++c1vgyXZ1qL04V152Fj0DFUJ0SI4P
 hh5w==
X-Gm-Message-State: AOAM533gBnlgps5IlqgLB10mzSN8LO0UiqGMd5Wu5W6KsNK0yaA4P3nm
 YkI3+YBUtvaZQo8C/mMkIwhbFzL/vv/zLw==
X-Google-Smtp-Source: ABdhPJxErM53epytFNpIJdI3/a9zdSqFrICBlsEBiJkNLoECwWzSEjPVpUQPi64CmaQN2g4Kj9Mq2A==
X-Received: by 2002:a63:1921:: with SMTP id z33mr28455929pgl.211.1619629464253; 
 Wed, 28 Apr 2021 10:04:24 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1faf:c32e:8742:d913])
 by smtp.gmail.com with ESMTPSA id c8sm244351pfp.160.2021.04.28.10.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:23 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/4] drm/mediatek: init panel orientation property
Date: Thu, 29 Apr 2021 01:04:14 +0800
Message-Id: <20210428170416.1027484-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428170416.1027484-1-hsinyi@chromium.org>
References: <20210428170416.1027484-1-hsinyi@chromium.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..9da1fd649131 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	ret = drm_connector_init_panel_orientation_property(dsi->connector);
+	if (ret) {
+		DRM_ERROR("Unable to init panel orientation\n");
+		goto err_cleanup_encoder;
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
