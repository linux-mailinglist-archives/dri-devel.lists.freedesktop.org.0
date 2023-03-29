Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062796CF6C1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 01:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBBF10E184;
	Wed, 29 Mar 2023 23:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7CF10E184
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 23:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680131660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RDa5o+kZyCZFoDwvixD+yMC8DGY8pjS5wLyVr2om2qE=;
 b=KaZV5i3OdS6FNH32Ay4eCjMY3ZXA00k3GlaT6mZW+qkDC81QDzQUwtDg8klQk52l/Ftdp8
 mTfmg2f6uUKt2tMPjr0Eiy4dvcPJPA/sGLX2C6K/Lo4dhCtBlCaJFhKEsLvhVbkhaDjemD
 RfKj70PRAZPPt8kTt7Qdk4OgXSEeez0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-iBlf7S5bOiO8WxJwoR6SIg-1; Wed, 29 Mar 2023 19:14:13 -0400
X-MC-Unique: iBlf7S5bOiO8WxJwoR6SIg-1
Received: by mail-qk1-f198.google.com with SMTP id
 203-20020a370ad4000000b00746981f8f4bso8140075qkk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680131652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RDa5o+kZyCZFoDwvixD+yMC8DGY8pjS5wLyVr2om2qE=;
 b=0bcLDU9bUGZBXPZ+6wHhsCsPRR0XVpfHwfeSyzd5bVmmNpEjULMzvcgRvvgImhq4Jt
 OkwwNV4ACS5NZkq+bMSv/LCyQ+2Z34QCS9CFjk45dOkJqAoxEXO2Qtn6yrYUioTeIcdx
 h+OozNzmUg8uhj7RsJw8afZYuT7PjTAOdPkw2pu9GY66ddNHtkaQ8jIAEcIL/+e8ZcnU
 vY0HP+oHFie8aaJIGmd9fESautXqv37C0XxtRurJkTs4IZCCqWBM6aAAobiNb3Mn+cBn
 9cnKcZJBoO/4asMo2QF9xrmsJXVzv7+HarYy495iVWCpXlnLJvlE02HNmYOcKLo5FYgj
 gcNw==
X-Gm-Message-State: AO0yUKV1UpFq1Gz4aOgroeagwLxdpexf9RZ5tqQe4VYaEfGDiiAsKUHQ
 Dp4vEGjvLOR1yJH5Dk3VOpEimO5sxZ+xDa2JTrlkE1x0YGn6056rj5XZoUntcgvY5ODqY9Jf+z4
 6o20dGSObOJc6B9s45l9QL0F1D+oKWvkyMnm3
X-Received: by 2002:a05:622a:53:b0:3bf:c3e8:c19b with SMTP id
 y19-20020a05622a005300b003bfc3e8c19bmr39717913qtw.22.1680131652537; 
 Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set9FAlt8CkZ7gP0dtRURdKafeSyXrPgA0ctSwHl2YRdMc9jHIn4kx1HtMkkz0/D/w1j49owN7A==
X-Received: by 2002:a05:622a:53:b0:3bf:c3e8:c19b with SMTP id
 y19-20020a05622a005300b003bfc3e8c19bmr39717885qtw.22.1680131652329; 
 Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 x16-20020ae9e910000000b007435a646354sm12246105qkf.0.2023.03.29.16.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com
Subject: [PATCH] drm/nouveau/svm: remove unused ret variable
Date: Wed, 29 Mar 2023 19:14:07 -0400
Message-Id: <20230329231407.1816570-1-trix@redhat.com>
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
drivers/gpu/drm/nouveau/nouveau_svm.c:929:6: error: variable
  'ret' set but not used [-Werror,-Wunused-but-set-variable]
        int ret;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a74ba8d84ba7..e072d610f2f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -926,15 +926,14 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
 		 unsigned long addr, u64 *pfns, unsigned long npages)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
-	int ret;
 
 	args->p.addr = addr;
 	args->p.size = npages << PAGE_SHIFT;
 
 	mutex_lock(&svmm->mutex);
 
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
-				struct_size(args, p.phys, npages), NULL);
+	nvif_object_ioctl(&svmm->vmm->vmm.object, args,
+			  struct_size(args, p.phys, npages), NULL);
 
 	mutex_unlock(&svmm->mutex);
 }
-- 
2.27.0

