Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACE96C5621
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F260110EA1D;
	Wed, 22 Mar 2023 20:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4FA10EA1A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 20:03:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F66DB81DF0;
 Wed, 22 Mar 2023 20:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A19EC433A7;
 Wed, 22 Mar 2023 20:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515388;
 bh=E4vPFq6KkOIXDrVd9H3/XXddQaNibLZsPHe/eNEX/cU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mzyDvdtK/Vts1cuTcFjCkaam4H7H5mfm2Q26kDAHbctp4tLSq78rk1xz2qt+L6W0t
 lP0dLFJHGShg/rvgt6tSH+hlis9kQOdsCUAMmtqq0SAX0dW8Ye0p3JV0ubWtUU0YXl
 8L9njuvnkFPO9K72GtsusdwAgtwnlmNzcrFjkKYaeIvdsZlFPv8DAcUPuF3l1ryJDt
 5CAqbHPI1ljto7I36EL4BMy6YBxM6jPeZOqk0Mv+wXcUO34WszzPd8KDv+ajGMT9EX
 CMJ2vietlsWHGrJQ1XefPh2Igb1He3f43fRkQe1nNmmzHZMpnMqeN7BYvpUqC1CD+V
 imTWhOj29HuUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 9/9] fbdev: au1200fb: Fix potential divide by zero
Date: Wed, 22 Mar 2023 16:02:41 -0400
Message-Id: <20230322200242.1997527-9-sashal@kernel.org>
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
Cc: Wei Chen <harperchen1110@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit 44a3b36b42acfc433aaaf526191dd12fbb919fdb ]

var->pixclock can be assigned to zero by user. Without
proper check, divide by zero would occur when invoking
macro PICOS2KHZ in au1200fb_fb_check_var.

Error out if var->pixclock is zero.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/au1200fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 265d3b45efd0c..43a4dddaafd52 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1040,6 +1040,9 @@ static int au1200fb_fb_check_var(struct fb_var_screeninfo *var,
 	u32 pixclock;
 	int screen_size, plane;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	plane = fbdev->plane;
 
 	/* Make sure that the mode respect all LCD controller and
-- 
2.39.2

