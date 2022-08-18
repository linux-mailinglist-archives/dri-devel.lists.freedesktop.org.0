Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8045990DE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8948610ED02;
	Thu, 18 Aug 2022 23:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C60D10E174;
 Thu, 18 Aug 2022 23:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660863799; x=1692399799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ispFCQCyndshp9+rIxiad1D6aEOqrIxf1SUqLG1EXsc=;
 b=SPMVkuwypB/6CDE1xQU0dImttxP1RX5k1QSHUf1GdjvBMyLTpR2EwL3L
 yPpqyGklACPZtfdAnArIEu/43JpfV6U5yyXdUZnpwAtbDza/Sxj8BI7R6
 HsmA1OGI9Q8SCtsGA/uLBC9RknezMBM9W8DHubs4ubC4X24O/+EGenIs2
 7iYZqHY4+EcW7NuoI4XU3hjpAINC+3ZdZDOElk1rWjoMsEA4bvKtMpnVI
 h72SzfXMMR8FlENbEAfOPEVO9vpt/CKToPh9xqoeKnXHvpd+91MStJhAQ
 p5zbikokwsr2Up26srnfd2Y7y3+nxnV/mfs6WZsHLptspXoCw3mcgbB8L Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293677550"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="293677550"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:19 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="641042852"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:18 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/15] mei: pxp: support matching with a gfx discrete card
Date: Thu, 18 Aug 2022 16:02:34 -0700
Message-Id: <20220818230243.3921066-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
References: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomas Winkler <tomas.winkler@intel.com>

With on-boards graphics card, both i915 and MEI
are in the same device hierarchy with the same parent,
while for discrete gfx card the MEI is its child device.
Adjust the match function for that scenario
by matching MEI parent device with i915.

V2:
 1. More detailed commit message
 2. Check for dev is not null before it is accessed.

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/misc/mei/pxp/mei_pxp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
index 17c5d201603f..afc047627800 100644
--- a/drivers/misc/mei/pxp/mei_pxp.c
+++ b/drivers/misc/mei/pxp/mei_pxp.c
@@ -159,17 +159,24 @@ static int mei_pxp_component_match(struct device *dev, int subcomponent,
 {
 	struct device *base = data;
 
+	if (!dev)
+		return 0;
+
 	if (!dev->driver || strcmp(dev->driver->name, "i915") ||
 	    subcomponent != I915_COMPONENT_PXP)
 		return 0;
 
 	base = base->parent;
-	if (!base)
+	if (!base) /* mei device */
 		return 0;
 
-	base = base->parent;
-	dev = dev->parent;
+	base = base->parent; /* pci device */
+	/* for dgfx */
+	if (base && dev == base)
+		return 1;
 
+	/* for pch */
+	dev = dev->parent;
 	return (base && dev && dev == base);
 }
 
-- 
2.37.2

