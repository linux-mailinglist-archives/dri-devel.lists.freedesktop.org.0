Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBA2C25F90
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF12C10EBDF;
	Fri, 31 Oct 2025 16:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="atgMkVSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17B810EBDE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761926607;
 bh=ZZAC+QeA7hh9g7MTW2UfEhBtJ0yRXTeSN6x8sHtwBsA=;
 h=From:To:Cc:Subject:Date:From;
 b=atgMkVSIx55qzK2t5IkgCwlFllOP90C0djbJn1enSoe0SAehKLGDYLEreJ0YOec4D
 Zw0rmwoMmGxpC1Imxs2dQfiBEuQJLq2ycynS99vlq6kBhzWQhpmkIxy5lbaLRTLTx4
 nCXFVR703MhPpPqjAiD26Wd2GWky+Ckla4nBbisuOnHeQ8SJPL1g/4krdVfnbevIy5
 hKCUKLl/DctvJfXHvl0xLOPIl4I389eekHo4o+s3KbEu0UgiwJ6z31Iz//UPulmllf
 2S2n02hw9Xt5fgC8tot+XRnl1T8SntZMrntFrS2JdHtOacynU+IXyKmpjiQU+iFEiU
 oX5aIEySvR3Vw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C21617E1278;
 Fri, 31 Oct 2025 17:03:27 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 1/2] drm/panthor: Handle errors returned by
 drm_sched_entity_init()
Date: Fri, 31 Oct 2025 17:03:17 +0100
Message-ID: <20251031160318.832427-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In practice it's not going to fail because we're passing the current
sanity checks done by drm_sched_entity_init(), and that's the only
reason it would return an error, but better safe than sorry.

v2:
- Add R-b

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 4216913ad7c9..33e04208db31 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3430,6 +3430,8 @@ group_create_queue(struct panthor_group *group,
 
 	drm_sched = &queue->scheduler;
 	ret = drm_sched_entity_init(&queue->entity, 0, &drm_sched, 1, NULL);
+	if (ret)
+		goto err_free_queue;
 
 	return queue;
 
-- 
2.51.0

