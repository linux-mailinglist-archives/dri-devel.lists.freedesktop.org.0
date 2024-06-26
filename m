Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78875917990
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E6810E791;
	Wed, 26 Jun 2024 07:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="AAs4Yfa3";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rdDcWB8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Wed, 26 Jun 2024 04:57:20 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBF410E759
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719377840; x=1750913840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PyotQWY+vhDeX6zc3eagaZBEBtHJTWwRgB86lW0uB1w=;
 b=AAs4Yfa3zpg+/QHcZ7eEGdEVc6ukFVgCj51/WBcEZb7lmbymkOkxvOcd
 4dEpVZWM8uxhuN1ws5gSWr88ja+lrwIS2xxFFTxM9Nb0TUXQBPb7p8jWl
 e4Jg0cw9Aay+ld9VsNo5OmDAvtRgE03jkQ+Hse7pqd6nbCpmWrUOWg1SB
 J5C/TmK16cT7fHYlLNa+9qOS9xnM6WaqPe30pu9r+KwgbTgv56MZnSmN5
 fM0K4rqEiJdp8uf6SU46zRxWWMb9/o63Pp7hRtSYJndJ9AKMpMoyyZcSE
 642ZKxg+u5ZXDQR25Rn4ZiNIw9p1xTEYO9L3Hgr9uaWrlBMz7KnXZRLw8 Q==;
X-CSE-ConnectionGUID: DLYO0bOJRn2SOU8zwygVtg==
X-CSE-MsgGUID: T0XYMbzOSD+5UwkLbT618Q==
X-IronPort-AV: E=Sophos;i="6.08,265,1712613600"; d="scan'208";a="37587111"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 26 Jun 2024 06:50:08 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E05AA160B1D; Wed, 26 Jun 2024 06:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719377404; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=PyotQWY+vhDeX6zc3eagaZBEBtHJTWwRgB86lW0uB1w=;
 b=rdDcWB8lWIRAgWyjinUmEWXwvz9SmJcSwajwy05Ce7f9lnN/rqniTBbeombDvIYH6V8Gxc
 JImMfVAnEtyoI6yTyrpO9F+nh1XATBvEBC0osYqXqtcln7+4d4hygY14t31F1Xgv5bqBsQ
 0DnZQbxSIQ+BH7i9aAGupoS8zZT12FuvoWWEigRD+//j4s/rsWdLThLP6yWAg34urpcAvd
 BNoahIUjyAz9pRX7TVfnXT+dQoGpPcafV+pVXq7LPRdSkFrTn3f7rOsI9dUtC2k2OBZwhk
 /aBka9jlMkGmeyuXXUzGYBJOoehgghp+OzfwVY+6urL2GwnUjv79D834IY9vYA==
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: simple: Add AUO G104STN01 panel
Date: Wed, 26 Jun 2024 06:36:27 +0200
Message-ID: <20240626044727.2330191-1-paul.gerber@ew.tq-group.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 26 Jun 2024 07:22:57 +0000
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
---

Tested on TQ MBa8MPxL with TQMa8MPxL.

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5067f5c0a272..8d75284845db 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -64,6 +64,8 @@ properties:
         # AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
       - auo,g104sn02
         # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
+      - auo,g104stn01
+        # AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
       - auo,g121ean01
         # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
       - auo,g156xtn01
-- 
2.44.1

