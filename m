Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACB568024
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE832112375;
	Wed,  6 Jul 2022 07:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at gabe;
 Tue, 05 Jul 2022 15:58:31 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B758DF2C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 15:58:31 +0000 (UTC)
Received: from rustam-GF63-Thin-9RCX (unknown [83.149.199.65])
 by mail.ispras.ru (Postfix) with ESMTPS id AC12440737BD;
 Tue,  5 Jul 2022 15:52:51 +0000 (UTC)
Message-ID: <f483778df438c24ac57d660785c71402a1ba2d2c.camel@ispras.ru>
Subject: [POSSIBLE BUG] Unreachable code or possible dereferencing of NULL
 pointer
From: Subkhankulov Rustam <subkhankulov@ispras.ru>
To: David Airlie <airlied@linux.ie>
Date: Tue, 05 Jul 2022 18:52:45 +0300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 06 Jul 2022 07:41:40 +0000
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
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Version: 5.19-rc5

In function 'via_do_init_map' (drivers/gpu/drm/via/via_map.c: 54)
'drm_legacy_findmap' can return NULL pointer. If that happens,it calls
'via_do_cleanup_map' (drivers/gpu/drm/via/via_map.c: 58).

---------------------------------------------------------------------
54    dev_priv->mmio = drm_legacy_findmap(dev, init->mmio_offset);
55    if (!dev_priv->mmio) {
56        DRM_ERROR("could not find mmio region!\n");
57        dev->dev_private = (void *)dev_priv;
58        via_do_cleanup_map(dev);
59        return -EINVAL;
60    }
---------------------------------------------------------------------

'via_do_cleanup' functions calls
'via_dma_cleanup'(drivers/gpu/drm/via/via_map.c: 78).

---------------------------------------------------------------------
76    int via_do_cleanup_map(struct drm_device *dev)
77    {
78        via_dma_cleanup(dev);
79
80        return 0;
81    }
---------------------------------------------------------------------

In 'via_dma_cleanup' there is another conditional construction
(drivers/gpu/drm/via/via_dma.c: 168). 

---------------------------------------------------------------------
168   if (dev_priv->ring.virtual_start) {
169       via_cmdbuf_reset(dev_priv);
170
171       drm_legacy_ioremapfree(&dev_priv->ring.map, dev);
172       dev_priv->ring.virtual_start = NULL;
173   }
---------------------------------------------------------------------

It seems like there are two possible ways: 

1) dev_priv->ring.virtual_start != 0. 

In that case function call chain happens: 'via_cmdbuf_reset',
'via_cmdbuf_flush', 'via_hook_segment' and 'via_read'
(drivers/gpu/drm/via/via_drv.h: 124).
In 'via_read' dereferencing of "dev_priv->mmio" happens, which is NULL.

---------------------------------------------------------------------
124    static inline u32 via_read(struct drm_via_private *dev_priv, u32
reg)
125    {
126        return readl((void __iomem *)(dev_priv->mmio->handle +
reg));
127    }
---------------------------------------------------------------------

2) dev_priv->ring.virtual_start == 0.
Then all function calls located inside conditional construction
(drivers/gpu/drm/via/via_dma.c: 168) do not happen.

Thus, if dev_priv->mmio == NULL, call of 'via_do_cleanup_map'
(drivers/gpu/drm/via/via_map.c: 58) may result in either an error or
nothing at all.
Should we remove call to via_do_cleanup_map(dev) or should we somehow
avoid NULL pointer dereference in 'via_read'?

Found by Linux Verification Center (linuxtesting.org) with SVACE.

regards,
Rustam Subkhankulov

