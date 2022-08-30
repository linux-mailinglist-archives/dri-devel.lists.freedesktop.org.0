Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9B5A6A46
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F7710E2C3;
	Tue, 30 Aug 2022 17:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39410E2C2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:27:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97C5A617BD;
 Tue, 30 Aug 2022 17:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3EEC433C1;
 Tue, 30 Aug 2022 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880425;
 bh=DnYQUcsVH32s4uZbj997262p3sc1ImMPNTeT3izOTnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JTz+XukYPka2V8EUJH5G71d9eByxlOgEx56lOQ5mKrJn8vNKLqCwPGO4R2Y3qoW8L
 SA+LHUQTFyY3Z1hVMCVZrLP/oNzIgKH8rpd+xGgWP6mQADvavicvZ0GPrrvItqTusi
 3IJtT1glg1JlCF/5vGjMkxN1j/rfG1Bh6uDj1k8yKGRbgUAhrKPI+mnqhmiZ4Ftk07
 eZwRL2eGW+BBNL4LpR/G3geImU/5PHrzGj5cxdETCgBhpMYm69TVwOjaVLz90B9r/2
 vM+564p7tHZzQJu02yjkMe7pRvorxVUL5sPZwLuaH85rSkLclMT+WiVvFHE/pqyw0K
 dshYpQLu0XouQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 8/8] fbdev: chipsfb: Add missing
 pci_disable_device() in chipsfb_pci_init()
Date: Tue, 30 Aug 2022 13:26:31 -0400
Message-Id: <20220830172631.581969-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172631.581969-1-sashal@kernel.org>
References: <20220830172631.581969-1-sashal@kernel.org>
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
index 413b465e69d8e..7ca149ab86d20 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -432,6 +432,7 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
  err_release_fb:
 	framebuffer_release(p);
  err_disable:
+	pci_disable_device(dp);
  err_out:
 	return rc;
 }
-- 
2.35.1

