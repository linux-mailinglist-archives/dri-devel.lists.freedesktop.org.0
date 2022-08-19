Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4C59A8D7
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 00:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ACB10EBE2;
	Fri, 19 Aug 2022 22:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AF310E54E;
 Fri, 19 Aug 2022 22:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660949638; x=1692485638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k/pvbPW3wwaX2jC/RyOHzw1x6ZqHDyTDvKOqsKADVME=;
 b=Bp2NThzlggVz87PyLqe0I5Etf+EpKM6rlXFgLFdp3niADEF2qReZ0YrL
 Y8TmJL05M8doPYYW2Us77PS0Ht5MOo/uULSZESX2eoZejkwKXgHYLOltG
 LexqQZocgXqQDNzQYa/aTI4qwfnzj/l7+x6CgWb/SMmQWssWSFjGIP8DE
 6PnJpvOH0s3gIT1DI6uDCRBw5iuHX/hwccMPvunkLmOtbRs1jRJepnHKr
 eFRS39y8Wi7y3tVJAKV43PTLC+TipDkV6w8aeW1J3DQjQZtNNwiDTIYP/
 qD1xxXjPxuLMuIVzbb1kNMRkJ8SDNMJVM+MgL9iaKdWFodVHpPu0E76kA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="273513236"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="273513236"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 15:53:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="936378490"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 15:53:58 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 06/15] mei: pxp: support matching with a gfx discrete card
Date: Fri, 19 Aug 2022 15:53:26 -0700
Message-Id: <20220819225335.3947346-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

