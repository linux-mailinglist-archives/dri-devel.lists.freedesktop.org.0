Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0BF6070F5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BA910E5DE;
	Fri, 21 Oct 2022 07:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A363B10E17D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288662; x=1697824662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9EUhpbmFxPe3OIDE8FCrOeUxv0Nh3hIGi4wVmTDTcYM=;
 b=l+/Ro2UgI76F6QlViLzAe9vmulS95x71ddwcUgeRT7d+ZV4oWHYnzwvf
 kbLmxnttNriOdmw3ZhyEcFRfbHiFWq9rrX7wRpx/Bn/m5KHh6kHJc8QG9
 op/xUJPwP1BO9eO6IY28+XwAuJRe+oWA0UxY10Jy9eNNc/3zw9ZVKdoD6
 Z1nFibChBBwMdPEBPWB+mZymWRQt1KcvWGi+QASEIvQ96JMPU39v9gOX0
 /KtkSYFC7LeLEnYf8SSDbrRTEUldRxOejDjTSeTcGDJrAM7YUFoBjcf8B
 qnEtGhsJocanefGlp/0EV8M3IyN7cFozUuIg4jJ3JTRNSLJpP5Fp+NBy5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305528662"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305528662"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772517093"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772517093"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:38 -0700
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v5 10/10] gna: add open and close operations on GNA device
Date: Thu, 20 Oct 2022 19:53:34 +0200
Message-Id: <20221020175334.1820519-11-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:22:31 +0000
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomasz Jankowski <tomasz1.jankowski@intel.com>

Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
---
 drivers/gpu/drm/gna/gna_device.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index aee409e3b4ea..4ce08bf313c3 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -58,6 +58,49 @@ const struct dev_pm_ops __maybe_unused gna_pm = {
 	SET_RUNTIME_PM_OPS(gna_runtime_suspend, gna_runtime_resume, NULL)
 };
 
+static int gna_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct gna_device *gna_priv;
+
+	gna_priv = to_gna_device(dev);
+
+	file->driver_priv = gna_priv;
+
+	return 0;
+}
+
+static void gna_delete_file_requests(struct drm_file *file, struct gna_device *gna_priv)
+{
+	struct gna_request *req, *temp_req;
+	struct list_head *reqs_list;
+
+	mutex_lock(&gna_priv->reqlist_lock);
+
+	reqs_list = &gna_priv->request_list;
+	if (!list_empty(reqs_list)) {
+		list_for_each_entry_safe(req, temp_req, reqs_list, node) {
+			if (req->drm_f == file) {
+				bool is_pending;
+
+				list_del_init(&req->node);
+				is_pending = cancel_work_sync(&req->work);
+				if (is_pending)
+					atomic_dec(&gna_priv->enqueued_requests);
+				kref_put(&req->refcount, gna_request_release);
+				break;
+			}
+		}
+	}
+
+	mutex_unlock(&gna_priv->reqlist_lock);
+}
+
+static void gna_close(struct drm_device *dev, struct drm_file *file)
+{
+	struct gna_device *gna_priv = (struct gna_device *)file->driver_priv;
+
+	gna_delete_file_requests(file, gna_priv);
+}
 
 static void gna_drm_dev_fini(struct drm_device *dev, void *ptr)
 {
@@ -136,6 +179,9 @@ static struct drm_gem_object *gna_create_gem_object(struct drm_device *dev,
 
 static const struct drm_driver gna_drm_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_RENDER,
+	.open = gna_open,
+	.postclose = gna_close,
+
 	.gem_create_object = gna_create_gem_object,
 
 	.ioctls = gna_drm_ioctls,
-- 
2.25.1

