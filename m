Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A0C58B87
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BA310E8CC;
	Thu, 13 Nov 2025 16:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d502RUC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C369910E8C3;
 Thu, 13 Nov 2025 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051328; x=1794587328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=00YqMn1xgNfaa8IyKneU1YTwVRsL/5ObnW9VBzHq/ws=;
 b=d502RUC/EoG0ni9d5LYjvL0TLwWXkYQacJ7D1CwO+CWr+Y8uJa/0xn+F
 CwrlliRfR4tnfnJndCjuy8BdlV2VO7wr/BdyuMlAe7t8oF/GG+AoBusYd
 hzXcljP5sGsZfeLV9fFjx3TUNXQQddcwtnZ1+xTOZho1jm7q/xLFDChPT
 8PAyluVND05nKVhy8/a/9Ne7zDg+0rBYKX45JrjnA1MNT2hyWGqbRXC2w
 6IWm5OfHFmRt2Jew0fSJI4Edyw8/aJaJw79sBkX4VcTwDSx2FkVKMQox6
 soNG09hPOI3GEqCfhabJ6Ql4s0qKkr/Co5Yfp11Y8Pz+UB0kv2Nu9HhRH w==;
X-CSE-ConnectionGUID: xdDF8DgITJOPyos+HeF+iQ==
X-CSE-MsgGUID: Z1dEJm5JR1iNb0S8qOhGew==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75817085"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="75817085"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:28:47 -0800
X-CSE-ConnectionGUID: 3UTbcYBIT6uFhTCEDf9Vtw==
X-CSE-MsgGUID: M1wNkJYUSeS9uzt+zjeutg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189184706"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:28:41 -0800
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
Subject: [PATCH v2 11/11] PCI: Prevent restoring assigned resources
Date: Thu, 13 Nov 2025 18:26:28 +0200
Message-Id: <20251113162628.5946-12-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
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
index 7e268960954b..1d9fc078c7ad 100644
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

