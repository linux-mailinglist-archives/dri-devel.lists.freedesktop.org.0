Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BB637195C
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298C46E296;
	Mon,  3 May 2021 16:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560226E113;
 Mon,  3 May 2021 16:35:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFFF8611AE;
 Mon,  3 May 2021 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059718;
 bh=qzBd5KFoOot3ymsfol1NFk7ANSu/74D3rjHu6RHVPIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dAn7YxtKdPBrcs9+YJfal4I9UZrfD2SiScAIYnaPZHv+9KDgi2VL4zb+PPk1WT9iZ
 dtI4BbMLz7yQVI+5NwhIzXSK8xMCS4HPoHdqWFpqoqJw0nlTb/D644Wpolnp6RZ53J
 MDnINpjqCnLGP7QXjlwarMN3cu7O6OGI9Jr+kaDCQfwJ0Lq6k2o5Or00xkW4ucrJzu
 fblzzCFaHFo71GgjPIqpHlZ9an/rm+tpCEEZGkYX53fy7YIfrFeDVcRMLYwYXEfp3x
 xmuloAMPb63LCIlAbxIbYZeSJyy+hkvnG3+TShHxD5xtilBwdOyIMqeTH9xUuDJyFV
 Z4IvoMFOZe9ig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 003/134] drm/qxl: release shadow on shutdown
Date: Mon,  3 May 2021 12:33:02 -0400
Message-Id: <20210503163513.2851510-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163513.2851510-1-sashal@kernel.org>
References: <20210503163513.2851510-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gerd Hoffmann <kraxel@redhat.com>

[ Upstream commit 4ca77c513537700d3fae69030879f781dde1904c ]

In case we have a shadow surface on shutdown release
it so it doesn't leak.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: http://patchwork.freedesktop.org/patch/msgid/20210204145712.1531203-6-kraxel@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/qxl/qxl_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 10738e04c09b..56e0c6c625e9 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1228,6 +1228,10 @@ int qxl_modeset_init(struct qxl_device *qdev)
 
 void qxl_modeset_fini(struct qxl_device *qdev)
 {
+	if (qdev->dumb_shadow_bo) {
+		drm_gem_object_put(&qdev->dumb_shadow_bo->tbo.base);
+		qdev->dumb_shadow_bo = NULL;
+	}
 	qxl_destroy_monitors_object(qdev);
 	drm_mode_config_cleanup(&qdev->ddev);
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
