Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209CF6C5623
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFFD10EA15;
	Wed, 22 Mar 2023 20:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9659E10EA1E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 20:03:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FAC4622D1;
 Wed, 22 Mar 2023 20:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061F8C433D2;
 Wed, 22 Mar 2023 20:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515403;
 bh=0vnA3WU9n71Hksc/Fk2ECnvm3tBZSD5qLPZsrYMfSA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TzZtufsQBBPZM9IScUzruPMYp1D56vQZsO+CrIGahMZDdzenMyEEI39179XXPSLqG
 V9tQLUmvRGi+F6aaSWSg46CaMEy0ta3W8lj7SchHkYQHL8ubxHMnEKHPbM+BBPJRdX
 AFfNl2B1kXDn0UGhBPzPBH/g0isWqOYynWAwa3gSecvarD9ZLCG5NOUPA3OtIzr69x
 Eqq/Y/7yXLA4YVMnteAoJVaQx1dB299AvjyzY/6gqkliyczrf4KRcArcDh3ro+78E2
 iQURybzri5mex0+YisIhIVpSAkbB3axvn7JjIxU3GJVJbMX4uJFu31nKvTW6idJPTd
 PhBWJBg8nYu4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 4/9] fbdev: tgafb: Fix potential divide by zero
Date: Wed, 22 Mar 2023 16:03:04 -0400
Message-Id: <20230322200309.1997651-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322200309.1997651-1-sashal@kernel.org>
References: <20230322200309.1997651-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Wei Chen <harperchen1110@gmail.com>,
 wsa+renesas@sang-engineering.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit f90bd245de82c095187d8c2cabb8b488a39eaecc ]

fb_set_var would by called when user invokes ioctl with cmd
FBIOPUT_VSCREENINFO. User-provided data would finally reach
tgafb_check_var. In case var->pixclock is assigned to zero,
divide by zero would occur when checking whether reciprocal
of var->pixclock is too high.

Similar crashes have happened in other fbdev drivers. There
is no check and modification on var->pixclock along the call
chain to tgafb_check_var. We believe it could also be triggered
in driver tgafb from user site.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/tgafb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 65ba9921506e2..9d2912947eef6 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -166,6 +166,9 @@ tgafb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
 	struct tga_par *par = (struct tga_par *)info->par;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	if (par->tga_type == TGA_TYPE_8PLANE) {
 		if (var->bits_per_pixel != 8)
 			return -EINVAL;
-- 
2.39.2

