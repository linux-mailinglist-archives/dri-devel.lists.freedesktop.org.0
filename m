Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A70B1F304
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 10:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A208410E271;
	Sat,  9 Aug 2025 08:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="ZrO0BGTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.iitb.ac.in (smtpd7.iitb.ac.in [103.21.126.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68010E271
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 08:00:22 +0000 (UTC)
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
 by smtp1.iitb.ac.in (Postfix) with SMTP id 79574101C944
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 13:30:18 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 79574101C944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
 t=1754726418; bh=zisvSLce1+aXq35EDvfK2Fr8uFmjstmeaklYSS/7hDw=;
 h=Date:From:To:Cc:Subject:From;
 b=ZrO0BGTMl4F1Qy/Pq0xjwIaCEW6Guu3oqd8gyl96uLkGcOyg+Xk5P2jEI3P4PmTWa
 8fS1xT93Pt6HlnaPBgEgHNHej7qTy5H8+4PmG5AnvbighmHPtaydAbQbGCSiyIrsOM
 2lTztwO/YGwZfKvzkkpqS1hb9R3V1rp0MXerpusc=
Received: (qmail 21441 invoked by uid 510); 9 Aug 2025 13:30:18 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from
 <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 0.653874 secs;
 09 Aug 2025 13:30:18 +0530
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on ldns1.iitb.ac.in
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=IITB_ORIG,PROPER_IITB_MSGID,
 T_RP_MATCHES_RCVD autolearn=disabled version=3.4.1
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
 by ldns1.iitb.ac.in with SMTP; 9 Aug 2025 13:30:17 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 by ldns1.iitb.ac.in (Postfix) with ESMTP id 25615360083;
 Sat,  9 Aug 2025 13:30:17 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 (Authenticated sender: akhilesh)
 by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id E483C1E8138A;
 Sat,  9 Aug 2025 13:30:16 +0530 (IST)
Date: Sat, 9 Aug 2025 13:30:11 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 bskeggs@redhat.com, kherbst@redhat.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
 skhan@linuxfoundation.org
Subject: [PATCH] drm: nouveau: fifo: ga100: fix null pointer dereferences
Message-ID: <aJcACwrvcjCq78eH@bhairav-test.ee.iitb.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Fix potential NULL pointer dereference in ga100_fifo_nonstall_allow()
and ga100_fifo_nonstall_block() when nvkm_runl_get() returns NULL.
Fix CVE-476 as reported by coverity tool (CID: 1660771)

Fixes: 55e1a5996085 ("drm/nouveau/fifo/ga100-: add per-runlist nonstall intr handling")
Addresses-Coverity-ID: 1660771
Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
index e74493a4569e..a441fb602f28 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
@@ -520,7 +520,9 @@ ga100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
 	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
 	struct nvkm_runl *runl = nvkm_runl_get(fifo, index, 0);
 
-	nvkm_inth_block(&runl->nonstall.inth);
+	WARN_ON(!runl);
+	if (runl)
+		nvkm_inth_block(&runl->nonstall.inth);
 }
 
 static void
@@ -529,7 +531,9 @@ ga100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
 	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
 	struct nvkm_runl *runl = nvkm_runl_get(fifo, index, 0);
 
-	nvkm_inth_allow(&runl->nonstall.inth);
+	WARN_ON(!runl);
+	if (runl)
+		nvkm_inth_allow(&runl->nonstall.inth);
 }
 
 const struct nvkm_event_func
-- 
2.34.1

