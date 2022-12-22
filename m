Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357576547B4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 22:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618E310E17C;
	Thu, 22 Dec 2022 21:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E8210E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1671743721; bh=wdZWXREs23UJurCPJSaRRURkt4bR1UNV3+Qmxgjy/wY=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=Rq7SDQLqgswGo4+TLDsSsZffMG16TZocNQpPGke+zZ49bjiyRG5MfrHQi4jDy7aKb
 SuCdgsRvG2BBdJK7xhMJmU36KwvlVV1HfwQ/aYBOoINF4LqQjh6XaYBYgeNo2RATs5
 sSj1+or5XUSOya/Di72vgQD8G5rxi6WRJy097jeo=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Thu, 22 Dec 2022 22:15:21 +0100 (CET)
X-EA-Auth: x1X1YHVLLgk9fNauahX0z1zlVD+p3LfWBHpwaT7t1dquufMWtxg6rDDVcYt7XJRu1H+sXOFe1ZJX4yXwGMQ0/piD64dKEliL
Date: Fri, 23 Dec 2022 02:45:00 +0530
From: Deepak R Varma <drv@mailo.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdkfd: Use resource_size() helper function
Message-ID: <Y6TI1O9adSP/OrnT@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>, drv@mailo.com,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the resource_size() function instead of a open coded computation
resource size. It makes the code more readable.

Issue identified using resource_size.cocci coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Note: Proposed change compile tested only.

 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 10048ce16aea..de8ce72344fc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1027,8 +1027,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 		/* Disable SVM support capability */
 		pgmap->type = 0;
 		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
-			devm_release_mem_region(adev->dev, res->start,
-						res->end - res->start + 1);
+			devm_release_mem_region(adev->dev, res->start, resource_size(res));
 		return PTR_ERR(r);
 	}

--
2.34.1



