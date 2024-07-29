Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF8993EB8D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2358E10E221;
	Mon, 29 Jul 2024 02:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F7610E221
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:46:19 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WXN142Df4z20krH;
 Mon, 29 Jul 2024 10:42:00 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (unknown [7.193.23.208])
 by mail.maildlp.com (Postfix) with ESMTPS id 432FE1A0190;
 Mon, 29 Jul 2024 10:46:16 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.178.219) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 10:46:15 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
 <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
 <shuah@kernel.org>, <wanghaibin.wang@huawei.com>, Zenghui Yu
 <yuzenghui@huawei.com>
Subject: [PATCH v2] kselftests: dmabuf-heaps: Ensure the driver name is
 null-terminated
Date: Mon, 29 Jul 2024 10:46:04 +0800
Message-ID: <20240729024604.2046-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600007.china.huawei.com (7.193.23.208)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even if a vgem device is configured in, we will skip the import_vgem_fd()
test almost every time.

  TAP version 13
  1..11
  # Testing heap: system
  # =======================================
  # Testing allocation and importing:
  ok 1 # SKIP Could not open vgem -1

The problem is that we use the DRM_IOCTL_VERSION ioctl to query the driver
version information but leave the name field a non-null-terminated string.
Terminate it properly to actually test against the vgem device.

While at it, let's check the length of the driver name is exactly 4 bytes
and return early otherwise (in case there is a name like "vgemfoo" that
gets converted to "vgem\0" unexpectedly).

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
* From v1 [1]:
  - Check version.name_len is exactly 4 bytes and return early otherwise

[1] https://lore.kernel.org/r/20240708134654.1725-1-yuzenghui@huawei.com

P.S., Maybe worth including the kselftests file into "DMA-BUF HEAPS
FRAMEWORK" MAINTAINERS entry?

 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index 5f541522364f..5d0a809dc2df 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -29,9 +29,11 @@ static int check_vgem(int fd)
 	version.name = name;
 
 	ret = ioctl(fd, DRM_IOCTL_VERSION, &version);
-	if (ret)
+	if (ret || version.name_len != 4)
 		return 0;
 
+	name[4] = '\0';
+
 	return !strcmp(name, "vgem");
 }
 
-- 
2.33.0

