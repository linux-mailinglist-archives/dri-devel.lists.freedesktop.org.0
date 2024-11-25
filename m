Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C599D9341
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C7E10E7DA;
	Tue, 26 Nov 2024 08:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="EwcZSLE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7999E10E6B6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:37:38 +0000 (UTC)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
 by cmsmtp with ESMTPS
 id Fam8tQO30umtXFc5itSpzK; Mon, 25 Nov 2024 16:37:38 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id Fc5ft1yge5BVrFc5htVCWH; Mon, 25 Nov 2024 16:37:37 +0000
X-Authority-Analysis: v=2.4 cv=Qv9Y30yd c=1 sm=1 tr=0 ts=6744a7d1
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=jHB5UwbQy1EK6tLgU6AA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZkaQrEJQKXqjJUPUIzJYYL/fozoFlM4O9eaEZj14tUU=; b=EwcZSLE5Y7T94mFQ+8wbjatkn5
 pP4PisXppncniVSlpyNhFVZ4SR70T9cZFSy+M+nBUXyOvhl7p6H2GPNI/ROkJRg/Qsv3j1DSipVRN
 O7ChBvYyTop5neO+hDDI90+OMYEgFMZQx6alJR+bo2oyLAqn3LZCxg6zQeZIZ8DmFXADmwpFLZ2+Z
 wIAfOdtxh4vcqnxBiS+KnioSWsMGDt4Jyioe/V6qIe3J1ZwDaWLdjhCmizZmQQZVk1e2PnSChBufD
 Z9Hkx7d2/fePr/lXN0/MjJ+0uUGfA/oLSr2IfGjtbX33e2TWSAKFAZMBBvJbGl2mAu/IjqOpkNWUO
 LNSYIbqw==;
Received: from [122.165.245.213] (port=38110 helo=[127.0.1.1])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tFc5Z-001iXQ-2q;
 Mon, 25 Nov 2024 22:07:29 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Mon, 25 Nov 2024 22:07:03 +0530
Subject: [PATCH 1/2] dt-bindings: gpu: add reset control property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-pvr-reset-v1-1-b437b8052948@linumiz.com>
References: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
In-Reply-To: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
To: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732552647; l=764;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=Ho9yE+w80J7VIUHdPNx6owMyuxUaKBtNAwOmDj2W8xQ=;
 b=buSZC0mE82qD1h/SzkH5xIZDHBjoFSR9kNvw2We8/zoqNTYp/mcovVjufRcXBuJG6Vp+QMov1
 jDbtSsXSmdACKwUzKF3xbkMLNPcJ5t90ukYAR67bwY0MKgjIXjcVOh+
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tFc5Z-001iXQ-2q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:38110
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 15
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLa9rIM31dPpyN6grNOn+V8gBgC4WLnUODr30FfoWGqZJ1C7oYOW7LdowvI0jDSJG3JAynOhM2mY2oGwCCwa+D/CoaZGgRvOMmG6mHHSKFdNOApauUAK
 EXvUKJ/NFWU0bAKePhB7cNcSjy9CtuTW2kf6lFHepBLnqBRvd48B+RgQqxmp19voo5Qyz9iGSNPMGdliq/3gwBIB+i+FMJoi8ThAbDfqDTqZo/93NVPO8Bju
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

GE8300 in Allwinner A133 have reset control from the ccu.
Add the resets property as optional one to control it.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087..bb607d4b1e07 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -37,6 +37,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.39.2

