Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA8E4A00E0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 20:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B8910E62B;
	Fri, 28 Jan 2022 19:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B5A10E54C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 19:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643398217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SEZKuudk9FTI+7yAy64FaqZEcUXfR8+t/aDwSXBZQrU=;
 b=RmK5kGNH+YRigtBIZxnjRepmfjwXmVPaoP7flO4Wb6bgE4G9prXvLEyonWw8TM54pveyx7
 USX97sPnUPVcToJhwgvDrWgLTjYzpmOKvxpV2xGu0+9za2krkn0c8fis6iHvOOMW+Gms5O
 OS6BnHkPdHb70QKdt3DN+FCfaH94sGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-yybfL9f6PuOsydIGP4KB2A-1; Fri, 28 Jan 2022 14:30:13 -0500
X-MC-Unique: yybfL9f6PuOsydIGP4KB2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A665100C662;
 Fri, 28 Jan 2022 19:30:11 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.11.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 888275D6B1;
 Fri, 28 Jan 2022 19:30:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] Revert "drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()"
Date: Fri, 28 Jan 2022 14:29:50 -0500
Message-Id: <20220128192951.626532-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Greg KH <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 2343bcdb4747d4f418a4daf2e898b94f86c24a59.

Unfortunately, as Greg pointed out I totally missed the fact that this
patch came from a umn.edu patch. umn.edu is still banned from contributing
to the Linux kernel, so let's revert this for the time being. I'll
re-evaluate this fix myself later and send another fix if this ends up
being valid.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
index a6ea89a5d51a..667fa016496e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
@@ -142,12 +142,11 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const char *name, int ver,
 
 	hsfw->imem_size = desc->code_size;
 	hsfw->imem_tag = desc->start_tag;
-	hsfw->imem = kmemdup(data + desc->code_off, desc->code_size, GFP_KERNEL);
+	hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
+	memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
+
 	nvkm_firmware_put(fw);
-	if (!hsfw->imem)
-		return -ENOMEM;
-	else
-		return 0;
+	return 0;
 }
 
 int
-- 
2.34.1

