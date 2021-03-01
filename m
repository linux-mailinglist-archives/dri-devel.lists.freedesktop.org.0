Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F05E327CBA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 12:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03366E58B;
	Mon,  1 Mar 2021 11:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597646E58B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 11:00:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47A7160200;
 Mon,  1 Mar 2021 11:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614596423;
 bh=iDT1Lv6FfRnvgAzPWGRnnUZSQ2tUs2zwpasxBbIcPdk=;
 h=Subject:To:Cc:From:Date:From;
 b=L2H7kQnIqnjx9cy2IWyK8CeBsItJXknxjWDXnQ/HjGDs4KJ3grVwel8JmvqBhxkWF
 AMXx8VCQ47htLxX4DYlFiMKwr8ujC4gHDAnFwQsmuJpFx5lrAMraWt+vBr95C3RMnz
 uvxpDk/JBE7wd0x5KVxe8X26HYE3qbI3HwZ4qQQ0=
Subject: Patch "drm/nouveau/kms: handle mDP connectors" has been added to the
 5.11-stable tree
To: bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, kherbst@redhat.com, markpearson@lenovo.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 01 Mar 2021 11:50:34 +0100
Message-ID: <16145958346039@kroah.com>
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

    drm/nouveau/kms: handle mDP connectors

to the 5.11-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-nouveau-kms-handle-mdp-connectors.patch
and it can be found in the queue-5.11 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From d1f5a3fc85566e9ddce9361ef180f070367e6eab Mon Sep 17 00:00:00 2001
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 27 Nov 2020 19:39:09 +0100
Subject: drm/nouveau/kms: handle mDP connectors

From: Karol Herbst <kherbst@redhat.com>

commit d1f5a3fc85566e9ddce9361ef180f070367e6eab upstream.

In some cases we have the handle those explicitly as the fallback
connector type detection fails and marks those as eDP connectors.

Attempting to use such a connector with mutter leads to a crash of mutter
as it ends up with two eDP displays.

Information is taken from the official DCB documentation.

Cc: stable@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Reported-by: Mark Pearson <markpearson@lenovo.com>
Tested-by: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Karol Herbst <kherbst@redhat.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h |    1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c             |    1 +
 2 files changed, 2 insertions(+)

--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
@@ -14,6 +14,7 @@ enum dcb_connector_type {
 	DCB_CONNECTOR_LVDS_SPWG = 0x41,
 	DCB_CONNECTOR_DP = 0x46,
 	DCB_CONNECTOR_eDP = 0x47,
+	DCB_CONNECTOR_mDP = 0x48,
 	DCB_CONNECTOR_HDMI_0 = 0x60,
 	DCB_CONNECTOR_HDMI_1 = 0x61,
 	DCB_CONNECTOR_HDMI_C = 0x63,
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1210,6 +1210,7 @@ drm_conntype_from_dcb(enum dcb_connector
 	case DCB_CONNECTOR_DMS59_DP0:
 	case DCB_CONNECTOR_DMS59_DP1:
 	case DCB_CONNECTOR_DP       :
+	case DCB_CONNECTOR_mDP      :
 	case DCB_CONNECTOR_USB_C    : return DRM_MODE_CONNECTOR_DisplayPort;
 	case DCB_CONNECTOR_eDP      : return DRM_MODE_CONNECTOR_eDP;
 	case DCB_CONNECTOR_HDMI_0   :


Patches currently in stable-queue which might be from kherbst@redhat.com are

queue-5.11/drm-nouveau-kms-handle-mdp-connectors.patch
queue-5.11/drm-nouveau-bail-out-of-nouveau_channel_new-if-chann.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
