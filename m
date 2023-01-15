Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173B66AFA7
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 08:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E2C10E0D7;
	Sun, 15 Jan 2023 07:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977CB10E0D7;
 Sun, 15 Jan 2023 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673767061; bh=k7u5aS66zy2fmuck3/VN5zNUw4xK14B+PFhiVV5QSGQ=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=VQOO7un7PPsAFbAr7KLG2+tIkjqC7C0QcZmQbjuHusQ18C1pFFrQHmd+RKrWKh4NP
 javzOLx2ZdrFw/pEEx9HxL7fj4GGE7To2jNQxQlDX3Z1kEbEMnlLSzq/he5g09DJpZ
 eqaHh0L3aPZisPBRejM6T4OxJQzFQ4PHneoXf/Sk=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 15 Jan 2023 08:17:41 +0100 (CET)
X-EA-Auth: gJML6+RJH0TCGtjLi2DcR+NBXo7OT6FysMxuzOTd0N300DEI59IhkImS0QOaE82bWbmULJnwFnOdmU0aCdOgs6ZHYd2Kcspi
Date: Sun, 15 Jan 2023 12:47:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/amd/pm/powerplay/smumgr/ci: use bitwise or for
 bitmasks addition
Message-ID: <6be220cf26f5416dc7e3dbd13ad42f6e7353d960.1673766696.git.drv@mailo.com>
References: <cover.1673766696.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673766696.git.drv@mailo.com>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For bit mask addition, it is recommended to use or operator "|" instead
of numerical addition as the former is quicker and cleaner. Change
suggested by orplus.cocci Coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
index 5ca3c422f7d4..a164d12b88ad 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
@@ -2203,7 +2203,7 @@ static int ci_program_mem_timing_parameters(struct pp_hwmgr *hwmgr)
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 
 	if (data->need_update_smu7_dpm_table &
-			(DPMTABLE_OD_UPDATE_SCLK + DPMTABLE_OD_UPDATE_MCLK))
+			(DPMTABLE_OD_UPDATE_SCLK | DPMTABLE_OD_UPDATE_MCLK))
 		return ci_program_memory_timing_parameters(hwmgr);
 
 	return 0;
-- 
2.34.1



