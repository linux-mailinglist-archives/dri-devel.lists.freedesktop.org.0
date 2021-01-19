Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA682FAE74
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 02:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EAB6E7E5;
	Tue, 19 Jan 2021 01:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033546E7E5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 01:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611021059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhplpPi62QtKSyOrt8eib3kZiYCWA8EZODBDlzkjX3E=;
 b=W0AmTOXfP5/XnUc0IwtMHMh1I4jkYMrdanR7vbZOteEunfa7c6EVKfKbuREWM0+qR7UNUd
 JhEwRiJS6Ef8mPu0nQqsJKorikdjIejQYktuxTM82f3sBusv7mJ2/bNMj7Es6knGvzD2PJ
 Y6BntYbwxxqqw7XaVh9x0Wh+7fy9nc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496--q8jgChoNZeBHdcWSd0HFw-1; Mon, 18 Jan 2021 20:50:57 -0500
X-MC-Unique: -q8jgChoNZeBHdcWSd0HFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E554F1005504;
 Tue, 19 Jan 2021 01:50:55 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-206.rdu2.redhat.com
 [10.10.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D492B1F471;
 Tue, 19 Jan 2021 01:50:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 5/5] drm/nouveau/kms/nv140-: Add CRC methods to
 gv100_disp_core_mthd_head
Date: Mon, 18 Jan 2021 20:48:49 -0500
Message-Id: <20210119014849.2509965-6-lyude@redhat.com>
In-Reply-To: <20210119014849.2509965-1-lyude@redhat.com>
References: <20210119014849.2509965-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed this while trying to figure out the bit that we need to set in
order to get cursor CRCs to come up correctly on volta+: we never actually
went and added these methods to gv100_disp_core_mthd_head in
drm/nouveau/nvkm/engine/disp/coregv100.c which means we don't trace their
values when disp tracing is enabled in nvkm. So, fix that.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
index e20a48f201f6..448a515057c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
@@ -106,6 +106,8 @@ gv100_disp_core_mthd_head = {
 		{ 0x20a4, 0x6820a4 },
 		{ 0x20a8, 0x6820a8 },
 		{ 0x20ac, 0x6820ac },
+		{ 0x2180, 0x682180 },
+		{ 0x2184, 0x682184 },
 		{ 0x218c, 0x68218c },
 		{ 0x2194, 0x682194 },
 		{ 0x2198, 0x682198 },
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
