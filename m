Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D417256660
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42676EC19;
	Sat, 29 Aug 2020 09:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BAC6E4B5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=E57ufVy/Xyp2As9q9f5ZuJpwUNN0dS/jixbFSkhJ07w=; b=buvukgVRXIgzOeVt9OWrYHn1jf
 xByVXZMtFrzIj1qVmd9mts1RKXSuTLap8rB29x7viWy4eQPDZWW1bfxsUhxZJwFKTUVzPiDJFwm3Y
 By7fLAkRWsFfaUZ/fCarjMr6yzXeUNJERNGNCh5zMLSsAiUC4t75VPBNoy5X13sFvvCOOOBvjp5+l
 y+l6EFzW7tM9Fcz307V7T3fO1GwVwdk3JiozgEAgtsJ/0RU09QhStRTgp4djEep7uqbHRnms0bWik
 Whzy6W1zgEsK/ozbyf54qq0a3PzWhX+/PenL+k1BGX/CSTn/JEfgYLRqdPbgLMmZrZ+PUXDDl0DfI
 42DCxmjw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBf0y-0005nF-Hx; Fri, 28 Aug 2020 14:06:00 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie
 <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] drm: virtio: fix kconfig dependency warning
Message-ID: <7481fb88-6b04-3726-57e0-0f513245c657@infradead.org>
Date: Fri, 28 Aug 2020 07:05:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
v2: depends on VIRTIO + VIRTIO_MENU (Gerd)

Found in linux-next but applies to mainline.

 drivers/gpu/drm/virtio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200828.orig/drivers/gpu/drm/virtio/Kconfig
+++ linux-next-20200828/drivers/gpu/drm/virtio/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_VIRTIO_GPU
 	tristate "Virtio GPU driver"
-	depends on DRM && VIRTIO && MMU
+	depends on DRM && VIRTIO && VIRTIO_MENU && MMU
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select VIRTIO_DMA_SHARED_BUFFER

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
