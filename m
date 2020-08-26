Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE5253E58
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE806EB56;
	Thu, 27 Aug 2020 06:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C2D6E1A2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=b4MA5TpSwk2Pnubg8wuSz4Ft23kjXnr6s/x3xGVfM+o=; b=Jbc2/quwfgWiTnjRfTG/KEzz2Y
 J4zprwW81y8Q/7NQYGOfaeyzmBlRKJT08kxTZUwZ8rYxi981RqXykckkHuGQ1rIp1KYT4oeF/vImS
 +swAZiv3EdCES26pTEVVU9p1lkH2twWmLxU7mMYN88lFVrfFscuqKtSiCtg2rQ6Fg4IDq0IXZeR0e
 rDpr37I2BFCjdBwO2FCyHScxkqH+h+crnu4zeNsVOh5M9PqEVBDoWRlYa2/oTyOtbFIWGgaEogDlI
 XmUOv3KKEnbBm8C09HuBKDWP3OByNTJLHezjX3SsfH+r2OgSyMxZ7vHII5PHtoKwqKslTjP3RRudS
 0/UAW5BQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAyaR-0008Au-ME; Wed, 26 Aug 2020 16:47:47 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie
 <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm: virtio: fix kconfig dependency warning
Message-ID: <d3643dcf-87f4-ff45-fb90-9945458438f9@infradead.org>
Date: Wed, 26 Aug 2020 09:47:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix kconfig dependency warning by using a different Kconfig symbol.

WARNING: unmet direct dependencies detected for VIRTIO_DMA_SHARED_BUFFER
  Depends on [n]: VIRTIO_MENU [=n] && DMA_SHARED_BUFFER [=y]
  Selected by [y]:
  - DRM_VIRTIO_GPU [=y] && HAS_IOMEM [=y] && DRM [=y] && VIRTIO [=y] && MMU [=y]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: virtualization@lists.linux-foundation.org
---
Found in linux-next but applies to mainline.

 drivers/gpu/drm/virtio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200826.orig/drivers/gpu/drm/virtio/Kconfig
+++ linux-next-20200826/drivers/gpu/drm/virtio/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_VIRTIO_GPU
 	tristate "Virtio GPU driver"
-	depends on DRM && VIRTIO && MMU
+	depends on DRM && VIRTIO_MENU && MMU
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select VIRTIO_DMA_SHARED_BUFFER

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
