Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F56C55DB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8728310EA00;
	Wed, 22 Mar 2023 20:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00EF10EA00
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 20:01:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16729622CB;
 Wed, 22 Mar 2023 20:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE279C433D2;
 Wed, 22 Mar 2023 20:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515275;
 bh=eMWDS+3wZyH867vHh4eJhuV+Y41uSSa2FKh5pK+WX4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PcKFqSnc3k7sxgRGaz9e32zVyZIg9WGlNSXqTBfVvVAhchJDDc0OnB+ukKcVD7/hR
 l9OIyvX0EQPBLw23nkUuxPdzwDlDotF/Jlsao6R99JdH1cSg7Q1ydEqjTXt1Xrto90
 qhEcJs0qyaVgCsuvyDi2CefgMVQfpDqetRAH1SCCVF+OBPMj8/9w+xnhnqF/2JvDIX
 iwj/SE6qcjn5uRSoedY6GPsJHULUmdzx96VoseLndjD6rDtX9tZ4DPva07ClFJFarP
 VqFe064fO43QAEA9iuklo0JQGb4ecoboz8cJDbhrJetyzr8/h0F99HGDAwISjHN/ON
 vQ96crw/5GA1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 31/34] fbdev: au1200fb: Fix potential divide by
 zero
Date: Wed, 22 Mar 2023 15:59:23 -0400
Message-Id: <20230322195926.1996699-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
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
index 81c3154544287..b6b22fa4a8a01 100644
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

