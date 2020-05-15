Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A71D42EA
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 03:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7F56EBC6;
	Fri, 15 May 2020 01:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4918B6E3D2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:24:48 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3978C9D3;
 Fri, 15 May 2020 03:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589505886;
 bh=68H8688PuZ554YOJAt+oXC0cWRE0EAHzcF1P96dMHlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QfokATFfjsutpu8tNVdg3Cw23EAZHVjnMOzDkoDMsBxXZrja4+mn+7lEQBIutGqJV
 MHkabzfJLGxTAhB+UTmedCj4f8AoSM8cedeDOzj7fDnTHDQmxPjAnFa8SE8XEMKbA5
 XJfV72dHVMq0uZZMRGb6ep8MFmlE/pSooeVmyik8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] dt-bindings: media: renesas,
 fcp: Add resets and iommus properties
Date: Fri, 15 May 2020 04:24:27 +0300
Message-Id: <20200515012432.31326-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The resets and iommus properties are used in DT sources in the kernel
tree. Document them, and make resets mandatory. The iommus property is
optional as not all platforms wire the FCP to a functional IOMMU.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index 041c05467b46..9f830bd95071 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -31,14 +31,21 @@ properties:
   clocks:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - clocks
   - power-domains
+  - resets
 
 additionalProperties: false
 
@@ -53,5 +60,7 @@ examples:
         reg = <0xfea2f000 0x200>;
         clocks = <&cpg CPG_MOD 602>;
         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+        resets = <&cpg 602>;
+        iommus = <&ipmmu_vi0 9>;
     };
 ...
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
