Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300F5805574
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CA510E51B;
	Tue,  5 Dec 2023 13:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADE710E51B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:06:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20231205130644euoutp023fafa1b5cfb1bac9034f8f1953ae0335~d8VpbRhGk2276822768euoutp02_
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:06:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20231205130644euoutp023fafa1b5cfb1bac9034f8f1953ae0335~d8VpbRhGk2276822768euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1701781604;
 bh=3djYIPlIEHPAVOgGmtvfiiLsf3bNmhA0OAsSAQwtPUc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=DdJ1A7OKT6HjpgRK2bVpGrwT74tnZe6zZxoQDYYlrQvw12JbPNsddQ8RqpAezkwUP
 8aQHh9eGC/lQK386cFmR/ef3x+Bkr8hXApaO5slgAgj5m9Yr3Y3xVeyiuWDSKWyq1E
 6mRPVm+55253B9bdONDWAIl/IX9fPi7PNj9siVOM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231205130644eucas1p2718897683fbbb32a1d4315f22d49cb64~d8Vo_RZPd0099800998eucas1p2p;
 Tue,  5 Dec 2023 13:06:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5B.DF.09814.3602F656; Tue,  5
 Dec 2023 13:06:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20231205130643eucas1p283a5476b78a87997fa393d00f5172418~d8VomF8yy1993619936eucas1p2-;
 Tue,  5 Dec 2023 13:06:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231205130643eusmtrp2bb6144d525e0afb546b1f00f5fcb4caa~d8VolQtwq1626416264eusmtrp2o;
 Tue,  5 Dec 2023 13:06:43 +0000 (GMT)
X-AuditID: cbfec7f4-727ff70000002656-4c-656f20633a5d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 70.1F.09274.3602F656; Tue,  5
 Dec 2023 13:06:43 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231205130643eusmtip11acdc942d2dc461a40ff7332e80436f5~d8Vn_VOa42835128351eusmtip1k;
 Tue,  5 Dec 2023 13:06:42 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/debugfs: fix potential NULL pointer dereference
Date: Tue,  5 Dec 2023 14:06:31 +0100
Message-Id: <20231205130631.3456986-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djP87rJCvmpBkt5LE5cX8Rk8X/bRGaL
 ied/sllc+fqezeLyrjlsFmuP3GW3WPhxK4tFW+cyVov3O28xWmx5M5HVgctj77cFLB47Z91l
 99i0qpPN4861PWwe804GetzvPs7k0bdlFaPH5tPVHp83yQVwRnHZpKTmZJalFunbJXBlXP5w
 jLHgqFTFls8HWRsY54p3MXJySAiYSJy98I2ti5GLQ0hgBaPE748r2EASQgJfGCVuvc+FSHxm
 lPjSMp+pi5EDrON2Tx1EfDmjxLxns6G6gRom79zDDtLNJmAo0fW2C2ySiICjxPxnbxhBipgF
 bjFJzFi0mgUkISzgIrHgRTsTiM0ioCpx480vsAZeAXuJhR+fsUDcJy+x/+BZZoi4oMTJmU/A
 4sxA8eats5lBhkoIXOCQWNG0lxmiwUVi+8xb7BC2sMSr41ugbBmJ/ztBXgBpaGeUWPD7PpQz
 gVGi4fktRogqa4k750DO4ABaoSmxfpc+xM+OEovWa0OYfBI33gpC3MAnMWnbdGaIMK9ER5sQ
 xAw1iVnH18FtPXjhEtRlHhLvTt1igoRurMTTzsesExgVZiH5bBaSz2YhnLCAkXkVo3hqaXFu
 emqxUV5quV5xYm5xaV66XnJ+7iZGYKo6/e/4lx2My1991DvEyMTBeIhRgoNZSYR33q3sVCHe
 lMTKqtSi/Pii0pzU4kOM0hwsSuK8qinyqUIC6YklqdmpqQWpRTBZJg5OqQamib3bLhjbrXyl
 2/F4gvnHg1bZNboOAS689/+VHJ3srFYt6FCo8LVN2flnm+eTp5J6T21n1OYnWGyelDi3teAo
 w9ETYVqL4h7vOl+77fA8/673lzdIiGTF3g+Ln3uJOTZVanXLyrxnD78w2209vMn2kuo7d/OP
 qWVnu9WKeLsnuDi8u3rqpu3dUzkPDt9N61Z94nTuaxTPufwqrp+Xq20fLGHaZ6F28mmh2D/d
 hDuSuQeYsvzLPphofJVbG+EtNu+JSVLKtcmegd9Mo8I3SFddT8q+M8k4/GR0ZsNNUZ39tb8X
 zVxdqVx9dr47V5+4pdTV9vt75bxPdGss3cX/Y3PZwUlXNAp6NmSFL1Cu+NajxFKckWioxVxU
 nAgAqXpvDsQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4Xd1khfxUgx13lS1OXF/EZPF/20Rm
 i4nnf7JZXPn6ns3i8q45bBZrj9xlt1j4cSuLRVvnMlaL9ztvMVpseTOR1YHLY++3BSweO2fd
 ZffYtKqTzePOtT1sHvNOBnrc7z7O5NG3ZRWjx+bT1R6fN8kFcEbp2RTll5akKmTkF5fYKkUb
 WhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZVz+cIyx4KhUxZbPB1kbGOeKdzFy
 cEgImEjc7qnrYuTiEBJYyihxd/5Ppi5GTqC4jMTJaQ2sELawxJ9rXWwQRZ8YJbZ+2MsGkmAT
 MJToeguS4OAQEXCWWLY0BKSGWeABk8TmZTfAaoQFXCQWvGgHG8oioCpx480vsDivgL3Ewo/P
 WCAWyEvsP3iWGSIuKHFy5hOwODNQvHnrbOYJjHyzkKRmIUktYGRaxSiSWlqcm55bbKRXnJhb
 XJqXrpecn7uJERgl24793LKDceWrj3qHGJk4GA8xSnAwK4nwzruVnSrEm5JYWZValB9fVJqT
 WnyI0RTovonMUqLJ+cA4zSuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi
 4JRqYNrDtfXw7hPHJZIn7LE0/6v3f2e8qkJjYVBAQE9HnU9vkIjTYeHsEguBPwdsZxivFGl/
 sWpyjWbq/9nHVdWm37gV6Tw9nm3h5bau02bvGJ6k5UUWHji4fOIDD8ELnTOOPUw66P9I5esa
 l99rL8k92mW9iSvOxT5ZmE1B3N7GetPBqz8iqgNEu7RsLhrMOPIsze2d3XfxgpDy73K3dsQL
 PdxZfk3z5DHfEEfNHa/2nclo9NtouFvy1p7bfexNzqy7F+x1i3kgUycYELJvfsk2geaK5Z79
 W9I/1Fs8V55jLvzTsNB/29/5uU11LRJvdU6G2xvL+Ok+fdC/h+0FQ/WMTVWHIjkl/j3zFrPp
 +WR0QomlOCPRUIu5qDgRAHCdY20bAwAA
