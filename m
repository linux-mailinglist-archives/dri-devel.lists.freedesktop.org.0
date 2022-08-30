Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D05A69EB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524D410E283;
	Tue, 30 Aug 2022 17:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6C310E286
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:24:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C64EBB81D1D;
 Tue, 30 Aug 2022 17:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B97EC433D7;
 Tue, 30 Aug 2022 17:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880270;
 bh=UyC6EuVYNPcXw2t8mig7weYbNDvzVVaZ6wLDTuTmYIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lcxianBDPHmZ9ZfzGcyfv9n/OqV5tyo0OjvHHU1npelBq9+Wr9NwKFBOB+U1D+ktr
 TB5E4iWQIDvG1yJVqcLD5/xr35TYxoGqz59vyWlDOzQIuvGv6Jr4PMwnSr8P1F7Op3
 z44i0CqcdtfIKI75MDOelZvG6RpcPpB5dRLJHxtsL/Lsk9jjLpxM/sYLDjOH5AZFaG
 MgCsF6+mgPPz3ygKs91xOGnNJ1JpwxooUVwNl3rv3c3G3UYsK1iya8qd8gjpUzs8li
 1OEt280E+twfRV528rVdf3Iis4F4EW78yDHJjfcY7wsBhtsevgmzXboLwcfe2iWBlH
 5MPrMUCCwTyeA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/16] fbdev: chipsfb: Add missing
 pci_disable_device() in chipsfb_pci_init()
Date: Tue, 30 Aug 2022 13:23:16 -0400
Message-Id: <20220830172317.581397-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172317.581397-1-sashal@kernel.org>
References: <20220830172317.581397-1-sashal@kernel.org>
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
 mpe@ellerman.id.au, Helge Deller <deller@gmx.de>, christophe.leroy@csgroup.eu,
 dri-devel@lists.freedesktop.org, Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit 07c55c9803dea748d17a054000cbf1913ce06399 ]

Add missing pci_disable_device() in error path in chipsfb_pci_init().

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/chipsfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index 393894af26f84..2b00a9d554fc0 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -430,6 +430,7 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
  err_release_fb:
 	framebuffer_release(p);
  err_disable:
+	pci_disable_device(dp);
  err_out:
 	return rc;
 }
-- 
2.35.1

