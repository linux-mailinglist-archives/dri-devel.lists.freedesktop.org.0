Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD62B7118D2
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 23:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3390E10E769;
	Thu, 25 May 2023 21:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352E310E768
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685049048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tDnyD1Q+TvZD8RBnYsiyH5gRK/DXU5xMZC5lqC7VcXs=;
 b=hM/mnt9at0ZBdh2FYfiBBvq3A2fDl29aK8OMETJwzUsf1geE4dUZYAiygkmNBqi2ApusAO
 qfr7JZHuE6Fzqh3wtTlmVdhouh70dsK5M+Dli/NRnqPeFZUKGalzdlWifYTXb65/GBaixh
 /7Xkk9zbCcV13WmfuHaQ7c688YK4Lbo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-CLLVwZcIOLC0PIJez2bEbw-1; Thu, 25 May 2023 17:10:47 -0400
X-MC-Unique: CLLVwZcIOLC0PIJez2bEbw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3f522fa084bso14309341cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 14:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685049046; x=1687641046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tDnyD1Q+TvZD8RBnYsiyH5gRK/DXU5xMZC5lqC7VcXs=;
 b=i9P+eVzW8sNVSPWJrDlcoEPGOs0+6YD7meJDlqBm8heJOX6XXZHuVauXjeTJsoeFHo
 b758m4njWd2AAG7OEbCtCZaieRM/vl/i6S8YdjUgIjh79AtiMG1w7pZtKWqZwa3DjaML
 jD+WjrkcCq9nCiUSSFRw5HCn0r1/0dRs9/F4tqXwqFI7cx/R5YMz8OjsdPpvMzFjM5c9
 f6ET5ujC3j/erBaVcdjWYDRE8zdin+H3gT81hDJ3kO+WxbfKSKFuxu0NIupWh4hw0siz
 rDRAZvy7C0qorcL9oxVlAQNAD2BmxK0fnwFoYPlXHd+GUt1Z0LlTxeUDTSeDW3QqNQnn
 J/GQ==
X-Gm-Message-State: AC+VfDxqvV7SB6CQwhsJ11BKsIKAgemOZ+pLgPesnAGxY5Rcc5Ie4MEn
 rY06S54cPE9zSWaColS1nf/Eig4KhfGthca0mPkPstKaC0h6ZOvDzDfTVKi2W7VMNbwzs7lcHuP
 zJn2knP2tuYpHvoUehLK3kcpckgms
X-Received: by 2002:ac8:5acf:0:b0:3e3:7e6f:423c with SMTP id
 d15-20020ac85acf000000b003e37e6f423cmr1017688qtd.34.1685049046280; 
 Thu, 25 May 2023 14:10:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tZiuI8gD3Aif7n+Bf8DUaassrUnfxP6XFasaXNKtLHxyDyblw20JldsbFKRXFeXMklWQvIQ==
X-Received: by 2002:ac8:5acf:0:b0:3e3:7e6f:423c with SMTP id
 d15-20020ac85acf000000b003e37e6f423cmr1017674qtd.34.1685049046045; 
 Thu, 25 May 2023 14:10:46 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 br5-20020a05622a1e0500b003ef5dc13bbbsm702340qtb.85.2023.05.25.14.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 14:10:45 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Subject: [PATCH] drm/nouveau/acr: remove unused variable loc
Date: Thu, 25 May 2023 17:10:40 -0400
Message-Id: <20230525211040.3233982-1-trix@redhat.com>
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
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: error: variable
  ‘loc’ set but not used [-Werror=unused-but-set-variable]
  221 |                 u32 loc, sig, cnt, *meta;
      |                     ^~~
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
index f36a359d4531..bd104a030243 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
@@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
 		const struct firmware *hsbl;
 		const struct nvfw_ls_hsbl_bin_hdr *hdr;
 		const struct nvfw_ls_hsbl_hdr *hshdr;
-		u32 loc, sig, cnt, *meta;
+		u32 sig, cnt, *meta;
 
 		ret = nvkm_firmware_load_name(subdev, path, "hs_bl_sig", ver, &hsbl);
 		if (ret)
@@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
 		hdr = nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
 		hshdr = nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->header_offset);
 		meta = (u32 *)(hsbl->data + hshdr->meta_data_offset);
-		loc = *(u32 *)(hsbl->data + hshdr->patch_loc);
 		sig = *(u32 *)(hsbl->data + hshdr->patch_sig);
 		cnt = *(u32 *)(hsbl->data + hshdr->num_sig);
 
-- 
2.27.0

