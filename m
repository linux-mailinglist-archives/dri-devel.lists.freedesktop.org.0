Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D81A2930
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F416EAB8;
	Wed,  8 Apr 2020 19:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2B56E02E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:13:05 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MybX9-1j6Gzx3Zgz-00z1aQ; Wed, 08 Apr 2020 21:12:28 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: work around dma_addr_t/resource_size_t mixup warning
Date: Wed,  8 Apr 2020 21:07:05 +0200
Message-Id: <20200408191224.947302-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:DVSM1LIbfhMXWme1EElCj+8pny765s3sA/2Gb86UfuGGhZJ6d22
 ZLfY/aoBnETxdQe3tl80wWrA9EH52Nrzodw33eV2E5IjGmEvuuTfZ//0NcKB1v0Mmb7nN4Z
 Kg9uEcr2deFJ7CA8RDRNyzjOTqTPl6ecd68O6CQsSx8ZRbV+4M+8oAKlbdQsu2czskwZYza
 pvt9mDYF+wn6rtouoQphg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:66Qguc75blI=:teWWSWuMOiL9cYz8XdHo0F
 uxSaU1XYvL+4VfYNLWX6pg/PYV7tKUQ29ZOpbbdetFx3X+wqQauNkNixr7eWupCwniohAdsZS
 BXK8/w5/IMsCzsS1saiCcF4WoLwYVeZM4aliuNmqOK8ByQVeRbI8EP5piYFV89hoikNbj6x75
 GP//GYKJxRw2gVyWX6NwD5vj+tRU+E40YafWzl+KpepxecQOP0fkB1elrZzLUKD0zXO5RaTHN
 yj0Y9rr23gARxJsJF7fTJ+GPuObkozhZlMBnH9pRQaQBkP/kWZAVdsrWAQdXw8pBcAWeOnuFc
 E9Yz2CksQcCdbAUGRMdsJmX018f9Hqah6Q8jpqToc8H1zQjEsjFJPfj/JLSo8elt2aU7y5HfY
 xCT0ik4rdI3Y46MHi1nB0Zrc8qZIa2YN1KtJlmT1ZhGjbL37+eCGnmDaLKEpQa6VK4zSr9rOW
 FCHk9YZ1w8KZBb7JNh9aY6EyO8+BmCfqGH6yIQ8wpbpAWQPj8/y3RCHx7+UYOIOaobwQuV+RA
 iKLQ4a0n7Xyd5aqD6POGqgpxorwQ+lGh6t0qZ3bgk9aDDZKwM1LFXNcRy2F8/d0XS4psdZQno
 RoITjbLEUIFCX94D/vasDn3inMVfGCHnIWKV5nh6j9T5eSN3tHI1lsITlZw7r51w78rqyNqxy
 LpPKLyPLDdBjTCZCz0u8kgXa/RiMoo48xYfcd+5f2uVX7GZQ+aTroZcrfDJjO+KYlqHhrF9Fk
 wWUaXXuZmH0/dBZnDqCxaRfaAwCBEm0oSorEGafd5a+0pLV87DjM85awFTbr6+py+q4jAeeGz
 M/mOs+V9Fk6h37rJ/mp1s+XaIT7YAaNcrNgxn6UOZ1nDQ7DU0Q=
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On configurations with 64-bit dma_addr_t but 32-bit resource_size_t,
there is now a warning:

drivers/gpu/drm/drm_bufs.c: In function 'drm_addmap_core':
drivers/gpu/drm/drm_bufs.c:328:8: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
  328 |        &map->offset,
      |        ^~~~~~~~~~~~
      |        |
      |        resource_size_t * {aka unsigned int *}
In file included from include/linux/pci-dma-compat.h:8,
                 from include/linux/pci.h:2392,
                 from include/drm/drm_pci.h:35,
                 from drivers/gpu/drm/drm_bufs.c:46:
include/linux/dma-mapping.h:642:15: note: expected 'dma_addr_t *' {aka 'long long unsigned int *'} but argument is of type 'resource_size_t *' {aka 'unsigned int *'}
  642 |   dma_addr_t *dma_handle, gfp_t gfp)
      |   ~~~~~~~~~~~~^~~~~~~~~~

I have no idea if this is safe on targets that may need a high DMA address,
or why we store a DMA address token in a resource_size_t in the first place,
but using a temporary variable avoids the warning.

Fixes: 8e4ff9b56957 ("drm: Remove the dma_alloc_coherent wrapper for internal usage")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/drm_bufs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index dcabf5698333..0fbe65c62f1e 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -149,6 +149,7 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 {
 	struct drm_local_map *map;
 	struct drm_map_list *list;
+	dma_addr_t dma_addr;
 	unsigned long user_token;
 	int ret;
 
@@ -325,8 +326,9 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 		 * need to point to a 64bit variable first. */
 		map->handle = dma_alloc_coherent(&dev->pdev->dev,
 						 map->size,
-						 &map->offset,
+						 &dma_addr,
 						 GFP_KERNEL);
+		map->offset = (resource_size_t)dma_addr;
 		if (!map->handle) {
 			kfree(map);
 			return -ENOMEM;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
