Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1983B1887
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 13:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AC189DFD;
	Wed, 23 Jun 2021 11:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Wed, 23 Jun 2021 09:20:03 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643376E894;
 Wed, 23 Jun 2021 09:20:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.224])
 by lucky1.263xmail.com (Postfix) with ESMTP id 6C78CFAC1D;
 Wed, 23 Jun 2021 17:12:53 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P4528T140206187476736S1624439563868494_; 
 Wed, 23 Jun 2021 17:12:48 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <20a6f2888ef16c71f2ba7213c491eac8>
X-RL-SENDER: huqiqiao@uniontech.com
X-SENDER: huqiqiao@uniontech.com
X-LOGIN-NAME: huqiqiao@uniontech.com
X-FST-TO: airlied@linux.ie
X-RCPT-COUNT: 6
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: huqiqiao <huqiqiao@uniontech.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu:use kvcalloc instead of kvmalloc_array
Date: Wed, 23 Jun 2021 17:12:42 +0800
Message-Id: <20210623091242.12861-1-huqiqiao@uniontech.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 23 Jun 2021 11:08:46 +0000
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
Cc: huqiqiao <huqiqiao@uniontech.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kvmalloc_array + __GFP_ZERO is the same with kvcalloc.

Signed-off-by: huqiqiao <huqiqiao@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9acee4a5b2ba..50edc73525b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -908,9 +908,8 @@ static int amdgpu_vm_alloc_pts(struct amdgpu_device *adev,
 		unsigned num_entries;
 
 		num_entries = amdgpu_vm_num_entries(adev, cursor->level);
-		entry->entries = kvmalloc_array(num_entries,
-						sizeof(*entry->entries),
-						GFP_KERNEL | __GFP_ZERO);
+		entry->entries = kvcalloc(num_entries,
+						sizeof(*entry->entries), GFP_KERNEL);
 		if (!entry->entries)
 			return -ENOMEM;
 	}
-- 
2.11.0



