Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BB73C378F
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 01:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BF16EB66;
	Sat, 10 Jul 2021 23:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118A86EB66
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 23:49:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6D60613B0;
 Sat, 10 Jul 2021 23:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625960992;
 bh=IWa6rNN8M5qqyxJN6EtU7EI4tHS7i0cvTiHx3ChZI0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IVTThEcoQtKq0NcVQmvWpInor8Er8DVSENlNsph8nJWwGQADB4Wg2znv6buhsa6V5
 PKhEgyE2cYZTBg08H4Y8O5N7DVp3e6nqcGR9vBnxfO5hk5i4RbZFN/eRwDahIyxI7D
 MzVr2IBEZpPH3tZeKldkIc9xUhLk1U7ZqdJuWcGPe0ElOG0ubpk8DSF6kjn4/Xb7mx
 HouDI7o3RDj7hvoOr4AJ7pBM45F5eQLgxpQAvh9yx0nnUTGvpNmHQbsPHu1Fj1KpRg
 gfQUVpYwhCRqyajsEistBhUGeFFGYB804lr3h8HmcB18zQ2GrheKLqgViqbhPpuP47
 DfqZN4uFYnAEQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 25/43] drm/gma500: Add the missed
 drm_gem_object_put() in psb_user_framebuffer_create()
Date: Sat, 10 Jul 2021 19:48:57 -0400
Message-Id: <20210710234915.3220342-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710234915.3220342-1-sashal@kernel.org>
References: <20210710234915.3220342-1-sashal@kernel.org>
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
index ebe9dccf2d83..0b8648396fb2 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -352,6 +352,7 @@ static struct drm_framebuffer *psb_user_framebuffer_create
 			 const struct drm_mode_fb_cmd2 *cmd)
 {
 	struct drm_gem_object *obj;
+	struct drm_framebuffer *fb;
 
 	/*
 	 *	Find the GEM object and thus the gtt range object that is
@@ -362,7 +363,11 @@ static struct drm_framebuffer *psb_user_framebuffer_create
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

