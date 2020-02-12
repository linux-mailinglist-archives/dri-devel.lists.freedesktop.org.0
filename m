Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBDE15B1C1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 21:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3277A6E0FD;
	Wed, 12 Feb 2020 20:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6216E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 20:22:39 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 66so3253299otd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 12:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xmzww6qF1lYp+hV6WRAA52aNnE6EhgFR79VxQVFdEbg=;
 b=nkbh6w7W1frgTutwoIOqB46IEt/u7BkmErIY7bDx0DdhP5QnLj69nrF4SEeakXMTW1
 Fn2mOQDw5cRMyx+CuzHUd5/1DWCXXS1kG/kE3Zw/3MaEk2DH4XeWJb2Bg64qGVlDk2Ii
 sMVpVOkSpc2oiKZT90/ajHC6hEg1UVHdCYnNdhEPOiaSuRn9wUwTClRdDqqCnPVrznFA
 OdHVbL7zYdO384Dd6yhnTVnBvR+TD4WU73vEx8xz51KJDQFcJQ0bg8kqe2DiArDG7SVY
 DLrL9u3AqEDYLEdR2//hsTNCvVabmIvGt4LrZTr+RFc1JXxcUPYv+Kiw5vWQPHi+qFfB
 oIpg==
X-Gm-Message-State: APjAAAUVvuL5ETqnO5+GpQmyJgicZtI/Gm5E1drBw0DfHHhkuC5c+7f5
 Lt9eBC0ji5vPcTjVoryAJw==
X-Google-Smtp-Source: APXvYqyU0o1Pze8wveuZDA3u/iHypwszUsk+ei4KqiNpwRNL9Jlei+NqysV33pWakfS6MC4rBmeMAQ==
X-Received: by 2002:a9d:6b84:: with SMTP id b4mr10865483otq.190.1581538958277; 
 Wed, 12 Feb 2020 12:22:38 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id o1sm14852otl.49.2020.02.12.12.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 12:22:37 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panfrost: Don't try to map on error faults
Date: Wed, 12 Feb 2020 14:22:36 -0600
Message-Id: <20200212202236.13095-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomeu Vizoso <tomeu.vizoso@collabora.com>

If the exception type isn't a translation fault, don't try to map and
instead go straight to a terminal fault.

Otherwise, we can get flooded by kernel warnings and further faults.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
I rewrote this some simplifying the code and somewhat following Steven's 
suggested. Still not using defines though. No defines here was good 
enough before IMO.

Only compile tested.

 drivers/gpu/drm/panfrost/panfrost_mmu.c | 44 +++++++++++--------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 763cfca886a7..4f2836bd9215 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -596,33 +596,27 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 		source_id = (fault_status >> 16);
 
 		/* Page fault only */
-		if ((status & mask) == BIT(i)) {
-			WARN_ON(exception_type < 0xC1 || exception_type > 0xC4);
-
+		ret = -1;
+		if ((status & mask) == BIT(i) && (exception_type & 0xF8) == 0xC0)
 			ret = panfrost_mmu_map_fault_addr(pfdev, i, addr);
-			if (!ret) {
-				mmu_write(pfdev, MMU_INT_CLEAR, BIT(i));
-				status &= ~mask;
-				continue;
-			}
-		}
 
-		/* terminal fault, print info about the fault */
-		dev_err(pfdev->dev,
-			"Unhandled Page fault in AS%d at VA 0x%016llX\n"
-			"Reason: %s\n"
-			"raw fault status: 0x%X\n"
-			"decoded fault status: %s\n"
-			"exception type 0x%X: %s\n"
-			"access type 0x%X: %s\n"
-			"source id 0x%X\n",
-			i, addr,
-			"TODO",
-			fault_status,
-			(fault_status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
-			exception_type, panfrost_exception_name(pfdev, exception_type),
-			access_type, access_type_name(pfdev, fault_status),
-			source_id);
+		if (ret)
+			/* terminal fault, print info about the fault */
+			dev_err(pfdev->dev,
+				"Unhandled Page fault in AS%d at VA 0x%016llX\n"
+				"Reason: %s\n"
+				"raw fault status: 0x%X\n"
+				"decoded fault status: %s\n"
+				"exception type 0x%X: %s\n"
+				"access type 0x%X: %s\n"
+				"source id 0x%X\n",
+				i, addr,
+				"TODO",
+				fault_status,
+				(fault_status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
+				exception_type, panfrost_exception_name(pfdev, exception_type),
+				access_type, access_type_name(pfdev, fault_status),
+				source_id);
 
 		mmu_write(pfdev, MMU_INT_CLEAR, mask);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
