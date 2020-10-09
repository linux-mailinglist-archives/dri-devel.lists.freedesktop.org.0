Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70482883A3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB446EC54;
	Fri,  9 Oct 2020 07:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0B66EC68
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:33:12 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E7CF22265;
 Fri,  9 Oct 2020 07:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602228791;
 bh=VblTp4uT2q57McSM6vuXpXLpxtKnJCV6CHUuCMlUTpk=;
 h=Subject:To:Cc:From:Date:From;
 b=hknIv/fE9C7tta1K8N8kJnJfiFZo3G5SkyFJVu9o14y8SU/0A4b1G0AisngfK/EBM
 +EdHDuI0UVjcFhEUFT8GZCxJWEPbGaK9RQRAvsPWHSVWMfhTMFZ2Kn0IxU8mPxfOzQ
 O/kk8cmkah5FHg5m2w1KMs0Ugy4qpSeC9SVLqfPg=
Subject: Patch "drm/nouveau/device: return error for unknown chipsets" has
 been added to the 5.8-stable tree
To: airlied@redhat.com, dann.frazier@canonical.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, jcline@redhat.com,
 kherbst@redhat.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 09 Oct 2020 09:33:45 +0200
Message-ID: <1602228825148179@kroah.com>
MIME-Version: 1.0
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/nouveau/device: return error for unknown chipsets

to the 5.8-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-nouveau-device-return-error-for-unknown-chipsets.patch
and it can be found in the queue-5.8 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From c3e0276c31ca8c7b8615da890727481260d4676f Mon Sep 17 00:00:00 2001
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 7 Oct 2020 00:05:27 +0200
Subject: drm/nouveau/device: return error for unknown chipsets

From: Karol Herbst <kherbst@redhat.com>

commit c3e0276c31ca8c7b8615da890727481260d4676f upstream.

Previously the code relied on device->pri to be NULL and to fail probing
later. We really should just return an error inside nvkm_device_ctor for
unsupported GPUs.

Fixes: 24d5ff40a732 ("drm/nouveau/device: rework mmio mapping code to get rid of second map")

Signed-off-by: Karol Herbst <kherbst@redhat.com>
Cc: dann frazier <dann.frazier@canonical.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
Reviewed-by: Jeremy Cline <jcline@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20201006220528.13925-1-kherbst@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -3149,6 +3149,7 @@ nvkm_device_ctor(const struct nvkm_devic
 		case 0x168: device->chip = &nv168_chipset; break;
 		default:
 			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
+			ret = -ENODEV;
 			goto done;
 		}
 


Patches currently in stable-queue which might be from kherbst@redhat.com are

queue-5.8/drm-nouveau-device-return-error-for-unknown-chipsets.patch
queue-5.8/drm-nouveau-mem-guard-against-null-pointer-access-in-mem_del.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
