Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6207B1FCCC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033B410E2AD;
	Sun, 10 Aug 2025 22:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h2BpM/7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5C710E2AD
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754865974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uno9AFMoEyhj2DAPDWvWv4t+hFccS8StsfhUFSrHj9I=;
 b=h2BpM/7O+olWmRxkOnx3X3CF7hdquHtaKdD3Y1LGu0FC2TmqlRz/XWKNVyjMQ6m8jw+X17
 8vt5zP8DYbgozvJx+ZPsDRHFUCdU9r0Lcpra4fajYTwlO+VTqNSQkOxfDclzXyHOJE0YkK
 o+5fuEe658glbWJbPELtaXM0JZfYBcE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-PzYsoSqHMx-UasZWkl1GsA-1; Sun, 10 Aug 2025 18:46:11 -0400
X-MC-Unique: PzYsoSqHMx-UasZWkl1GsA-1
X-Mimecast-MFC-AGG-ID: PzYsoSqHMx-UasZWkl1GsA_1754865971
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b08a2b3e83so117390441cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754865970; x=1755470770;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uno9AFMoEyhj2DAPDWvWv4t+hFccS8StsfhUFSrHj9I=;
 b=iuTrwYLcxGADwn/mg8JT8nDm7Xru6nUkunsOB46JaAl6mI/6qQ8UUAymV5oii89sW4
 SBT68vyGCnBTXKS5FRA5/mHbEdNg94c0rEJ+DtozykOVKhRXOR0u/xmoqxj685kNcQQO
 Yo0mzlyzKEKybp6KHuY9Hl9w8NHIHuxQY299CAAJutZmYDyLSXdTzJeZqMFZSwOt9lH7
 DGjgd5+LR8ldsWEdr9bWjfIdciSwT6o5mjcA+DDy13ActpHtHatIkQgJ+MaomsGYNOKJ
 Ze/nlYExCbOHn48N+pXdNElTYjnchWn2xH1XLJBNbGTLtIbmvlbFnJsYoPlsi6KNuLIC
 FyhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9NWMaeKw3dnmiYiliad3nkf6wTwD2hBIfH5Wm/1ppbq9rintfW9+HIFi9SahKSbBnZOzuwzR5p/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0UBIkEq7eK+PDfYI3wvyF6DhlELJP1WhCg2Eogs5/T+wbjKP/
 93iD74kB7s+ULRrpOevQ4j8/9WfEnuqsWQEVDrnDvczC92PcFVHHRCnPqs/Fjj2lSG6ERwoGruE
 szIh3zIOz4spTc1lhbVXSHV3QT8C2Tv70YMZLwkzIGEf0jMlWONAaSQrWydn0rHXtlgxSLg==
X-Gm-Gg: ASbGnctlp5UWwUMPXm5fMPhPhF4pRTxyI2iSEKpnJqnAV6uKwt3p7YIyJ0zkK0Wxr7K
 OocYTUdk391a7uACL5cgFnyURvQPGaqDE9aBkZl+qWfBsIV0Cd8Hf8dkegr00xImBj/L2nfqMog
 thu+7axVBBHgJczXsAvlyAPXPAcWn3fAOQX00Mf855wdQGwJqVDtTtb1U/S84AN5OHt+ru4ZTER
 xdGRi/Kfv480yIreO1zI68nkwqrH0hSVt8sasbM2gv/UNzGWaM3nSw1x/acP01yoVWzmTzMVbls
 NJ7Zxo6RssR+0WZ0Ld3fXZijN+nrx4T0UEH5a/BvMo9nvMVQtzPB9BM3zN5vBJ8PmnEMX4lovKo
 SBzMpQg==
X-Received: by 2002:a05:622a:1304:b0:4b0:dedc:1176 with SMTP id
 d75a77b69052e-4b0dedc131cmr16273921cf.49.1754865970554; 
 Sun, 10 Aug 2025 15:46:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjMTodXpCZJI+V6X66BJdKc/nrAgZZBHfrq0FWIY+BTXEFv3Zqfof1whkxmm2vRWEJM7gJDQ==
X-Received: by 2002:a05:622a:1304:b0:4b0:dedc:1176 with SMTP id
 d75a77b69052e-4b0dedc131cmr16273521cf.49.1754865970110; 
 Sun, 10 Aug 2025 15:46:10 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:46:08 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:30 -0400
Subject: [PATCH v2 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1429;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=K/vzlwQbHrPXAsE0zMa+ZWELLEN88HFuPFzZqi1CGSY=;
 b=qwO8ilR67ycB5abLTz8lkcaaMraMyT4Kb+y602Glvxo2Z7+fRcKOb5tXSI4yVR6HcJvX+lHrH
 QHpiy2uGNJpBVV9WhaW5knt2IT2dHcrLcTidOIeNTq7nKUw5m+AZu3i
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GajhHbys9tvo3QTDHrY8_nqtJHv8vlXmXiBDA-BZgmc_1754865971
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
2.50.1

