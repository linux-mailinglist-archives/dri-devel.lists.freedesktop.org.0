Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882D582DA90
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A770F10E2C5;
	Mon, 15 Jan 2024 13:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D9D10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:53:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40FCvHEa112237;
 Mon, 15 Jan 2024 06:57:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1705323437;
 bh=6iByVdVvYTCVZkLYoWSBd1ifMXk011NYhGbUvfcH5hM=;
 h=From:To:CC:Subject:Date;
 b=xCGMBLjs9zHNbrIUnG4ZN/d+VPZarbUZD5f8tWzRbjulXGTERhLl8kuWLOh5Yi+RZ
 gJPBGuZvA39VI6kSnAUeEnN5b0Nn2Pa3HhcYgOGbVaAfr4xknyxEV9gOWfTgYhETtc
 LxxuScoMKWNc+kYVqjW8bi54SEpLl7M87Vw4JLMk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40FCvHph019828
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Jan 2024 06:57:17 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Jan 2024 06:57:17 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Jan 2024 06:57:17 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40FCvG9W128446;
 Mon, 15 Jan 2024 06:57:16 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Add common1 register space for TI Keystone displays
Date: Mon, 15 Jan 2024 18:27:14 +0530
Message-ID: <20240115125716.560363-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: nm@ti.com, j-luthra@ti.com, vigneshr@ti.com, kristo@kernel.org,
 praneeth@ti.com, a-bhatia1@ti.com, devarsht@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add common1 register space for SoC's supporting TI Keystone displays
present in AM65x and AM62x SoCs. This is required to support use-cases
where Linux may want to use common1 region instead of common region with
the latter being controlled by another processing core.

The enumeration of common1 region in device-tree bindings seem to be a
miss as ideally bindings should enumerate all supported register spaces
as done in
Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml which
also uses TI Keystone display subsystem albeit with some more features.

Devarsh Thakkar (2):
  dt-bindings: display: ti,am65x-dss: Add support for common1 region
  arm64: dts: ti: Add common1 register space for AM62x and AM65x SoCs

 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       | 7 +++++--
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                   | 5 +++--
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi                   | 5 +++--
 3 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.34.1

