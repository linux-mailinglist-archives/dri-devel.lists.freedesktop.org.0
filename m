Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6296C627BE9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 12:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B615610E041;
	Mon, 14 Nov 2022 11:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A9E10E03B;
 Mon, 14 Nov 2022 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668424638; x=1699960638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cShosTX6qgQLbMxJswZ+DfJVbc0pAc5BznoSUHJHKgg=;
 b=NjhusvFYTTq8hbgXMWT27Ysvh2Wor9BlBNIXVW5xcfIaa4nOe9csUszf
 gowC1xZHIc65hJurJRh2TfOiToYsu+xHEGR3CeuI7vvV1gYpxFFhjEc93
 Mjwhhvyp5AFKSWvqWbfzFhYcMSux5NQJVU5OFpe4g5via+CtbzQA6NQdh
 Y7WHDuGhE8TwEMGG1l1KNAJJyv8Dozx10D5plyTayhqyLpfbEAYhaxXQS
 slT4Zq7KcTgoq9ob0iMRzclGehVgLaFJcZmPEt2U5P+uIyp+V4azvqvXe
 b/HyBun8t1n59v8XaygbL4bOfWNv09l21IS2w+F/iywL8HKdmmew8fnH7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="291660167"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="291660167"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:17:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="589330261"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="589330261"
Received: from dsmahang-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.240])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:17:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RESEND] drm/edid/firmware: stop using a throwaway platform device
Date: Mon, 14 Nov 2022 13:17:09 +0200
Message-Id: <20221114111709.434979-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Matthieu CHARETTE <matthieu.charette@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've used a temporary platform device for firmware EDID loading since
it was introduced in commit da0df92b5731 ("drm: allow loading an EDID as
firmware to override broken monitor"), but there's no explanation why.

Using a temporary device does not play well with CONFIG_FW_CACHE=y,
which caches firmware images (e.g. on suspend) so that drivers can
request firmware when the system is not ready for it, and return the
images from the cache (e.g. during resume). This works automatically for
regular devices, but obviously not for a temporarily created device.

Stop using the throwaway platform device, and use the drm device
instead.

Note that this may still be problematic for cases where the display was
plugged in during suspend, and the firmware wasn't loaded and therefore
not cached before suspend.

References: https://lore.kernel.org/r/20220727074152.43059-1-matthieu.charette@gmail.com
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2061
Reported-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
Tested-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Resend with a proper commit message; patch itself is unchanged.
---
 drivers/gpu/drm/drm_edid_load.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index ef4ab59d6935..5d9ef267ebb3 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -172,20 +172,9 @@ static const struct drm_edid *edid_load(struct drm_connector *connector, const c
 		fwdata = generic_edid[builtin];
 		fwsize = sizeof(generic_edid[builtin]);
 	} else {
-		struct platform_device *pdev;
 		int err;
 
-		pdev = platform_device_register_simple(connector->name, -1, NULL, 0);
-		if (IS_ERR(pdev)) {
-			drm_err(connector->dev,
-				"[CONNECTOR:%d:%s] Failed to register EDID firmware platform device for connector \"%s\"\n",
-				connector->base.id, connector->name,
-				connector->name);
-			return ERR_CAST(pdev);
-		}
-
-		err = request_firmware(&fw, name, &pdev->dev);
-		platform_device_unregister(pdev);
+		err = request_firmware(&fw, name, connector->dev->dev);
 		if (err) {
 			drm_err(connector->dev,
 				"[CONNECTOR:%d:%s] Requesting EDID firmware \"%s\" failed (err=%d)\n",
-- 
2.34.1

