Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A2371F7F
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 20:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5E96E906;
	Mon,  3 May 2021 18:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 24167 seconds by postgrey-1.36 at gabe;
 Mon, 03 May 2021 18:21:55 UTC
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706396E8FF;
 Mon,  3 May 2021 18:21:55 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 0168BC800D5;
 Mon,  3 May 2021 20:21:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id qyb-wfgdHNVr; Mon,  3 May 2021 20:21:53 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300E37f3986001A8B79e0b24CB29D.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:8600:1a8b:79e0:b24c:b29d])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id A300EC800CE;
 Mon,  3 May 2021 20:21:53 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: wse@tuxedocomputers.com, ville.syrjala@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] Add missing check
Date: Mon,  3 May 2021 20:21:46 +0200
Message-Id: <20210503182148.851790-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503182148.851790-1-wse@tuxedocomputers.com>
References: <20210503182148.851790-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a missing check that could potentially lead to an unarchivable mode being
validated.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---

From 54fa706f0a5f260a32af5d18b9622ceebb94c12e Mon Sep 17 00:00:00 2001
From: Werner Sembach <wse@tuxedocomputers.com>
Date: Mon, 3 May 2021 14:42:36 +0200
Subject: [PATCH 2/4] Add missing check

---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 576d3d910d06..ce165ef28e88 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1913,7 +1913,7 @@ intel_hdmi_mode_valid(struct drm_connector *connector,
 		clock *= 2;
 	}
 
-	if (drm_mode_is_420_only(&connector->display_info, mode))
+	if (connector->ycbcr_420_allowed && drm_mode_is_420_only(&connector->display_info, mode))
 		clock /= 2;
 
 	status = intel_hdmi_mode_clock_valid(hdmi, clock, has_hdmi_sink);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
