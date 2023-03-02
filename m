Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C798E6A8293
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 13:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C992F10E168;
	Thu,  2 Mar 2023 12:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1791610E168
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 12:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677761313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qWubdolcTPcYZMWRbItbBs4vyBxRKmavcU+qlGC7gI4=;
 b=eUvQLSgB4lvqePnLEFQZ2ozTi8sM5Y2G5USsHBAQ7dfRi+atOurZ6D6G7OIkfTTDqMzWul
 benvq65FrMeJwjFAu+2QCxN0SEBU5r5OJMCrjl9IlF8Tsg0TQHmd0G+ittgq7xudrx2RHj
 ZS0lQmo69ccVfdWUIyVyTS/4KhIXVNY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-RLVOQpwCPpa-rRgOI-EuMQ-1; Thu, 02 Mar 2023 07:48:31 -0500
X-MC-Unique: RLVOQpwCPpa-rRgOI-EuMQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 lt7-20020a056214570700b0057290f3623eso8675945qvb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 04:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677761311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qWubdolcTPcYZMWRbItbBs4vyBxRKmavcU+qlGC7gI4=;
 b=WJC1XFQK8k0hEA4fHGhKyAytBlddJ4wvQ24GGVqFRs1Y90gzBpFeFcNgny7rcvJksS
 x3MYLuVzJ6w5aoSTLKQabwLuzRNTgDCeRbcZTy67Odgca0qnGpnSwqO/YM7yOMrk8xyT
 ZTXJGtxHTPQP6KXOLjnUuHf1D2rqbVUMS8JTMD+xRGnQ4rwv93BDv3Vz9TouXwBkVb9P
 3SoZgw6qq9Cx3Ywu/BeKIlDVO2eQe9FfFx0AVcDhLSBDmAo1HzrYJZmDSiarh5NCatQC
 VdHnhGUbqlQ0tY7H0wEATj7A88YWURelNReg1eO4w4xbkIXkZnacU/ayWAOO5UrJ37cK
 8Eaw==
X-Gm-Message-State: AO0yUKXWevjErQzA6bBFAUzwC/xr5p0EguraX1+dr4eFd3r4GqASKvw7
 SqaswSoX8Nhmk+KKup/xlb8skMKJfequZNzNYJ0Zcw/S6S3Z2ykTW+HfhgVHJfwobhmDZhIQko1
 jSBNVDj1PlBQoVYW0AUU3TbCFv4gp
X-Received: by 2002:a05:622a:5cf:b0:3bf:db54:b622 with SMTP id
 d15-20020a05622a05cf00b003bfdb54b622mr17085764qtb.30.1677761311193; 
 Thu, 02 Mar 2023 04:48:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9I+TSl84uLi9L/hA047N42TNQ2RbkOPTsi+FcB8UwVS5/djJiPNP8Zc/AXLoClAtyGqLq6XA==
X-Received: by 2002:a05:622a:5cf:b0:3bf:db54:b622 with SMTP id
 d15-20020a05622a05cf00b003bfdb54b622mr17085737qtb.30.1677761310938; 
 Thu, 02 Mar 2023 04:48:30 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac801c9000000b003bfd8e2ab40sm7585267qtg.16.2023.03.02.04.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:48:30 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Subject: [PATCH] drm/nouveau/nvfw/acr: set wpr_generic_header_dump
 storage-class-specifier to static
Date: Thu,  2 Mar 2023 07:48:19 -0500
Message-Id: <20230302124819.686469-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: error: no previous
  prototype for ‘wpr_generic_header_dump’ [-Werror=missing-prototypes]
   49 | wpr_generic_header_dump(struct nvkm_subdev *subdev,
      | ^~~~~~~~~~~~~~~~~~~~~~~

wpr_generic_header_dump is only used in acr.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
index 83a9c48bc58c..7ac90c495737 100644
--- a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
@@ -45,7 +45,7 @@ wpr_header_v1_dump(struct nvkm_subdev *subdev, const struct wpr_header_v1 *hdr)
 	nvkm_debug(subdev, "\tstatus        : %d\n", hdr->status);
 }
 
-void
+static void
 wpr_generic_header_dump(struct nvkm_subdev *subdev, const struct wpr_generic_header *hdr)
 {
 	nvkm_debug(subdev, "wprGenericHeader\n");
-- 
2.27.0

