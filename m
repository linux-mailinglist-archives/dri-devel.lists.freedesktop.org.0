Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483CC287E8A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 00:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF746EB0C;
	Thu,  8 Oct 2020 22:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61676EB0C;
 Thu,  8 Oct 2020 22:13:19 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FC8A22241;
 Thu,  8 Oct 2020 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602195199;
 bh=QwC/kxxkaru98nLEFoJk/4mhtYf+gyr8z3Rnw7Q/3Q8=;
 h=Date:From:To:Cc:Subject:From;
 b=PsCHVunq6rzcCfkb6KsoAbgWbosMsjvZIUnlSgnXksbycIEKwOU0aBvtgicRJMZsz
 2/NZwBxKr75b48N/nUFfsKkilDl0c9+2B/yNDUurNIwu/TKrhmGMe0biIg3EOwacva
 RUfKfSXB5m6uclm4GlssXSIZvPQubV9ImgvrFWBU=
Date: Thu, 8 Oct 2020 17:18:42 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/i915/display: Use fallthrough pseudo-keyword
Message-ID: <20201008221842.GA9463@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to enable -Wimplicit-fallthrough for Clang[1], replace the
existing /* fall through */ comments with the new pseudo-keyword
macro fallthrough[2].

[1] https://git.kernel.org/linus/e2079e93f562c7f7a030eb7642017ee5eabaaa10
[2] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4d06178cd76c..2941051ac3e1 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1090,7 +1090,7 @@ ehl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rate,
 				return icl_combo_phy_ddi_translations_edp_hbr2;
 			}
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		/* All combo DP and eDP ports that do not support low_vswing */
 		*n_entries = ARRAY_SIZE(ehl_combo_phy_ddi_translations_dp);
@@ -1126,7 +1126,7 @@ tgl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rate,
 			*n_entries = ARRAY_SIZE(icl_combo_phy_ddi_translations_edp_hbr2);
 			return icl_combo_phy_ddi_translations_edp_hbr2;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		/* All combo DP and eDP ports that do not support low_vswing */
 		if (rate > 270000) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
