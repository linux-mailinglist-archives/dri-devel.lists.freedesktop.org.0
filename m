Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8002A197510
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA166E0D3;
	Mon, 30 Mar 2020 07:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C581B89F24
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:56 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n17so16301206lji.8
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vPqDxoQDIqKqbTClKBTFY/GuSR/u7mIa4tRLiNa4khw=;
 b=b2Wk9D3nd02S1yBEw9VfNDHynpLIG1M19fnbYk4/jKvJE6gnNPd6fx/N9rmAc3h1WJ
 0W4cIvLJs4zAoKqlmKnVdTm/7JOiI2jcLsTRUwkogWpygEHuBr7tnXXjJKfMFhu8jCzi
 YNL7hvXCo/KE3R0Er5Z7L0GQKBMAtnPchxE9PvlT2PvaEMODvg/pRIs15ZIS8BfaXRGD
 7qCFNCiqYt3gQNpoHKhM8w1hg292Gntwo2n6q4Cw4K3lczlaaHnH9gTmwB2oxgsIKVAj
 voa3vghwgz+YfoFB1PGPeHCDGheL2yfhAk0ebY3wbFhZODm3AdVX9swEnK1snhMnnzA5
 G39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPqDxoQDIqKqbTClKBTFY/GuSR/u7mIa4tRLiNa4khw=;
 b=JpxaSHsNhD6alhQnBfth27VoBIkIsXJCIKnAMA2L3Gi0BQ1DwxEDJEkZWbPXi0eJEg
 9ROl6brTxXm38dgA/TLvP82P+RqI8OWM8sAwQYQwRXjayY4VcveY0Glgq5bR396//Go7
 in7jj+ZW2QWaIkHVlkWfCe/S3Y7fAUXfSP1gWH6JK3sPRLWSPRj04oHL3K5NOE3ROskk
 4QyqhlWe6kxDK91W6Lv+wPUB41jluFiTujjpsyRZ7FWQtfh+z9YRy9McZrdc/OFi6UA8
 7XcrHpuZ7X4hv2ESl8C6xi/W24urSl0MuhkxglMAey1zvnJCuvLLUS+7M00iU4fo6k7d
 qUJA==
X-Gm-Message-State: AGi0PuYwBwvCf4KDBGWBlCNeUp7hxen6R/VpkyzcQRsZRZUUFXOkQI9M
 IWlaIQr+N9EsMKmXI7EsX54=
X-Google-Smtp-Source: APiQypJKpYIkMoYh3zusIktDsInbffTBT2Ewun8AAXofUfmOfattVIpgibKPpUp/ustF4Zz22EcaHQ==
X-Received: by 2002:a2e:740e:: with SMTP id p14mr5716504ljc.290.1585530595270; 
 Sun, 29 Mar 2020 18:09:55 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 20/22] drm/tegra: dc: Extend debug stats with total number
 of events
Date: Mon, 30 Mar 2020 04:09:02 +0300
Message-Id: <20200330010904.27643-21-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's useful to know the total number of underflow events and currently
the debug stats are getting reset each time CRTC is being disabled. Let's
account the overall number of events that doesn't get reset.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 10 ++++++++++
 drivers/gpu/drm/tegra/dc.h |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 564af302a965..7112f80ff9e8 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1616,6 +1616,11 @@ static int tegra_dc_show_stats(struct seq_file *s, void *data)
 	seq_printf(s, "underflow: %lu\n", dc->stats.underflow);
 	seq_printf(s, "overflow: %lu\n", dc->stats.overflow);
 
+	seq_printf(s, "frames total: %lu\n", dc->stats.frames_total);
+	seq_printf(s, "vblank total: %lu\n", dc->stats.vblank_total);
+	seq_printf(s, "underflow total: %lu\n", dc->stats.underflow_total);
+	seq_printf(s, "overflow total: %lu\n", dc->stats.overflow_total);
+
 	return 0;
 }
 
@@ -2187,6 +2192,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): frame end\n", __func__);
 		*/
+		dc->stats.frames_total++;
 		dc->stats.frames++;
 	}
 
@@ -2195,6 +2201,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		dev_dbg(dc->dev, "%s(): vertical blank\n", __func__);
 		*/
 		drm_crtc_handle_vblank(&dc->base);
+		dc->stats.vblank_total++;
 		dc->stats.vblank++;
 	}
 
@@ -2202,6 +2209,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): underflow\n", __func__);
 		*/
+		dc->stats.underflow_total++;
 		dc->stats.underflow++;
 	}
 
@@ -2209,11 +2217,13 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): overflow\n", __func__);
 		*/
+		dc->stats.overflow_total++;
 		dc->stats.overflow++;
 	}
 
 	if (status & HEAD_UF_INT) {
 		dev_dbg_ratelimited(dc->dev, "%s(): head underflow\n", __func__);
+		dc->stats.underflow_total++;
 		dc->stats.underflow++;
 	}
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 3a0ff57c5169..3eb4eddc2288 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -41,6 +41,11 @@ struct tegra_dc_stats {
 	unsigned long vblank;
 	unsigned long underflow;
 	unsigned long overflow;
+
+	unsigned long frames_total;
+	unsigned long vblank_total;
+	unsigned long underflow_total;
+	unsigned long overflow_total;
 };
 
 struct tegra_windowgroup_soc {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
