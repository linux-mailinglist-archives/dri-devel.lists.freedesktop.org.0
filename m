Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551929A346C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 07:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173C010E0C0;
	Fri, 18 Oct 2024 05:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="r7DkyYyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29A710E0C0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 05:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729230403; x=1729835203; i=friedrich.vock@gmx.de;
 bh=OTyZoD6paysPwtO5U5wv/qdO8Ng07QcwV9isGCnepSg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=r7DkyYyY0XXziiw8J2GGEZAL8xfiA7/JRZLjBwvRlk1F91fkzvvCHo0Rida7hM2d
 aFZd8rr64ovUw1Mozrl5qddjXq3EhzkdDNdyJqbVhD5EZiYUzfxpe7ML55ZsqQog4
 Rb3WzepXnSdZT0Ttblj8E3YhDAoERe/YM/2S6hk0Q9hGC4uHbgk5IqrymRA2qgH9x
 6S5J4dNf4hzGLlJiv0lg7eP2+k8TzXFeHQE1GwM8ZqFS0K3bO72DWq7PgpExTnRcq
 hc48GYGhHCnTdByYSuTtqoxfIC5dzp3NznJFqLHSfyNs7AOPrx3PSwnqnx7Faqk+k
 vOC4sMc2Nb45ton+Kw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([109.91.201.165]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MXp9Y-1tQr7v0tEy-00YCxR; Fri, 18 Oct 2024 07:46:43 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: Eliminate all duplicate fences in
 dma_fence_unwrap_merge
Date: Fri, 18 Oct 2024 07:46:08 +0200
Message-ID: <20241018054608.6478-1-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tnYxLdOoqC1T0J1iObvzpudQQH+q1tmq7CdAdqLHCGHxrTScFbv
 1V/g0X/I7Q/wEkkLoqkByH7HQVkbXGDOjX05/uMelaG7u18HANGLkjm0ozi4rGX4XAvfdLO
 szXCEJ2pVoT04rMvJfrvtbCPBsm3/nDMACqvumIFw5632DmHcmXLCdq/4Ab5o/HtmVlNyfI
 6ZZRczhM4Wx+Xf4G3MlKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ARzAmnuoq9g=;6AftcJPV20Ftc2z7w3lrG1bjYB6
 /6adle78s7w6zPDq15r+MVT5ACSXXoHkzdIEE6B9U+X9Pw7xD5X/offfJ+0qr2domobagjLD0
 PJRU9HjWgf+6gYJqfuuwX5FtlNlUT4DseSMb2p04zR/V8lSADEpI5R/hpsojyD/j64Fv93tVw
 YYe7lF4iGeVKhfYORwgz8cUbO/bNZzSLEeaQsuPsQJxz6owqE9RBvtXHTpRBmpm55jmJg/n7d
 3RsB4ovnAPcFRtiu0WBOV0Iy2j9URf3RUilu4QjVM0xECp8Z2dY/n2Qha1o49Pu7jSwOw6fTy
 rb7PRb0/NzMFjj/Jkvof8hu7u8kCxKBNnoqKjibDdye0eK2xlZ+7xA8+QrDtgwJaWXfaaEGko
 ZMyecVurmWERq5dXPnunvC9rhbOD+7FMrSE2BJMv7+Q/u8VUoj6MT1Jj3llJ23+wKZK895QDY
 HdbMPxnzm3384J9e4DFlx4RTOhZQEW8sA+e6zPtmUq2BiQE4Cf8jLh2K1n4OjZ3qXwD9rz/8g
 mQ0AjxEJ0uaCz6iaSfVCpxz5vhyt6WdbQ/mzEsu7HCf64Au8JG5XFY31pWfqkS3S7iFukRHvT
 hoOGFMxVCGgswQyCLaza3710y4EIOv/ELm8OvIVuFLWrA/WWijzp3/Yo4wze/3S+DxSSufhQZ
 io2hYY67qIiOjmE4d8+qg7SFzbDXyu7la+PhYKwoEgqXLvXxwiIudJb9WQEWVzsL+5YK81tEZ
 q3KylRdoSoTI0ZwCXvJWDftqAXtA22c5gxuwsjKV6DK++p2InzeuAOuVORSwkrabkcuBnLITQ
 Y0xW7UeTfjS4QXDcrOo53V2g==
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

When dma_fence_unwrap_merge is called on fence chains where the fences
aren't ordered by context, the merging logic breaks down and we end up
inserting fences twice. Doing this repeatedly leads to the number of
fences going up exponentially, and in some gaming workloads we'll end up
running out of memory to store the resulting array altogether, leading
to a warning such as:

vkd3d_queue: page allocation failure: order:7, mode:0x40dc0(GFP_KERNEL|__G=
FP_COMP|__GFP_ZERO), nodemask=3D(null),cpuset=3D/,mems_allowed=3D0
CPU: 2 PID: 5287 Comm: vkd3d_queue Tainted: G S                 6.10.7-200=
.fsync.fc40.x86_64 #1
Hardware name: Dell Inc. G5 5505/0NCW8W, BIOS 1.11.0 03/22/2022
Call Trace:
 <TASK>
 dump_stack_lvl+0x5d/0x80
 warn_alloc+0x164/0x190
 ? srso_return_thunk+0x5/0x5f
 ? __alloc_pages_direct_compact+0x1d9/0x220
 __alloc_pages_slowpath.constprop.2+0xd14/0xd80
 __alloc_pages_noprof+0x32b/0x350
 ? dma_fence_array_create+0x48/0x110
 __kmalloc_large_node+0x6f/0x130
 __kmalloc_noprof+0x2dd/0x4a0
 ? dma_fence_array_create+0x48/0x110
 dma_fence_array_create+0x48/0x110
 __dma_fence_unwrap_merge+0x481/0x5b0
 sync_file_merge.constprop.0+0xf8/0x180
 sync_file_ioctl+0x476/0x590
 ? srso_return_thunk+0x5/0x5f
 ? __seccomp_filter+0xe8/0x5a0
 __x64_sys_ioctl+0x97/0xd0
 do_syscall_64+0x82/0x160
 ? srso_return_thunk+0x5/0x5f
 ? drm_syncobj_destroy_ioctl+0x8b/0xb0
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? __check_object_size+0x58/0x230
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? drm_ioctl+0x2ba/0x530
 ? __pfx_drm_syncobj_destroy_ioctl+0x10/0x10
 ? srso_return_thunk+0x5/0x5f
 ? ktime_get_mono_fast_ns+0x3b/0xd0
 ? srso_return_thunk+0x5/0x5f
 ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu]
 ? srso_return_thunk+0x5/0x5f
 ? syscall_exit_to_user_mode+0x72/0x200
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x8e/0x160
 ? syscall_exit_to_user_mode+0x72/0x200
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x8e/0x160
 ? srso_return_thunk+0x5/0x5f
 ? syscall_exit_to_user_mode+0x72/0x200
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x8e/0x160
 ? do_syscall_64+0x8e/0x160
 ? srso_return_thunk+0x5/0x5f
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

