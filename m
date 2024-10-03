Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D0F98EDEE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2185110E804;
	Thu,  3 Oct 2024 11:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/Nb/AVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757B710E804
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954349; x=1759490349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j+kjsygloMNATuoZYTboOJSDjNugvl8FuIQrrxOMlnA=;
 b=O/Nb/AVn9FW9oVnsWGaSIahLeRUL1Mo+rw7Bzoc0gs/CoB8KoFsntDeD
 3rOqshC3VMaeuy7RUDywThLHf7oZ07LHBGaaMys0gcMkmJMMZfnBBqCMo
 BzQfARoIKQwbhgqOelZAREyUkeA8cKjncgzXZ1iosa8bf/OoXTjtito02
 vVuq4LxSijaeLtUXVpDdOZJ6JGQYbogrst3XDCvzan8QlYOKLwDdm2Yk+
 8DR546GRdNVeOiaXkCXqTnKlpokskSgcMoCBAVvWnsZQBQhd78ixVSEQ0
 d6nyrwp1QpMg7JjYxtrOfDMV9pEj2YO7vqZSsHyCgjjDGCHnbQSYkgwNM Q==;
X-CSE-ConnectionGUID: zGKTm4aSRR+1znYN/cW/Ag==
X-CSE-MsgGUID: Pm3+2rRlSMuYuSAk5DnV6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012972"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012972"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:19:08 -0700
X-CSE-ConnectionGUID: Skd+JHMfSlefj+blLX6glg==
X-CSE-MsgGUID: z5X5lKxxRrC3adfkepA9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423744"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:19:05 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 04/10] drm/armada: Fix armada_debugfs_crtc_reg_write()
 return type
Date: Thu,  3 Oct 2024 14:18:45 +0300
Message-ID: <20241003111851.10453-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
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
2.45.2

