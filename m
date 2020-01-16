Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3C13FB32
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 22:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E77E6E2C4;
	Thu, 16 Jan 2020 21:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730C16E2B6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 21:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579209416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vw6H7ASYVkU51Cq9DruCycaNw/+qQUS/vjyDCwvBhVI=;
 b=Lc91MoHUlBZQPBhx016PGQLNMJSGvpTPor878zp/CjgCWwyPhUOT7NewcCmFY6NL3pBN6L
 yefcPM6icXGiGiwad3d8V1c0s8KIr6WHqobtX6EgDgmnaKW9e5+JShhceYr7i2K562aX5q
 GAsxavgi7unHopIqmLwAzuJUFWQ8ntY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-otu8gQRUPUesT5gx5QpVYA-1; Thu, 16 Jan 2020 16:16:52 -0500
X-MC-Unique: otu8gQRUPUesT5gx5QpVYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD8371854336;
 Thu, 16 Jan 2020 21:16:50 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5723760C84;
 Thu, 16 Jan 2020 21:16:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/i915: Fix DPCD register order in
 intel_dp_aux_enable_backlight()
Date: Thu, 16 Jan 2020 16:16:10 -0500
Message-Id: <20200116211623.53799-4-lyude@redhat.com>
In-Reply-To: <20200116211623.53799-1-lyude@redhat.com>
References: <20200116211623.53799-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 AceLan Kao <acelan.kao@canonical.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Perry Yuan <pyuan@redhat.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For eDP panels, it appears it's expected that so long as the panel is in
DPCD control mode that the brightness value is never set to 0. Instead,
if the desired effect is to set the panel's backlight to 0 we're
expected to simply turn off the backlight through the
DP_EDP_DISPLAY_CONTROL_REGISTER.

We already do the latter correctly in intel_dp_aux_disable_backlight().
But, we make the mistake of writing the DPCD registers in the wrong
order when enabling the backlight in intel_dp_aux_enable_backlight()
since we currently enable the backlight through
DP_EDP_DISPLAY_CONTROL_REGISTER before writing the brightness level. On
the X1 Extreme 2nd Generation, this appears to have the potential of
confusing the panel in such a way that further attempts to set the
brightness don't actually change the backlight as expected and leave it
off. Presumably, this happens because the incorrect register writing
order briefly leaves the panel with DPCD mode enabled and a 0 brightness
level set.

So, reverse the order we write the DPCD registers when enabling the
panel backlight so that we write the brightness value first, and enable
the backlight second. This fix appears to be the final bit needed to get
the backlight on the ThinkPad X1 Extreme 2nd Generation's AMOLED screen
working.

Tested-by: AceLan Kao <acelan.kao@canonical.com>
Tested-by: Perry Yuan <pyuan@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 5d4db5f8a165..77a759361c5c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -207,8 +207,9 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
 		}
 	}
 
+	intel_dp_aux_set_backlight(conn_state,
+				   connector->panel.backlight.level);
 	set_aux_backlight_enable(intel_dp, true);
-	intel_dp_aux_set_backlight(conn_state, connector->panel.backlight.level);
 }
 
 static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old_conn_state)
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
