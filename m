Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 702386E5A59
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A4410E6A8;
	Tue, 18 Apr 2023 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 909 seconds by postgrey-1.36 at gabe;
 Tue, 18 Apr 2023 07:11:00 UTC
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BC210E0CA;
 Tue, 18 Apr 2023 07:10:59 +0000 (UTC)
From: Daniil Dulov <d.dulov@aladdin.ru>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [PATCH] drm/amdkfd: Fix potential deallocation of previously
 deallocated memory.
Date: Mon, 17 Apr 2023 23:55:21 -0700
Message-ID: <20230418065521.453001-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.20.32]
X-ClientProxiedBy: EXCH-2016-02.aladdin.ru (192.168.1.102) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)
X-Mailman-Approved-At: Tue, 18 Apr 2023 07:24:20 +0000
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
Cc: lvc-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 Daniil Dulov <d.dulov@aladdin.ru>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <ozeng@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pointer mqd_mem_obj can be deallocated in kfd_gtt_sa_allocate().
The function then returns non-zero value, which causes the second deallocation.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d1f8f0d17d40 ("drm/amdkfd: Move non-sdma mqd allocation out of init_mqd")
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 3b6f5963180d..bce11c5b07d6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -119,7 +119,8 @@ static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
 	}
 
 	if (retval) {
-		kfree(mqd_mem_obj);
+		if (mqd_mem_obj)
+			kfree(mqd_mem_obj);
 		return NULL;
 	}
 
-- 
2.25.1

