Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCBBC16319
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B2110E629;
	Tue, 28 Oct 2025 17:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+xIw3Js";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32AF10E629;
 Tue, 28 Oct 2025 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761673007; x=1793209007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=di5GEvT3KUkXT7OWsKsdLxJyHADgOdeBIjyqf73f89E=;
 b=V+xIw3JsrFXFFA497gTarYkgClZBZLAfqn9EZD30cjSpxwi4OfS592v/
 2juUpZA0xQAWcOQP7ejmpySLgQjJ4K7TxulpaKL0u5lu02b4i0PyYQTyg
 f5SgOT21zma/8D+SiWmqqiC1UoLFjdfNhplrxoxhO24DkJpOTHZ7tmEGS
 +QhdtiuAHZWSggWjZKn2/pSiSbr30uMwH2nwj8E1ZHw5+SakQgJRrUBGE
 WXkatlBAAQ4wiJt3wCReeSqRkJCm+BUdy1+FMipVfarbI25K8jQmgrph0
 pC7VEEWHvmo/tqobhQo35On+8oPRoiz4hO9wlHN7nrNcoMrGveHI7hn4r g==;
X-CSE-ConnectionGUID: 7FasELd/S6imjrzf5rMrGA==
X-CSE-MsgGUID: ORRxzDL8QoqawJW2u441Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63819366"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63819366"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:36:46 -0700
X-CSE-ConnectionGUID: cIhGgUyjTVSF3DcB+zd31g==
X-CSE-MsgGUID: KKP4sCC5Tvq+pn6ETKCdlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189465498"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:36:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 3/9] PCI: Change pci_dev variable from 'bridge' to 'dev'
Date: Tue, 28 Oct 2025 19:35:45 +0200
Message-Id: <20251028173551.22578-4-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcoming fix to BAR resize will store also device BAR resource into the
saved list. Change the pci_dev variable in the loop from 'bridge' to
'dev' as the former would be misleading with non-bridges in the list.

This is in a separate change to reduce churn in the upcoming BAR resize
fix.

While it appears that the logic in the loop doing pci_setup_bridge() is
altered as 'bridge' variable is no longer updated, a bridge should
never appear more than once in the saved list so the if check can only
match to the first entry. As such, the code with two distinct pci_dev
variables better represent the intention of the check compared with the
old code where bridge variable was reused for different purpose.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index e6984bb530ae..d58f025aeaff 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -2479,12 +2479,13 @@ int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
 	}
 
 	list_for_each_entry(dev_res, &saved, list) {
+		struct pci_dev *dev = dev_res->dev;
+
 		/* Skip the bridge we just assigned resources for */
-		if (bridge == dev_res->dev)
+		if (bridge == dev)
 			continue;
 
-		bridge = dev_res->dev;
-		pci_setup_bridge(bridge->subordinate);
+		pci_setup_bridge(dev->subordinate);
 	}
 
 	free_list(&saved);
@@ -2500,19 +2501,19 @@ int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
 	/* Revert to the old configuration */
 	list_for_each_entry(dev_res, &saved, list) {
 		struct resource *res = dev_res->res;
+		struct pci_dev *dev = dev_res->dev;
 
-		bridge = dev_res->dev;
-		i = pci_resource_num(bridge, res);
+		i = pci_resource_num(dev, res);
 
 		if (res->parent) {
 			release_child_resources(res);
-			pci_release_resource(bridge, i);
+			pci_release_resource(dev, i);
 		}
 
 		restore_dev_resource(dev_res);
 
-		pci_claim_resource(bridge, i);
-		pci_setup_bridge(bridge->subordinate);
+		pci_claim_resource(dev, i);
+		pci_setup_bridge(dev->subordinate);
 	}
 	free_list(&saved);
 	up_read(&pci_bus_sem);
-- 
2.39.5

