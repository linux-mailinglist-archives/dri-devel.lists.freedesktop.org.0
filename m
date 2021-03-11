Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A9337A67
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 18:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FCD6EA92;
	Thu, 11 Mar 2021 17:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F066EA92
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 17:06:18 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id v9so40991752lfa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHqyaVV9xNkvF/r79ZHMYRyngwcH1Np8oMRkBFJWWS4=;
 b=n0UNIFzJl7UvpSVi8okqSi+a0qw8Q426ONaQ6UgCg5oXVBJmpclx3raIAebYj2fLpb
 i5K5SM65TApPeTTWxMfmOtVa9ByKnIiod0Z3oHDV7sQE2dn00wcTxLFOwfv2DPHV8yRi
 P/EKvTYLNnSeqGvSc+2XjKw1KYKBVMwMWD4PLq4U7hkeURvSQUvimglvgG7bLJEJF5vC
 JxYXkbsD2ZtlX3Uevfv2syC9uMzZQIJ8nULU7RQzaz2XOZT1vmmpqer4FomgbdT/QmDb
 ReprJRvphmy60GYWtAf2Xf+pRonxJohKCU/GFPGMxHCz+X/1U6XamMlJ306+qWjkgs8c
 rxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHqyaVV9xNkvF/r79ZHMYRyngwcH1Np8oMRkBFJWWS4=;
 b=YRBRWdtsFs5sxH/olcM4t3z0UsPvHjkhqpexhUhMqrcouYt2WSBuAnMM9k5fD740wf
 8Fpu5C32O3NdNIFDizpRloOfT9ciJF6XKCQG9ePPx4WLJyCehhf1/MYuYes/kEvhDZrQ
 Z4izxf3/P2ZmuhfT0t4f/FvU+zBzbA/BSKGRBofJQIvEKaUrDM663E3M4mSQnZ/8ct5a
 o1Ml/q13TQqCQsMPzItUeVk8y/1+GH9bjQ/UZGyIJxRvc/S0lSiGMb+Hy3r/4yGmU6Os
 qnh3L8GWMRelykZ0WKv+Y/P07Is5NuvuEPvLGiG+SSzwKkeg6KgIQlMHQihTTfOwC5Ba
 eVfA==
X-Gm-Message-State: AOAM532zYFYRgD84znBS0Hb1Q9yGGE63zlgI5arcU3rETE2UxK34yM5E
 JWCCqMztillm7bz9dxKLWkA=
X-Google-Smtp-Source: ABdhPJwp4zBM8qRRb3oSJtBT+UcNGKSJDJT5fRb/x0pjJ5KtFNZq3VhLvWYKp295CuBc74ao+oTU4A==
X-Received: by 2002:ac2:53a1:: with SMTP id j1mr2827639lfh.298.1615482376537; 
 Thu, 11 Mar 2021 09:06:16 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id p5sm1166009ljj.26.2021.03.11.09.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:06:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v14 2/2] drm/tegra: dc: Extend debug stats with total number
 of events
Date: Thu, 11 Mar 2021 20:06:06 +0300
Message-Id: <20210311170606.7543-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311170606.7543-1-digetx@gmail.com>
References: <20210311170606.7543-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's useful to know the total number of underflow events and currently
the debug stats are getting reset each time CRTC is being disabled. Let's
account the overall number of events that doesn't get a reset.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 10 ++++++++++
 drivers/gpu/drm/tegra/dc.h |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 49fa488cf930..ecac28e814ec 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1539,6 +1539,11 @@ static int tegra_dc_show_stats(struct seq_file *s, void *data)
 	seq_printf(s, "underflow: %lu\n", dc->stats.underflow);
 	seq_printf(s, "overflow: %lu\n", dc->stats.overflow);
 
+	seq_printf(s, "frames total: %lu\n", dc->stats.frames_total);
+	seq_printf(s, "vblank total: %lu\n", dc->stats.vblank_total);
+	seq_printf(s, "underflow total: %lu\n", dc->stats.underflow_total);
+	seq_printf(s, "overflow total: %lu\n", dc->stats.overflow_total);
+
 	return 0;
 }
 
@@ -2313,6 +2318,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): frame end\n", __func__);
 		*/
+		dc->stats.frames_total++;
 		dc->stats.frames++;
 	}
 
@@ -2321,6 +2327,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		dev_dbg(dc->dev, "%s(): vertical blank\n", __func__);
 		*/
 		drm_crtc_handle_vblank(&dc->base);
+		dc->stats.vblank_total++;
 		dc->stats.vblank++;
 	}
 
@@ -2328,6 +2335,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): underflow\n", __func__);
 		*/
+		dc->stats.underflow_total++;
 		dc->stats.underflow++;
 	}
 
@@ -2335,11 +2343,13 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
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
index 69d4cca2e58c..ad8d51a55a00 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -48,6 +48,11 @@ struct tegra_dc_stats {
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
