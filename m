Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C7BFC2C4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF45810E78E;
	Wed, 22 Oct 2025 13:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vx5shfkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2543910E794;
 Wed, 22 Oct 2025 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761140065; x=1792676065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ew29Btz/2o1XyiScu8yLVhe48HekjowiHOdS1N1YhSE=;
 b=Vx5shfkU5qqRoGARG+ao/U/5+prfxjFBgOB8I4sVLooh6FXEVyl4ASUu
 +KxwcrkFE4qEGpAKHBLZWduX2ihB07MSxPfeZvXVHrU//duKVM+5Jng+w
 VXC2uNf7oywv1uWU3TDn6deR6clGikkdBiquuoehlc+bj8NDc/qK5V+de
 1wa9F6F5wDwvRxLRT3ADSNwHMek1fkxJbcA2+cPwkdApp8zIb5UckfEOR
 XMqUjGD4cyLLUoqU8xHeXJkJbkzjDeGM4zbI587JRT5Koshr5+juFgyE1
 lXmpEA/00RBtZZKMepfdKQMLdL7NJ3mXgc0JzLa6+h053dK45q/Ggs+cv Q==;
X-CSE-ConnectionGUID: O+woAmZFS1uQgfQgJMmZDg==
X-CSE-MsgGUID: ZExFTYrhQNelnEf+NjkNRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63435406"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63435406"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:34:24 -0700
X-CSE-ConnectionGUID: BFekWB/xTVGgxSjhxDFjVA==
X-CSE-MsgGUID: tVe9t5DKSi2KlJ2r004wnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="188156754"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:34:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Michael J . Ruhl" <mjruhl@habana.ai>,
 Andi Shyti <andi.shyti@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 03/11] PCI: Move pci_rebar_size_to_bytes() and export it
Date: Wed, 22 Oct 2025 16:33:23 +0300
Message-Id: <20251022133331.4357-4-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251022133331.4357-1-ilpo.jarvinen@linux.intel.com>
References: <20251022133331.4357-1-ilpo.jarvinen@linux.intel.com>
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

pci_rebar_size_to_bytes() is in drivers/pci/pci.h but would be useful
for endpoint drivers as well.

Move the function into rebar.c and export it.

In addition, convert the literal to where the number comes from
(PCI_REBAR_MIN_SIZE).

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/pci.h   |  4 ----
 drivers/pci/rebar.c | 12 ++++++++++++
 include/linux/pci.h |  1 +
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index fffd0a0cc803..939a3a84b06e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1023,10 +1023,6 @@ void pci_rebar_init(struct pci_dev *pdev);
 void pci_restore_rebar_state(struct pci_dev *pdev);
 int pci_rebar_get_current_size(struct pci_dev *pdev, int bar);
 int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size);
-static inline u64 pci_rebar_size_to_bytes(int size)
-{
-	return 1ULL << (size + 20);
-}
 
 struct device_node;
 
diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
index 342b47022a5a..1d30dbb7fe82 100644
--- a/drivers/pci/rebar.c
+++ b/drivers/pci/rebar.c
@@ -35,6 +35,18 @@ int pci_rebar_bytes_to_size(u64 bytes)
 }
 EXPORT_SYMBOL_GPL(pci_rebar_bytes_to_size);
 
+/**
+ * pci_rebar_size_to_bytes - Convert BAR Size to bytes
+ * @size: BAR Size as defined in the PCIe spec (0=1MB, 31=128TB)
+ *
+ * Return: BAR size in bytes.
+ */
+resource_size_t pci_rebar_size_to_bytes(int size)
+{
+	return 1ULL << (size + ilog2(PCI_REBAR_MIN_SIZE));
+}
+EXPORT_SYMBOL_GPL(pci_rebar_size_to_bytes);
+
 void pci_rebar_init(struct pci_dev *pdev)
 {
 	pdev->rebar_cap = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 540221d0df0b..0a50912c5ce5 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1422,6 +1422,7 @@ int pci_release_resource(struct pci_dev *dev, int resno);
 
 /* Resizable BAR related routines */
 int pci_rebar_bytes_to_size(u64 bytes);
+resource_size_t pci_rebar_size_to_bytes(int size);
 u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
 
-- 
2.39.5