X-CMS-MailID: 20231205130643eucas1p283a5476b78a87997fa393d00f5172418
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231205130643eucas1p283a5476b78a87997fa393d00f5172418
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231205130643eucas1p283a5476b78a87997fa393d00f5172418
References: <CGME20231205130643eucas1p283a5476b78a87997fa393d00f5172418@eucas1p2.samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

encoder->funcs entry might be NULL, so check it first before calling its
methods. This fixes NULL pointer dereference observed on Rasberry Pi
3b/4b boards.

Fixes: caf525ed45b4 ("drm/encoder: register per-encoder debugfs dir")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This fixes the following issue observed on Raspberry Pi 4b:

vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000010 when read
[00000010] *pgd=00000000
Internal error: Oops: 5 [#1] SMP ARM
Modules linked in: sha256_arm raspberrypi_hwmon cfg80211(+) hci_uart btbcm bluetooth vc4(+) ecdh_generic ecc libaes snd_soc_hdmi_codec snd_soc_core v3d drm_shmem_helper ac97_bus snd_pcm_dmaengine snd_pcm genet(+) gpu_sched snd_timer snd bcm2711_thermal soundcore drm_dma_helper
CPU: 1 PID: 221 Comm: systemd-udevd Not tainted 6.7.0-rc4-next-20231205 #14267
Hardware name: BCM2711
PC is at drm_debugfs_encoder_add+0x6c/0x98
LR is at 0x0
...
 drm_debugfs_encoder_add from drm_encoder_register_all+0x20/0x60
 drm_encoder_register_all from drm_modeset_register_all+0x34/0x70
 drm_modeset_register_all from drm_dev_register+0x24c/0x28c
 drm_dev_register from vc4_drm_bind+0x21c/0x2d0 [vc4]
 vc4_drm_bind [vc4] from try_to_bring_up_aggregate_device+0x160/0x1bc
 try_to_bring_up_aggregate_device from component_master_add_with_match+0xc4/0xf8
 component_master_add_with_match from vc4_platform_drm_probe+0xa0/0xc0 [vc4]
 vc4_platform_drm_probe [vc4] from platform_probe+0x5c/0xb8
 platform_probe from really_probe+0xc8/0x2dc
 really_probe from __driver_probe_device+0x88/0x19c
 __driver_probe_device from driver_probe_device+0x30/0x104
 driver_probe_device from __driver_attach+0x90/0x174
 __driver_attach from bus_for_each_dev+0x6c/0xb4
 bus_for_each_dev from bus_add_driver+0xcc/0x1cc
 bus_add_driver from driver_register+0x7c/0x118
 driver_register from vc4_drm_register+0x44/0x1000 [vc4]
 vc4_drm_register [vc4] from do_one_initcall+0x40/0x1e0
 do_one_initcall from do_init_module+0x50/0x1e4
 do_init_module from init_module_from_file+0x90/0xbc
 init_module_from_file from sys_finit_module+0x144/0x258
 sys_finit_module from ret_fast_syscall+0x0/0x54
Exception stack(0xf0cf1fa8 to 0xf0cf1ff0)
...
---[ end trace 0000000000000000 ]---

---
 drivers/gpu/drm/drm_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 02e7481758c0..f4715a67e340 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -638,7 +638,7 @@ void drm_debugfs_encoder_add(struct drm_encoder *encoder)
 	debugfs_create_file("bridges", 0444, root, encoder,
 			    &bridges_fops);
 
-	if (encoder->funcs->debugfs_init)
+	if (encoder->funcs && encoder->funcs->debugfs_init)
 		encoder->funcs->debugfs_init(encoder, root);
 }
 
-- 
2.34.1

