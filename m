Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777C6406552
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 03:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACEB6E951;
	Fri, 10 Sep 2021 01:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1997 seconds by postgrey-1.36 at gabe;
 Fri, 10 Sep 2021 01:40:33 UTC
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9436E951
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:40:32 +0000 (UTC)
Received: from tazenda.hos.anvin.org
 ([IPv6:2601:646:8600:3c70:7285:c2ff:fefb:fd4]) (authenticated bits=0)
 by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 18A1729L277238
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 9 Sep 2021 18:07:08 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 18A1729L277238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2021083001; t=1631236030;
 bh=V6F7bdaXf2OKxaplYOc+J8bYBVsMAGw7SiKf5H6zkvY=;
 h=From:To:Cc:Subject:Date:From;
 b=UqI+VY9J3gscDPibGFV+GaghgePB3g8ITCLAyDkkf7xFk6KRPA1sX9Tr3anudTCD5
 2REygG/vPnLwhylBlCQuoMFPJ3ZoxcOB+H0XKK7jPKkqzlnCEQzCdqC1KYH/oX6NgV
 96i6oWwzW1kpUv8X/kx01vvLYMVmCwCBtt7Vsb1h+ZiZla3Cfc7D/ke0U/I/1EJWEw
 DuIY4xVSQWWvKrd+lZGuJkFn+KZhUe5+0AKZe6qFOk3HsvgBzqGaJTDAYh2bEx0u5i
 bV3ewWGmA+C0IcriU0B341jt74JYOK+nSYi4smIFrpsdchw8XuC9duCtGO+WxAYgds
 Aw0kvtB3U7r1g==
From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "H. Peter Anvin (Intel)" <hpa@zytor.com>
Subject: [PATCH] drm/bochs: add Bochs PCI ID for Simics model
Date: Thu,  9 Sep 2021 18:06:55 -0700
Message-Id: <20210910010655.2356245-1-hpa@zytor.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current (and older) Simics models for the Bochs VGA used the wrong PCI
vendor ID (0x4321 instead of 0x1234).  Although this can hopefully be
fixed in the future, it is a problem for users of the current version,
not the least because to update the device ID the BIOS has to be
rebuilt in order to see BIOS output.

Add support for the 4321:1111 device number in addition to the
1234:1111 one.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 drivers/gpu/drm/tiny/bochs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 73415fa9ae0f..2ce3bd903b70 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -63,6 +63,7 @@ MODULE_PARM_DESC(defy, "default y resolution");
 
 enum bochs_types {
 	BOCHS_QEMU_STDVGA,
+	BOCHS_SIMICS,
 	BOCHS_UNKNOWN,
 };
 
@@ -695,6 +696,13 @@ static const struct pci_device_id bochs_pci_tbl[] = {
 		.subdevice   = PCI_ANY_ID,
 		.driver_data = BOCHS_UNKNOWN,
 	},
+	{
+		.vendor      = 0x4321,
+		.device      = 0x1111,
+		.subvendor   = PCI_ANY_ID,
+		.subdevice   = PCI_ANY_ID,
+		.driver_data = BOCHS_SIMICS,
+	},
 	{ /* end of list */ }
 };
 
-- 
2.31.1

