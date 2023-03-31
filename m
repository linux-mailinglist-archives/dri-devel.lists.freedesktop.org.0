Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6856D298E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 22:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA7310E1F0;
	Fri, 31 Mar 2023 20:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8B410E1F0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 20:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680295335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dpVbBRCiJ4We7LHm9u8gIxfqs0WEGOfu+33bncRZNio=;
 b=haFJkNwPItkcxwZgeXKoN0CaBppjIeYBoBJQP0JRgurjTGlWmGZAtEws4/8X5DeOc30jd1
 eq/32GGWMuqjOhJGBN05HRQ6J3Etstki4hwh9le7cT/85MD7p+YUbjFQSCgBIqzE3n4Tmr
 JyMW30wKH+wE0kIO0cCs++er/Ls2FeY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-0SbbFDk8OLaKQ06bC9GjOA-1; Fri, 31 Mar 2023 16:42:14 -0400
X-MC-Unique: 0SbbFDk8OLaKQ06bC9GjOA-1
Received: by mail-qk1-f199.google.com with SMTP id
 c80-20020ae9ed53000000b007468c560e1bso11139500qkg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 13:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680295333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dpVbBRCiJ4We7LHm9u8gIxfqs0WEGOfu+33bncRZNio=;
 b=hrfeXKi6K1yerW6iBIRG9Bakj6TH6J3TmMhPALMBFOblu1V8N5AKCc2+FKlirlxaeG
 0GvLCUiLZdbUWfGJHYdjB5nSwaCoo4oRmajpWDJ1BUknJp7RS4IGg0Ht4EIIuhvZ6CX7
 uP/b4ipgtPjC508KFQ/F6klVcEYgArpN7kI7HflHy6ekI5Vh8XDBiActLNXTugbUTDKj
 DWb+MhwXclgkV8XLjTLkbxp4EVu+dR6KmW3U/1MmLnH2xKw+jq1bmm5LSkgBI2gabrKo
 ngGYpVcr/FKrNMPjiOrxsCrt1QF/pArSwO2M4YySALYK4JDM3sitgO2yuru+NEUXzjec
 uGgA==
X-Gm-Message-State: AO0yUKVLJjGw2I2K6zXmi1hZkTg1/oUWkACYniueK/uq4rIvcNuJowBo
 28bp127GPicxoi3Voumzdzv7wXg/lXSzMe5HCmJM2Wp2c5TQZUINUqVCpQK/lxAKz3Ba9Ia/ZG0
 z0bPCKZbqF+1vfauqhlfaB3fK8msK
X-Received: by 2002:a05:622a:1d5:b0:3b8:6ae9:b107 with SMTP id
 t21-20020a05622a01d500b003b86ae9b107mr45596234qtw.17.1680295333575; 
 Fri, 31 Mar 2023 13:42:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set/mIthcjf+qNMnYSZIwwm7EuAYx4smtbfumckwe21E1gR7bqyHXH49VRfud0h3afzJGf56gqA==
X-Received: by 2002:a05:622a:1d5:b0:3b8:6ae9:b107 with SMTP id
 t21-20020a05622a01d500b003b86ae9b107mr45596209qtw.17.1680295333331; 
 Fri, 31 Mar 2023 13:42:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 r194-20020a3744cb000000b007465ee178a3sm910309qka.96.2023.03.31.13.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 13:42:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, gsamaiya@nvidia.com
Subject: [PATCH] drm/nouveau/acr: remove unused loc variable
Date: Fri, 31 Mar 2023 16:42:09 -0400
Message-Id: <20230331204209.1863060-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:7: error: variable
  'loc' set but not used [-Werror,-Wunused-but-set-variable]
                u32 loc, sig, cnt, *meta;
                    ^
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

