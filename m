Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7032E5726EF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 22:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BF38F09A;
	Tue, 12 Jul 2022 20:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 916 seconds by postgrey-1.36 at gabe;
 Tue, 12 Jul 2022 07:29:23 UTC
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3783312AD14
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=bSYm9
 C5OeuYbDhENBAdXq4HRvNSPczwQvj64WhMLeyk=; b=KB5xRyB0ILL9VqILcLd4a
 S83vIxTAf0E3sDLh+IaFKKo9mFY/+zguQaYmpGa8ukqNu1zJ6iBn0SZUzUWirtFI
 YOPnaQnz31qw+8WWU4+DTiL5vZ1KRhfduBZ7fTcYXBcj04mzReko0ehU+D5Ejw7G
 XSo8sbf8UrMi8lwLxqseb8=
Received: from localhost.localdomain (unknown [111.48.58.12])
 by smtp11 (Coremail) with SMTP id D8CowAAHffomH81i5anSMQ--.64515S2;
 Tue, 12 Jul 2022 15:13:44 +0800 (CST)
From: Jiangshan Yi <13667453960@163.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Subject: [PATCH] component: replace ternary operator with min()
Date: Tue, 12 Jul 2022 15:12:23 +0800
Message-Id: <20220712071223.301160-1-13667453960@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowAAHffomH81i5anSMQ--.64515S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4kXF4DJw4UAry8WFWrAFb_yoWkCFc_Cr
 nruas7Cr1fCrWrZr12vwsIyryvqayj9F1jqFnagr1fG34UZan2gFykZryrt348Cr1Yg3Zr
 Gr1qyry2yr4IkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnc_-DUUUUU==
X-Originating-IP: [111.48.58.12]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbizQg8+1c7NeZ7AgAAsE
X-Mailman-Approved-At: Tue, 12 Jul 2022 20:05:01 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiangshan Yi <yijiangshan@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiangshan Yi <yijiangshan@kylinos.cn>

Fix the following coccicheck warning:

drivers/base/component.c:544: WARNING opportunity for min().
drivers/base/component.c:740: WARNING opportunity for min().

min() macro is defined in include/linux/minmax.h. It avoids
multiple evaluations of the arguments when non-constant and performs
strict type-checking.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/base/component.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5eadeac6c532..349c54694481 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -541,7 +541,7 @@ int component_master_add_with_match(struct device *parent,
 
 	mutex_unlock(&component_mutex);
 
-	return ret < 0 ? ret : 0;
+	return min(ret, 0);
 }
 EXPORT_SYMBOL_GPL(component_master_add_with_match);
 
@@ -737,7 +737,7 @@ static int __component_add(struct device *dev, const struct component_ops *ops,
 	}
 	mutex_unlock(&component_mutex);
 
-	return ret < 0 ? ret : 0;
+	return min(ret, 0);
 }
 
 /**
-- 
2.25.1

