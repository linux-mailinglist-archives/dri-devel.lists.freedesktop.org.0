Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB03976C66
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E125110EBB3;
	Thu, 12 Sep 2024 14:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Hdd+iPNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EF210EBB2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:44:44 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-718e11e4186so954966b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726152284; x=1726757084;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENHzAa0J3LYULKcETMFEp8gDeg2pft3wUA50kLkpahc=;
 b=Hdd+iPNmDtnVmhPr7AYA1BdwmfEtVc7+GmVZ5IJlcmXJcrICXadbHQL1OV9djkYa+0
 kL1ousBdQz9F6IVlNIOclSJCA3RevTJC0OVPeQYWLk0qqNhpoYrCgqGNM41DRNR4v4Rv
 vbvJ69Lxh7GRpc6ZBBQnUDgoJ4k9WSjiMVQtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726152284; x=1726757084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ENHzAa0J3LYULKcETMFEp8gDeg2pft3wUA50kLkpahc=;
 b=eADGQnKf2jDoYsAxANZKpoA/Aj7kAx++5P5jfRTjmOwvlqMZ9ldNx/3eaeIFCBezlh
 SWoU7Mj8OYrQoS6MrocsIdEzU0hE0r8KX91mYqKpKYhOtRVq+BXt1B1CZ1HZjn02Oyqn
 ZmqO41UwIs5ctKhvoqasD7BoIhVwUV/e3f9+fku+ErSuVR2D4wOKEELF49jphOWa9x7Y
 yKhsiZlyRuMNLCaTlUX43B0lVqfjggZiT/NsvLH2XwkeYngf6TodF1lmGYasGWvWot/b
 49cmuhuuSRwk+poa5wMJ5fKf/+uaVFPIfjwgdgbIVQ8M+hZDqNSvJzASR/nc3wwrVhyg
 C3qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeJKpcrcyinSDXz19swnLxGXgGbhF/z7DoZyV/qykzp0m+qKvT2J84+dObINGVa9v7+1r77i6QfjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy28hSGXlx9FbS2Z8KJHo3ySzz/NtV/Zzs2QEnv2uw1WA3Tv+EK
 TvMAzKSXcQVnOVd9q7T++xlKZEyiVBHhqY64LPCKvyTnLv7sCVCoekynXI7U8A==
X-Google-Smtp-Source: AGHT+IGmocmHhOdJqPoiASVWIbhrUvuzbyP0frIxr5SqJiWxgxpjRkvqPtBS2tOxjv28s+maVvPRJA==
X-Received: by 2002:a05:6a00:1790:b0:706:a931:20da with SMTP id
 d2e1a72fcca58-719260654f6mr5526880b3a.3.1726152283924; 
 Thu, 12 Sep 2024 07:44:43 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:8638:897f:b6cd:8c44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db1fdee186sm1826269a12.85.2024.09.12.07.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 07:44:43 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Pin-yen Lin <treapking@chromium.org>,
 Fabien Parent <fparent@baylibre.com>, Jitao shi <jitao.shi@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] arm64: dts: mt8183: Add port node to dpi node
Date: Thu, 12 Sep 2024 22:43:59 +0800
Message-ID: <20240912144430.3161717-3-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
In-Reply-To: <20240912144430.3161717-1-treapking@chromium.org>
References: <20240912144430.3161717-1-treapking@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the port node to fix the binding schema check.

Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409110843.Hm5W9upr-lkp@intel.com/

---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 266441e999f2..0a6578aacf82 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1845,6 +1845,10 @@ dpi0: dpi@14015000 {
 				 <&mmsys CLK_MM_DPI_MM>,
 				 <&apmixedsys CLK_APMIXED_TVDPLL>;
 			clock-names = "pixel", "engine", "pll";
+
+			port {
+				dpi_out: endpoint { };
+			};
 		};
 
 		mutex: mutex@14016000 {
-- 
2.46.0.662.g92d0881bb0-goog

