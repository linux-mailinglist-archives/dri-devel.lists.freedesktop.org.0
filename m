Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F0E43BCF5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 00:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0E86E4C7;
	Tue, 26 Oct 2021 22:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D646E4C1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635286158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvLwBuw2xMaGHdYkra4v1Q3yXMsS6BPwfHitS+XchrA=;
 b=XusmX88FqTMOcOUt1O52FM6OeGAc0JnPtshzdZ43nNCKLBxgMXi7HKjP2jz/gI3C4OQ3lJ
 UWZKPeLbCniXFLTC3aeZ82N0Cu6jXUMrAxUCAMF7b9V90Qy+9UfGNEKGIiObXYvJXFbhcM
 5OeHBs98DMzs/JLh+u8t3rx5UBushkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-1kTBeKgbPZqk7x22hGux9g-1; Tue, 26 Oct 2021 18:09:16 -0400
X-MC-Unique: 1kTBeKgbPZqk7x22hGux9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA548112B8F0;
 Tue, 26 Oct 2021 22:09:14 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 981535F4E0;
 Tue, 26 Oct 2021 22:09:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Satadru Pramanik <satadru@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/5] drm/dp: Disable unsupported features in
 DP_EDP_BACKLIGHT_MODE_SET_REGISTER
Date: Tue, 26 Oct 2021 18:08:46 -0400
Message-Id: <20211026220848.439530-4-lyude@redhat.com>
In-Reply-To: <20211026220848.439530-1-lyude@redhat.com>
References: <20211026220848.439530-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

As it turns out, apparently some machines will actually leave additional
backlight functionality like dynamic backlight control on before the OS
loads. Currently we don't take care to disable unsupported features when
writing back the backlight mode, which can lead to some rather strange
looking behavior when adjusting the backlight.

So, let's fix this by ensuring we only keep supported features enabled for
panel backlights - which should fix some of the issues we were seeing from
this on fi-bdw-samus.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 867cf9cd73c3 ("drm/dp: Extract i915's eDP backlight code into DRM helpers")
---
 drivers/gpu/drm/drm_dp_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index ada0a1ff262d..8f2032a955cf 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -3372,7 +3372,9 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 		return ret < 0 ? ret : -EIO;
 	}
 
-	new_dpcd_buf = dpcd_buf;
+	/* Disable any backlight functionality we don't support that might be on */
+	new_dpcd_buf = dpcd_buf & (DP_EDP_BACKLIGHT_CONTROL_MODE_MASK |
+				   DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE);
 
 	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
@@ -3394,6 +3396,8 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 				    aux->name, ret);
 		else
 			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
+	} else {
+		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
 	}
 
 	if (new_dpcd_buf != dpcd_buf) {
-- 
2.31.1

