Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288BA307727
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 14:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167E76E970;
	Thu, 28 Jan 2021 13:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B2E6E966;
 Thu, 28 Jan 2021 13:31:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0233B120;
 Thu, 28 Jan 2021 13:31:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, chris@chris-wilson.co.uk
Subject: [PATCH v6 5/5] drm: Move struct drm_device.pdev to legacy section
Date: Thu, 28 Jan 2021 14:31:27 +0100
Message-Id: <20210128133127.2311-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128133127.2311-1-tzimmermann@suse.de>
References: <20210128133127.2311-1-tzimmermann@suse.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Struct drm_device.pdev is being moved to legacy status as only legacy
DRM drivers use it. A possible follow-up patchset could remove pdev
entirely.

v4:
	* rebased

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/drm/drm_device.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index d647223e8390..c5a195676e8f 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -279,9 +279,6 @@ struct drm_device {
 	/** @agp: AGP data */
 	struct drm_agp_head *agp;
 
-	/** @pdev: PCI device structure */
-	struct pci_dev *pdev;
-
 	/** @num_crtcs: Number of CRTCs on this device */
 	unsigned int num_crtcs;
 
@@ -324,6 +321,9 @@ struct drm_device {
 	/* List of devices per driver for stealth attach cleanup */
 	struct list_head legacy_dev_list;
 
+	/* PCI device structure */
+	struct pci_dev *pdev;
+
 #ifdef __alpha__
 	/** @hose: PCI hose, only used on ALPHA platforms. */
 	struct pci_controller *hose;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
