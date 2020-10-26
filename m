Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB4929986A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 22:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF446EA6E;
	Mon, 26 Oct 2020 21:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B116EA6E;
 Mon, 26 Oct 2020 21:01:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.30.34.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E32620829;
 Mon, 26 Oct 2020 21:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603746087;
 bh=MIKQiQBZmnJNoIdqgw0/BlRmOZ5SjarctyzS0l2h4+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LhJGZKnxSeOcuD6ScbAADTnR9TLfI1UtJCyMiRiDdhHRuZuvsY3YrTaDxh6sGNlq/
 GJNUazGYQ518GnLMyj7JxnE+sR70RBTEk+CHDZnfJAwrk6Kz51sc2k3Eqe9KndcdNq
 Br42FS+wMsgrnj3jVqhMnunD5FRtHzyJ9KYNpdAU=
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Anthony Koo <Anthony.Koo@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Subject: [PATCH 4/5] drm/amdgpu: fix build_coefficients() argument
Date: Mon, 26 Oct 2020 22:00:32 +0100
Message-Id: <20201026210039.3884312-4-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201026210039.3884312-1-arnd@kernel.org>
References: <20201026210039.3884312-1-arnd@kernel.org>
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
Cc: Lewis Huang <Lewis.Huang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Denis Efremov <efremov@linux.com>, Reza Amini <Reza.Amini@amd.com>,
 amd-gfx@lists.freedesktop.org, Josip Pavic <Josip.Pavic@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc -Wextra warns about a function taking an enum argument
being called with a bool:

drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c: In function 'apply_degamma_for_user_regamma':
drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c:1617:29: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_transfer_func_predefined' [-Wenum-conversion]
 1617 |  build_coefficients(&coeff, true);

It appears that a patch was added using the old calling conventions
after the type was changed, and the value should actually be 0
(TRANSFER_FUNCTION_SRGB) here instead of 1 (true).

Fixes: 55a01d4023ce ("drm/amd/display: Add user_regamma to color module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
index b8695660b480..09bc2c249e1a 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
@@ -1614,7 +1614,7 @@ static void apply_degamma_for_user_regamma(struct pwl_float_data_ex *rgb_regamma
 	struct pwl_float_data_ex *rgb = rgb_regamma;
 	const struct hw_x_point *coord_x = coordinates_x;
 
-	build_coefficients(&coeff, true);
+	build_coefficients(&coeff, TRANSFER_FUNCTION_SRGB);
 
 	i = 0;
 	while (i != hw_points_num + 1) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
