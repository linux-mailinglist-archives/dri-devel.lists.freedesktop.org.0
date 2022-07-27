Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E4F581FB7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 08:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD47C17C2;
	Wed, 27 Jul 2022 06:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Wed, 27 Jul 2022 03:05:33 UTC
Received: from mail.nfschina.com (unknown
 [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
 by gabe.freedesktop.org (Postfix) with ESMTP id 01A45C004B;
 Wed, 27 Jul 2022 03:05:33 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 0D0EC1E80D8E;
 Wed, 27 Jul 2022 11:00:25 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSFJZEL-oIX6; Wed, 27 Jul 2022 11:00:22 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
 (Authenticated sender: yuzhe@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 97E001E80D05;
 Wed, 27 Jul 2022 11:00:21 +0800 (CST)
From: Yu Zhe <yuzhe@nfschina.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/amdkfd: use time_is_before_jiffies(a + b) to replace
 "jiffies - a > b"
Date: Wed, 27 Jul 2022 10:59:17 +0800
Message-Id: <20220727025917.22477-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 27 Jul 2022 06:04:16 +0000
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
Cc: Yu Zhe <yuzhe@nfschina.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 liqiong@nfschina.com, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

time_is_before_jiffies deals with timer wrapping correctly.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
index a9466d154395..6397926e059c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
@@ -156,7 +156,7 @@ static void interrupt_wq(struct work_struct *work)
 	while (dequeue_ih_ring_entry(dev, ih_ring_entry)) {
 		dev->device_info.event_interrupt_class->interrupt_wq(dev,
 								ih_ring_entry);
-		if (jiffies - start_jiffies > HZ) {
+		if (time_is_before_jiffies(start_jiffies + HZ)) {
 			/* If we spent more than a second processing signals,
 			 * reschedule the worker to avoid soft-lockup warnings
 			 */
-- 
2.11.0

