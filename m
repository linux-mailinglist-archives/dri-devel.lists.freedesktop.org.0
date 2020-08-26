Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1AC2528E3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3958C89D4D;
	Wed, 26 Aug 2020 08:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141296E02D;
 Wed, 26 Aug 2020 05:22:09 +0000 (UTC)
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kAnsp-0003bH-4M; Wed, 26 Aug 2020 05:22:03 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: jani.nikula@linux.intel.com
Subject: [PATCH] drm/i915/lspcon: Limits to 8 bpc for RGB/YCbCr444
Date: Wed, 26 Aug 2020 13:21:15 +0800
Message-Id: <20200826052143.17607-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Uma Shankar <uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LSPCON only supports 8 bpc for RGB/YCbCr444.

Set the correct bpp otherwise it renders blank screen.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2195
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index b781bf469644..c7a44fcaade8 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -196,7 +196,8 @@ void lspcon_ycbcr420_config(struct drm_connector *connector,
 		crtc_state->port_clock /= 2;
 		crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR444;
 		crtc_state->lspcon_downsampling = true;
-	}
+	} else
+		crtc_state->pipe_bpp = 24;
 }
 
 static bool lspcon_probe(struct intel_lspcon *lspcon)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
