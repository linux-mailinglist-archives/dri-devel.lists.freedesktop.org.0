Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF2298AD7B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E43F10E58F;
	Mon, 30 Sep 2024 19:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbTjXLx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2831910E582
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726047; x=1759262047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qCIaMT4F0NMwfRLsA+PpeVNHQT02poEWxcgUjHcxWKo=;
 b=gbTjXLx6SCoWbeiwnfDd4DX/0oP5evFFY+PwHw//V87sfeq0lSoj/2Sc
 zA4ulj39vLCELNkyWgb7U/g8TxMIFzCF9KC93wTASjv+yeOoG48uHND/F
 jporaxiEPfUb5XBsNpdXnChc3jnlL3Us+R2uwZcQ/qw+iVHNymh05JNmO
 hRD4jWDHR7lqNJ+FidR0jAjGb2g41gnP/Gq6F/a8Q7xLPv4Pr2iYgif9f
 /LYZ8gYFmczuMkGtdXUlCSX1cdQrdhp6tHP8vfa7fjNRevidzfzEoNi1m
 eWZ54zRYsjKdlqjoFUiQB9KBfiTZzqvYGFm9NdxKNTtoxfq8yrQMkm5jV A==;
X-CSE-ConnectionGUID: 64oKPFavSoy+ePtrpAHWTQ==
X-CSE-MsgGUID: 7Ghm0qSYTjmxt2JKj6gNOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962382"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:07 -0700
X-CSE-ConnectionGUID: qXlr8KgIQlqVF9gBJo31xg==
X-CSE-MsgGUID: K2KA+HNeRjOPYhGi/rphwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370242"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:06 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH v2 27/31] accel/ivpu: Increase MS info buffer size
Date: Mon, 30 Sep 2024 21:53:18 +0200
Message-ID: <20240930195322.461209-28-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Increase MS info BO to 64KB to allow collecting more metrics.

Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_ms.c b/drivers/accel/ivpu/ivpu_ms.c
index 2f9d37f5c208a..ffe7b10f8a767 100644
--- a/drivers/accel/ivpu/ivpu_ms.c
+++ b/drivers/accel/ivpu/ivpu_ms.c
@@ -11,7 +11,7 @@
 #include "ivpu_ms.h"
 #include "ivpu_pm.h"
 
-#define MS_INFO_BUFFER_SIZE	  SZ_16K
+#define MS_INFO_BUFFER_SIZE	  SZ_64K
 #define MS_NUM_BUFFERS		  2
 #define MS_READ_PERIOD_MULTIPLIER 2
 #define MS_MIN_SAMPLE_PERIOD_NS   1000000
-- 
2.45.1

