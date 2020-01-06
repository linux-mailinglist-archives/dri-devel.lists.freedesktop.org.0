Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F00130E33
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 08:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDEB89FBC;
	Mon,  6 Jan 2020 07:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1681 seconds by postgrey-1.36 at gabe;
 Mon, 06 Jan 2020 07:52:14 UTC
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.46.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9E589FBC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 07:52:14 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id C1D44937B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 00:59:58 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id oMMoiczJb3Qi0oMMoiQtfN; Mon, 06 Jan 2020 00:59:58 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zs/OwLvCA6jS7TNxcQCit+/Ww+RcUnpu1UvuQF8dEtI=; b=ZkOI9NGA+cKtzcVCyTqZlA4v1T
 JUellohSEt5/jPkTvYMDpkLNa8Urhq3Ee4eedihHLjg8J7Zyt2EeDR1KVuMV/yrpIXmB3LoQiBcdm
 l13JvB9K1HSYQ2IGK65CSUZIh/AKvGHPyfrmV4u9fInE1hX+WmjreyPTO7fDWffoe+YK8SV1J3L61
 1VqeSxCtE2nkyogOqQiB2MH9gnd4RR/OCLVCXbi2h/7eT20Irt27yzgVM0+x3vbq1Ghrp6WGoD0X/
 t0pDD70gMtXZhCSjAthlO4eSvQ+S98UeiCtkBiL2erb555K6PUrUCYfvDpJzY8L/7RIr27tJ6AlOj
 SzhXnCXg==;
Received: from [189.152.215.240] (port=33838 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1ioMMm-0014nS-Pl; Mon, 06 Jan 2020 00:59:57 -0600
Date: Mon, 6 Jan 2020 01:01:53 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH][next] drm/i915/display: Fix inconsistent IS_ERR and PTR_ERR
Message-ID: <20200106070152.GA13299@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.152.215.240
X-Source-L: No
X-Exim-ID: 1ioMMm-0014nS-Pl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.152.215.240]:33838
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix inconsistent IS_ERR and PTR_ERR in intel_modeset_all_tiles().

The proper pointer to be passed as argument is crtc_state.

This bug was detected with the help of Coccinelle.

Fixes: a603f5bd1691 ("drm/i915/dp: Make sure all tiled connectors get added to the state with full modeset")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index da5266e76738..a96bee699a5e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -14424,7 +14424,7 @@ intel_modeset_all_tiles(struct intel_atomic_state *state, int tile_grp_id)
 		crtc_state = drm_atomic_get_crtc_state(&state->base,
 						       conn_state->crtc);
 		if (IS_ERR(crtc_state)) {
-			ret = PTR_ERR(conn_state);
+			ret = PTR_ERR(crtc_state);
 			break;
 		}
 		crtc_state->mode_changed = true;
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
