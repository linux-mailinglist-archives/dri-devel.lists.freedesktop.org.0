Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1A446872
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 19:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9785F6EC85;
	Fri,  5 Nov 2021 18:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457376EC85
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636137259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/G6y34JOTC7UqNDqWGUgS2eZXF3BvIhBAU3/+T9uZs=;
 b=gd9XK40dK2lsnIV3Js9EsXE+R9fJ05483MOqcwpHUdfTDLlgOlP/4r+TO35APR72P1Mxo4
 xDhwo/iLhPMpclbODHlbEwzO6YmgrkwVq5q2npMvOL3nE1DaHXULOR9eqqvbDoV82aZdOg
 v5GYTVdiTU8mCIaE4LQ/89Js3MD4fOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-558qMmg2NmON34f9YiwcaQ-1; Fri, 05 Nov 2021 14:34:16 -0400
X-MC-Unique: 558qMmg2NmON34f9YiwcaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 997621B2C983;
 Fri,  5 Nov 2021 18:34:14 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.16.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3CD75FC13;
 Fri,  5 Nov 2021 18:34:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 3/5] drm/dp: Don't read back backlight mode in
 drm_edp_backlight_enable()
Date: Fri,  5 Nov 2021 14:33:40 -0400
Message-Id: <20211105183342.130810-4-lyude@redhat.com>
In-Reply-To: <20211105183342.130810-1-lyude@redhat.com>
References: <20211105183342.130810-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As it turns out, apparently some machines will actually leave additional
backlight functionality like dynamic backlight control on before the OS
loads. Currently we don't take care to disable unsupported features when
writing back the backlight mode, which can lead to some rather strange
looking behavior when adjusting the backlight.

So, let's fix this by just not reading back the current backlight mode on
initial enable. I don't think there should really be any downsides to this,
and this will ensure we don't leave any unsupported functionality enabled.

This should fix at least one (but not all) of the issues seen with DPCD
backlight support on fi-bdw-samus

v5:
* Just avoid reading back DPCD register - Doug Anderson

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 867cf9cd73c3 ("drm/dp: Extract i915's eDP backlight code into DRM helpers")
---
 drivers/gpu/drm/drm_dp_helper.c | 40 ++++++++++-----------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index ada0a1ff262d..af2aad2f4725 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -3363,27 +3363,13 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 			     const u16 level)
 {
 	int ret;
-	u8 dpcd_buf, new_dpcd_buf;
+	u8 dpcd_buf = DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
 
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &dpcd_buf);
-	if (ret != 1) {
-		drm_dbg_kms(aux->drm_dev,
-			    "%s: Failed to read backlight mode: %d\n", aux->name, ret);
-		return ret < 0 ? ret : -EIO;
-	}
-
-	new_dpcd_buf = dpcd_buf;
-
-	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
-		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
-		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
-
-		if (bl->pwmgen_bit_count) {
-			ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
-			if (ret != 1)
-				drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
-					    aux->name, ret);
-		}
+	if (bl->pwmgen_bit_count) {
+		ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
+		if (ret != 1)
+			drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
+				    aux->name, ret);
 	}
 
 	if (bl->pwm_freq_pre_divider) {
@@ -3393,16 +3379,14 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 				    "%s: Failed to write aux backlight frequency: %d\n",
 				    aux->name, ret);
 		else
-			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
+			dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
 	}
 
-	if (new_dpcd_buf != dpcd_buf) {
-		ret = drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, new_dpcd_buf);
-		if (ret != 1) {
-			drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
-				    aux->name, ret);
-			return ret < 0 ? ret : -EIO;
-		}
+	ret = drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, dpcd_buf);
+	if (ret != 1) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
+			    aux->name, ret);
+		return ret < 0 ? ret : -EIO;
 	}
 
 	ret = drm_edp_backlight_set_level(aux, bl, level);
-- 
2.31.1

