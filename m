Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18716C5611
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B42010EA19;
	Wed, 22 Mar 2023 20:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C524610EA18
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 20:03:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4838F622DE;
 Wed, 22 Mar 2023 20:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8471C4339C;
 Wed, 22 Mar 2023 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515383;
 bh=H2fvv6Sn/nwtQj7JD929f6vx9acoQ8RQKgq2U3QvaLY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L3thXqPgNW4dF2u8cwq4mH7VhDZUrwX6s9j2jbqYzUrEOktkgdTICnRJimK/QAQYp
 UTF3hUIg+pAi0IC3/deThUcjRBlWHcgzu1hgvP8QH4FA5JuPIEQcedX/n/DO9QBKRV
 jbIILGPy7LCEk/9yYaMnqrG2yO1POM+XJqRoJQOvKPa5xbdyDOUPuKSNakuBqQm4GP
 t20XLuCEWeBZiT1ywrXZ9p+ezMLDE1EK3dtonjfRy9bZxZuvv2RvDMqNLMc33uSmvP
 ABz0ZPpztHh9uBInPW9JqlQEY0mi7jlEuZ1UC/Erdm7hJ0DQ8VOhp/XVRZCEdFx7r6
 MrHelroOxZ0Rg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 7/9] fbdev: intelfb: Fix potential divide by zero
Date: Wed, 22 Mar 2023 16:02:39 -0400
Message-Id: <20230322200242.1997527-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322200242.1997527-1-sashal@kernel.org>
References: <20230322200242.1997527-1-sashal@kernel.org>
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
 Helge Deller <deller@gmx.de>, mbroemme@libmpq.org,
 dri-devel@lists.freedesktop.org, Wei Chen <harperchen1110@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit d823685486a3446d061fed7c7d2f80af984f119a ]

Variable var->pixclock is controlled by user and can be assigned
to zero. Without proper check, divide by zero would occur in
intelfbhw_validate_mode and intelfbhw_mode_to_hw.

Error out if var->pixclock is zero.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/intelfb/intelfbdrv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index a76c61512c608..274e6bb4a9610 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -1214,6 +1214,9 @@ static int intelfb_check_var(struct fb_var_screeninfo *var,
 
 	dinfo = GET_DINFO(info);
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	/* update the pitch */
 	if (intelfbhw_validate_mode(dinfo, var) != 0)
 		return -EINVAL;
-- 
2.39.2

