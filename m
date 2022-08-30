Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CDA5A6A49
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479EE10E2CB;
	Tue, 30 Aug 2022 17:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696E510E2CC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:27:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21D6FB81D36;
 Tue, 30 Aug 2022 17:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D195DC433C1;
 Tue, 30 Aug 2022 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880448;
 bh=tjMui3/sZ+L+ZhPIM7/IALO8nmLeCVVbPByfLgaGHUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CPMSQSTT8hdIGz+Ai2wkcHj9Z2X2Sm+xu6zgS/Fu9nbpqmHvnzM5awjua895w1PUb
 AAHu6piEoyB414f4hKRzzfBFhAMFqeExK0agDpGB0BeI35eJ1XqsV9mNGYQCD9cqx7
 2YXFKmc923EZoFEPzb59WSjpILE0AXPpYYp6YN8Jzrek4sOmIBX1t6JxAtPeHlPg6N
 8N4SCtQOrUCmsXcvizmuecOdnbV0n7jHvi9gQ7U841vUp6cyB5h1DK9VKe0Nrgipez
 7q0m/5hstdOhdv4ZEnI6JZhXxI6fNqYOUUluEyli7rrsB4vbsnJxpgK4DQLvzA9sDx
 57jx09HjSy2Kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 6/6] fbdev: chipsfb: Add missing
 pci_disable_device() in chipsfb_pci_init()
Date: Tue, 30 Aug 2022 13:27:06 -0400
Message-Id: <20220830172706.582088-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172706.582088-1-sashal@kernel.org>
References: <20220830172706.582088-1-sashal@kernel.org>
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
index 84a3778552eba..ec1f8af165e9e 100644
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

