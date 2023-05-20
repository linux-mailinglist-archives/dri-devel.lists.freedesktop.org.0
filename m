Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4799170AA1E
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 20:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7606110E1A1;
	Sat, 20 May 2023 18:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC7510E19C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 18:24:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8639D616E2;
 Sat, 20 May 2023 18:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCE5C4339B;
 Sat, 20 May 2023 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684607083;
 bh=VkzKi7wqEKvjxhQtJcHeYKgd7dMVMtJz1Ug+wtlkdoc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fy72TrvJ7J784cjRgxWA2SpvpOvsHX1sfYZtOmTTE8vbR38hne3SXsean/1ptmXQo
 2xWZXczujirZ1j1bq7Hdzyp8xrNBqaxa21c0df7V3a6oyrvhQrjdvbMDZJUu/0Xt8v
 Pbe8DCSvmrm5AzNyJDfkmyUd4808ZDfPTJQotDFmgDIfpqlxUMOxFbp2/KItmpTVoD
 LkCuLqhFtEgGp97NzMIzX3vn/zV1kW7noUtk8CJdeC7knGa3ZvS0HQKZguxW1i8aka
 supxom6QhVxO3oreMwtqVfe6KTU5Oi+/t24nFiw6/EJxnkv0KF3CmFL60I2bfsJzlR
 3iR4rT2XePYdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 3/4] fbdev: stifb: Fix info entry in sti_struct
 on error path
Date: Sat, 20 May 2023 14:24:28 -0400
Message-Id: <20230520182432.866012-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520182432.866012-1-sashal@kernel.org>
References: <20230520182432.866012-1-sashal@kernel.org>
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
index 9313562e739e1..16eed250fd8f3 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1373,6 +1373,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	iounmap(info->screen_base);
 out_err0:
 	kfree(fb);
+	sti->info = NULL;
 	return -ENXIO;
 }
 
-- 
2.39.2

