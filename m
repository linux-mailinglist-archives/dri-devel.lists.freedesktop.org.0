Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52565A69D1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BE910E274;
	Tue, 30 Aug 2022 17:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C62D10E272
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:23:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98DD8616EB;
 Tue, 30 Aug 2022 17:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA20C433C1;
 Tue, 30 Aug 2022 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880182;
 bh=0u026pqT58oZ4sONs/gvlH4NvnoS731D0/6bWyVkQHo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fWHRsU7H7D+0sz6Lphzcqzy5cL91tzBv2tttGNKbB3wZxABsqMGIkphdPuXnLFaJT
 MgdO6kEKKz3fbMYxFpgrn/q6P50oWyVVYCRxzASa+7uyJzObRVm3v1NNXr+EqrQS6H
 LpMEhv12CUB4pc1W1EoMD/RwkEyjz1fDEKoLP5KTMKzcolCKqRcYMjuinAenvaY4S9
 ojGweagA91xzclNzavjM0hki9TNHHm9o4tzOZRRBNPiLSYa4CjK0ZdW+WHK4BeV14a
 McIsC2lDke8oUeEd16tRZn43RNovCKQcxZf0GVrsTasbeleNLo64O2Xu+GlNxsD8Zf
 8gN4u9/exMr7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 21/23] fbdev: fbcon: Destroy mutex on freeing
 struct fb_info
Date: Tue, 30 Aug 2022 13:21:38 -0400
Message-Id: <20220830172141.581086-21-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172141.581086-1-sashal@kernel.org>
References: <20220830172141.581086-1-sashal@kernel.org>
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
index ce699396d6bad..09ee27e7fc25f 100644
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

