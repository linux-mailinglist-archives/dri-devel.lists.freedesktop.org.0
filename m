Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6AE37D3AD
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 20:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7A76ECBB;
	Wed, 12 May 2021 18:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8F06ECB9;
 Wed, 12 May 2021 18:55:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92D16B243;
 Wed, 12 May 2021 18:55:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bskeggs@redhat.com, daniel@ffwll.ch, airlied@linux.ie, maxime@cerno.tech
Subject: [PATCH] drm/nouveau: Remove invalid reference to struct
 drm_device.pdev
Date: Wed, 12 May 2021 20:55:27 +0200
Message-Id: <20210512185527.26050-1-tzimmermann@suse.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pdev field got removed from struct drm_device recently. Replace
the invalid reference with an upcast from the struct's dev field.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: b347e04452ff ("drm: Remove pdev field from struct drm_device")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
This patch should be merged through drm-misc-next.
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7f38788a6c2b..2a298c171d4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -460,7 +460,8 @@ nouveau_connector_of_detect(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder;
-	struct device_node *cn, *dn = pci_device_to_OF_node(dev->pdev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	struct device_node *cn, *dn = pci_device_to_OF_node(pdev);

 	if (!dn ||
 	    !((nv_encoder = find_encoder(connector, DCB_OUTPUT_TMDS)) ||
--
2.31.1

