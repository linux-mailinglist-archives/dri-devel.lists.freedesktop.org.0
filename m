Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69F98AD69
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C702C10E57D;
	Mon, 30 Sep 2024 19:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UK7KDIIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7B210E57D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726029; x=1759262029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TnvsmJcPiXuRyZW1h74XjR37Iz6G6vVbwTQESFZ0rHI=;
 b=UK7KDIIbrBr/bDUxUSfw8Qoa9sZ13OpEOEvmnEjPSH0cbBPNKD7oD4fy
 LaDFeyT8Jtxj15auFgm1UNgO7RH9qPYTlm9jdGFFprsBU2jsZT3E65Lh4
 iAPi0RgNDBlO+UVbzLsVHUSzzZ1e+fML6FWoeV8mgqKyaFabXgYTxycTL
 oky3pzN3cSsR3vSPMLqyAD8z6g9ndUdUt6ae/oI/0u7I09TFm3mydeIB1
 DZYp56E+5AZtnklQevAXGQrdRKUjSTxn95dOA9KXm9ClrJWZrXvIWDmI0
 qMmOdGoIGZ0q3rbUbR9NGiwAdaxCxtleJCOOwsB28xG3ViUqZp9Rq2RSS g==;
X-CSE-ConnectionGUID: cT6kauhyTnin0PB1UJDdNA==
X-CSE-MsgGUID: EkGoF5SsQSS6dejq7q9moQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962333"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:49 -0700
X-CSE-ConnectionGUID: tSxxMPHzT3CHiTh5X5p22g==
X-CSE-MsgGUID: n+2qKuSyQPKemd67meHP7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370079"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:47 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 15/31] accel/ivpu: Add one jiffy to bo_wait_ioctl timeout
 value
Date: Mon, 30 Sep 2024 21:53:06 +0200
Message-ID: <20240930195322.461209-16-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Add one jiffy to ensure wait function never times out before
intended timeout value, which could happen if absolute timeout value
is less than (1s / CONFIG_HZ) in the future.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 1b409dbd332d8..d8e97a760fbc0 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -384,6 +384,9 @@ int ivpu_bo_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 
 	timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
 
+	/* Add 1 jiffy to ensure the wait function never times out before intended timeout_ns */
+	timeout += 1;
+
 	obj = drm_gem_object_lookup(file, args->handle);
 	if (!obj)
 		return -EINVAL;
-- 
2.45.1

