Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F4C3DD4C
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FD810EA0B;
	Thu,  6 Nov 2025 23:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RIrWru6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C63810EA0B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=;
 b=RIrWru6kywONlL9XBLNuAw0K1Bah3O5BudCPQlV4bCxBQYY4goqk7KJ8Pcih4MHEO6iCth
 i7yjOoRpZS3+/IGV06RKFBktdcCaAhglSsL0zvwycGzlcuIJjcNgVYRKCScxAUbODZC191
 WxyBi9E6EVk+np6wYYooklZyf4FOF2c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-8Q15dTK3NZqhQ7UsqY0uOg-1; Thu, 06 Nov 2025 18:27:07 -0500
X-MC-Unique: 8Q15dTK3NZqhQ7UsqY0uOg-1
X-Mimecast-MFC-AGG-ID: 8Q15dTK3NZqhQ7UsqY0uOg_1762471626
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e892acc0b3so5268381cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471626; x=1763076426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=;
 b=N+Cbeo+OYAYr2wzJzB1ZJCZyz/cgSXwIjhi6CfF3M63nO3QXpw5kenDLcsWrs4AJ6l
 I1mhGsBqj1vybKRRtkudxPpu3b3lDXWYimSzExmGn0bnzMP3LRizr7eh7PBgYealPxxR
 c9uOF8fk/I7xhKtPMInAXroKpmnq3xFZGcKSIqIiynMlteWB32nZFAtB+j7qOblH3WHo
 gPzRRVjTE9xSnbWW7Pwq1kb3A423T0GnDLPWbZlEK5uN019JnYnBRbl6ckknvLshztPT
 e1PAAElNvD49R/4P8a0Hcts3Kg4x6Dnfm9PhsPcJFUooYaqJDw5wjUO6DyjudsMHys9J
 qwtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDp/me+0Vgm4p3RkHdQ8P6hiKYdSw0hY5OnD06ndo2J1yPIaPnDBB0qBcu6dq1k3zDuWY6fL7MoQA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymBgmemBtk6gJNEjv/khNGNl2f7XlfdEN0YkH/pCIcur7Qk9qh
 a+FzJZTdxA4LEBxbwnXVod1hianRm/2e9/y6Nc0nsJ8pwO+RwHW5CeeG+n2M52MYuTuMIVd92ns
 2x16FVW9N52NnZ5L0TdwphzcKGQXlLBBm3bi8QGLMOTLY5ubLY8TqBBXVjueEDED1HfcsIw==
X-Gm-Gg: ASbGnctQYcdocMtuwYJ9E4/hhIYdAjtuoh76XxvyeSrs9DUx/LNeUwpKkqmwXMcRRqT
 pa2iVoDBcR0L/pupJqdQ6Wv7c9JP9f6qHepVs0NtZxtlLA5fOkkdIBORhVQ6E6UkgXEa5Lw5Tua
 fjUqaLHZnxvzZi8FdtaaM0TpExXXmzRORie92WaGv9mSUYPZ/xaOQY8mHlfbGe1VPaEfosOI36/
 F2oiCi8HIxlZriTRnhDKh30sncWRv+99dEaf2xyuAVheUC1nGzjuXdpPL6bYX3fkSsZpRpcQuke
 hfMtLZK3AH9yEjEYWxdIhalez5JcrLfqQIEprFjc4go4ESVaJbjgEOSpSfMZWnzUOpoEcvIjz9K
 mAeJj6ga80QCftbMtUeasukgKxnEhDLzoa2PAyLI83w==
X-Received: by 2002:ad4:5e8c:0:b0:87c:fbf:108a with SMTP id
 6a1803df08f44-88167afbb01mr19476736d6.10.1762471626527; 
 Thu, 06 Nov 2025 15:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAKV5Z7B7KevWNhDrMQhaFFBe79yFfIMSER6+SS9G7GG9yGBlDbjxgm5e37vbwHrzd8zri1w==
X-Received: by 2002:ad4:5e8c:0:b0:87c:fbf:108a with SMTP id
 6a1803df08f44-88167afbb01mr19476536d6.10.1762471626163; 
 Thu, 06 Nov 2025 15:27:06 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:27:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:53 -0500
Subject: [PATCH v2 RESEND 7/9] phy: rockchip: phy-rockchip-inno-hdmi:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-7-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=B3cRh6p3LgoB2SM5XPxaNOqjVUw8A6Swuk8MPDVITuM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59Raa525zMnJS/r9qwT+FG4FH7p/2ecBceX+1fMSF5
 feuhew/3VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEAv8xMjSUXVyxZ7uixJnX
 YgUTf0if+PYmbwaXxuFNHqoeua3y8fkM/2M+/Ld89F1Hxzyt1aThga0O43ShJKVrPI/Xnd1dkHL
 +EAMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p3G2yubGTzCEQXVoOyhx-BDQtLHm2ZjWGd-atVgd6oM_1762471626
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 30 ++++++++++++++-------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 8dcc2bb777b5455d21a10f06c5ad842b2ddbc834..1483907413faa5ce1dc8614db05e6e929410404d 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -749,22 +749,23 @@ unsigned long inno_hdmi_phy_rk3228_clk_recalc_rate(struct clk_hw *hw,
 	return vco;
 }
 
-static long inno_hdmi_phy_rk3228_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3228_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate && !cfg->fracdiv)
+		if (cfg->pixclock == req->rate && !cfg->fracdiv)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
@@ -835,7 +836,7 @@ static const struct clk_ops inno_hdmi_phy_rk3228_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3228_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3228_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3228_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3228_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3228_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3228_clk_set_rate,
 };
 
@@ -906,22 +907,23 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 	return inno->pixclock;
 }
 
-static long inno_hdmi_phy_rk3328_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3328_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate)
+		if (cfg->pixclock == req->rate)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
@@ -989,7 +991,7 @@ static const struct clk_ops inno_hdmi_phy_rk3328_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3328_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3328_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3328_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3328_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3328_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3328_clk_set_rate,
 };
 

-- 
2.51.0

