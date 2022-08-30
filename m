Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1265A6A1E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF6E10E2A6;
	Tue, 30 Aug 2022 17:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58EF10E298
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:25:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72EE5617AA;
 Tue, 30 Aug 2022 17:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0380EC433C1;
 Tue, 30 Aug 2022 17:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880333;
 bh=hL/0P9NZvhSOooiTe1PRQF0s5L0Ochs2JID39gpuJ3c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R8Ir6aBia1VmRd74Hqm7duB79em3+co7LvP8R2osvuKnjsPyAmJ9Ejqy+ctdcghhc
 7poM7TOkh8VkOzsr6XzYJucTVgxtbRHUeVQ8Euy06jZG9uG1pz4qeT9zLZGf1s4Ueo
 oGmGLySlZJKIZrPWW4YSH/RYFjGM626Jf6+3GboEy90kRDiboL9B73k4UL9+xe2bsx
 pvwE+z5+1L5EyUnD7/quPq85zC/pBLwJ+dGZEbHO4QzYqkw+QTHACwtAxr8tyoPF3j
 7+im92ivVS+6lOJRVKwv7lPHGuXV5UwkYl6mYtTwJzg6bxyAG+xlJlGgiqEQSo11Eh
 qrLdvUSWyZZ0A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 11/12] fbdev: chipsfb: Add missing
 pci_disable_device() in chipsfb_pci_init()
Date: Tue, 30 Aug 2022 13:24:42 -0400
Message-Id: <20220830172444.581654-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172444.581654-1-sashal@kernel.org>
References: <20220830172444.581654-1-sashal@kernel.org>
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
index 80fdd3ee0565f..57b1e011d2d34 100644
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

