Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E62117C4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 03:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4396EA40;
	Thu,  2 Jul 2020 01:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9BA6E507
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:25:36 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3919720748;
 Thu,  2 Jul 2020 01:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593653135;
 bh=Xi7/eg4OGJypXMWBSatH0ZdfxFUt+M0VePkYdJ7Z6v4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=obWJr1/cH2DaxrkT5HiVbDCu05c7Pz9C1Z81ibW+WbubS5zjJbVJ0AN+eq5/Nw1lc
 b5l3j6GVGauaxGxWw1IIbSggaawuQ2cEFKjpghUd5qQRB3QkvU59CQw/bWJ307l5YO
 PuO5XX3LJmSasDtCJFGtftkWJciWtSpoP4WC8DDA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 09/40] drm: mcde: Fix display initialization
 problem
Date: Wed,  1 Jul 2020 21:23:30 -0400
Message-Id: <20200702012402.2701121-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012402.2701121-1-sashal@kernel.org>
References: <20200702012402.2701121-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit b984b6d8b52372b98cce0a6ff6c2787f50665b87 ]

The following bug appeared in the MCDE driver/display
initialization during the recent merge window.

First the place we call drm_fbdev_generic_setup() in the
wrong place: this needs to be called AFTER calling
drm_dev_register() else we get this splat:

 ------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/drm_fb_helper.c:2198 drm_fbdev_generic_setup+0x164/0x1a8
mcde a0350000.mcde: Device has not been registered.
Modules linked in:
Hardware name: ST-Ericsson Ux5x0 platform (Device Tree Support)
[<c010e704>] (unwind_backtrace) from [<c010a86c>] (show_stack+0x10/0x14)
[<c010a86c>] (show_stack) from [<c0414f38>] (dump_stack+0x9c/0xb0)
[<c0414f38>] (dump_stack) from [<c0121c8c>] (__warn+0xb8/0xd0)
[<c0121c8c>] (__warn) from [<c0121d18>] (warn_slowpath_fmt+0x74/0xb8)
[<c0121d18>] (warn_slowpath_fmt) from [<c04b154c>] (drm_fbdev_generic_setup+0x164/0x1a8)
[<c04b154c>] (drm_fbdev_generic_setup) from [<c04ed278>] (mcde_drm_bind+0xc4/0x160)
[<c04ed278>] (mcde_drm_bind) from [<c04f06b8>] (try_to_bring_up_master+0x15c/0x1a4)
(...)

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200613223027.4189309-1-linus.walleij@linaro.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5649887d2b901..16e5fb9ec784d 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -215,7 +215,6 @@ static int mcde_modeset_init(struct drm_device *drm)
 
 	drm_mode_config_reset(drm);
 	drm_kms_helper_poll_init(drm);
-	drm_fbdev_generic_setup(drm, 32);
 
 	return 0;
 
@@ -282,6 +281,8 @@ static int mcde_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto unbind;
 
+	drm_fbdev_generic_setup(drm, 32);
+
 	return 0;
 
 unbind:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
