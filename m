Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84ABB5372F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291D810E3AF;
	Thu, 11 Sep 2025 15:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="W/8Q8TfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8156B10E3AF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757603687; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fN1oUjrQCtFrarLOSqPeTAZ/qjlPA1iQBPsVZbcnUCqHoCsB2EdvpXJXjPzPyBvMaYVKAkO1B1fbjK9hxa0ADRTBHkDbucsqhAGUg8nEkj6fCc7goDzq/I+vEXbML4AWtW4O8Lwy04Jk3HlGxmSVAugYrGjouy6kM9U8xlG/QGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757603687;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vT3zc1P7AscQ3qHt0AONayuX979LBsagO3ReeDrvc8E=; 
 b=lwu4fk9jAjv8xW9gu/KJ8VPUZvFT9wo547buNeskkF58nqNOr5asRRSxZBfTMexRMx8L2ya93Wff1m8dDKxDdket16UiTri2RTivj4g5QcPe5uH42vDAR+qa9PY6a6yoBDJhI/q4pZUCM4tMb+pSGGqiMY40/V4naKG+NIqxZtI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603687; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vT3zc1P7AscQ3qHt0AONayuX979LBsagO3ReeDrvc8E=;
 b=W/8Q8TfPU9/6++HGf4rco1kTzpSzs3h5uRssn93jKUahoQlvfobdcE6OlWl/DQZw
 +gRZ4uKC4dRxMkrilsKjVwILidN22UsV2JUdbb1Y+nlmw5hTroUK7K4nN2PctgzEWUW
 SyxRxWIDGPvPVfmx37H3ZbYE/KS0YlrLA/6riH9c=
Received: by mx.zohomail.com with SMTPS id 1757603686217696.2957018828596;
 Thu, 11 Sep 2025 08:14:46 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com,
 heiko@sntech.de, houlong.wei@mediatek.com, jeesw@melfas.com,
 kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 10/12] arm64: dts: mediatek: mt8173-elm: Drop unused bank
 supply
Date: Thu, 11 Sep 2025 12:09:59 -0300
Message-ID: <20250911151001.108744-11-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The mediatek,mt8173-thermal device tree binding schema doesn't allow
regulator supplies like the ones defined in mt8173-elm.dtsi. Drop these as
the associated driver doesn't implement them either.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index f52a9906f6a65..eb4f6ba555465 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1149,11 +1149,6 @@ &ssusb {
 	status = "okay";
 };
 
-&thermal {
-	bank0-supply = <&mt6397_vpca15_reg>;
-	bank1-supply = <&da9211_vcpu_reg>;
-};
-
 &uart0 {
 	status = "okay";
 };
-- 
2.50.1

