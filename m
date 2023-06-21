Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC4D73928E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748C510E36E;
	Wed, 21 Jun 2023 22:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net
 (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0043910E135
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 22:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=W99jR6zQr9o9HH0LFWjkqVeyLEmhww0LQ1TODMrD+JU=;
 b=lgYVrVqzL5xtT/wvZAyliCCJFvkwGuTcAcJfKQdzdxZC6nLMwUo9oDusU22C1uWycY8I
 p34S3bqatApfjKJTD6B4eqk7llOn5/Xibjn/59rFvUNYJpcXcORsPCo/1q8lBzu49gqfjB
 5PDLZaTyULgvju+D0MFe6J6rsx8c/hdQbcyDzjbI6MDJnr3FbvWFMIIF/X0/Gt/wgODH29
 AMiYWHdlvJEungau2LBFg6UBFDagsmxX5TqNHt+ZoboL6wu8V4cakUrMw9jhJCfkqgkEj3
 F40YikYplgk68+/3que0WX9V4L4kVAXHsY7Sm/jyaWEFZ3bd0BYwBi10ZNkv5yNA==
Received: by filterdrecv-84b96456cb-hrvlt with SMTP id
 filterdrecv-84b96456cb-hrvlt-1-64937AAC-29
 2023-06-21 22:33:16.784398642 +0000 UTC m=+3624881.780498603
Received: from bionic.localdomain (unknown) by geopod-ismtpd-0 (SG) with ESMTP
 id q2JBcGBES7ak8zO87bOzoQ Wed, 21 Jun 2023 22:33:16.341 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/5] drm/rockchip: vop: Fix reset of state in duplicate
 state crtc funcs
Date: Wed, 21 Jun 2023 22:33:17 +0000 (UTC)
Message-ID: <20230621223311.2239547-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621223311.2239547-1-jonas@kwiboo.se>
References: <20230621223311.2239547-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h4IxyhjudaBMscryW?=
 =?us-ascii?Q?yil2MxaaDxax+ugZQXodSqRHYB6mo1lanwr1jqt?=
 =?us-ascii?Q?Ei9avORGicVCxu+gicqUMciYzh1qKi1ZY3R+1P3?=
 =?us-ascii?Q?aX7yUhNr6Or2AE9dNYOm56eYLJtPiUd3ZR50SPS?=
 =?us-ascii?Q?B1bkQhX3ZiGjT=2F=2FxAb0d=2Fm0K6Mrf5xdkwW64C85?=
 =?us-ascii?Q?YKcmxYRXdySdhLFV3XH4A=3D=3D?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Mark Yao
 <markyao0591@gmail.com>
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct rockchip_crtc_state members such as output_type, output_bpc and
enable_afbc is always reset to zero in the atomic_duplicate_state crtc
funcs.

Fix this by using kmemdup on the subclass rockchip_crtc_state struct.

Fixes: 4e257d9eee23 ("drm/rockchip: get rid of rockchip_drm_crtc_mode_config")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
---
v2:
- Collect r-b tag

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index a530ecc4d207..60b23636a3fe 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1614,7 +1614,8 @@ static struct drm_crtc_state *vop_crtc_duplicate_state(struct drm_crtc *crtc)
 	if (WARN_ON(!crtc->state))
 		return NULL;
 
-	rockchip_state = kzalloc(sizeof(*rockchip_state), GFP_KERNEL);
+	rockchip_state = kmemdup(to_rockchip_crtc_state(crtc->state),
+				 sizeof(*rockchip_state), GFP_KERNEL);
 	if (!rockchip_state)
 		return NULL;
 
-- 
2.41.0

