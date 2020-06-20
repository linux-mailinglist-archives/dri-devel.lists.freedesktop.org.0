Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3BC203049
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D976E532;
	Mon, 22 Jun 2020 07:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1EA6E05F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 09:12:01 +0000 (UTC)
Received: from njvxl5505.vivo.xyz (unknown [157.0.31.125])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 03FEF4815C6;
 Sat, 20 Jun 2020 17:11:59 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/amd: fix potential memleak in err branch
Date: Sat, 20 Jun 2020 17:11:52 +0800
Message-Id: <20200620091152.11206-1-bernard@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTB8dQ0pISUxOSk5IVkpOQklNT09ISkJJSE5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OTI6Sww5MDgxPwIySCg0MRUX
 ITwKCUxVSlVKTkJJTU9PSEpCTU9JVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSUhJQzcG
X-HM-Tid: 0a72d0ffb7d393bakuws03fef4815c6
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function kobject_init_and_add alloc memory like:
kobject_init_and_add->kobject_add_varg->kobject_set_name_vargs
->kvasprintf_const->kstrdup_const->kstrdup->kmalloc_track_caller
->kmalloc_slab, in err branch this memory not free. If use
kmemleak, this path maybe catched.
These changes are to add kobject_put in kobject_init_and_add
failed branch, fix potential memleak.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
Changes since V2:
*remove duplicate kobject_put in kfd_procfs_init.

Link for V1:
*https://lore.kernel.org/patchwork/patch/1258608/
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d27221ddcdeb..0e0c42e9f6a3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -428,6 +428,7 @@ struct kfd_process *kfd_create_process(struct file *filep)
 					   (int)process->lead_thread->pid);
 		if (ret) {
 			pr_warn("Creating procfs pid directory failed");
+			kobject_put(process->kobj);
 			goto out;
 		}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
