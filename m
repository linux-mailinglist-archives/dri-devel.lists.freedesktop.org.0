Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF30EAFAF7A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 11:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428B910E312;
	Mon,  7 Jul 2025 09:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="BUxUMpZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7222810E312
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=56yF/zI7i6sgqCq8VI4vVeBeXQpKc4+9Sjf8ASmThTs=; b=BUxUMpZ41VghoI+Vz9XXRZu3fk
 4IKlVayPb5Ns8jQ2nDmw9D6pa+TpLyLpmzHTfPTNjT33I05j2RgN6PYbS36GKPqI1pmY5RIU4/lZm
 1px5hEMyp/uE9gGJGh72q81jAQ6OwmYntvt6zQ1uPXsz9FwLZLKLbJ3HTZLyRtAkpRTAWxfLyd4aA
 nV3JHK9ueyewZlo6/56+ZFeS6nsuUfnR1SjfJaFAe6L+SDkXe2i2xx4UiZN9KTjuveXMeyFpD9a4W
 jb7CqUX90RTl7ljIQ7QFQbjlaFq/8pYrtjlaYZD9cAa76kXLq9Lt+qNEiZyQ6O0xcVqABr3ytlo6g
 HK2bn/xQ==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 (helo=senjougahara.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uYhzH-003mee-2n;
 Mon, 07 Jul 2025 12:18:12 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Mon, 07 Jul 2025 18:17:39 +0900
Subject: [PATCH] gpu: host1x: Fix race in syncpt alloc/free
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-host1x-syncpt-race-fix-v1-1-28b0776e70bc@nvidia.com>
X-B4-Tracking: v=1; b=H4sIALKQa2gC/x2MwQqAIBAFfyX23IIaYfQr0UHsVXuxcCOK6N+Tj
 jMw85AiC5T66qGMU1S2VMDWFcU1pAUsU2FyxrXGG8/rpoe9WO8U94NziOBZLkbT+NnCIbiOSrx
 nFP2Ph/F9PwA03d9oAAAA
X-Change-ID: 20250707-host1x-syncpt-race-fix-e337f1e2ea28
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mainak Sen <msen@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

From: Mainak Sen <msen@nvidia.com>

Fix race condition between host1x_syncpt_alloc()
and host1x_syncpt_put() by using kref_put_mutex()
instead of kref_put() + manual mutex locking.

This ensures no thread can acquire the
syncpt_mutex after the refcount drops to zero
but before syncpt_release acquires it.
This prevents races where syncpoints could
be allocated while still being cleaned up
from a previous release.

Remove explicit mutex locking in syncpt_release
as kref_put_mutex() handles this atomically.

Signed-off-by: Mainak Sen <msen@nvidia.com>
Fixes: f5ba33fb9690 ("gpu: host1x: Reserve VBLANK syncpoints at initialization")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index f63d14a57a1d950daa1a5864613d7f2fe4d04aa9..acc7d82e0585e83db2da82933ada4c817114b16e 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -345,8 +345,6 @@ static void syncpt_release(struct kref *ref)
 
 	sp->locked = false;
 
-	mutex_lock(&sp->host->syncpt_mutex);
-
 	host1x_syncpt_base_free(sp->base);
 	kfree(sp->name);
 	sp->base = NULL;
@@ -369,7 +367,7 @@ void host1x_syncpt_put(struct host1x_syncpt *sp)
 	if (!sp)
 		return;
 
-	kref_put(&sp->ref, syncpt_release);
+	kref_put_mutex(&sp->ref, syncpt_release, &sp->host->syncpt_mutex);
 }
 EXPORT_SYMBOL(host1x_syncpt_put);
 

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250707-host1x-syncpt-race-fix-e337f1e2ea28

