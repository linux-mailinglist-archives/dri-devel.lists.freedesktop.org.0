Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D684675E2A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D76110EB06;
	Fri, 20 Jan 2023 19:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB3A10EAFC;
 Fri, 20 Jan 2023 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674243319; x=1705779319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RmHp35HZdITzZMST9XxXP5+dDBzZpKoMgvb3vxaufVA=;
 b=ZCVPObySSsBqmFVO66OA2vyzu9Bq+AJQ3WUF4Ze2KnmMSDWaTO+qvycH
 K5LHe1cTCMhWFNb3quGPnSQXC7PgITVUnZlKHwPaof0zjWYTz/71jQnjL
 pR8JnONOMnIxj3RrfxhNDsukXGPAX8/ebQCr65LEgtlrBPkIeXdbHxVBx
 QFMaYGaW8mkMSmhxA12Y7LZmFGsQv4ORfQa0LzejVQMSXskynDdJcFrsQ
 aNalsxWduR7FfQaUyacU8vVgCQKrGL23XZEybp9BouNZrRhn0jiTIQkjX
 fQ7yo2h6J7WfKZU/ZGw6gmKPYRKLRexVtcBfMZqj8hHXg7q0HFzM/qtYo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411903545"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411903545"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834518320"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834518320"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/i915: Convert MBUS_ABOX_CTL() to
 _PICK_EVEN_2RANGES()
Date: Fri, 20 Jan 2023 11:34:56 -0800
Message-Id: <20230120193457.3295977-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120193457.3295977-1-lucas.demarchi@intel.com>
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MBUS_ABOX_CTL() can use _PICK_EVEN_2RANGES instead of _PICK, which
reduces the size and is safer.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index fe6385443c4a..3d6ad4424265 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1040,9 +1040,11 @@
 #define _MBUS_ABOX0_CTL			0x45038
 #define _MBUS_ABOX1_CTL			0x45048
 #define _MBUS_ABOX2_CTL			0x4504C
-#define MBUS_ABOX_CTL(x)		_MMIO(_PICK(x, _MBUS_ABOX0_CTL, \
-						    _MBUS_ABOX1_CTL, \
-						    _MBUS_ABOX2_CTL))
+#define MBUS_ABOX_CTL(x)							\
+	_MMIO(_PICK_EVEN_2RANGES(x, 2,						\
+				 _MBUS_ABOX0_CTL, _MBUS_ABOX1_CTL,		\
+				 _MBUS_ABOX2_CTL, _MBUS_ABOX2_CTL))
+
 #define MBUS_ABOX_BW_CREDIT_MASK	(3 << 20)
 #define MBUS_ABOX_BW_CREDIT(x)		((x) << 20)
 #define MBUS_ABOX_B_CREDIT_MASK		(0xF << 16)
-- 
2.39.0

