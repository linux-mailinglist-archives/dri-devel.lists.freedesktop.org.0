Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C461204F1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 13:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC8C6E4E6;
	Mon, 16 Dec 2019 12:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09956E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576498064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQ46nvUqunNbgCF9mSFvcSSkOg8dmX0iy8J423hZNsI=;
 b=POw0rd2xNEPtfngD6rQwIDSy2l9h2iaUfawl880+T4KRH9c1suwoRiNYAKYHiOSRatW9ww
 KLock0eLuu6s/xZSoE5HadLRI1xuZq0YBaW+6bv1nKGRQAt8VW70kXjXxWJtQIkldjpXM3
 2VRyUTVHwDpWZXLDqvDFpdK95gTHqKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-3ahovy91MrqEk-n33ywftw-1; Mon, 16 Dec 2019 07:07:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6F491005502;
 Mon, 16 Dec 2019 12:07:41 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21A581000328;
 Mon, 16 Dec 2019 12:07:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/i915: Add invert-brightness quirk for Thundersoft
 TST178 tablet
Date: Mon, 16 Dec 2019 13:07:35 +0100
Message-Id: <20191216120735.1091873-3-hdegoede@redhat.com>
In-Reply-To: <20191216120735.1091873-1-hdegoede@redhat.com>
References: <20191216120735.1091873-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 3ahovy91MrqEk-n33ywftw-1
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Thundersoft TST178 tablet uses a DSI panel with an external PWM
controller (as all DSI panels do). But unlike other DSI panels a duty-cycle
of 100% turns the backlight off and 0% sets it to maximum brightness.

I've checked the VBT and there is a BDB_LVDS_BACKLIGHT section, but
it does not set the active_low_pwm flag. This tablet re-uses the main
PCI vendor and product ids for the subsystem ids, so I see no other option
then to add a DMI based quirk to fix this.

Note that the PWM backlight code in intel_panel.c currently does not honor
the vbt.active_low_pwm flag, but that does not matter in this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 399b1542509f..54dba152ead8 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -82,6 +82,16 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
 					    DMI_MATCH(DMI_PRODUCT_NAME, ""),
 				},
 			},
+			{
+				.callback = intel_dmi_reverse_brightness,
+				.ident = "Thundersoft TST178 tablet",
+				/* DMI strings are too generic, also match on BIOS date */
+				.matches = {DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+					    DMI_EXACT_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+					    DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
+					    DMI_EXACT_MATCH(DMI_BIOS_DATE, "04/15/2014"),
+				},
+			},
 			{ }  /* terminating entry */
 		},
 		.hook = quirk_invert_brightness,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
