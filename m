Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDF3329F00
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 13:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0F46E938;
	Tue,  2 Mar 2021 12:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FE16E933
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 12:45:16 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id e2so16562041ljo.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 04:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsAU40DSj2V8WyiPA2FnCGE9liTgJLKy+L+ScTeuyXY=;
 b=PPIYu9Codq6bxO4eijFwZSN7sqEF6h57TWa30qKtAgsbaS4NOYln26tnSZmm5A06uQ
 HSlmfOCo200P2iltZ9IwZ3LVzotYpr96QK26ldWtZ1io+7hsCOxGGza2jnPCIW7gQhes
 E2qgUVYUSoZ9Xowjg+T/1rNu+7Ar7PGHkaY0TNLM9j0VPAO0OrQDDruTCl2ILmbeMcZF
 SgrOs9o/x/0fX6ImLbQCF8YBtoj3QVsoatFFqr9eVXXmfkKtG/s7zCrfJVLi6kVCRqxm
 AzhWl+4obu7lprBNtTsAlS4O3r0A2DkNlNIJrPl9HWM/qCcsqF2sx5bj8gT+vh91l8b4
 9Tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsAU40DSj2V8WyiPA2FnCGE9liTgJLKy+L+ScTeuyXY=;
 b=f66RSt3FSAi2XDVukfd/mrdvDnrgdaSSntTf6lvNB6doKnAHDuBOx37r+k6bIvEPTR
 tdCmDlgnbs84ZvwmhTby2H6Y1m12Vp+d6p+aJpPlXL857zKab3LEPQisv7J9kPiczCWJ
 cHh+AD15s+kKrDbNMTWlcHDxDOOu+WFi1JIw739Ip2XC0pb9hMeDGZ07Rc0efiCfghlF
 ChhegqESemPuVViZONcuURsw/b/Wkhwem1NRUjWiLW2+7DE3BVWh1PMzbEZe82l37y8R
 FeliUYGRiUvcZxrXCfZSn5h0yiQEn9IB6jF5tELnx2ksM1tWkjjqtwUewv8wSeUX2+tZ
 zsGw==
X-Gm-Message-State: AOAM53027qXXGPtXfZNFJNpqiciTkFPFfXLpzG3VYaNPi0UPWSuw9nmL
 6IkMMmHUq2DUQC8Jax0O/LQ=
X-Google-Smtp-Source: ABdhPJzhcU+vHPyphQdH9ezeBIdtlG/p4Ceab1j1WVSTIZLVrG5Q9r0fuGhUTYPcz3EHVcVEQbwfLg==
X-Received: by 2002:a2e:8e28:: with SMTP id r8mr12675196ljk.156.1614689115461; 
 Tue, 02 Mar 2021 04:45:15 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id m16sm2634705lfh.109.2021.03.02.04.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 04:45:15 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v13 2/2] drm/tegra: dc: Extend debug stats with total number
 of events
Date: Tue,  2 Mar 2021 15:44:45 +0300
Message-Id: <20210302124445.29444-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302124445.29444-1-digetx@gmail.com>
References: <20210302124445.29444-1-digetx@gmail.com>
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
index 7c6079984906..1399e4032701 100644
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
 
@@ -2310,6 +2315,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): frame end\n", __func__);
 		*/
+		dc->stats.frames_total++;
 		dc->stats.frames++;
 	}
 
@@ -2318,6 +2324,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		dev_dbg(dc->dev, "%s(): vertical blank\n", __func__);
 		*/
 		drm_crtc_handle_vblank(&dc->base);
+		dc->stats.vblank_total++;
 		dc->stats.vblank++;
 	}
 
@@ -2325,6 +2332,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): underflow\n", __func__);
 		*/
+		dc->stats.underflow_total++;
 		dc->stats.underflow++;
 	}
 
@@ -2332,11 +2340,13 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
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
index 0d7bdf66a1ec..ba4ed35139fb 100644
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
