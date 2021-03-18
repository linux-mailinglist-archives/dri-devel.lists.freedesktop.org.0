Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2A340ACF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 18:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F1B6E929;
	Thu, 18 Mar 2021 17:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560426E929
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616086935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aaIWi/Aa75Hr56eti79lKQowFccyYMrkVkBuTxfGEhk=;
 b=YVFz/JDRMjCqyoJcJDVcmOr6RvTFR6PiV2rcja1ksY6aMF+ftFMRCePXb7mqeOX+13uXvM
 GeF+e1QVIhJzID11OTOztHmkmkZC9NG1P7bxWpGaoRUlM62JVtQssm44jps4GCSRn1QkpT
 S270WycbgrVK4tUVbCLFtOJ9snqN5Do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-QzJu-dWLNPiT0vYhS6dp9g-1; Thu, 18 Mar 2021 13:02:11 -0400
X-MC-Unique: QzJu-dWLNPiT0vYhS6dp9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB50B190A7A1;
 Thu, 18 Mar 2021 17:02:09 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-18.rdu2.redhat.com [10.10.113.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1192019D9B;
 Thu, 18 Mar 2021 17:02:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/dpcd_bl: Don't try vesa interface unless specified
 by VBT
Date: Thu, 18 Mar 2021 13:02:02 -0400
Message-Id: <20210318170204.513000-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Aaron Ma <aaron.ma@canonical.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like that there actually are another subset of laptops on the market
that don't support the Intel HDR backlight interface, but do advertise
support for the VESA DPCD backlight interface despite the fact it doesn't
seem to work.

Note though I'm not entirely clear on this - on one of the machines where
this issue was observed, I also noticed that we appeared to be rejecting
the VBT defined backlight frequency in
intel_dp_aux_vesa_calc_max_backlight(). It's noted in this function that:

/* Use highest possible value of Pn for more granularity of brightness
 * adjustment while satifying the conditions below.
 * ...
 * - FxP is within 25% of desired value.
 *   Note: 25% is arbitrary value and may need some tweak.
 */

So it's possible that this value might just need to be tweaked, but for now
let's just disable the VESA backlight interface unless it's specified in
the VBT just to be safe. We might be able to try enabling this again by
default in the future.

Fixes: 2227816e647a ("drm/i915/dp: Allow forcing specific interfaces through enable_dpcd_backlight")
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Bugzilla: https://gitlab.freedesktop.org/drm/intel/-/issues/3169
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 651884390137..4f8337c7fd2e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -646,7 +646,6 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 			break;
 		case INTEL_BACKLIGHT_DISPLAY_DDI:
 			try_intel_interface = true;
-			try_vesa_interface = true;
 			break;
 		default:
 			return -ENODEV;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
