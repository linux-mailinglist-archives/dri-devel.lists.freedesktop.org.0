Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EA091AB06
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F31D10E16F;
	Thu, 27 Jun 2024 15:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="ZvqLWKEg";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="sZI7qpkL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2546A10EA58
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719477918; x=1751013918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ljUA2/gwMkyYm97U6fvrYnZuvtjIfdPE/kHZr8D3krA=;
 b=ZvqLWKEgvdpGVyQh1g8LT2CUIGF0wPJbOV9+DQjGNTSWKbH3rpnBQeYq
 vppcRJFQY6y8GrG0J570+H4J6+XXzw81F065lt+s1GiwWokmPjOtVDoCR
 HEU0L4zTePck8HgdnF0tMMzJbJG342zhRY96rB5XKxEXIV2l1P5wptdDF
 DUEO+S6IQWzHxpNW4DreGqULNFN7uJIQUToqidr1h5wHeYS8Dit2xq21t
 B/FTRGJoLz6toeiUVcGOBrk+n8YWAGTb8ZRtTfbPaXYg2EZi95LP7O4nI
 fKNy0j0bWj4WdXzy1TSqYTO/yaG2vYISwRpHnCjPv6t2miUFPHQ2xRx08 g==;
X-CSE-ConnectionGUID: BadCDbIdSp+kDxdWH3aw+w==
X-CSE-MsgGUID: Ex8iheCxRImuvdAiDJbXTA==
X-IronPort-AV: E=Sophos;i="6.08,269,1712613600"; d="scan'208";a="37617945"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 27 Jun 2024 10:45:17 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 04DD9170D1D; Thu, 27 Jun 2024 10:45:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719477913; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ljUA2/gwMkyYm97U6fvrYnZuvtjIfdPE/kHZr8D3krA=;
 b=sZI7qpkLF65LHz0SloJPVbCBOnLq71PLIwLJFxHIU4m03tfWsbfXbpX/w80oBWz3HEHcD7
 h1/u6qZydSXZoj6zQ4343rS9O1c6MTroYqQ9+CS7x+8wWwSkR1j5sQwDi4TdWZOZ26YdiE
 onJP6FMnMCcNNVG8sMW6C6vv97SN3qWIS68AP0/HKMxiUhk/M+vLTg9s68QAxaeGWIlvUp
 CQ/T2GCXeo7aihd3VVJvPjpMQIS8R2rOV7XwaipdOXtzGQpKsmRtqylSbUxD+1wLtfJO3r
 rR+s7vGAOdiisZJ1lC5+1p9RVmKuoxMveBRMB/9qChj+LFihKM0NrYWFxZ1p2A==
From: Paul Gerber <paul.gerber@ew.tq-group.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Paul Gerber <paul.gerber@ew.tq-group.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add AUO G104STN01 panel
Date: Thu, 27 Jun 2024 10:44:43 +0200
Message-ID: <20240627084446.3197196-2-paul.gerber@ew.tq-group.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240627084446.3197196-1-paul.gerber@ew.tq-group.com>
References: <20240627084446.3197196-1-paul.gerber@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Thu, 27 Jun 2024 15:21:11 +0000
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

Add AUO G104STN01 10.4" LCD-TFT LVDS panel compatible string.

Signed-off-by: Paul Gerber <paul.gerber@ew.tq-group.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Tested on TQ TQMa8MPxL on MBa8MPxL.

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5067f5c0a272..a6eeb17040fc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -63,6 +63,8 @@ properties:
       - auo,g101evn010
         # AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
       - auo,g104sn02
+        # AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
+      - auo,g104stn01
         # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
       - auo,g121ean01
         # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
-- 
2.44.1

