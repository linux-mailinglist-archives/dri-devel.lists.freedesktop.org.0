Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C182D11C
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 16:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2561B10E18D;
	Sun, 14 Jan 2024 15:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D736A10E18D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 15:15:40 +0000 (UTC)
Received: from fedora.home ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id P2D2rpeDvx8edP2D2ruurW; Sun, 14 Jan 2024 16:15:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1705245339;
 bh=gGvgGoM0e1dEjbodoGgiPLnqIqDMOOhcBuBKmJRpc0g=;
 h=From:To:Cc:Subject:Date;
 b=BtgUzr6PiLEDrT5U7hh+Jo3YWfcnNrYPzC3/04dcm9p4EHAa9TcvqKQ27kwu4TTql
 Ol4tDykXmDjWOXTK6OH3AbkkQ2j/8QVv1zsYOcOntfb3BZQw97Y//wzeWOeSWkVHFT
 g9KyBM5JsNeU/wMxd/IpUtc0lcYLS0wntGq8wrHXwLu98r+ZdA0M/MIcEjGLk8chV9
 Uj18E1i+0gWvdYH+lSQ4TB2snhTdGsg9fnsgdmAYm3yyJaUtmTxkCxHEmT2W3Jspja
 SR3DQdevSDv+pir+9kftCvA/RpF+w6MKEVKOp43eus0qVfRr3qtHZvlDg8K4utfFlE
 KTdg05vxZI/TQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Jan 2024 16:15:39 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/guc: Remove usage of the deprecated ida_simple_xx()
 API
Date: Sun, 14 Jan 2024 16:15:34 +0100
Message-ID: <7108c1871c6cb08d403c4fa6534bc7e6de4cb23d.1705245316.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_range() is inclusive. So a -1 has been added when needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a259f1118c5a..73ce21ddf682 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2156,11 +2156,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
 					      order_base_2(ce->parallel.number_children
 							   + 1));
 	else
-		ret = ida_simple_get(&guc->submission_state.guc_ids,
-				     NUMBER_MULTI_LRC_GUC_ID(guc),
-				     guc->submission_state.num_guc_ids,
-				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
-				     __GFP_NOWARN);
+		ret = ida_alloc_range(&guc->submission_state.guc_ids,
+				      NUMBER_MULTI_LRC_GUC_ID(guc),
+				      guc->submission_state.num_guc_ids - 1,
+				      GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 	if (unlikely(ret < 0))
 		return ret;
 
@@ -2183,8 +2182,8 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 							   + 1));
 		} else {
 			--guc->submission_state.guc_ids_in_use;
-			ida_simple_remove(&guc->submission_state.guc_ids,
-					  ce->guc_id.id);
+			ida_free(&guc->submission_state.guc_ids,
+				 ce->guc_id.id);
 		}
 		clr_ctx_id_mapping(guc, ce->guc_id.id);
 		set_context_guc_id_invalid(ce);
-- 
2.43.0

