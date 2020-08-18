Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A9248476
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 14:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE1889C6E;
	Tue, 18 Aug 2020 12:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28E189C6E;
 Tue, 18 Aug 2020 12:09:17 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1k80QV-000230-6O; Tue, 18 Aug 2020 12:09:15 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Anthony Koo <Anthony.Koo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: fix potential integer overflow when
 shifting 32 bit variable bl_pwm
Date: Tue, 18 Aug 2020 13:09:14 +0100
Message-Id: <20200818120914.20280-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

The 32 bit unsigned integer bl_pwm is being shifted using 32 bit arithmetic
and then being assigned to a 64 bit unsigned integer.  There is a potential
for a 32 bit overflow so cast bl_pwm to enforce a 64 bit shift operation
to avoid this.

Addresses-Coverity: ("unintentional integer overflow")
Fixes: 3ba01817365c ("drm/amd/display: Move panel_cntl specific register from abm to panel_cntl.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
index a6d73d30837c..df7f826eebd8 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
@@ -76,7 +76,7 @@ static unsigned int dce_get_16_bit_backlight_from_pwm(struct panel_cntl *panel_c
 	else
 		bl_pwm &= 0xFFFF;
 
-	current_backlight = bl_pwm << (1 + bl_int_count);
+	current_backlight = (uint64_t)bl_pwm << (1 + bl_int_count);
 
 	if (bl_period == 0)
 		bl_period = 0xFFFF;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
