Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CAF5A6995
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A8C10E255;
	Tue, 30 Aug 2022 17:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6B810E253
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:21:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED2A26172E;
 Tue, 30 Aug 2022 17:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FACFC433D7;
 Tue, 30 Aug 2022 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880059;
 bh=zneAbTP5pou8p5X4jgg4eabYrBfqHrjpDXDezHwggak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mcA7kVhbZoxJslRWTloppfylEyunXU8ezZNM1tDwpeoX1TwyCclnzJIadF5pTC75Y
 aGWGszK+3EM0/h2UJVx4+KH8+/s7dsWk3D43bq5EWrnRVZi13/l/X7Eqhb/H4zR90r
 O/vIKjm+oCKPi85zo1GJT6vJcW52WDQg/rhsMPMvz6P3cSDXUM9C3Gmv+uKZmvH4HC
 HD3cxThS6oeG+idu1vTmu+SccspOUp9I3W7h8k4x7WUZ8miG7BrByx5MJTfKHgvZmX
 hg4ZyJqSKxR8s+StUKoS8py3pKU7pB6ZuQJ83FETzsrI/GhwTrKd5RaeyVwOAcgEeX
 afR2mTnKu+gJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 29/33] fbdev: fbcon: Destroy mutex on freeing
 struct fb_info
Date: Tue, 30 Aug 2022 13:18:20 -0400
Message-Id: <20220830171825.580603-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830171825.580603-1-sashal@kernel.org>
References: <20220830171825.580603-1-sashal@kernel.org>
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
 Shigeru Yoshida <syoshida@redhat.com>, Helge Deller <deller@gmx.de>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, wangqing@vivo.com,
 tzimmermann@suse.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shigeru Yoshida <syoshida@redhat.com>

[ Upstream commit 58559dfc1ebba2ae0c7627dc8f8991ae1984c6e3 ]

It's needed to destroy bl_curve_mutex on freeing struct fb_info since
the mutex is embedded in the structure and initialized when it's
allocated.

Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/fbsysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index c2a60b187467e..4d7f63892dcc4 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -84,6 +84,10 @@ void framebuffer_release(struct fb_info *info)
 	if (WARN_ON(refcount_read(&info->count)))
 		return;
 
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+	mutex_destroy(&info->bl_curve_mutex);
+#endif
+
 	kfree(info->apertures);
 	kfree(info);
 }
-- 
2.35.1

