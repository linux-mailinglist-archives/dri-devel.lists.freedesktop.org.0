Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53C3606802
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 20:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37C310E1EA;
	Thu, 20 Oct 2022 18:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F22E10E1EA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=KdHqm/l66j6BWqUls9UaxFTsEolEqNPGfBkODMbr/GA=; b=Sv
 nNrY/A/9z+07NdZbX/h5lHzCRWSVw2LllsAYQ7NTYjUEyc6dQokA+2UwXMOf84QjssYBe+LdN5WrA
 1E+Qmxio2VQqwJbL6k3j0z5pAGMF8+oor9uvvWUOtvTugP5eIw3rnfbF3q7bWi9mZi2GZYiq4vYi7
 pB9wCXsQUK6EmSNKSoQ45FzhFrJ48fiDlduzZrWGZEuD9j0vleJfN/QQKTzZYMrFoeVxUD10V2eT/
 l9y3MuLU6ywQ9oLAEhSzPI7F9LIa/lP6xzDGDjlI7xVer+E4jPwkB/R6ImWStlIbwYEwdKwdLqukk
 wovhcKowstPQZZxPyNveoPXXvjH+JfRA==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1ola2F-0002sk-Tt;
 Thu, 20 Oct 2022 19:12:53 +0100
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: fix fbdev on non-IOMMU devices
Date: Thu, 20 Oct 2022 19:12:47 +0100
Message-Id: <20221020181248.2497065-1-john@metanate.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
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
Cc: Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When switching to the generic fbdev infrastructure, it was missed that
framebuffers were created with the alloc_kmap parameter to
rockchip_gem_create_object() set to true.  The generic infrastructure
calls this via the .dumb_create() driver operation and thus creates a
buffer without an associated kmap.

alloc_kmap only makes a difference on devices without an IOMMU, but when
it is missing rockchip_gem_prime_vmap() fails and the framebuffer cannot
be used.

Detect the case where a buffer is being allocated for the framebuffer
and ensure a kernel mapping is created in this case.

Fixes: 24af7c34b290 ("drm/rockchip: use generic fbdev setup")
Reported-by: Johan Jonker <jbx6244@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 614e97aaac80..da8a69953706 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -364,9 +364,12 @@ rockchip_gem_create_with_handle(struct drm_file *file_priv,
 {
 	struct rockchip_gem_object *rk_obj;
 	struct drm_gem_object *obj;
+	bool is_framebuffer;
 	int ret;
 
-	rk_obj = rockchip_gem_create_object(drm, size, false);
+	is_framebuffer = drm->fb_helper && file_priv == drm->fb_helper->client.file;
+
+	rk_obj = rockchip_gem_create_object(drm, size, is_framebuffer);
 	if (IS_ERR(rk_obj))
 		return ERR_CAST(rk_obj);
 
-- 
2.38.1

