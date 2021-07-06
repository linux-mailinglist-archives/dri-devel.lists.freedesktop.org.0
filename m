Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9583BCBA1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6A16E061;
	Tue,  6 Jul 2021 11:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA2C6E04A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:15:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AC2961C28;
 Tue,  6 Jul 2021 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570111;
 bh=jsq9Lm87mEaGrOMSoJNKmgrmnj6vOX9jZw1y6QOjEsk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O3W7cgBmWHvXJG04NRNSHNE8IHMnc6ZB2Hih3IU5Htu16ljcz9Ty8qOuCMjcI6Sbp
 TuPGgrpS3MrZEb4ZC7Z9t6dBmSfW60MyeBDusFuowfg4Rr+IvU7w67GEG4tGn99zh8
 iLP4ekOds/m/ZeXB04cIe4A6/T0MhPxsM0RkeoRMrgg5Rh91xi1T1lYlI0R3El4ZYl
 r47+QtyGJ+T0sY9ILrziUJYbsgkpTTAouE8l8YReU7ULE7NkBMsJa6CL6GlhihN6u1
 +kwP6eq1MKrDGls2mwykqJaux19LcPYHH4UOv1j8cXCpoHq4r/tHo3++LhZgzDzXEm
 DzJvxK/1T50tw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 043/189] drm/vc4: Fix clock source for VEC
 PixelValve on BCM2711
Date: Tue,  6 Jul 2021 07:11:43 -0400
Message-Id: <20210706111409.2058071-43-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

[ Upstream commit fc7a8abcee2225d6279ff785d33e24d70c738c6e ]

On the BCM2711 (Raspberry Pi 4), the VEC is actually connected to
output 2 of pixelvalve3.

NOTE: This contradicts the Broadcom docs, but has been empirically
tested and confirmed by Raspberry Pi firmware devs.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210520150344.273900-2-maxime@cerno.tech
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 76657dcdf9b0..665ddf8f347f 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -994,7 +994,7 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
-		[0] = VC4_ENCODER_TYPE_VEC,
+		[PV_CONTROL_CLK_SELECT_VEC] = VC4_ENCODER_TYPE_VEC,
 	},
 };
 
-- 
2.30.2

