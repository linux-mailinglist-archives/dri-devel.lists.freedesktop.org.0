Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4A12E119F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A676E881;
	Wed, 23 Dec 2020 02:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6DC6E880;
 Wed, 23 Dec 2020 02:16:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AC30225AA;
 Wed, 23 Dec 2020 02:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689800;
 bh=aDvM95/uWJh8JlO29lhGODte2th50PhhOtvptCz+sjc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RPWYBbzPsn4w8Xc2Perc6B4BqZGxmlqtxBkyLXuycGfgKcwOjw6Y6oQ/FAjrsqrC2
 VZjfezdMJaxQ13cs+44gXjlJG3AjwqgrW0gQpd1eZ2uxokw5rlnaDN94ZZiBWSnpJM
 x/WHDRj8P3JDTX+B1KM5TAhyNYawUHh66dyjgKcVkRlq4YPB9F9mWrp9KviLah9cR1
 1lOhz/ptx2IyWsTPLvk442VqgyO0wigV87n2yoocAm1k1cUwU5f063KpwK8ig0wBkX
 rA90mG8yyMEtCE8VbXgqUva2zT8jiFX2CdDWLj0VW28yB9mblK77Qg1IJjRrMhHZkS
 7bit5xF1taK6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 010/217] drm/amdgpu: change to save bad pages in
 UMC error interrupt callback
Date: Tue, 22 Dec 2020 21:12:59 -0500
Message-Id: <20201223021626.2790791-10-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dennis Li <Dennis.Li@amd.com>

[ Upstream commit 22503d803dab174b7f038fc9886c225ef30ee95c ]

Instead of saving bad pages in amdgpu_ras_reset_gpu, it will reduce
the unnecessary calling of amdgpu_ras_save_bad_pages.

Signed-off-by: Dennis Li <Dennis.Li@amd.com>
Reviewed-by: Hawking Zhang <hawking.zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 5 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c | 7 ++++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 82cd8e55595af..1ddae6b3bba53 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1665,7 +1665,7 @@ int amdgpu_ras_add_bad_pages(struct amdgpu_device *adev,
  * write error record array to eeprom, the function should be
  * protected by recovery_lock
  */
-static int amdgpu_ras_save_bad_pages(struct amdgpu_device *adev)
+int amdgpu_ras_save_bad_pages(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 	struct ras_err_handler_data *data;
@@ -1838,9 +1838,6 @@ int amdgpu_ras_reserve_bad_pages(struct amdgpu_device *adev)
 		data->last_reserved = i + 1;
 		bo = NULL;
 	}
-
-	/* continue to save bad pages to eeprom even reesrve_vram fails */
-	ret = amdgpu_ras_save_bad_pages(adev);
 out:
 	mutex_unlock(&con->recovery_lock);
 	return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index ec398ed7deb86..8f766b3c78de2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -506,6 +506,7 @@ bool amdgpu_ras_check_err_threshold(struct amdgpu_device *adev);
 int amdgpu_ras_add_bad_pages(struct amdgpu_device *adev,
 		struct eeprom_table_record *bps, int pages);
 
+int amdgpu_ras_save_bad_pages(struct amdgpu_device *adev);
 int amdgpu_ras_reserve_bad_pages(struct amdgpu_device *adev);
 
 static inline int amdgpu_ras_reset_gpu(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
index 262baf0f61ea0..a2975c8092a91 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -126,10 +126,11 @@ int amdgpu_umc_process_ras_data_cb(struct amdgpu_device *adev,
 				err_data->ue_count);
 
 		if ((amdgpu_bad_page_threshold != 0) &&
-			err_data->err_addr_cnt &&
+			err_data->err_addr_cnt) {
 			amdgpu_ras_add_bad_pages(adev, err_data->err_addr,
-						err_data->err_addr_cnt))
-			dev_warn(adev->dev, "Failed to add ras bad page!\n");
+						err_data->err_addr_cnt);
+			amdgpu_ras_save_bad_pages(adev);
+		}
 
 		amdgpu_ras_reset_gpu(adev);
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
