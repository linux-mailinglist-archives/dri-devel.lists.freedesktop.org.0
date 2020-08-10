Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E5024123B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 23:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A94D6E10F;
	Mon, 10 Aug 2020 21:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2BE6E10F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 21:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597094392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2lrokUfoGQAhbbN5B0q4Eo9DnItokSH8gIcb/T1Xy8=;
 b=OGJvF0QR5zCy1gEla/O9Krwb48ytRK5BLrV3oaxwf7D2SAgftPSs1WSvTxW7eb7Z4QmF6h
 G6QP/d7UajwplS+/fgk10qh7kqT2Wl+VYEpBVRwzUyyVsXybebiV9G1N+7ns7iZykH1350
 Hr9WAQmkGpL9cvz6EX+LHqWGqqD054g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-OUZDo_1aPkmYw61eUWUvDw-1; Mon, 10 Aug 2020 17:18:47 -0400
X-MC-Unique: OUZDo_1aPkmYw61eUWUvDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7D351005510;
 Mon, 10 Aug 2020 21:18:45 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5645779CF3;
 Mon, 10 Aug 2020 21:18:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] drm/nouveau/kms/nv140-: Include correct push header in
 crcc37d.c
Date: Mon, 10 Aug 2020 17:18:37 -0400
Message-Id: <20200810211838.37862-2-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like when we converted everything over to Nvidia's class headers,
we mistakenly included the nvif/push507b.h instead of nvif/pushc37b.h,
which resulted in breaking CRC reporting for volta+:

nouveau 0000:1f:00.0: disp: chid 0 stat 10003361 reason 3
[RESERVED_METHOD] mthd 0d84 data 00000000 code 00000000
nouveau 0000:1f:00.0: disp: chid 0 stat 10003360 reason 3
[RESERVED_METHOD] mthd 0d80 data 00000000 code 00000000
nouveau 0000:1f:00.0: DRM: CRC notifier ctx for head 3 not finished
after 50ms

So, fix that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: c4b27bc8682c ("drm/nouveau/kms/nv50-: convert core crc_set_src() to new push macros")
---
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
index 9afe9a87bde0c..814e5bd974460 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -6,7 +6,7 @@
 #include "disp.h"
 #include "head.h"
 
-#include <nvif/push507c.h>
+#include <nvif/pushc37b.h>
 
 #include <nvhw/class/clc37d.h>
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
