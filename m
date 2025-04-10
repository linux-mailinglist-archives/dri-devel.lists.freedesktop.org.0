Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE5A84721
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1854110E9E7;
	Thu, 10 Apr 2025 14:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atB4Yssp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B000210E9E7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744297163; x=1775833163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PL87bXJTd9TM9byCXKoErWcyTXfk7+YXzqFkEGPZQ+4=;
 b=atB4YsspFI2jBsime2GRtmBnREGgK2QGXlrZrkH1Y+GU++EeCSSCjHyq
 GwxOju4GKKZcJDhWTIqSHdl2YTY+Poo6nxAGiEvHjWLdxHERcotC8+hME
 Rr1NUvBMq9Y/ZECg3LTSkzC17S2xFZppR5tD9M2S/z9SMWe2701ptkMN2
 34wXKV4hbJCWrzGzJtv/w/oy5d6U1f2VFxG0V/EeZGL2eaWnwIOWXRjd3
 ToTwS97sRMxwL4STRn6bg6tuoXPjrNFGeiV5zExVmg8qQQU9qbq8z6Q2D
 u1EYWQezP8WyQI9ghOtzHZ4OFIdcxvuU2akqkQlltZbgoPDr6B1N5ATsp A==;
X-CSE-ConnectionGUID: fOE+RaUDS5+FEpT3cGW04Q==
X-CSE-MsgGUID: hRnS8HSoTias/4PnqF81Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71208151"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="71208151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 07:59:21 -0700
X-CSE-ConnectionGUID: c0b6OG9+ROyYPrX75yJW5Q==
X-CSE-MsgGUID: 5Ci4lecQR8Wik+3Dok6KSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134101996"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 07:59:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 17:59:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 4/6] drm/armada: Fix armada_debugfs_crtc_reg_write() return
 type
Date: Thu, 10 Apr 2025 17:59:02 +0300
Message-ID: <20250410145904.25550-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
References: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Change the armada_debugfs_crtc_reg_write() return type to
the correct ssize_t. This makes the code actually build on
certain architectures.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/armada/armada_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index a763349dd89f..96aebd56272f 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -49,7 +49,7 @@ static int armada_debugfs_crtc_reg_open(struct inode *inode, struct file *file)
 			   inode->i_private);
 }
 
-static int armada_debugfs_crtc_reg_write(struct file *file,
+static ssize_t armada_debugfs_crtc_reg_write(struct file *file,
 	const char __user *ptr, size_t len, loff_t *off)
 {
 	struct armada_crtc *dcrtc;
-- 
2.49.0

