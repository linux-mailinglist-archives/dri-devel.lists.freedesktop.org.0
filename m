Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3550E241238
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 23:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0707089F77;
	Mon, 10 Aug 2020 21:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F87D89F77
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 21:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597094331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kW9eqzFeo7XlW3/tLhwNHZrS1FoKXiUbx92pJ7Yvqb0=;
 b=O1cvZF9iM/tjZtsfmxcg1lYqqsuZhFeR/32cBg0JubyfySqTp11TlY20yinXqzgEyyAqGY
 dCKl+naqJIcAncQhxFDQCHFIm3RSgHFTXcZXPcuAE3oUsPaUcIUzfqXQkhURY+W58XYZNz
 9PG+6vC9RzTy1TvtWfWp7o8MI4W/k90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-WAWVdh2YMMe-UXPgslRwkg-1; Mon, 10 Aug 2020 17:18:49 -0400
X-MC-Unique: WAWVdh2YMMe-UXPgslRwkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A22A1009600;
 Mon, 10 Aug 2020 21:18:47 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C232979CF3;
 Mon, 10 Aug 2020 21:18:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 2/2] drm/nouveau/kms/nv50-: Don't call HEAD_SET_CRC_CONTROL in
 head907d_mode()
Date: Mon, 10 Aug 2020 17:18:38 -0400
Message-Id: <20200810211838.37862-3-lyude@redhat.com>
In-Reply-To: <20200810211838.37862-1-lyude@redhat.com>
References: <20200810211838.37862-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was a mistake that was present before, but never got noticed until
we converted over to using nvidia's class headers for display
programming. Luckily though it never caused any problems, since we
always end up calling crc907d_set_src() after head907d_mode().

So, let's get rid of this.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/head907d.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head907d.c b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
index 8f860e9c52247..85648d790743f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
@@ -322,7 +322,7 @@ head907d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 	const int i = head->base.index;
 	int ret;
 
-	if ((ret = PUSH_WAIT(push, 14)))
+	if ((ret = PUSH_WAIT(push, 13)))
 		return ret;
 
 	PUSH_MTHD(push, NV907D, HEAD_SET_OVERSCAN_COLOR(i),
@@ -353,14 +353,7 @@ head907d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 	PUSH_MTHD(push, NV907D, HEAD_SET_DEFAULT_BASE_COLOR(i),
 		  NVVAL(NV907D, HEAD_SET_DEFAULT_BASE_COLOR, RED, 0) |
 		  NVVAL(NV907D, HEAD_SET_DEFAULT_BASE_COLOR, GREEN, 0) |
-		  NVVAL(NV907D, HEAD_SET_DEFAULT_BASE_COLOR, BLUE, 0),
-
-				HEAD_SET_CRC_CONTROL(i),
-		  NVDEF(NV907D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
-		  NVDEF(NV907D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
-		  NVDEF(NV907D, HEAD_SET_CRC_CONTROL, TIMESTAMP_MODE, FALSE) |
-		  NVDEF(NV907D, HEAD_SET_CRC_CONTROL, PRIMARY_OUTPUT, NONE) |
-		  NVDEF(NV907D, HEAD_SET_CRC_CONTROL, SECONDARY_OUTPUT, NONE));
+		  NVVAL(NV907D, HEAD_SET_DEFAULT_BASE_COLOR, BLUE, 0));
 
 	PUSH_MTHD(push, NV907D, HEAD_SET_PIXEL_CLOCK_FREQUENCY(i),
 		  NVVAL(NV907D, HEAD_SET_PIXEL_CLOCK_FREQUENCY, HERTZ, m->clock * 1000) |
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
