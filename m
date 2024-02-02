Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F938477ED
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 19:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D401E10E803;
	Fri,  2 Feb 2024 18:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gtmOCbON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88210E7EE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 18:42:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 176DA611C6;
 Fri,  2 Feb 2024 18:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DEAC433C7;
 Fri,  2 Feb 2024 18:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706899357;
 bh=uvhYev15j5sKSpk4W36dY35o9B0FZ/iIo2RY+WGvCdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gtmOCbON1oxGBijgXNE1xXgOfJd920SfAxewvQTnK493WNdY8cP+1OY4zqz0tgnWW
 Lm9Df06BDyq4GALDdeoww/Ew8OeE0NJ9DrnDgL14mevDJmVwFYObHgBGGsxk87bhAW
 sft/LQNJEqVQ6DdTvuP50KNaKZBYimqTj57HE5IvSXYDICiwNcTrpcEWR69kjyzKhh
 nhViWu2ctSoHX/Yotv9wY40OZgj/Qvv5LKpctKmnBWkJCrys+DTpmLGbk7OeZ0zDHL
 MuAP0lm+om+oZppvcT31bOqHdJxYRtiwrWFHWRlpp5Bua3iVPIXTHkqc3l5d368vIs
 hzTEqi0XTn/LQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fullway Wang <fullwaywang@outlook.com>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, tzimmermann@suse.de, sam@ravnborg.org,
 javierm@redhat.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 4.19 4/5] fbdev: sis: Error out if pixclock equals zero
Date: Fri,  2 Feb 2024 13:42:25 -0500
Message-ID: <20240202184229.542298-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202184229.542298-1-sashal@kernel.org>
References: <20240202184229.542298-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.306
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fullway Wang <fullwaywang@outlook.com>

[ Upstream commit e421946be7d9bf545147bea8419ef8239cb7ca52 ]

The userspace program could pass any values to the driver through
ioctl() interface. If the driver doesn't check the value of pixclock,
it may cause divide-by-zero error.

In sisfb_check_var(), var->pixclock is used as a divisor to caculate
drate before it is checked against zero. Fix this by checking it
at the beginning.

This is similar to CVE-2022-3061 in i740fb which was fixed by
commit 15cf0b8.

Signed-off-by: Fullway Wang <fullwaywang@outlook.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/sis/sis_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 20aff9005978..b7f9da690db2 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -1488,6 +1488,8 @@ sisfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 
 	vtotal = var->upper_margin + var->lower_margin + var->vsync_len;
 
+	if (!var->pixclock)
+		return -EINVAL;
 	pixclock = var->pixclock;
 
 	if((var->vmode & FB_VMODE_MASK) == FB_VMODE_NONINTERLACED) {
-- 
2.43.0

