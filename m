Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC6173640
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 12:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEC66F3ED;
	Fri, 28 Feb 2020 11:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710546E167
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rpjPL9jqeyRVwMqMh1jhx1Zp0mgurSsoUQwzX5GX6lI=;
 b=Mz9b2MLkz3CJxBkvM9gLc3rWlnIBvuKH/QFFMjm4EYqtPcjTShR3Ebu+dSMnZdhKW3vs42
 fKCFJT2O3XaOPpkTV8aE/dA4rI2DBsuUP1KyPmn/jr7qWtMqI4yN2bl7rXPsi9icUyk3Fh
 G8DInaodq/JGeUWoEwNa2c2QtOHUhaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-CvNtpvaUPyKkMq86xVwOxg-1; Fri, 28 Feb 2020 06:41:18 -0500
X-MC-Unique: CvNtpvaUPyKkMq86xVwOxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B34BA0CDD;
 Fri, 28 Feb 2020 11:41:17 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-193.ams2.redhat.com
 [10.36.117.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1121E1CB;
 Fri, 28 Feb 2020 11:41:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH resend 2/2] drm/i915/dp: Use BDB_GENERAL_FEATURES VBT block
 info for builtin panel-orientation
Date: Fri, 28 Feb 2020 12:41:10 +0100
Message-Id: <20200228114110.187792-3-hdegoede@redhat.com>
In-Reply-To: <20200228114110.187792-1-hdegoede@redhat.com>
References: <20200228114110.187792-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
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
 drivers/gpu/drm/i915/display/intel_dp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2db8d46f61a1..c31f5233941c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7608,9 +7608,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	intel_panel_setup_backlight(connector, pipe);
 
 	if (fixed_mode) {
-		/* We do not know the orientation, but their might be a quirk */
 		drm_connector_set_panel_orientation_with_quirk(connector,
-				DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+				dev_priv->vbt.orientation,
 				fixed_mode->hdisplay, fixed_mode->vdisplay);
 	}
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
