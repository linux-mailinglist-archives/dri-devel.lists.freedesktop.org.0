Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5BCB295B0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 01:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBB210E008;
	Sun, 17 Aug 2025 23:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="vHCvOWke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Sun, 17 Aug 2025 23:26:32 UTC
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABA610E008
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 23:26:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1755472789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=19CADCH4ex67/f+oe/6jdXcNL5Bo7Hgf1ytFVQUJ75o=;
 b=vHCvOWkevczGBaSiKQOKMVduBqAKhNMXcUUYJ3VHsCcPs4N4TqCEwAtxx5W/TYeGa7mGb6
 zJQK5bh1CDksTt/5z2ioQ84D8FzcKhmmZsn1yLWJ98biJ8sGNe+Rib/tjGQ5+uDV5PFaTZ
 DDIWkDG+FqjjYcOTmktSfgN1MSMuBaQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm: Use strscpy() instead of strscpy_pad()
Date: Mon, 18 Aug 2025 01:19:34 +0200
Message-ID: <20250817231933.634116-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

kzalloc() already zero-initializes the destination buffers, making
strscpy() sufficient for safely copying the names. The additional
NUL-padding performed by strscpy_pad() is unnecessary.

If the destination buffer has a fixed length, strscpy() automatically
determines its size using sizeof() when the argument is omitted. This
makes the explicit size arguments unnecessary.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/gpu/drm/drm_property.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149a35..47f2891f3f06 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -128,7 +128,7 @@ struct drm_property *drm_property_create(struct drm_device *dev,
 	property->num_values = num_values;
 	INIT_LIST_HEAD(&property->enum_list);
 
-	strscpy_pad(property->name, name, DRM_PROP_NAME_LEN);
+	strscpy(property->name, name);
 
 	list_add_tail(&property->head, &dev->mode_config.property_list);
 
@@ -421,7 +421,7 @@ int drm_property_add_enum(struct drm_property *property,
 	if (!prop_enum)
 		return -ENOMEM;
 
-	strscpy_pad(prop_enum->name, name, DRM_PROP_NAME_LEN);
+	strscpy(prop_enum->name, name);
 	prop_enum->value = value;
 
 	property->values[index] = value;
-- 
2.50.1

