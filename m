Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 522EF47345C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D00E89D5F;
	Mon, 13 Dec 2021 18:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1169 seconds by postgrey-1.36 at gabe;
 Mon, 13 Dec 2021 18:51:29 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D25C10E898
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 18:51:28 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JCVS90FSJz682w5;
 Tue, 14 Dec 2021 02:30:33 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 19:31:56 +0100
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <airlied@linux.ie>, <kraxel@redhat.com>, <daniel@ffwll.ch>
Subject: [PATCH] drm/virtio: Ensure that objs is not NULL in
 virtio_gpu_array_put_free()
Date: Mon, 13 Dec 2021 19:31:22 +0100
Message-ID: <20211213183122.838119-1-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.204.63.22]
X-ClientProxiedBy: lhreml752-chm.china.huawei.com (10.201.108.202) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
X-CFilter-Loop: Reflected
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
Cc: syzbot+e9072e90624a31dfa85f@syzkaller.appspotmail.com,
 Roberto Sassu <roberto.sassu@huawei.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If virtio_gpu_object_shmem_init() fails (e.g. due to fault injection, as it
happened in the bug report by syzbot), virtio_gpu_array_put_free() could be
called with objs equal to NULL.

Ensure that objs is not NULL in virtio_gpu_array_put_free(), or otherwise
return from the function.

Cc: stable@vger.kernel.org # 5.13.x
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
Reported-by: syzbot+e9072e90624a31dfa85f@syzkaller.appspotmail.com
Fixes: 377f8331d0565 ("drm/virtio: fix possible leak/unlock virtio_gpu_object_array")
---
 drivers/gpu/drm/virtio/virtgpu_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 2de61b63ef91..48d3c9955f0d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -248,6 +248,9 @@ void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
 {
 	u32 i;
 
+	if (!objs)
+		return;
+
 	for (i = 0; i < objs->nents; i++)
 		drm_gem_object_put(objs->objs[i]);
 	virtio_gpu_array_free(objs);
-- 
2.32.0

