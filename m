Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A23C37E9
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 01:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7026EB75;
	Sat, 10 Jul 2021 23:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51CC6EB75
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 23:50:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB9B0613E5;
 Sat, 10 Jul 2021 23:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625961049;
 bh=2Y87ANqT1IR8S1xi4zUf0mMImWInqGSIW0qfOzPDjc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ek47SYXxsb6qWchBzpoiMGsuxzpaj3Oin5slx5l71GVrRc5xk6BDKDpUobIqWL5wE
 ZMoqp/taKJiiyJnrYskj4KGeqhi+p/v3rheCO+0xoEBoqSvyYdpR/3dLv04/uhZTC7
 odSx+1V/jUYtLlUn9Ejdep3nwSAXbiePTIaTKZx37hPo4gk3QhHNZqc+v4ISzEgQwa
 vFRMz+/sv20RGeKzLaB+qWO08ku6hItK6SR3DsrNd+N7T/chXgpE7f5xfiM6XtvCKL
 RquJB0PMagNdxd3b/njOwE96JFABsUwL2pK3iWLsmcAp/H92/c0JdrPDZeAmfNRsMl
 1IlBVczKqCdvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 24/37] drm/gma500: Add the missed
 drm_gem_object_put() in psb_user_framebuffer_create()
Date: Sat, 10 Jul 2021 19:50:02 -0400
Message-Id: <20210710235016.3221124-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710235016.3221124-1-sashal@kernel.org>
References: <20210710235016.3221124-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Jing Xiangfeng <jingxiangfeng@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jing Xiangfeng <jingxiangfeng@huawei.com>

[ Upstream commit cd8f318fbd266b127ffc93cc4c1eaf9a5196fafb ]

psb_user_framebuffer_create() misses to call drm_gem_object_put() in an
error path. Add the missed function call to fix it.

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20210629115956.15160-1-jingxiangfeng@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/gma500/framebuffer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 54d9876b5305..6ef4ea07d1bb 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -435,6 +435,7 @@ static struct drm_framebuffer *psb_user_framebuffer_create
 			 const struct drm_mode_fb_cmd2 *cmd)
 {
 	struct drm_gem_object *obj;
+	struct drm_framebuffer *fb;
 
 	/*
 	 *	Find the GEM object and thus the gtt range object that is
@@ -445,7 +446,11 @@ static struct drm_framebuffer *psb_user_framebuffer_create
 		return ERR_PTR(-ENOENT);
 
 	/* Let the core code do all the work */
-	return psb_framebuffer_create(dev, cmd, obj);
+	fb = psb_framebuffer_create(dev, cmd, obj);
+	if (IS_ERR(fb))
+		drm_gem_object_put(obj);
+
+	return fb;
 }
 
 static int psbfb_probe(struct drm_fb_helper *fb_helper,
-- 
2.30.2

