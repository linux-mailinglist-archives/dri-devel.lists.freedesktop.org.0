Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B6A328983
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 19:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876216E059;
	Mon,  1 Mar 2021 18:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4230C6E059
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 18:02:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77F4A653CF;
 Mon,  1 Mar 2021 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614621726;
 bh=T1pp/baZMyBm9ebUv0FYbUIXiA0F/tVQAKGSVMsPi5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VK2k8FGdEbZKJSji+Egylcjyy5JYRsHGt283Uhf3lfjje45lXddQbb2Go26in9Z7n
 mzZv8adijVdqR10o/C52IRp/WTpscY5vO2IoWzqVHjqfm202KKlmEGkZ1wunLkdTza
 1GdmftFrKkNKuJ5TAu/Q3Up4MS2A0mMLSMmz+jH8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.11 621/775] drm/nouveau/kms: handle mDP connectors
Date: Mon,  1 Mar 2021 17:13:09 +0100
Message-Id: <20210301161232.084425546@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301161201.679371205@linuxfoundation.org>
References: <20210301161201.679371205@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Mark Pearson <markpearson@lenovo.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
