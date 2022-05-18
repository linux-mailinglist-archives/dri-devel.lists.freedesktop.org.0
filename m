Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8933552B9CC
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 14:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3592510F197;
	Wed, 18 May 2022 12:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DB210F197
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 12:28:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B801D6168C;
 Wed, 18 May 2022 12:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44938C34119;
 Wed, 18 May 2022 12:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652876891;
 bh=2G3O/BeuOB/LP+pXY8WjpNyQcb0iZ9J+DrQIeLIcGXY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=boOUcq/+nlWQEoFW6WOugy+AXfoip8MtHPwSJ2jzQu5iucQZa6ZHqkvuUPd8gV1cv
 SEIeJ9Rr5K6MXJ8AYXtRY740YD+OBB1AKHjjCSCRGzkxuOVw+8IXKTQIsUBe4T6SdW
 YN9L02OCFTmew9kz+//gRD0qJca91EUxGD5p2k06Ztj43S1p0GMcN9psuQkQ8HNTzT
 umPjyzoAWkQ+OOBODwIVGr/+aVG7mMVUJK8N90HciP2/CPjKQ6ycoE5vCU4nHtAzOX
 jFycRdjAA40VGdSiLOdnHH0hrbvo1uesHAvTtvOAd1W9+ifVlF3BTTDB/zGLVUKw7H
 HpEmhdlE2P89Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 07/17] fbdev: Prevent possible use-after-free in
 fb_release()
Date: Wed, 18 May 2022 08:27:41 -0400
Message-Id: <20220518122753.342758-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518122753.342758-1-sashal@kernel.org>
References: <20220518122753.342758-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, deller@gmx.de,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 wangqing@vivo.com, Daniel Vetter <daniel.vetter@intel.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

[ Upstream commit 89bfd4017e58faaf70411555e7f508495114e90b ]

Most fbdev drivers have issues with the fb_info lifetime, because call to
framebuffer_release() from their driver's .remove callback, rather than
doing from fbops.fb_destroy callback.

Doing that will destroy the fb_info too early, while references to it may
still exist, leading to a use-after-free error.

To prevent this, check the fb_info reference counter when attempting to
kfree the data structure in framebuffer_release(). That will leak it but
at least will prevent the mentioned error.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220505220413.365977-1-javierm@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/fbsysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 65dae05fff8e..ce699396d6ba 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -80,6 +80,10 @@ void framebuffer_release(struct fb_info *info)
 {
 	if (!info)
 		return;
+
+	if (WARN_ON(refcount_read(&info->count)))
+		return;
+
 	kfree(info->apertures);
 	kfree(info);
 }
-- 
2.35.1

