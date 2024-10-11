Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA899AEF7
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 00:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5A610EB37;
	Fri, 11 Oct 2024 22:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NxfrxLdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD6710EB37
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 22:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728687559; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WjW1abGkQwA8Dk2uzIEWnYG5zIpa0GwBrr2rYJVVNUTtOanm6iKZVZpV2947o9yqGEwxvA7Ukvzz5uw97e18m5k4BjV2JxdmvmGlh22ILPFYEAKfGr6H2M63dw6pbuI7x83kp5hACFpl0/F69xJg3gHdDxKIcR8fo/CXXdC314k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728687559;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jFfN6A7FKfkWOXVC2socfrJvDAKg5lUtpPic1FuxX5U=; 
 b=TrQj6XseIwomwOlebXPGiD8nU2XnRc053EnIXqaqyz6G8uLRloJBcyplaZjpdd6d4gt7YagwsWt1XyMwm1p2GTQf1m6Bi0o0SZ8NSqs3HxzY5O/5OgE+HkqxbBByiQIlmkvYj9KXPBYaSOArGKH/jFQWbLQMKWLGyjEPVfKaqrI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728687559; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=jFfN6A7FKfkWOXVC2socfrJvDAKg5lUtpPic1FuxX5U=;
 b=NxfrxLdIRQ5g1iShqyqs8xqJIAYs3ge7+YFbiXJK2vDzmN3OLFcuEabizvlD6E93
 eT8g7Bb9UBCVhlKPanzpzLZAG+YUFVGQTshF7VCUg67TMa79191cZgvKR7UM07UZFcc
 o1DQhYH9TuLyNfqBav5WhbSZfkR2Ht3WWwqN5jTM=
Received: by mx.zohomail.com with SMTPS id 1728687557745482.7109764290499;
 Fri, 11 Oct 2024 15:59:17 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/panthor: Fix runtime suspend sequence after OPP
 transition error
Date: Fri, 11 Oct 2024 23:56:59 +0100
Message-ID: <20241011225906.3789965-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

In case an OPP transition to a suspension state fails during the runtime
PM suspend call, if the driver's subsystems were successfully resumed,
we should return -EAGAIN so that the device's runtime PM status remains
'active'.

If FW reload failed, then we should fall through, so that the PM core
can flag the device as having suffered a runtime error.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 4082c8f2951d..cedd3cbcb47d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -528,8 +528,13 @@ int panthor_device_suspend(struct device *dev)
 		    drm_dev_enter(&ptdev->base, &cookie)) {
 			panthor_gpu_resume(ptdev);
 			panthor_mmu_resume(ptdev);
-			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
-			panthor_sched_resume(ptdev);
+			ret = panthor_fw_resume(ptdev);
+			if (!ret) {
+				panthor_sched_resume(ptdev);
+				ret = -EAGAIN;
+			} else {
+				drm_err(&ptdev->base, "FW resume failed at runtime suspend: %d\n", ret);
+			}
 			drm_dev_exit(cookie);
 		}
 
-- 
2.46.2

