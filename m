Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892C32F942
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 11:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7036E4DE;
	Sat,  6 Mar 2021 10:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F344A6EBC4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:18:30 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id j12so2220085pfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 07:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h6Fj4Viizx2BGBmsHfQGTYrOkXYZevrSR8lQGMpdUjM=;
 b=Zzn0no97cwoOC3zF4gwrszFeg4S3KMZMfgyX915FEOYy7UDs6x9Y+bXKl0pmHHMVi8
 rB5DM6kzTBdOYdO5yLMlvsa347vVKZCXwaUwE/p3+6nOa3ReY4f0BOdND5MURp+th6gv
 n+SlYIiJxYPdLW9jx0x9eqeP5ylB/lR2j2wwexRpqbwkJ14JfbqPEtdZt1wFCFAm2SWL
 hngCqZa+Yq43/TvrOUusxSJu5EJCP2n8XnrwHtNTlGHTNt0ch7Opba78NM6RWb99FK41
 koox3JiKoocNjUGW3dK36sLhOmd4tKimdLUuUnSN3VobBOW1EOyFaYTHIs5gOIDi0l/8
 7X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h6Fj4Viizx2BGBmsHfQGTYrOkXYZevrSR8lQGMpdUjM=;
 b=GzGJUTpSRa78UypaBtM4t1n93PKuGop3RTLCdL0LDBs1OtdY/iqmZ2UtiJIl+l9voJ
 bm1wRDl2sSasjCg1WQ0o3x2yQWzA+pWWU+jmjTDFvmRG4xb58yfo0H4b06TpsVugLmTQ
 /7imVDFAXettRefIx9NL4OwyNWiR+Il+YnX+Earz7BTaAp9KgK37Y61HpW+SnmKe1Wkb
 nhB1DhVCALxCut0bnhLkK6G27758E8iNBJNpGtd6POZKuqKjqDksfeM+CznOijKixLQK
 d/yq884M534eBDNfDj6BC/Hm/QkTRF/SwF+vwwxKkmKbH2qzRCjMGSF5hoMpEc4otntW
 i/lg==
X-Gm-Message-State: AOAM531A22FxU+yhLZB6WeAY6GfvvlaW0mW/sOeH8ImY82cw+0QWrJXg
 bi7h7ql6E4wUfu4n6gv49Rf01LFNfRU=
X-Google-Smtp-Source: ABdhPJzAHZUgOrCndaSG6B5NlZQYEsgPevliElVvWaqH1orAcGv6M/MFP2v/8RhlFOsc3Rf0M3mnaQ==
X-Received: by 2002:aa7:92cb:0:b029:1f1:542f:2b2b with SMTP id
 k11-20020aa792cb0000b02901f1542f2b2bmr3557609pfa.31.1614957510366; 
 Fri, 05 Mar 2021 07:18:30 -0800 (PST)
Received: from localhost (104.243.28.95.16clouds.com. [104.243.28.95])
 by smtp.gmail.com with ESMTPSA id v2sm2566313pjg.34.2021.03.05.07.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:18:29 -0800 (PST)
From: xndcn <xndchn@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix possible leak/unlock virtio_gpu_object_array
Date: Fri,  5 Mar 2021 23:18:19 +0800
Message-Id: <20210305151819.14330-1-xndchn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 06 Mar 2021 10:04:47 +0000
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
Cc: airlied@linux.ie, xndchn@gmail.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio_gpu_object array is not freed or unlocked in some
failed cases.

Signed-off-by: xndcn <xndchn@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 23eb6d772e..669f2ee395 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -174,7 +174,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		if (!sync_file) {
 			dma_fence_put(&out_fence->f);
 			ret = -ENOMEM;
-			goto out_memdup;
+			goto out_unresv;
 		}
 
 		exbuf->fence_fd = out_fence_fd;
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index d69a5b6da5..4ff1ec28e6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -248,6 +248,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
 	if (ret != 0) {
+		virtio_gpu_array_put_free(objs);
 		virtio_gpu_free_object(&shmem_obj->base);
 		return ret;
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
