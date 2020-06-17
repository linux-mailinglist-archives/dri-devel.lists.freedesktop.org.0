Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924B1FD171
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 18:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A0D89C1C;
	Wed, 17 Jun 2020 16:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTP id C954589C1C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:00:06 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jlaTo-0003xt-5r; Wed, 17 Jun 2020 16:00:00 +0000
From: Colin King <colin.king@canonical.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/mm/selftests: fix unsigned comparison with less
 than zero
Date: Wed, 17 Jun 2020 16:59:59 +0100
Message-Id: <20200617155959.231740-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0.rc0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Function get_insert_time can return error values that are cast
to a u64. The checks of insert_time1 and insert_time2 check for
the errors but because they are u64 variables the check for less
than zero can never be true. Fix this by casting the value to s64
to allow of the negative error check to succeed.

Addresses-Coverity: ("Unsigned compared against 0, no effect")
Fixes: 6e60d5ded06b ("drm/mm: add ig_frag selftest")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/selftests/test-drm_mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
index 3846b0f5bae3..671a152a6df2 100644
--- a/drivers/gpu/drm/selftests/test-drm_mm.c
+++ b/drivers/gpu/drm/selftests/test-drm_mm.c
@@ -1124,12 +1124,12 @@ static int igt_frag(void *ignored)
 
 		insert_time1 = get_insert_time(&mm, insert_size,
 					       nodes + insert_size, mode);
-		if (insert_time1 < 0)
+		if ((s64)insert_time1 < 0)
 			goto err;
 
 		insert_time2 = get_insert_time(&mm, (insert_size * 2),
 					       nodes + insert_size * 2, mode);
-		if (insert_time2 < 0)
+		if ((s64)insert_time2 < 0)
 			goto err;
 
 		pr_info("%s fragmented insert of %u and %u insertions took %llu and %llu nsecs\n",
-- 
2.27.0.rc0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
