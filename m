Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49FC1636D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB03510E63D;
	Tue, 28 Oct 2025 17:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czcqHsvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D6110E63D;
 Tue, 28 Oct 2025 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761673083; x=1793209083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rj0qgordGZNB+YdPjKDmtqTEG5yrczqeTMJCDVNmgm0=;
 b=czcqHsvuBt+Cd0uR/ZTJ2AxTRMMSPqWM7JyltnWkaww25r7Iy7p8xH6m
 w2LJJAPHSkbpNsDfOpdHV/Uls82kBh1e6d4vvgvhfLN5972U9a9whs9Jx
 8UTV652d4ki/iKmBQXNzSoaV6T4oKUa2jV+qnaLKoHkF9POKlK5V5qkbC
 WoH/JYxyogM2J/nZFlBRnL/6AxxJUyMe9PyKmslpQiCpfqO53yDuJv5hO
 smgC5HDMG8wD3Ro+DQq/LWrVjetndd9PSDQTlNdaVPZLb3WWcTqbCJZFr
 3DmskT1xk5uiatgkZkAXrZyotp44vWtf4X/lw5two5Mky0WGlNEYBEodi w==;
X-CSE-ConnectionGUID: 34gN1EUdR+ew60r6H2C2eA==
X-CSE-MsgGUID: iwieSlqSQB+oFYVrvghjBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81413277"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="81413277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:38:03 -0700
X-CSE-ConnectionGUID: CNDiVW/JRC2hDk9azTLjtQ==
X-CSE-MsgGUID: jG6aT9CEQn60hVk9anqSKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185304310"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:37:56 -0700
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
Subject: [PATCH 9/9] PCI: Prevent restoring assigned resources
Date: Tue, 28 Oct 2025 19:35:51 +0200
Message-Id: <20251028173551.22578-10-ilpo.jarvinen@linux.intel.com>
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

restore_dev_resource() copies saved addresses and flags from the struct
pci_dev_resource back to the struct resource, typically, during
rollback from a failure or in preparation for a retry attempt.

If the resource is within resource tree, the resource must not be
modified as the resource tree could be corrupted. Thus, it's a bug to
call restore_dev_resource() for assigned resources (which did happen
due to logic flaws in the BAR resize rollback).

Add WARN_ON_ONCE() into restore_dev_resource() to detect such bugs
easily and return without altering the resource to prevent corruption.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 8da83b612c59..28d6ae822c0b 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/bug.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -135,6 +136,9 @@ static void restore_dev_resource(struct pci_dev_resource *dev_res)
 {
 	struct resource *res = dev_res->res;
 
+	if (WARN_ON_ONCE(res->parent))
+		return;
+
 	res->start = dev_res->start;
 	res->end = dev_res->end;
 	res->flags = dev_res->flags;
-- 
2.39.5

