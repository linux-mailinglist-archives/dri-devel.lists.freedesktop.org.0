Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9266B2A385E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 02:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FD26E7D2;
	Tue,  3 Nov 2020 01:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4466E5D2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 01:19:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26A26222B9;
 Tue,  3 Nov 2020 01:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604366340;
 bh=gLHIgoD2vt9hPiX3wLzXW2G/zO/wNF9ivi/BFLeyUOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gXVN3TdeRlNNM4CU/sCafYgCHMoybhZZZ/eSoZ8JOtvHtelPMN6K7CUQnwyf80dSh
 QQMzaojTU3jJdW8O/VWjYw4zw2FK9CkTvsfFTRybyTkfB3nlzXbfKSJie/OgsIEa8X
 eFhQgksuIcYrJYNOgtYW2qwvvW+bX+RA6lCEJg40=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 14/35] drm/sun4i: frontend: Fix the scaler phase
 on A33
Date: Mon,  2 Nov 2020 20:18:19 -0500
Message-Id: <20201103011840.182814-14-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103011840.182814-1-sashal@kernel.org>
References: <20201103011840.182814-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <maxime@cerno.tech>

[ Upstream commit e3190b5e9462067714d267c40d8c8c1d0463dda3 ]

The A33 has a different phase parameter in the Allwinner BSP on the
channel1 than the one currently applied. Fix this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>
Link: https://patchwork.freedesktop.org/patch/msgid/20201015093642.261440-3-maxime@cerno.tech
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_frontend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index c4959d9e16391..7186ba73d8e14 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -694,7 +694,7 @@ static const struct sun4i_frontend_data sun4i_a10_frontend = {
 };
 
 static const struct sun4i_frontend_data sun8i_a33_frontend = {
-	.ch_phase		= { 0x400, 0x400 },
+	.ch_phase		= { 0x400, 0xfc400 },
 	.has_coef_access_ctrl	= true,
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
