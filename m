Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407769379D3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 17:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1435410E94C;
	Fri, 19 Jul 2024 15:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HFt+jClm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD61E10E94C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721402777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=f6d0hXH4uLkiXaZ4xSn07DWYcvQaiD8KGm9d+DE/JVs=;
 b=HFt+jClmkBbrM9EBiq8aI0UQA9aWClEls4/WqsNBwBVymEUd2Y+DUw0yPCTXNQD5z0h+/I
 jfh1ETsdmHwztnBtYielm03D0JMY+cKUFttE8V90ZsnxUzF0yI3GP1bDX/J40n7EgOAQOR
 u9wLn/KHTjgVA9jGfsk4lRoIx9ivzjk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-568-cUiENI3kM0aTQrqC_bjUsA-1; Fri,
 19 Jul 2024 11:26:12 -0400
X-MC-Unique: cUiENI3kM0aTQrqC_bjUsA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B62CB1955D4E; Fri, 19 Jul 2024 15:26:09 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.18])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5AB361955F40; Fri, 19 Jul 2024 15:26:05 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Knop Ryszard <ryszard.knop@intel.com>
Subject: [PATCH] mtd: mtdoops: Fix kmsgdump parameter renaming.
Date: Fri, 19 Jul 2024 17:24:13 +0200
Message-ID: <20240719152542.1554440-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

When the kmsg_dumper callback parameter changed, the reason variable
in mtdoops_do_dump() was not updated accordingly.
This breaks the build with mtdoops.

Fixes: e1a261ba599e ("printk: Add a short description string to kmsg_dump()")
Reported-by: Knop Ryszard <ryszard.knop@intel.com>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

The offended commit is in the drm-misc tree, because it was needed
by drm_panic. So I will push the fix there too.

 drivers/mtd/mtdoops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 86d49db9196d..7bf3777e1f13 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -305,7 +305,7 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 	struct kmsg_dump_iter iter;
 
 	/* Only dump oopses if dump_oops is set */
-	if (reason == KMSG_DUMP_OOPS && !dump_oops)
+	if (detail->reason == KMSG_DUMP_OOPS && !dump_oops)
 		return;
 
 	kmsg_dump_rewind(&iter);
@@ -317,7 +317,7 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 			     record_size - sizeof(struct mtdoops_hdr), NULL);
 	clear_bit(0, &cxt->oops_buf_busy);
 
-	if (reason != KMSG_DUMP_OOPS) {
+	if (detail->reason != KMSG_DUMP_OOPS) {
 		/* Panics must be written immediately */
 		mtdoops_write(cxt, 1);
 	} else {

base-commit: 26dbffb2a4c4d4639c7b336f6b74a437c23dadd4
-- 
2.45.2

