Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD8D0310D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E1D10E721;
	Thu,  8 Jan 2026 13:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ToX7VyYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A31910E721
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:36:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6F9A5442BD;
 Thu,  8 Jan 2026 13:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD31BC16AAE;
 Thu,  8 Jan 2026 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1767879409;
 bh=ZNFePQ78MHxaRdXQoGi8/qaz0RQaUmvfidiruwIBMII=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=ToX7VyYXcoXNnaHh4rW39hImMd/VQlkaue3J6nPKvTq3NzRX2CO4gb/+3/TQI1CYq
 9c33GRrpN9jAKydUQDPlszDOqGfAM58+b53qMN3gGNZ0zoSQNrjIld+SAIBpEXwoti
 wPFNG2jUYYbLTAPuASZ2ak/V71YdgWKkYLmANmmM=
Subject: Patch "drm/vmwgfx: Fix a null-ptr access in the cursor snooper" has
 been added to the 6.1-stable tree
To: airlied@gmail.com, airlied@redhat.com, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 brianp@vmware.com, dri-devel@lists.freedesktop.org, dtor@vmware.com,
 gregkh@linuxfoundation.org, ian.forbes@broadcom.com, kuzeyardabulut@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sashal@kernel.org,
 shivani.agarwal@broadcom.com, simona@ffwll.ch, tapas.kundu@broadcom.com,
 thellstrom@vmware.com, tzimmermann@suse.de,
 vamsi-krishna.brahmajosyula@broadcom.com, yin.ding@broadcom.com,
 zack.rusin@broadcom.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 14:36:37 +0100
In-Reply-To: <20251224083652.614902-1-shivani.agarwal@broadcom.com>
Message-ID: <2026010837-spoiling-gradation-5950@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/vmwgfx: Fix a null-ptr access in the cursor snooper

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-vmwgfx-fix-a-null-ptr-access-in-the-cursor-snooper.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-203358-greg=kroah.com@vger.kernel.org Wed Dec 24 09:57:13 2025
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
Date: Wed, 24 Dec 2025 00:36:52 -0800
Subject: drm/vmwgfx: Fix a null-ptr access in the cursor snooper
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, simona@ffwll.ch, airlied@gmail.com, brianp@vmware.com, dtor@vmware.com, airlied@redhat.com, thellstrom@vmware.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com, vamsi-krishna.brahmajosyula@broadcom.com, yin.ding@broadcom.com, tapas.kundu@broadcom.com, Kuzey Arda Bulut <kuzeyardabulut@gmail.com>, Ian Forbes <ian.forbes@broadcom.com>, Sasha Levin <sashal@kernel.org>, Shivani Agarwal <shivani.agarwal@broadcom.com>
Message-ID: <20251224083652.614902-1-shivani.agarwal@broadcom.com>

From: Zack Rusin <zack.rusin@broadcom.com>

[ Upstream commit 5ac2c0279053a2c5265d46903432fb26ae2d0da2 ]

Check that the resource which is converted to a surface exists before
trying to use the cursor snooper on it.

vmw_cmd_res_check allows explicit invalid (SVGA3D_INVALID_ID) identifiers
because some svga commands accept SVGA3D_INVALID_ID to mean "no surface",
unfortunately functions that accept the actual surfaces as objects might
(and in case of the cursor snooper, do not) be able to handle null
objects. Make sure that we validate not only the identifier (via the
vmw_cmd_res_check) but also check that the actual resource exists before
trying to do something with it.

Fixes unchecked null-ptr reference in the snooping code.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: c0951b797e7d ("drm/vmwgfx: Refactor resource management")
Reported-by: Kuzey Arda Bulut <kuzeyardabulut@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>
Link: https://lore.kernel.org/r/20250917153655.1968583-1-zack.rusin@broadcom.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
[Shivani: Modified to apply on v5.10.y-v6.1.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1507,6 +1507,7 @@ static int vmw_cmd_dma(struct vmw_privat
 		       SVGA3dCmdHeader *header)
 {
 	struct vmw_buffer_object *vmw_bo = NULL;
+	struct vmw_resource *res;
 	struct vmw_surface *srf = NULL;
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdSurfaceDMA);
 	int ret;
@@ -1542,18 +1543,24 @@ static int vmw_cmd_dma(struct vmw_privat
 
 	dirty = (cmd->body.transfer == SVGA3D_WRITE_HOST_VRAM) ?
 		VMW_RES_DIRTY_SET : 0;
-	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
-				dirty, user_surface_converter,
-				&cmd->body.host.sid, NULL);
+	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface, dirty,
+				user_surface_converter, &cmd->body.host.sid,
+				NULL);
 	if (unlikely(ret != 0)) {
 		if (unlikely(ret != -ERESTARTSYS))
 			VMW_DEBUG_USER("could not find surface for DMA.\n");
 		return ret;
 	}
 
-	srf = vmw_res_to_srf(sw_context->res_cache[vmw_res_surface].res);
+	res = sw_context->res_cache[vmw_res_surface].res;
+	if (!res) {
+		VMW_DEBUG_USER("Invalid DMA surface.\n");
+		return -EINVAL;
+	}
 
-	vmw_kms_cursor_snoop(srf, sw_context->fp->tfile, &vmw_bo->base, header);
+	srf = vmw_res_to_srf(res);
+	vmw_kms_cursor_snoop(srf, sw_context->fp->tfile, &vmw_bo->base,
+			     header);
 
 	return 0;
 }


Patches currently in stable-queue which might be from shivani.agarwal@broadcom.com are

queue-6.1/usb-xhci-move-link-chain-bit-quirk-checks-into-one-helper-function.patch
queue-6.1/crypto-af_alg-zero-initialize-memory-allocated-via-sock_kmalloc.patch
queue-6.1/rdma-core-fix-kasan-slab-use-after-free-read-in-ib_register_device-problem.patch
queue-6.1/drm-vmwgfx-fix-a-null-ptr-access-in-the-cursor-snooper.patch
queue-6.1/usb-xhci-apply-the-link-chain-quirk-on-nec-isoc-endpoints.patch
