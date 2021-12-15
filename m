Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC0476067
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 19:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983B810E1F7;
	Wed, 15 Dec 2021 18:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E06610E1F7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=aE8thdFYQsldf57tWzPRdCwPLimKXIrrUxf4p6MIe5g=; b=ZB
 RlrjzHsTpoTx4JD4oO8rPvA0uffhOD7MwSaEFP1znA6wQgTdF8PAKY5mtK2IuiBiE721Lorl7R2+j
 XKm/nBeb8na6dI7i3a8ymrYZXWXEeB/dfUZR/1kVCbaBOh8EHsizzFE7fk8it3T2TciYSmdyyx+Fw
 /zBQOJ2ycoMYxbcECNdX+VgWMKtM3W7xLcbIbklJCyh06Ta/MaAoG8DosZRlK3e91joneq3gi9Uc9
 1/61hUgseBQsq24kHeDBJpuk6bZZE5a3ButRuAK8byookP5/DgIY828FBbLs63DptjBCsfCPAIl5W
 GHmbEOUj6gcl44VuxAHR3J19+JN0Cmnw==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mxYnB-0001lP-O5; Wed, 15 Dec 2021 18:14:17 +0000
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: vop: implement atomic_print_state
Date: Wed, 15 Dec 2021 18:14:12 +0000
Message-Id: <20211215181413.2950676-1-john@metanate.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rockchip VOP subclasses drm_crtc_state so implementing the
atomic_print_state hook allows printing the additional Rockchip-specific
fields of the CRTC state.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 3e8d9e2d1b67..f3975905599b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1569,6 +1569,19 @@ static void vop_crtc_destroy_state(struct drm_crtc *crtc,
 	kfree(s);
 }
 
+static void vop_crtc_print_state(struct drm_printer *p,
+				 const struct drm_crtc_state *state)
+{
+	struct rockchip_crtc_state *s = to_rockchip_crtc_state(state);
+
+	drm_printf(p, "\toutput_type=%s\n",
+		   drm_get_connector_type_name(s->output_type));
+	drm_printf(p, "\toutput_mode=%d\n", s->output_mode);
+	drm_printf(p, "\toutput_bpc=%d\n", s->output_bpc);
+	drm_printf(p, "\toutput_flags=%x\n", s->output_flags);
+	drm_printf(p, "\tenable_afbc=%d\n", s->enable_afbc);
+}
+
 static void vop_crtc_reset(struct drm_crtc *crtc)
 {
 	struct rockchip_crtc_state *crtc_state =
@@ -1652,6 +1665,7 @@ static const struct drm_crtc_funcs vop_crtc_funcs = {
 	.reset = vop_crtc_reset,
 	.atomic_duplicate_state = vop_crtc_duplicate_state,
 	.atomic_destroy_state = vop_crtc_destroy_state,
+	.atomic_print_state = vop_crtc_print_state,
 	.enable_vblank = vop_crtc_enable_vblank,
 	.disable_vblank = vop_crtc_disable_vblank,
 	.set_crc_source = vop_crtc_set_crc_source,
-- 
2.34.1

