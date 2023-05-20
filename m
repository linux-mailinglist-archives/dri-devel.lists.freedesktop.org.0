Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E470AA0A
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 20:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D746410E19A;
	Sat, 20 May 2023 18:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9886010E19A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 18:24:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A7BB60BC9;
 Sat, 20 May 2023 18:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B667BC4339E;
 Sat, 20 May 2023 18:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684607047;
 bh=aSN0lbtzXMXs/1vWBSvYzOfemNma3YUjOg7pNQEdPKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IcWA+MZpt1cserR0ods2HUMH2Sdf1ci98AQSthvLhwHisoH+9nIIaf2n0jazQ1Pz2
 8GpP7SP2fIOWQvPoeTTePiOtwVVhtxOHzZWsRqv+L/ZLN7S+OlscxZ/QFIOw/hjJiN
 Q5horLkAZmD52zssAvHn0+hK5846ke8Svxb7QNY33CrER3hT08CmJvRS48BusDmFNv
 Jm7Tb97HGSqF1meXn0qbYY3kouvc1f6dQyrWYTyd09T9codEOGI4cBnuVjGS6tvbdC
 mVvaTq6NTDi0ZKTxfV0brkD/NnWZX8tk5YW3CPh+dp4Pe79hPvMSbdNPbSQmheH6au
 E6bdfuD8yI79w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 4/5] fbdev: stifb: Fix info entry in sti_struct on
 error path
Date: Sat, 20 May 2023 14:23:46 -0400
Message-Id: <20230520182352.856378-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520182352.856378-1-sashal@kernel.org>
References: <20230520182352.856378-1-sashal@kernel.org>
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
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, James.Bottomley@HansenPartnership.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Helge Deller <deller@gmx.de>

[ Upstream commit 0bdf1ad8d10bd4e50a8b1a2c53d15984165f7fea ]

Minor fix to reset the info field to NULL in case of error.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/stifb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index e606fc7287947..9c2be08026514 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1371,6 +1371,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	iounmap(info->screen_base);
 out_err0:
 	kfree(fb);
+	sti->info = NULL;
 	return -ENXIO;
 }
 
-- 
2.39.2

