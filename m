Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0363C4654
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 11:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6760B89856;
	Mon, 12 Jul 2021 09:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C7289856
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 09:47:03 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id t9so17669809pgn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ka9MgwmW5QsHbE3oC7CaA6AD1jb4S5a4fPDgxsbWrLU=;
 b=WHVTpBseJgLMnGqaa+1RqcoNPqyIUkmougt9lWoVSXdb1vDOPYvj9eqascjIEXhUfU
 qC8HnRP3UKSYTTDn1FHNirspfOX/GrqUkMSGuMwPyC7KDJ2ek5pBGzf+qFGiT3Idzqba
 i7rp4XxeTPaLwnY1OxOE89C796t1Nwq7aSat8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ka9MgwmW5QsHbE3oC7CaA6AD1jb4S5a4fPDgxsbWrLU=;
 b=iMZ0/DKVyc4iw9kfjvfy3/HaQsBYji5zMfy4gHV5fPmZHJ5P5US4OpFH7/XpsGAeO9
 pjCvHiuEQFxutYINpLbpv676yG/Do+Euw6qDXpQQ+Wk0eU+i4Sh4CcmzVI367crLXTNV
 H6uJPyHFMTpo/+lr72mS090Pwcqi/7CR03qoZ16mNjLHA6EruIW29uFQY0o2Zeen3cGo
 Cb+NxCbmnwQSy+dN6rAxVF/Djf3g6H/gAp85aWwX/vMXz5NENDc1F5LrYU3tQi88MhZB
 WwSKz725h5Jd7ncnP6V1Mc47Uk9fcLZujfht07LinlGxFUSldTGjr+YV8ej1BJOLESRg
 y7MQ==
X-Gm-Message-State: AOAM532BTczqeMDtyaLy7+KrA0FtocDpWqMEP/nF7yGgi2q7n9RiiE/H
 FVpU95YzZwCKGY+3oH9snqk6qw==
X-Google-Smtp-Source: ABdhPJzu+zuvDdKs4oR5z4/fiaSC07w3RNE3ZQ7jClgmYHqoH/5VyU8uRrV+hg7Lxiz2yMeqaJj2+g==
X-Received: by 2002:a05:6a00:98b:b029:32a:d9a5:2540 with SMTP id
 u11-20020a056a00098bb029032ad9a52540mr8333872pfg.66.1626083222436; 
 Mon, 12 Jul 2021 02:47:02 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6e22:4686:299f:5f2a])
 by smtp.gmail.com with ESMTPSA id 10sm14631650pjc.41.2021.07.12.02.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 02:47:02 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: mtk-dpi: Set out_fmt from config if not the
 last bridge
Date: Mon, 12 Jul 2021 17:46:57 +0800
Message-Id: <20210712094657.1159299-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

atomic_get_output_bus_fmts() is only called when the bridge is the last
element in the bridge chain.

If mtk-dpi is not the last bridge, the format of output_bus_cfg is
MEDIA_BUS_FMT_FIXED, and mtk_dpi_dual_edge() will fail to write correct
value to regs.

Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bced555648b01..25c565f9179cc 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -610,6 +610,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 
 	out_bus_format = bridge_state->output_bus_cfg.format;
 
+	if (out_bus_format == MEDIA_BUS_FMT_FIXED)
+		if (dpi->conf->num_output_fmts)
+			out_bus_format = dpi->conf->output_fmts[0];
+
 	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
 		bridge_state->input_bus_cfg.format,
 		bridge_state->output_bus_cfg.format);
-- 
2.32.0.93.g670b81a890-goog

