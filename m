Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC35B3EB0D4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EA16E530;
	Fri, 13 Aug 2021 06:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 368 seconds by postgrey-1.36 at gabe;
 Fri, 13 Aug 2021 03:36:33 UTC
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F8A6E4B1;
 Fri, 13 Aug 2021 03:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1628825788; bh=rViq60LtzWJcoJDiQ9b1+/kIjUovnJp4t/ZVZrd2Ks0=;
 h=From:To:Cc:Subject:Date;
 b=pisT4w3N1WHAQx+v4e/w2b/uba+jYQeOd6bQR96zOmnzBOVXP0z1+24yMBexIOEa9
 niKroJgf2Vd/+5Pb03O9T+3z4eXji5/YxchI5vBfo9TluyjvFcY6K+hQxdLyGnHXkQ
 dHDmnvJbU8uF3L0A2NWjYNHiWWmsgTHA5WayjzSg=
Received: from localhost.localdomain ([106.120.213.23])
 by newxmesmtplogicsvrszb7.qq.com (NewEsmtp) with SMTP
 id 71C2CC25; Fri, 13 Aug 2021 11:28:28 +0800
X-QQ-mid: xmsmtpt1628825308tloi975vk
Message-ID: <tencent_D167B6522B17C0228524C70F9CA5EEBBEC09@qq.com>
X-QQ-XMAILINFO: M2QCdMyLnanc1fNRNyhut05HsD9IXOUsGmzNo/z5kVAFyOLTS4sG92DTq19Oyk
 maKi7NDXnkOPTUdbmS5kn9RAVb4EgYqFfsnsIvMXxs83TKg6LHQZ9uRu99OBz8lSakJtSpCm4alN
 1N9VPAmqK6jyy1UBT1G1cI2BbDu0itZ+0wlXOQdh9M0jNTy75iG2RHEv6rcByymX++OD7GjQ20OG
 MKWYI8jeSe/+uyFo+OXkxfmzFsvls2gHIRKqG7AlAAWFLnqRCdO8vijWlCaRwb8Yy3bL/iEj4kky
 Uaz6LkbH0pURDC4o6fxu6aIb6rb//kz1xfI8topjqESY04RS5xLvVm0lUqBgQYpalu/fSyyJVGUd
 cpiMYTUfcNfB/nzPgs66Zf9qy5j52BnyxYLFFh/thi4cBmQWOA3RmI+PVf4bxtHuNGqv662MShpt
 TNQR8MVX8LLj1knhi827yBeIcE9at7o08lj8EXu3Zs100fMiB3YprHm2+E6mJ58k6ifW/mniFhKc
 tat5f3/pVbZXFY1mqfKQo4dIlnYvEGt/mhfbN1eFnHMZhPvf7lh7JtJ/MdjVKnXXMql7q9S/R3p6
 DLxXU1Jxk4SW1XNIlWgWpHO9U+Jy5U+dw14IAt84oNzwHL6J9Jse4Zu6S289zOwLy5g3bASQKF4u
 H9QkTtb557JkgKAxFl8foGt5V8c8skPmR1iqWRUaIgQINrzalAcBwJWr30nCw3No9slE6SzK+T9L
 K+SPYJi58RkUGra26gnNZmRP6sUqypdGgl/keubCTMt6qHQ/EelgmkdDrgxmUNcqeE/If1nMV3lW
 eMVeezsQElYwsPZP3QHuf+FI5oOvk+/nvQjSNYGZbnoW6c1o/9gfhTHwzoO0GgWK6t5ZZ52LTWpu
 3CkEuKnC0QamSlylD0H+g=
From: lwt105 <3061522931@qq.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, sumit.semwal@linaro.org, nirmoy.das@amd.com,
 chenli@uniontech.com, JinhuiEric.Huang@amd.com, mh12gx2825@gmail.com,
 lee.jones@linaro.org, kevin1.wang@amd.com, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, lwt105 <3061522931@qq.com>
Subject: [PATCH] drivers:gpu:drm:amd:amdgpu:fix a potential use-after-free
Date: Fri, 13 Aug 2021 11:28:25 +0800
X-OQ-MSGID: <20210813032825.99385-1-3061522931@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Aug 2021 06:58:02 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in line 1503, "dma_fence_put(fence);" drop the reference to fence and may
cause fence to be released. However, fence is used subsequently in line
1510 "fence->error". This may result in an use-after-free bug.

It can be fixed by recording fence->error in an variable before dropping
the reference to fence and referencing it after dropping.

Signed-off-by: lwt105 <3061522931@qq.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 30fa1f61e0e5..99d03180e113 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1486,7 +1486,7 @@ static int amdgpu_cs_wait_all_fences(struct amdgpu_device *adev,
 				     struct drm_amdgpu_fence *fences)
 {
 	uint32_t fence_count = wait->in.fence_count;
-	unsigned int i;
+	unsigned int i, error;
 	long r = 1;
 
 	for (i = 0; i < fence_count; i++) {
@@ -1500,6 +1500,7 @@ static int amdgpu_cs_wait_all_fences(struct amdgpu_device *adev,
 			continue;
 
 		r = dma_fence_wait_timeout(fence, true, timeout);
+		error = fence->error;
 		dma_fence_put(fence);
 		if (r < 0)
 			return r;
@@ -1507,8 +1508,8 @@ static int amdgpu_cs_wait_all_fences(struct amdgpu_device *adev,
 		if (r == 0)
 			break;
 
-		if (fence->error)
-			return fence->error;
+		if (error)
+			return error;
 	}
 
 	memset(wait, 0, sizeof(*wait));
-- 
2.25.1


