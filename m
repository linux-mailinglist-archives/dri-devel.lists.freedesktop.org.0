Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E757C7C8682
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 15:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AC110E613;
	Fri, 13 Oct 2023 13:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B53610E60F;
 Fri, 13 Oct 2023 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697202860; x=1728738860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=932ydnVlvZh6eMR3QgiFORqNpGA5FsujVeGmvJ+24c4=;
 b=MbT8xmttVwI74kbPRAnMokaUA+u78v4x8Zhw1EOGI32aV+6GUH0iFv6E
 pJjzvVU/HvqO0zkrHNgMrsB0a+9zrJxfMXUjRS6pgDicUK6Y7GmOHTTF9
 m73YauqSei+eYtGNltjIXrE3e6jEejRieSBdPBq2sQkBu3DYwsaQfWuhR
 hW90DnM0+zNqP34xsUcd1EUllcu1F9EcTkQsvgUXP1OHgxcQ8ZYsc6ESr
 9H/hd5tV4lnje82bPEJKDVK6hKbX1bwVY6UlKD4WqakVmMNMJoZuR9DtX
 +B7S5TyvUH8wpn+89OgjHlCzr4Sf3tm5dRRbT31NirPD9ibNkyjbUGYRq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="449370289"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="449370289"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086136012"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="1086136012"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmsmga005.fm.intel.com with SMTP; 13 Oct 2023 06:14:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Oct 2023 16:14:12 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: s/clamp()/min()/ in i965_lut_11p6_max_pack()
Date: Fri, 13 Oct 2023 16:14:01 +0300
Message-ID: <20231013131402.24072-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use min() instead of clamp() since the color values
involved are unsigned. No functional changes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index b01f463af861..a4b30614bd63 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -909,7 +909,7 @@ static void i965_lut_10p6_pack(struct drm_color_lut *entry, u32 ldw, u32 udw)
 static u16 i965_lut_11p6_max_pack(u32 val)
 {
 	/* PIPEGCMAX is 11.6, clamp to 10.6 */
-	return clamp_val(val, 0, 0xffff);
+	return min(val, 0xffffu);
 }
 
 static u32 ilk_lut_10(const struct drm_color_lut *color)
-- 
2.41.0

