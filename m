Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED27C4F161
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF9B10E60B;
	Tue, 11 Nov 2025 16:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L83PKPO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE1A10E614;
 Tue, 11 Nov 2025 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762879476; x=1794415476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=knPKDrMjXe5mlH+urOE16uEbmKHp060xbgSjEhJfc34=;
 b=L83PKPO8izGbWNvfjmH/y7Rw2e+bojnsy7TdFFnmppi755HS8SD0iDsB
 uOpxkAReVAoMgCDb3XQzCSHWKsI6FTCX7B/9UX70pAp+L18DwIp2ENRCQ
 x+rMoh0FtcEG1tXxWxB2f1YaMdwDwhiZjAAwkAUwbLfoyh6NFRcgWQt/D
 gIIaTwJ0HPLvuoE+XxnyhlaohUDPr5jxAPFtzl7+QCE0mXqtMp7LOQJAL
 a7i7IMHKXTfR2e1GIIjnVwKgON9J0zIzJtyuO++VSBpvMdmHE6qnjelpM
 e8UzCI8k0D54VCc9v+13q+m6TSwAq4H0XPjwbwj1SKCETep2wy5I8zi+q Q==;
X-CSE-ConnectionGUID: OQuZU9LdQ/eMriZoyBqAVA==
X-CSE-MsgGUID: msevHs1kRTqic/JtFcZTYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75244612"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75244612"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:36 -0800
X-CSE-ConnectionGUID: cCqBs69wRreTNP9l5lZT8Q==
X-CSE-MsgGUID: mJfXMg7EQL6N4dTq2pPY0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="188646750"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:32 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 01/17] drm/xe/svm: Fix a debug printout
Date: Tue, 11 Nov 2025 17:43:51 +0100
Message-ID: <20251111164408.113070-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
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

Avoid spamming the log with drm_info(). Use drm_dbg() instead.

Fixes: cc795e041034 ("drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: <stable@vger.kernel.org> # v6.17+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 55c5a0eb82e1..894e8f092e3f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -941,7 +941,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
 
 	if (xe_svm_range_in_vram(range)) {
-		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
+		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
 		return false;
 	}
 
-- 
2.51.1

