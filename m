Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9FA4FF0B6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 09:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BF110E3C5;
	Wed, 13 Apr 2022 07:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
 by gabe.freedesktop.org (Postfix) with ESMTP id BEC16112224
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IPpag
 3+972R44s++fbd4ZAcZ5wlqRJ02VxB1aGKpffw=; b=nEdXCtMrzOZ/zONktw5jg
 1I09nJfdWLc33D9fu4tR5TH6vmjjL10DqtJS9HSLlbGPhEu2/zLYK8ZaIdcQwIAp
 3lT1Sui3EmoDWNwM4loA5wVd3I+nL3blvsJBCcEIqrNLcdFRcsfXuXZIH8R3GBI1
 4362rJv8MdczpkWAwIpCWI=
Received: from ubuntu.localdomain (unknown [58.213.83.157])
 by smtp1 (Coremail) with SMTP id C8mowACXpycocFZimRLWAQ--.47686S4;
 Wed, 13 Apr 2022 14:39:38 +0800 (CST)
From: Bernard Zhao <zhaojunkui2008@126.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/host1x: remove useless if(ptr) check to kfree
Date: Tue, 12 Apr 2022 23:39:34 -0700
Message-Id: <20220413063934.23571-1-zhaojunkui2008@126.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowACXpycocFZimRLWAQ--.47686S4
X-Coremail-Antispam: 1Uf129KBjvdXoW5KrWxZr1UAw1xWFyfXr48Crg_yoWxXwb_ur
 1kJr1kW3yrGFnYqa17ArnxZrW0yFZ8uaykZryIga4rtryUCrn8Jw17ur1fu3WrWa1rGFyD
 A3WxtrW5Jw17KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRpwZzPUUUUU==
X-Originating-IP: [58.213.83.157]
X-CM-SenderInfo: p2kd0y5xqn3xasqqmqqrswhudrp/1tbiYArhqlpEG2eDWwAAsb
X-Mailman-Approved-At: Wed, 13 Apr 2022 07:39:54 +0000
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
Cc: bernard@vivo.com, Bernard Zhao <zhaojunkui2008@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch remove useless if(ptr) check to kfree.

Signed-off-by: Bernard Zhao <zhaojunkui2008@126.com>
---
 drivers/gpu/host1x/fence.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index ecab72882192..05b36bfc8b74 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -93,8 +93,7 @@ static void host1x_syncpt_fence_release(struct dma_fence *f)
 {
 	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
 
-	if (sf->waiter)
-		kfree(sf->waiter);
+	kfree(sf->waiter);
 
 	dma_fence_free(f);
 }
-- 
2.33.1

