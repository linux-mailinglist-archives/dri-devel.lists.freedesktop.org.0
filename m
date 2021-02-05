Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37431175D
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 00:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034136F538;
	Fri,  5 Feb 2021 23:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A53B6F53E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 23:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612568752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXEOzFshwbaugB5odL8bKl9y5OoiwyVDH5U6oa33fLU=;
 b=bmlbIWKmaRMlVU2/yjxiKe/fsBax5iKJFX40fPJaMPXairWNR1C55jAp7fz+FSnCOMEK39
 0LKRGyhdPLtpnZqeW6raWfbrSHyDIdF6WXe1y53EVb0yi15xsUfJJRTfNgYCgSaHW2JfbM
 uXw5bl6ZmxmR9TPjvmfSiHZKs1iG+qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-OdppFFdqMr2lpjR8LZVIxw-1; Fri, 05 Feb 2021 18:45:50 -0500
X-MC-Unique: OdppFFdqMr2lpjR8LZVIxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8BCD19611A0;
 Fri,  5 Feb 2021 23:45:48 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-116-79.rdu2.redhat.com
 [10.10.116.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D6A919718;
 Fri,  5 Feb 2021 23:45:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC v3 08/10] drm/i915/dpcd_bl: Return early in
 vesa_calc_max_backlight if we can't read PWMGEN_BIT_COUNT
Date: Fri,  5 Feb 2021 18:45:12 -0500
Message-Id: <20210205234515.1216538-9-lyude@redhat.com>
In-Reply-To: <20210205234515.1216538-1-lyude@redhat.com>
References: <20210205234515.1216538-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we can't read DP_EDP_PWMGEN_BIT_COUNT in
intel_dp_aux_vesa_calc_max_backlight() but do have a valid PWM frequency
defined in the VBT, we'll keep going in the function until we inevitably
fail on reading DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN. There's not much point in
doing this, so just return early.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 431758058aa0..c66350cdf7e9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -449,11 +449,14 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
 	int freq, fxp, fxp_min, fxp_max, fxp_actual, f = 1;
 	u8 pn, pn_min, pn_max;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &pn) == 1) {
-		pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
-		max_backlight = (1 << pn) - 1;
+	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &pn) != 1) {
+		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap\n");
+		return 0;
 	}
 
+	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+	max_backlight = (1 << pn) - 1;
+
 	/* Find desired value of (F x P)
 	 * Note that, if F x P is out of supported range, the maximum value or
 	 * minimum value will applied automatically. So no need to check that.
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
