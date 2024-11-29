Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953C9DBF02
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 05:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E42E10ED93;
	Fri, 29 Nov 2024 04:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWjQXRQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396B610ED8E;
 Fri, 29 Nov 2024 04:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732854396; x=1764390396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0s4InliC6VAvu6bYSTO0TI4H7F1qiAT6qTeTPxYWch4=;
 b=gWjQXRQ56H7LPXTqQtBE82k25yMFSM+d6FB44vL6WxxQ8ShhmsSXg4o2
 4JqS86SsHKTEuo9AwQkM2phpeZbHBm5OdPMkg4/jgn3/InHWvw3HnXDO/
 GBaXhlB7dfB44kvbOoaIqAwlR6yDTT2/T9jnr5KpX6FYu1DCNV8OR7zuI
 8wVppq1bImebYINpWXzlsQjZsgbQ5x1DMGP4nQb6THXBcVq4pEQsWa6ca
 TpsuF/SYwsKFOBLSmE9YO66rldJBpwFCyq4hyEf9CZR3JfS9i0NGqCvkQ
 5O5c97soC7QI9RWpVTuHoGMqSNxQ4dYO/H83oVHhInJXXNobB3JyLeDhg A==;
X-CSE-ConnectionGUID: h0o2YIUSTIeAzlBuyTSbsg==
X-CSE-MsgGUID: 35cylbsGRCKlXTlD8irvig==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33028017"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="33028017"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:26:36 -0800
X-CSE-ConnectionGUID: rpl4Y5T+Thy0tlTqzqppyw==
X-CSE-MsgGUID: TxGKJZhHQqqP+fHo5jULyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="92567174"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 Nov 2024 20:26:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 29 Nov 2024 06:26:32 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
Subject: [PATCH 1/2] drm/modes: Avoid divide by zero harder in
 drm_mode_vrefresh()
Date: Fri, 29 Nov 2024 06:26:28 +0200
Message-ID: <20241129042629.18280-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241129042629.18280-1-ville.syrjala@linux.intel.com>
References: <20241129042629.18280-1-ville.syrjala@linux.intel.com>
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

drm_mode_vrefresh() is trying to avoid divide by zero
by checking whether htotal or vtotal are zero. But we may
still end up with a div-by-zero of vtotal*htotal*...

Cc: stable@vger.kernel.org
Reported-by: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_modes.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 6ba167a33461..71573b85d924 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1287,14 +1287,11 @@ EXPORT_SYMBOL(drm_mode_set_name);
  */
 int drm_mode_vrefresh(const struct drm_display_mode *mode)
 {
-	unsigned int num, den;
+	unsigned int num = 1, den = 1;
 
 	if (mode->htotal == 0 || mode->vtotal == 0)
 		return 0;
 
-	num = mode->clock;
-	den = mode->htotal * mode->vtotal;
-
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		num *= 2;
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
@@ -1302,6 +1299,12 @@ int drm_mode_vrefresh(const struct drm_display_mode *mode)
 	if (mode->vscan > 1)
 		den *= mode->vscan;
 
+	if (check_mul_overflow(mode->clock, num, &num))
+		return 0;
+
+	if (check_mul_overflow(mode->htotal * mode->vtotal, den, &den))
+		return 0;
+
 	return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
 }
 EXPORT_SYMBOL(drm_mode_vrefresh);
-- 
2.45.2

