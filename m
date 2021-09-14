Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FAC40A654
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 07:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35376E3FE;
	Tue, 14 Sep 2021 05:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C976E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 05:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=3O5qPh9B9CukE5UqdcdI1jL5rwSTJCLiW4ZfHGkg0qQ=; 
 b=aG/tXfTj4uXc6FLHmVqhSsAEV0uMc87/iT1aevzAilDjjfv+2EVcxp1tW8xyyGCJE4mOgzhV2dMwM+XJAiWhZyQxsNbLTBmRh5lllClaHPca6Z1Ce3tOcXKto5Ukul2psAuOjv6QK3eM+O9a0GrCYWaMZBSB2wZhMBKF6mlyh3fB9zsXrTMTSQtBEBFJ+X8Xe7yL6wCUvzKfgeUGRS+RBc/Wf1+jb5jL7PHn9PiwbYKTY57bbdl3OaczYHBEYVFj6MukhjdTt9k0Htq/zG6oGuXENoWKTJTV7zeoDwGxu7lUlVqBmoaEPjtI6IfOi4athd7RgKCsl1+1zEfPiS/xYA==;
Received: from 11.48.165.83.dynamic.reverse-mundo-r.com ([83.165.48.11]
 helo=zeus.mundo-R.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1mQ1QF-0007tb-EH; Tue, 14 Sep 2021 07:55:59 +0200
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: mwen@igalia.com
Subject: [PATCH] drm/v3d: fix wait for TMU write combiner flush
Date: Tue, 14 Sep 2021 07:55:49 +0200
Message-Id: <20210914055549.4340-1-itoral@igalia.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hardware sets the TMUWCF bit back to 0 when the TMU write
combiner flush completes so we should be checking for that instead
of the L2TFLS bit.

Fixes spurious Vulkan CTS failures in:
dEQP-VK.binding_model.descriptorset_random.*
---
 drivers/gpu/drm/v3d/v3d_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index a3529809d547..5159f544bc16 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -197,7 +197,7 @@ v3d_clean_caches(struct v3d_dev *v3d)
 
 	V3D_CORE_WRITE(core, V3D_CTL_L2TCACTL, V3D_L2TCACTL_TMUWCF);
 	if (wait_for(!(V3D_CORE_READ(core, V3D_CTL_L2TCACTL) &
-		       V3D_L2TCACTL_L2TFLS), 100)) {
+		       V3D_L2TCACTL_TMUWCF), 100)) {
 		DRM_ERROR("Timeout waiting for L1T write combiner flush\n");
 	}
 
-- 
2.25.1

