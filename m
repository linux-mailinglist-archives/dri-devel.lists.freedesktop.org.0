Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4702E6F7A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A63892F1;
	Tue, 29 Dec 2020 09:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A630E899DB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 15:49:46 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id o17so24799375lfg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 07:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dCbZvyPJ9eUu2G59fWkwNpYcrEO/zvwjAoLRWdkXSE=;
 b=lxCFa2HVC3jf+yN4MDuz+0pTX6fn8ErcyMKifELPEAcor9P6+ePXhRlRpz2yamox05
 RSOkQeVuqkF+lDy8aFpV3cxjEX2bAQzGf72WJAL3z9DN951jjzAMrUmANiTL6IE6VMzh
 SBmmTOGKQgYYkrFQJgQT6jXpFoSq+m+dL9GStVrkfCyHDBnKCxaCfyc/A6wCIikCM49F
 wprwIQmGOm/q6nKYhPQJAD5C2m3WGo/ubhVvsK/FnNPp3w6R5R03c/Jb58PekVJv+deD
 9pbzn3wlk9Q8AVC1wy04rSeOz8+WYLJ9vrQ4Tkc8aDT89prFPrTcNNqEtgh9XQNFrX9j
 3VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dCbZvyPJ9eUu2G59fWkwNpYcrEO/zvwjAoLRWdkXSE=;
 b=HXamCu0590KPIcp+bNMekiNgPBjZvJnjoCMlfTEZUsP9XMizSeZZzsYRrM9KJbO2Hb
 rssgoBA3dLh1pxoV6fjFWQdScqsJ+uqCTEv7gOeOyDFBjh3Hjksil0YmE6v93HB3FeNO
 oKTuIrOhFhAqGdooaqALaQrWcixiI8lE077ngfDKuuQSd0UOCyWG/MHr09bJOLaF+KTS
 uijRxEkU/0oBDHvGdtGjqBghAnazgclL4blVdyl3aT+qR7ptNloSA0fMK4MsTO8riPRk
 +aYRa3gKN0L4BI5LWvoIaO6+k0BmIuyULyxf2+FJ0262fBLzXlbosqXf4axD+LYkEig6
 tgGA==
X-Gm-Message-State: AOAM531AMURWlhVi7HPvKhYu55QWEGcyyxAUiw2YNawSzy/Fml2tE6vD
 10yohnVkx8hOLXG6cDzi4so=
X-Google-Smtp-Source: ABdhPJzBVEvhOC7XYqv+u4u4PeXBR3zK+J5gKZL4Q5ljEmnhhYEl7ehktajcZM2/mDlsqeeNzLADyQ==
X-Received: by 2002:ac2:5333:: with SMTP id f19mr20745727lfh.344.1609170585132; 
 Mon, 28 Dec 2020 07:49:45 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm6502262ljd.25.2020.12.28.07.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 07:49:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v12 5/5] drm/tegra: dc: Extend debug stats with total number
 of events
Date: Mon, 28 Dec 2020 18:49:20 +0300
Message-Id: <20201228154920.18846-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228154920.18846-1-digetx@gmail.com>
References: <20201228154920.18846-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
Cc: linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
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
index 5c587cfd1bb2..b6676f1fe358 100644
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
