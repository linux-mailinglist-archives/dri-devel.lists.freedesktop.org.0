Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD4E27FB56
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81826E875;
	Thu,  1 Oct 2020 08:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE92D6E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 11:53:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e16so1474506wrm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qfj+TClPlVYbpelD2YZsoi79IQBZqKkdlSt5zFsjIAs=;
 b=XsLsT1M+AlmtzTtVzfmpzEdnlyNhgSN9Vm8/VlqSDOFx3bzC+XKoQ6tfO8635GE2tB
 K4vNvrMU0OcJbL5ljhMpoGtOKhgbOkp5FrOVTy+N0F82YWhBZHVCuDVdyGRE1fg1PgGn
 jzTp9PjGVE07lHazWB3jPXMvDMVbJU+/5UQOaU5HwqXr3dI68pK7GE043+co0vkKxtw+
 bpmODmoZ0zaZTG5p5ikahzCupx34VdUhGSItgXN754D+DE0eO5hlStfSH5xPGlO9LqwD
 kKr6RQDtIOXnWwTkySeNkk2hKiAqaWuGQT2si3rGDyPrmvi2QX8DxX5HrBD4MxCEz4hG
 BrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qfj+TClPlVYbpelD2YZsoi79IQBZqKkdlSt5zFsjIAs=;
 b=JeV1V1hxqlpdiEmb5gYzVC+ndlSVDwneHxsUMlWs7vzWduNx9/8uRej3i8DhWqoSZ/
 cHytrQ/KopvpPdFQ+rzRLnVCXFsenzNt1l7GXopIAL0mR8Z9hfRqB+hzFo8FtAk9fVfa
 anbHZ8HdBoTrpbS5tykoCrzfu8tIJ+UWbSvzTQg61cRDpqXpL+hwe4y78/emABnZxq+I
 tmD0coMv3dDccdb+wqO243pGh1P+3uCK3SPO1mIibPvoxD5Hdzvm9VHGv1jKIZW+k/IS
 Rx9h+M9CG9xiZ5b8iYZLtjG4gpuDhyNLQuVX+P0wXtYOuK7ComIV0qedtLSZu2R9MPIr
 fElQ==
X-Gm-Message-State: AOAM533WXSJVXdO+D1SLAjvYwOyIeFXZ2hDn86KQ//++IFeNykwLHnB7
 K8qUi4JmY5GK2ie56ZKaZ2oiMQ==
X-Google-Smtp-Source: ABdhPJxX79nVu9DHdEnVM3doUa5RIopeAThnQgQyTX9yOm+uhr5xThuu8COX5hYqqQapikbSC/0cAQ==
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr2696721wrr.283.1601466817417; 
 Wed, 30 Sep 2020 04:53:37 -0700 (PDT)
Received: from alex-xps13.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s12sm2222353wmd.20.2020.09.30.04.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 04:53:36 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 4/4] rpmsg: apu_rpmsg: Add an IOCTL to request IOMMU
 mapping
Date: Wed, 30 Sep 2020 13:53:50 +0200
Message-Id: <20200930115350.5272-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930115350.5272-1-abailon@baylibre.com>
References: <20200930115350.5272-1-abailon@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: ohad@wizery.com, gpain@baylibre.com, stephane.leprovost@mediatek.com,
 jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 mturquette@baylibre.com, Alexandre Bailon <abailon@baylibre.com>,
 bjorn.andersson@linaro.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the kernel is automatically doing an IOMMU memory mapping.
But we want to do it automatically for two reasons:
- to reduce the overhead of each APU operation
- to get the device address and use it as input for an operation
This adds 2 IOCTL to manually IOMMU map and unmap memory.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/rpmsg/apu_rpmsg.c      | 52 ++++++++++++++++++++++++++++++----
 include/uapi/linux/apu_rpmsg.h |  7 +++++
 2 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/apu_rpmsg.c b/drivers/rpmsg/apu_rpmsg.c
