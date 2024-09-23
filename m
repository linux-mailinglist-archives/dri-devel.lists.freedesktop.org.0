Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB497F1C6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 22:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E8A10E49C;
	Mon, 23 Sep 2024 20:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA+bBitF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2164210E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 20:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124537; x=1758660537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p738wSaEyVTLKYaGulJT32x1eeUtdXvoR6/xu3l8FRQ=;
 b=CA+bBitFagKc38VMbxfXpN7/iyX0xY6tbdEpHN4QOWgeGU7IV/k/Tgzp
 mWfZ9fF1rDt/5mN3GFw4OKkFzHF67v5Vh1XiEDi1eJew4bwt4ImtsYrvh
 PHki+Z8x5saiwsquXFNanIqK98cLUMX/pGSa7ez63w3LOOtm/90VyYAvm
 81JTYq6pTjcineOlYciRk4PCthRbd+NA4czsisDkgKgStKP3cSqvFviR9
 QC+OVdgbD/pV4snr1kpA1S6ssLn/ntdFc+1zNQepIdw4+sx9QhQYPIKhM
 nVhiFkwW+2kwLKuSL24ccRvyYUaLwOdA9gSIRQEfv6XI8Dx8F+3+B/KAU A==;
X-CSE-ConnectionGUID: 5WS6gD1zSBWgRwWCuq+hBA==
X-CSE-MsgGUID: qb2zdxakSqSdUf5veTgB/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25956193"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25956193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:48:56 -0700
X-CSE-ConnectionGUID: 5/gGAqJ4RNyAqoSON5RPwA==
X-CSE-MsgGUID: mQdbgi1yR8eJUiMSOhrYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71327868"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:48:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:48:53 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/6] fbcon: fbcon_cursor_noblink -> fbcon_cursor_blink
Date: Mon, 23 Sep 2024 23:48:53 +0300
Message-ID: <20240923204853.8629-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923155749.30846-4-ville.syrjala@linux.intel.com>
References: <20240923155749.30846-4-ville.syrjala@linux.intel.com>
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

Invert fbcon_cursor_noblink into fbcon_cursor_blink so that:
- it matches the sysfs attribute exactly
- avoids having to do these NOT operations all over the place

v2: Set the initial value to 1 to keep the same default
    behaviour (Helge)

Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/video/fbdev/core/fbcon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index bbe332572ca7..0681ac7900a2 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -166,7 +166,7 @@ static const struct consw fb_con;
 
 #define advance_row(p, delta) (unsigned short *)((unsigned long)(p) + (delta) * vc->vc_size_row)
 
-static int fbcon_cursor_noblink;
+static int fbcon_cursor_blink = 1;
 
 #define divides(a, b)	((!(a) || (b)%(a)) ? 0 : 1)
 
@@ -399,7 +399,7 @@ static void fbcon_add_cursor_work(struct fb_info *info)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	if (!fbcon_cursor_noblink)
+	if (fbcon_cursor_blink)
 		queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
 				   ops->cur_blink_jiffies);
 }
@@ -3214,7 +3214,7 @@ static ssize_t rotate_show(struct device *device,
 static ssize_t cursor_blink_show(struct device *device,
 				 struct device_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);
+	return sysfs_emit(buf, "%d\n", fbcon_cursor_blink);
 }
 
 static ssize_t cursor_blink_store(struct device *device,
@@ -3230,7 +3230,7 @@ static ssize_t cursor_blink_store(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	fbcon_cursor_noblink = !blink;
+	fbcon_cursor_blink = blink;
 
 	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
-- 
2.44.2

