Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FECA1600D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 04:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C50810E2AC;
	Sun, 19 Jan 2025 03:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 368 seconds by postgrey-1.36 at gabe;
 Sun, 19 Jan 2025 03:05:02 UTC
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id 17B8A10E253
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2025 03:05:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 8B88A60106CF9; 
 Sun, 19 Jan 2025 10:58:44 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: Su Hui <suhui@nfschina.com>, mary.guillemard@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: avoid garbage value in panthor_ioctl_dev_query()
Date: Sun, 19 Jan 2025 10:58:29 +0800
Message-Id: <20250119025828.1168419-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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

'priorities_info' is uninitialized, and the uninitialized value is copied
to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
'priorities_info' to avoid this garbage value problem.

Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 0b3fbee3d37a..44f5c72d46c3 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -802,6 +802,7 @@ static void panthor_query_group_priorities_info(struct drm_file *file,
 {
 	int prio;
 
+	memset(arg, 0, sizeof(*arg));
 	for (prio = PANTHOR_GROUP_PRIORITY_REALTIME; prio >= 0; prio--) {
 		if (!group_priority_permit(file, prio))
 			arg->allowed_mask |= BIT(prio);
-- 
2.30.2

