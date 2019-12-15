Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B00011FB83
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 22:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB4B6E15B;
	Sun, 15 Dec 2019 21:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B7C6E15B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 21:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576445595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yLU18MDeeZNJi5hgkJKGMJhVVZt9wSaeY/CBNbzD+0=;
 b=Y9XXb4CShJY5mXASSEHsVBGabZ9o07e2nmf74DhEw4/b4xjYo/JN5lfA/xbQH2IOSXerfD
 EqK2M4qp+G8gRDT/8ByE8hEVtLKA2azM64ZUwywOk8ESJ9WU4jf+0n+H3VHV/bgYEz7UoE
 6ilBxzdDrQQ/vA70NM/IzYl31LRK0k0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-mqWx4IyyNPSYKWfG4MjUhw-1; Sun, 15 Dec 2019 16:33:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7233F107ACC4;
 Sun, 15 Dec 2019 21:33:12 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E49DB5C28C;
 Sun, 15 Dec 2019 21:33:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/i915/dp: Use BDB_GENERAL_FEATURES VBT block info for
 builtin panel-orientation
Date: Sun, 15 Dec 2019 22:33:07 +0100
Message-Id: <20191215213307.689830-2-hdegoede@redhat.com>
In-Reply-To: <20191215213307.689830-1-hdegoede@redhat.com>
References: <20191215213307.689830-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: mqWx4IyyNPSYKWfG4MjUhw-1
X-Mimecast-Spam-Score: 0
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some devices with a builtin panel have the panel mounted upside down,
this is indicated by the rotate_180 bit in the BDB_GENERAL_FEATURES VBT
block.

We store this info in dev_priv->vbt.orientation, use this to set the
connector's orientation property so that fbcon and userspace will show
the image the right way up on devices with an upside-down mounted panel.

This fixes the image being upside-down on a Teclast X89 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b05b2191b919..d31c04a22976 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7350,9 +7350,12 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	intel_connector->panel.backlight.power = intel_edp_backlight_power;
 	intel_panel_setup_backlight(connector, pipe);
 
-	if (fixed_mode)
+	if (fixed_mode) {
+		connector->display_info.panel_orientation =
+			dev_priv->vbt.orientation;
 		drm_connector_init_panel_orientation_property(
 			connector, fixed_mode->hdisplay, fixed_mode->vdisplay);
+	}
 
 	return true;
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
