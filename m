Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC02326EC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 23:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9391D6E41F;
	Wed, 29 Jul 2020 21:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CD56E422
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596058638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ny64fSMMc7Rq10ZRUtyqKunya/reGTsGGORluTaaBMg=;
 b=MmBlaAa/JetmwAfTOAt4Va+9gP3PaLpV1m7Iy0vQGjxxgB+aMW+6v8E7KttSpKRYTrzlyw
 31Ba/P7DK395FKxmbCZcaKv4q8WcPEcPbvJ+0LmFziT1ZZezMAHwSin+RbtbVdg2hrEoee
 e17+x9hD8HfC81T9saY+ZyIjDrLkTK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-g7qGyxW0PC2vBuHIW8CSZQ-1; Wed, 29 Jul 2020 17:37:14 -0400
X-MC-Unique: g7qGyxW0PC2vBuHIW8CSZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7766F91275;
 Wed, 29 Jul 2020 21:37:13 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-146.rdu2.redhat.com [10.10.119.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EC9A60C84;
 Wed, 29 Jul 2020 21:37:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 3/9] drm/nouveau/kms/fbcon: Correct pm_runtime calls in
 nouveau_fbcon_release()
Date: Wed, 29 Jul 2020 17:36:57 -0400
Message-Id: <20200729213703.119137-4-lyude@redhat.com>
In-Reply-To: <20200729213703.119137-1-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to update the last busy timer for our device and use
pm_runtime_put_autosuspend() here instead so that our GPU can
autosuspend when we're done.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: f231976c2e89 ("drm/nouveau/fbcon: take runpm reference when userspace has an open fd")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: stable@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.3+
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index fad8030ec1f81..4d9f3b5ae72d2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -200,8 +200,11 @@ static int
 nouveau_fbcon_release(struct fb_info *info, int user)
 {
 	struct nouveau_fbdev *fbcon = info->par;
-	struct nouveau_drm *drm = nouveau_drm(fbcon->helper.dev);
-	pm_runtime_put(drm->dev->dev);
+	struct drm_device *dev = fbcon->helper.dev;
+
+	pm_runtime_mark_last_busy(dev->dev);
+	pm_runtime_put_autosuspend(dev->dev);
+
 	return 0;
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
