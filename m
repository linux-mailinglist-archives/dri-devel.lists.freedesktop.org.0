Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63D624B78
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 21:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A241E10E821;
	Thu, 10 Nov 2022 20:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9233F10E832;
 Thu, 10 Nov 2022 20:14:52 +0000 (UTC)
Received: from dimapc.. (unknown [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 32EF16602A35;
 Thu, 10 Nov 2022 20:14:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668111291;
 bh=8lPPkB/X/nAF7UCnlj4YAfVJ4CiTG60x/dmXzJUkhFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vs2DxqerXBoYuKVokuo4qllebuVOqRgJgOpEfACXfRig5MufY62WKEHWvF/TUVx5J
 cLnzg7+wdeX5IipFW0IcfkQN1byMmwbt/0wlM/oGvFJEMvmAHO0WeOnQJltTIjkON9
 OT56X85voHyfhssNDFiy7CAvhnjlcF+LZ0YBuOQedrYMIix/hsfgyRYJ2FaHYo2NhF
 eD9Qz6L32qGZXVhlY3HuwfdxozObHRKC0FCIAbvyLZVmNXmqBJ5svUDWy5tgC8fHq8
 OY6cY1et+6vAWLYfCRoEJ0vs5iiKlfkc9eCn+24UrhclhzmzECbfJJlC/lvPZkrEvd
 GOgUuvv+yCMjg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Subject: [PATCH v1 1/6] dma-buf: Move dma_buf_mmap_internal() to dynamic
 locking specification
Date: Thu, 10 Nov 2022 23:13:44 +0300
Message-Id: <20221110201349.351294-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221110201349.351294-1-dmitry.osipenko@collabora.com>
References: <20221110201349.351294-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All dma-buf functions has been moved to dynamic locking specification
The dma_buf_mmap_internal() was missed out by accident. Take reservation
lock around file mapping operation to adhere the common locking convention.

Reported-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 13bfd2d09c56..b809513b03fe 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -129,6 +129,7 @@ static struct file_system_type dma_buf_fs_type = {
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
+	int ret;
 
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
@@ -144,7 +145,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
-	return dmabuf->ops->mmap(dmabuf, vma);
+	dma_resv_lock(dmabuf->resv, NULL);
+	ret = dmabuf->ops->mmap(dmabuf, vma);
+	dma_resv_unlock(dmabuf->resv);
+
+	return ret;
 }
 
 static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
-- 
2.37.3

