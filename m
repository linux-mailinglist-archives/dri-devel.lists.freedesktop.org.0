Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C816F931
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DE06E265;
	Wed, 26 Feb 2020 08:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325446E22A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 08:10:47 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id b185so1055423pfb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 00:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNDrMK3Cuph8hAawynxP4ClnMYdwocSlmGrvdp+XI7U=;
 b=TBrP0h2wisco9iwCPRUPdbzfKPQaem8N0CCbkufM0ubNMvNGPVi7J4OrKi6XaCKbH6
 hh3Y+bgMR/KAzZy3SJxpHSn/W55kTsTGse062SF7bXdc1s6lOwPqxkWqbnhYBTrOOQRL
 P5UEoGPV5IsF76w8fyduRaTE03AV7RIeG3tdyzE6dWtIWMgpvpx224lpnK6HQOTLFKGx
 8NN0VzAznR0u0zIR0NAXJZCtJ32GmXNwAp/DudApysZdxoB5XwxmgmLNpboYi0ogxMJL
 H4NuemzoK00dffBEXYJVCaGEH3TCcpoSWqSDpn+UxmqlsA7Meikom5RyLGooaap33bAj
 PsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNDrMK3Cuph8hAawynxP4ClnMYdwocSlmGrvdp+XI7U=;
 b=YpyH5YXtII5W/1MvTdbmoHHwUshcRnupdAmHd1TsTtcyYXPyWxduPDNpvZgWrAL7pk
 gPeOHpVcGvM4zxWshnMmHd/QWBwSm84dIEVS/WhE1g8llJfcXTYhSicpAOAycgafg5Hq
 kWemkwMUitf1DiMbMi21RxBmh/lNwu39YwYjrAvYZoh6prQ2vvWijnHIK/iRotGX14Yp
 74YERQIc5YCtSqkWp0XlFBwB0qNB5mq/5AubI27yO9n9L1wb0IemQESk5LdD5+jyscfl
 zw1tTBswzUJzpoFxxVpZJVPPTWSXX7JjmpohNBXPtirbGpiTuONvCKa5/EojXvjytAor
 e4tw==
X-Gm-Message-State: APjAAAUSRW4SnUjNcSLpTMbVnyPg+wHVWNN27aZsCWMnTjIh8EFjEDPK
 XnHNiKZSc/7ZJk0eQFH2Vk0=
X-Google-Smtp-Source: APXvYqx16ATSH0Ri7QydUSr5etiFpP7VXGwv2ajzCwfEDuf3Fsc6V5gruuHjTDm3C4cjgRnxu80rnQ==
X-Received: by 2002:a63:42c2:: with SMTP id p185mr2844380pga.268.1582704646751; 
 Wed, 26 Feb 2020 00:10:46 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id v7sm1679230pfn.61.2020.02.26.00.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 00:10:46 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Torsten Duwe <duwe@suse.de>, Icenowy Zheng <icenowy@aosc.io>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/6] dt-bindings: display: simple: Add NewEast
 Optoelectronics WJFH116008A compatible
Date: Wed, 26 Feb 2020 00:10:09 -0800
Message-Id: <20200226081011.1347245-5-anarsoul@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226081011.1347245-1-anarsoul@gmail.com>
References: <20200226081011.1347245-1-anarsoul@gmail.com>
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit adds compatible for NewEast Optoelectronics WJFH116008A panel
to panel-simple binding

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 8fe60ee2531c..0e5d01ac32e1 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -39,6 +39,8 @@ properties:
       - boe,nv140fhmn49
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
       - giantplus,gpm940b0
+        # NewEast Optoelectronics CO., LTD WJFH116008A eDP TFT LCD panel
+      - neweast,wjfh116008a
         # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
       - satoz,sat050at40h12r2
         # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