It's a bit unfortunate that we end up with quadratic complexity w.r.t.
the number of merged fences in all cases, but I'd argue in practice
there shouldn't be more than a handful of in-flight fences to merge.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3617
Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/dma-buf/dma-fence-unwrap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fenc=
e-unwrap.c
index 628af51c81af..46277cef0bc6 100644
=2D-- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -68,7 +68,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int =
num_fences,
 	struct dma_fence *tmp, **array;
 	ktime_t timestamp;
 	unsigned int i;
-	size_t count;
+	size_t count, j;

 	count =3D 0;
 	timestamp =3D ns_to_ktime(0);
@@ -127,6 +127,10 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned i=
nt num_fences,
 			 * function is used multiple times. So attempt to order
 			 * the fences by context as we pass over them and merge
 			 * fences with the same context.
+			 *
+			 * We will remove any remaining duplicate fences down
+			 * below, but doing this here saves us from having to
+			 * iterate over the array to detect the duplicate.
 			 */
 			if (!tmp || tmp->context > next->context) {
 				tmp =3D next;
@@ -145,7 +149,12 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned i=
nt num_fences,
 		}

 		if (tmp) {
-			array[count++] =3D dma_fence_get(tmp);
+			for (j =3D 0; j < count; ++j) {
+				if (array[count] =3D=3D tmp)
+					break;
+			}
+			if (j =3D=3D count)
+				array[count++] =3D dma_fence_get(tmp);
 			fences[sel] =3D dma_fence_unwrap_next(&iter[sel]);
 		}
 	} while (tmp);
=2D-
2.47.0

