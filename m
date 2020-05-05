Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C97C61C5884
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9501B894EB;
	Tue,  5 May 2020 14:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 836 seconds by postgrey-1.36 at gabe;
 Tue, 05 May 2020 14:16:13 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09DD89138;
 Tue,  5 May 2020 14:16:13 +0000 (UTC)
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MBV6n-1jQid641ol-00CwN4; Tue, 05 May 2020 16:16:08 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Evan Quan <evan.quan@amd.com>
Subject: [PATCH] amdgpu: fix integer overflow on 32-bit architectures
Date: Tue,  5 May 2020 16:15:59 +0200
Message-Id: <20200505141606.837164-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:AkHFlSmgzp0jc+4llNiW+N+aB5OAyViD48sJ9HgEiVEF6fHsqQ/
 my7xScjJabhxQy51veqRxDGj468ZcU2Y1qyA/vAWUNneRt7mAboEJtEMSf0s2KYcuIhxneJ
 Vvf4HOqoO+vV98lY8TcGZhyq9Jzo8LXqSdQyDu6cAIZQuJO+ec6Z2IyWzTOXqFohOIDYfGl
 XToXSuqrzN3OY0YATcdag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4EQ5IcEC00E=:KlLlWj4vyVL6/3IxXdVlFy
 iRqdSEEX4aDUpKxY6hg6N1dWPK43VxA7TZYttNGVpXIpyxawAHjee1HRvrqb+HzATJWxvxsGD
 Q/Tjvr6CEfoY+1CP7lT1pbzw20DbbUMsJu2ebpvFm5R/ic3GWJKvgGe/p0ofkxkWpOM4OKDIH
 hxJmw+XvBJpM7ne3kn/a+L4dN50kueITd5SmkXEBt7OuVyQ+kKNkasA6WcLsXjk6/ZD/b1214
 I48BAXqy+VTn02bnk7G89hi3P5vo/ZuQFLZU93xeHm9fdvoU4vyLBpzzq0+nwoOTH7i0l/xvO
 FPlrWrrCGmvXr5aRpr9A9pI7fmHP6K2vhghcS1uTrg87fL9hKnLh8g7XysYxqlidjgbjiN83B
 62Dh3AEihexlbYZeA1dpOPvlsk0XlaZen6yD1HW0gTTIyEn/1r1n7eaanrG1fZViKWknI72/f
 qeGhH3uU4RKyP6TZa2qCIDVQ0SARl6hTHvC9P0HvdDA82zVjqRx3AzT10hesKq8x1czlRJeKY
 rSSzoadO5ogqzgCPAwBs7TFv4sS1K2Mc8AysvvqrZpb3QPU7DSX0FYp3NnM4OOcGD6H1ewxjg
 b/KYBsyphRkgKHn7bLGznymg1KPOk2hotz9lzDrV7vKFtEaJ4wDaEabkUagz8JYKeKcdBDL+K
 yU465Q5L24SuHzhfm/8Gjw0ZnrNXvMiNsbikd4MUZG78MHvHvTQEGD0ijwduMmz3Dkz4Mm6aQ
 vlELC3mDFgcUkOQd1ur5gleJJsf4wCHPumesooBI3ccz9dqyU22QpvOc5st9PjX60klfXyMh2
 xDDdQIRdBZ3gdeCaNzJCDgaP6leVG1gnnJlXnYpoke0b6J3R5Q=
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
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, Kent Russell <kent.russell@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multiplying 1000000000 by four overruns a 'long' variable, as clang
points out:

drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4160:53: error: overflow in expression; result is -294967296 with type 'long' [-Werror,-Winteger-overflow]
                expires = ktime_get_mono_fast_ns() + NSEC_PER_SEC * 4L;
                                                                  ^
Make this a 'long long' constant instead.

Fixes: 3f12acc8d6d4 ("drm/amdgpu: put the audio codec into suspend state before gpu reset V3")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'm not sure the ktime_get_mono_fast_ns() call is necessary here
either. Is it intentional because ktime_get_ns() doesn't work
during a driver suspend, or just a mistake?
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 6f93af972b0a..2e07e3e6b036 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4157,7 +4157,7 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
 		 * the audio controller default autosuspend delay setting.
 		 * 4S used here is guaranteed to cover that.
 		 */
-		expires = ktime_get_mono_fast_ns() + NSEC_PER_SEC * 4L;
+		expires = ktime_get_mono_fast_ns() + NSEC_PER_SEC * 4LL;
 
 	while (!pm_runtime_status_suspended(&(p->dev))) {
 		if (!pm_runtime_suspend(&(p->dev)))
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
