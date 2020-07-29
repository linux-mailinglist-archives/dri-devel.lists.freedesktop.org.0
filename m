Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1006E2326E4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 23:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D276E2EF;
	Wed, 29 Jul 2020 21:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0FE6E2EF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 21:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596058635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlzYrlxQ6z7rgvNzuqLOagIf/kbOaxOQKOCQwnjGeBE=;
 b=YwpevgA+LVr1OU3rvwSs6gl6XUcvOp1v1BqLnCEB3Cu5+plntErvtn8F+z4cxx26mizRJa
 WwTQ7Cjze55BzTBxBbuQ0ikbQ23I6EThlorEGQ2zdvrxL4wfPR8EJGZRbtyxRETQiRv9e4
 1CJfYjcbILX3uFjmfMALhJnfXOhbMTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-fpvoriDuPKqUgIOULgcyXg-1; Wed, 29 Jul 2020 17:37:13 -0400
X-MC-Unique: fpvoriDuPKqUgIOULgcyXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54D8A100CCC1;
 Wed, 29 Jul 2020 21:37:12 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-146.rdu2.redhat.com [10.10.119.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25B6E619B5;
 Wed, 29 Jul 2020 21:37:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 2/9] drm/nouveau/kms: Fix rpm leak in
 nouveau_connector_hotplug()
Date: Wed, 29 Jul 2020 17:36:56 -0400
Message-Id: <20200729213703.119137-3-lyude@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Found another one, we forget to drop the runtime PM reference we grab
here in the event of a failure. So, do that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 3e1a12754d4d ("drm/nouveau: Fix deadlocks in nouveau_connector_detect()")
Cc: stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 38e226b8cfd05..ab35153e31b72 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1188,6 +1188,9 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 	} else if (ret != 1 && ret != -EACCES) {
 		NV_WARN(drm, "HPD on %s dropped due to RPM failure: %d\n",
 			name, ret);
+
+		pm_runtime_mark_last_busy(drm->dev->dev);
+		pm_runtime_put_autosuspend(drm->dev->dev);
 		return NVIF_NOTIFY_DROP;
 	}
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