index 343bd08a859a..4c064feddf5a 100644
--- a/drivers/rpmsg/apu_rpmsg.c
+++ b/drivers/rpmsg/apu_rpmsg.c
@@ -114,7 +114,7 @@ static int apu_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int count,
 }
 
 static struct apu_buffer *apu_device_memory_map(struct rpmsg_apu *apu,
-		uint32_t fd, struct rpmsg_request *rpmsg_req)
+						uint32_t fd)
 {
 	struct rpmsg_device *rpdev = apu->rpdev;
 	struct apu_buffer *buffer;
@@ -129,10 +129,6 @@ static struct apu_buffer *apu_device_memory_map(struct rpmsg_apu *apu,
 	list_for_each_entry(buffer, &apu->buffers, node) {
 		if (buffer->fd == fd) {
 			kref_get(&buffer->refcount);
-			if (rpmsg_req)
-				list_add(&buffer->req_node,
-					 &rpmsg_req->buffers);
-
 			return buffer;
 		}
 	}
@@ -230,6 +226,44 @@ static void apu_device_memory_unmap(struct kref *ref)
 	kfree(buffer);
 }
 
+static int apu_iommu_mmap_ioctl(struct rpmsg_apu *apu, void __user *argp)
+{
+	struct apu_iommu_mmap apu_iommu_mmap;
+	struct apu_buffer *buffer;
+	int ret;
+
+	if (copy_from_user(&apu_iommu_mmap, argp, sizeof(apu_iommu_mmap)))
+		return -EFAULT;
+
+	buffer = apu_device_memory_map(apu, apu_iommu_mmap.fd);
+	if (!buffer)
+		return -ENOMEM;
+
+	apu_iommu_mmap.da = buffer->iova;
+	if (copy_to_user(argp, &apu_iommu_mmap, sizeof(apu_iommu_mmap)))
+		ret = -EFAULT;
+
+	return 0;
+}
+
+static int apu_iommu_munmap_ioctl(struct rpmsg_apu *apu, void __user *argp)
+{
+	u32 fd;
+	struct apu_buffer *buffer, *tmp;
+
+	if (copy_from_user(&fd, argp, sizeof(fd)))
+		return -EFAULT;
+
+	list_for_each_entry_safe(buffer, tmp, &apu->buffers, node) {
+		if (buffer->fd == fd) {
+			kref_put(&buffer->refcount, apu_device_memory_unmap);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int apu_send_request(struct rpmsg_apu *apu,
 			    struct apu_request *req)
 {
@@ -266,7 +300,7 @@ static int apu_send_request(struct rpmsg_apu *apu,
 
 	INIT_LIST_HEAD(&rpmsg_req->buffers);
 	for (i = 0; i < req->count; i++) {
-		buffer = apu_device_memory_map(apu, fd[i], rpmsg_req);
+		buffer = apu_device_memory_map(apu, fd[i]);
 		if (IS_ERR(buffer)) {
 			ret = PTR_ERR(buffer);
 			goto err_free_memory;
@@ -417,6 +451,12 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 		}
 		spin_unlock_irqrestore(&apu->ctx_lock, flags);
 
+		break;
+	case APU_IOMMU_MMAP:
+		ret = apu_iommu_mmap_ioctl(apu, argp);
+		break;
+	case APU_IOMMU_MUNMAP:
+		ret = apu_iommu_munmap_ioctl(apu, argp);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/include/uapi/linux/apu_rpmsg.h b/include/uapi/linux/apu_rpmsg.h
index f61207520254..e9b841dcbcb4 100644
--- a/include/uapi/linux/apu_rpmsg.h
+++ b/include/uapi/linux/apu_rpmsg.h
@@ -31,10 +31,17 @@ struct apu_request {
 	__u8 data[0];
 };
 
+struct apu_iommu_mmap {
+	__u32 fd;
+	__u32 da;
+};
+
 /* Send synchronous request to an APU */
 
 #define APU_SEND_REQ_IOCTL		_IOW(0xb7, 0x2, struct apu_request)
 #define APU_GET_NEXT_AVAILABLE_IOCTL	_IOR(0xb7, 0x3, __u16)
 #define APU_GET_RESP			_IOWR(0xb7, 0x4, struct apu_request)
+#define APU_IOMMU_MMAP			_IOWR(0xb7, 0x5, struct apu_iommu_mmap)
+#define APU_IOMMU_MUNMAP		_IOWR(0xb7, 0x6, __u32)
 
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
