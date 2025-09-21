Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1D0B8D76C
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 10:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8085910E22E;
	Sun, 21 Sep 2025 08:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="oYhd4n59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B04A10E2FF
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 08:35:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758443726; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gsMA6quhUM1kWSDHXIaOjv2msYYcL73neNuoI0yUGWd3pgSG5k1Nr3xw6/iGmhE8or6WTSU+h02o6J00Q4G1C+WD/PD+k2L/VwpJghuhigvkDjrnEzBN63GcSoSp6Rb93CxgmCx5qyJ/GsNRdaJ68+jcl7bt3X3n8ITDcl3EMug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758443726;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=efmETRccs8kLEdcb77jPapZRIKSB0g2ptOw7m7XUf8o=; 
 b=WdwDiKpYm/wKw4bQhJGHMnrN12dA8NOAOUjExt9h8TL7Iy5ptVcweo9Xp+Tqglmy2FYhbQpqoiyHZSSh50ocvSUex/l1YWXWlWphMoKraw9QAiv902vWpgTOSv/CFJHuZf8n/InvZYzGoFPS43ful4Pnsfnt148XqfyHeqyUQoc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758443726; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=efmETRccs8kLEdcb77jPapZRIKSB0g2ptOw7m7XUf8o=;
 b=oYhd4n59U9zx2jaqND+0Vfz9I9c442p7Q4nnhK4NOZkLBr8dIvFb4yn1uPv645M9
 2sYPqBY1FJk0XC6bol77PYKZ9tEIUB6ETO3755/n24t/GFR1VHAxCFtxekFo4VRFx76
 r3lCFrRUYDOeNdKm6R0f6JqayBW4lvHEAmraA8BN86y/uhgk9IP+wID6uG0ZMUBnVOi
 Xi6lqK8keXavlInpSJyEYXNBdV5MzEDYWJjueoGSbUZcJRPC7kjGTttKQ9HiAnl/SDO
 rR7OmnTRXfdIYrjWafohEzaNRFZuXw8LEhgXVisza83K5zjb1MbO+PBBsYmC45M74YR
 XGsYU8GADA==
Received: by mx.zohomail.com with SMTPS id 1758443723225109.34629747101064;
 Sun, 21 Sep 2025 01:35:23 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 1/8] dt-bindings: vendor-prefixes: add verisilicon
Date: Sun, 21 Sep 2025 16:34:39 +0800
Message-ID: <20250921083446.790374-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921083446.790374-1-uwu@icenowy.me>
References: <20250921083446.790374-1-uwu@icenowy.me>
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

VeriSilicon is a Silicon IP vendor, which is the current owner of
Vivante series video-related IPs and Hantro series video codec IPs.

Add a vendor prefix for this company.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad2..b24ab511251b6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1656,6 +1656,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics (Shanghai) Co., Ltd.
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.51.0

