Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C93B3AB2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 04:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39156E12D;
	Fri, 25 Jun 2021 02:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ED96E12D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 02:03:56 +0000 (UTC)
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 86DD1B1916;
 Fri, 25 Jun 2021 10:03:49 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P1334T140034502022912S1624586622420447_; 
 Fri, 25 Jun 2021 10:03:49 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7e806d5e61b4e62798b4abb7502b1da4>
X-RL-SENDER: huqiqiao@uniontech.com
X-SENDER: huqiqiao@uniontech.com
X-LOGIN-NAME: huqiqiao@uniontech.com
X-FST-TO: alexander.deucher@amd.com
X-RCPT-COUNT: 5
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: huqiqiao <huqiqiao@uniontech.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Subject: [PATCH] drm/amdgpu: use kvcalloc for entry->entries
Date: Fri, 25 Jun 2021 10:03:44 +0800
Message-Id: <20210625020344.30979-1-huqiqiao@uniontech.com>
X-Mailer: git-send-email 2.11.0
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
 huqiqiao <huqiqiao@uniontech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

malloc_array + __GFP_ZERO is the same with kvcalloc.

Signed-off-by: huqiqiao <huqiqiao@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index b8c31e3469c0..5cadfadc625f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -909,7 +909,7 @@ static int amdgpu_vm_alloc_pts(struct amdgpu_device *adev,
 
 		num_entries = amdgpu_vm_num_entries(adev, cursor->level);
 		entry->entries = kvcalloc(num_entries,
-					sizeof(*entry->entries), GFP_KERNEL);
+			sizeof(*entry->entries), GFP_KERNEL);
 		if (!entry->entries)
 			return -ENOMEM;
 	}
-- 
2.11.0



