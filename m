Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13E0C3DD31
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F12910E9FD;
	Thu,  6 Nov 2025 23:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h0fIbBAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8BB10E9FD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzzoA0sgvtO6Huy28YTNePP1cZ5wFE7gDr3kf/Jxy+g=;
 b=h0fIbBAydu/MM+mjjmd+hjsTLZPoNedNMMoRC1ReymnrZY+ZQTeeEj6LbUPePaqLaJrmdj
 qvQH1xIUtV9mTxmaziCn6UFBp8fRRV11P6YTr28ow/lMk7MgRrwIaFItTOFHk+AGSKKWBv
 GMibajoVHLqeHqMm5Dj6FpOWRknlbgU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568--HHhE7bkPKmiUH-wCmF0vw-1; Thu, 06 Nov 2025 18:26:41 -0500
X-MC-Unique: -HHhE7bkPKmiUH-wCmF0vw-1
X-Mimecast-MFC-AGG-ID: -HHhE7bkPKmiUH-wCmF0vw_1762471601
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8a4c63182so5704861cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471601; x=1763076401;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fzzoA0sgvtO6Huy28YTNePP1cZ5wFE7gDr3kf/Jxy+g=;
 b=g2FqoA1C7WUNmgDn0sENcABwsENM/cUIPpOwwcBFBoUkzsjTNcIetfRLOTcekRfVqt
 TyCBO5T16xR9IA9OWr58z+KVONX1tKkG5FjwGehaoSEgFgfxFACGddOg6j9ZjMr87Koc
 0RlCAgJTmqTL+rRV+cSek3mjkph3yLsY62weBWKCZbywlrOz/4w0cS9x0ZAbm+4WOhoD
 i8ySL43OQCGET5eS0rxxVJuJOh4jR0rvTa1j34aXwc9zz9XqCi4qqiASAD2p5MGKnZQb
 CkkjFw0/jPtkmKkNMn15g1dsqPIdrXiWQCErmXZ6+C9lF5mogn0NdS3psXb7HzxMfVct
 F/ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdoY1CpVjnAD3V46+y1VjzMyQRMj7Ttsgb40ExKElfjLP7FvZhJykoB6MzPq17JP2RZk/4RMvqhcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA0yr1wcd2V5MTua3B1e50LUholCH574Rz3wCDhHsaJga9XAjo
 8x65zZ10bozTRcpUjXZsZTi85G2QJo1xl0wozNXy/p3l3n4yhfeZqzVEahtaBJ0ROsiu7z6+QKE
 5m9J3VBdL9dvOReft0JsY1YqQYpj6OPXj90DEUTfj8eTHflLSTtUtlaSpn3KQG9PudetNaQ==
X-Gm-Gg: ASbGncu9Zt2uJQOmtOY58tRr/gARKC2UxEcvZjyQZcQmmg+nQ4EEKBeCju8H6H3ZgdX
 YscrSERAIJ3ah8tE5BRitlP216p8SnqfRaPDQwPwot7VDzKB+2nsK146BHKywJMu5aZ6gaPKkC3
 8zn08w7m/McnwltvZ+hIP+fawy038DU7t2O43kvB9d6hS0s1HX1EX3zgjcMoWzhYbZ0HID09VuA
 qJonZs8R6kbnNClJ4MedocSogYF3F0L+BDPKILX8HOwA1zhThJt1c9mr73ZbhC6gm4oXC0YbomU
 hwcg9zr7IyRF7WenX6IpJSnRXWhTbxmNHPs0FD2YPippTLE3wN1dASVhuT8G1lxPiGpwOGFqIY9
 L/0Cxfr96i0SatiDAYfQQu1MjQRtgWJIieyUzj0ZDvw==
X-Received: by 2002:ac8:5e0b:0:b0:4ec:f8c7:228e with SMTP id
 d75a77b69052e-4ed94965d2cmr14670381cf.20.1762471600796; 
 Thu, 06 Nov 2025 15:26:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBSY6ZC3uinTD+3Ty3ImTkmn67RZYU0qwyag+7rpP+kdNpFJpdcKxM23Wr/jw9wVVKFtdCLA==
X-Received: by 2002:ac8:5e0b:0:b0:4ec:f8c7:228e with SMTP id
 d75a77b69052e-4ed94965d2cmr14670131cf.20.1762471600494; 
 Thu, 06 Nov 2025 15:26:40 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:26:39 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:48 -0500
Subject: [PATCH v2 RESEND 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-2-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=kakNurIzgUJYDq3FSiWnwOldSD2Dsz8eAB7sKp0pFFg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RakLvNXLXp4dKGpoLGdvd/lA+kBXBxPQrUnzGDJn
 31ZbNPtjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYysYrhr9DBktS9ynMn++tf
 k5w20/RkIMMWe4YlR42kDylzcPtNSWX4n7cyZM6jjhVMr1oMFc86Lt7ee3N2m+epE1GRUfUfZDP
 2swIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qLx50UhbjrvMFSTcUFdBq1R6E2KU3qMqvbo5IymJRH8_1762471601
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

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.51.0

