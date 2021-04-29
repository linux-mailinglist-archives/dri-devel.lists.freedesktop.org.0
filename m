Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A836E441
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 06:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456D56EC67;
	Thu, 29 Apr 2021 04:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5A26ED13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 04:28:42 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id p2so30805433pgh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=G85VcZJiBhrc0Z+xTBYX6C5fC+iasG268uM+qWiT0xg/xpPu0RRhUrnr8buAZ+LlV1
 lSKD7pRAcedECmwTgS8kTxBRZ76a6Itsaz2/daIKpP6tkNusndubKuXvj0rjc6r64pQ6
 ektV8bQmN/zPS9egbWIlp0qx+zMjeyKhAqJOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=D5O+oPA4zO5hP4/ccwi/ioxoKmxmWddXqH+HtybEE+zCVvhjbK/OK6i3TTNNWVjvR6
 8T0hfrrMgPoFR/Q45tRXOu+6+EmBLKGhiQhuEewbObPEoJwv4j0mf9YS+jYv9oJ66Up2
 iYacX7Smp65Ozb8IbzsWQCoKFcVvIZ60xmx+MYQnZLfOdZ37/hdEsl1Ds8io4eyqVITm
 UGdrCAPPIktMExWVwWfj6fxkOXKH3CC+MDDjndhz5bKi5zusg4EpSayLi4ecDJ7MsZ0T
 VQOalG0IhOs7w2lK48Q5K26ZUTJXlGpyETlIjWQLHYIB6fhlMg29TeQmp6oaIMU3r2LE
 zi+g==
X-Gm-Message-State: AOAM533zxpMzIr8nUhOSs48d5ho7SfpWD4OYfA6B/iKeLb30RavOkRSJ
 6c3bhKhDFtNAEH1Z9bTyH5NLUXB17ncB2g==
X-Google-Smtp-Source: ABdhPJz7d0lwcYiWWsZ+p9irRnLEfdh2OXdUkleFkMQkFzA1hAfKA+4YpXWMxwylDQGJh7nhUk4LhA==
X-Received: by 2002:a63:4550:: with SMTP id u16mr30275755pgk.440.1619670522054; 
 Wed, 28 Apr 2021 21:28:42 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:f701:2ca2:56ba:8e83])
 by smtp.gmail.com with ESMTPSA id w124sm1069390pfb.73.2021.04.28.21.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 21:28:41 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/3] drm/mediatek: init panel orientation property
Date: Thu, 29 Apr 2021 12:28:33 +0800
Message-Id: <20210429042834.1127456-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210429042834.1127456-1-hsinyi@chromium.org>
References: <20210429042834.1127456-1-hsinyi@chromium.org>
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
