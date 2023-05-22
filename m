Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C970CAC1
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4955110E37C;
	Mon, 22 May 2023 20:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725BE10E37C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684786725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O9q1qCwNu3Mrx87IGOjeTMvMrxO9D4Con5QINyscbnk=;
 b=Ijh/Cy8Yq2mEWhlx9zE2hmCg+7OgpOTV6bXt17cH9g+CCvGqk96hOuxmjY2b6tKk08ufXU
 YcsR/DrN+pi4b1KMG+nOKgZKm7ISlz+Jyhh+Fa0GhZTM4XJitLtBMf7HJZji/Vfb/BIy1i
 FsHThOBi1duPH5HO9PLMErFRqouGGys=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-T29V0OqmOY2tfxZAxvyRhA-1; Mon, 22 May 2023 16:18:44 -0400
X-MC-Unique: T29V0OqmOY2tfxZAxvyRhA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-625891d5ad5so1590476d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786723; x=1687378723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O9q1qCwNu3Mrx87IGOjeTMvMrxO9D4Con5QINyscbnk=;
 b=l2k6Lrh5Thntswh1LGe6qeePMkU2RE6v81taGBVhL4IQ/FmiZnkvW6GNuGqbcx86kW
 T/hRd9StXlPvSbFkyOayC7eylxiUHHXaFH3XmtecqckzWsCweMT4gfBKkS1om5bTtNgV
 WuJNrLXFxnI6Q0ryf8s+v6n1YxnJIoNk3pOrPGjFI0KF5rCp/AwZRHnpBMKlQmuWN92S
 Fk35Bg7Z5K0v9Ts2GOuIqMdvzWKbVtimqeZbM28n2ngo5PCX7atqeQep+hVbRdjb1KHa
 1//9mjpnR35K6p1EW1BrOunrobgO39Lednacr7MBx19uFXrtLuo+c36EmkspljPLdK1P
 C7lQ==
X-Gm-Message-State: AC+VfDyBKO/Qb/019ufw3800gpju60T+fc5FIui+El8EdOJhU29lBplU
 e84sW9ySAr4uYC8F/kA9ol2+oEKC+DOvxwiPR9dk4iGFBndI3aKdTQ0PnDurs459ilX7zeNYZ0d
 ZyEoK+dZxKmKU0+nPKOEy/ft9666N
X-Received: by 2002:a05:6214:400f:b0:625:86ed:8ab4 with SMTP id
 kd15-20020a056214400f00b0062586ed8ab4mr4376378qvb.3.1684786723528; 
 Mon, 22 May 2023 13:18:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fUAFOMh8GoM7ZLqKEyQV3CmmIqRVsI4seXXB/Q3bmVY+dOhM/G3gUw77RysfQOiQm3Y6Waw==
X-Received: by 2002:a05:6214:400f:b0:625:86ed:8ab4 with SMTP id
 kd15-20020a056214400f00b0062586ed8ab4mr4376368qvb.3.1684786723299; 
 Mon, 22 May 2023 13:18:43 -0700 (PDT)
Received: from kherbst.pingu (ip1f1032e8.dynamic.kabel-deutschland.de.
 [31.16.50.232]) by smtp.gmail.com with ESMTPSA id
 i10-20020a0cfcca000000b006255bcfca88sm1688836qvq.7.2023.05.22.13.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:18:42 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/acr: Abort loading ACR if no firmware was found
Date: Mon, 22 May 2023 22:18:38 +0200
Message-Id: <20230522201838.1496622-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes a NULL pointer access inside nvkm_acr_oneinit in case necessary
firmware files couldn't be loaded.

Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/212
Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
index 795f3a649b12..6388234c352c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
@@ -224,7 +224,7 @@ nvkm_acr_oneinit(struct nvkm_subdev *subdev)
 	u64 falcons;
 	int ret, i;
 
-	if (list_empty(&acr->hsfw)) {
+	if (list_empty(&acr->hsfw) || !acr->func->wpr_layout) {
 		nvkm_debug(subdev, "No HSFW(s)\n");
 		nvkm_acr_cleanup(acr);
 		return 0;
-- 
2.40.1

