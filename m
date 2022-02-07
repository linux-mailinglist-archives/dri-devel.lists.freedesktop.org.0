Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128054ACA2B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 21:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C522510F9C7;
	Mon,  7 Feb 2022 20:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DDF10F9AB;
 Mon,  7 Feb 2022 20:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644264694; x=1675800694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LhlvY85+hO9v5AinifbrpYvygC8ZIsKYEZCCCiy4INU=;
 b=HKJL6dTAx4loAjRX68kKmB5JievtNkssaQDuRZ11id17Bkq1/oXVGWkZ
 DTp+6mejIzWI287dWQDu+4lmSmjSXWf3gQA8owE9ec6OuuKYT2WGrzc52
 g/gbP5lEfyLf2uUPcskXbm3vQj6OEdISa2KsI1Ac0I2Gh8FB8JN6/92HK
 1YfOjIF+fOBJo5QbK5+0eg7BXMVxwaryd7YOoMdjt2vSqbr3JHJA4zW8f
 jO0EhTVcmf5EviPcYo60BN8WANJGx+k6YxQ+vKCHCEohn4tEmaRSUe1Wf
 CwTy/ZDlRkJdZDtpKqZ+G2VUcHp3RS+H20SgWz+OwkHOPtbnhONge5hE4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="229448820"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="229448820"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:11:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="770754219"
Received: from vdixit-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.60.7])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:11:33 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 6/6] drm: Add arch arm64 for drm_clflush_virt_range
Date: Mon,  7 Feb 2022 12:11:27 -0800
Message-Id: <20220207201127.648624-7-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207201127.648624-1-michael.cheng@intel.com>
References: <20220207201127.648624-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use flush_tlb_kernel_range when invoking drm_clflush_virt_range on
arm64 platforms. Using flush_tlb_kernel_range will:

1. Make sure prior page-table updates have been completed
2. Invalidate the TLB
3. Check if the TLB invalidation has been completed

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index f19d9acbe959..d2506060a7c8 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -176,6 +176,10 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
+
+#elif defined(CONFIG_ARM64)
+	void *end = addr + length;
+	flush_tlb_kernel_range(*addr, *end);
 #else
 	pr_err("Architecture has no drm_cache.c support\n");
 	WARN_ON_ONCE(1);
-- 
2.25.1

