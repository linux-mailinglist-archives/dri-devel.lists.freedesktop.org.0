Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96FE54D104
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02A910F6C3;
	Wed, 15 Jun 2022 18:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 15 Jun 2022 07:59:14 UTC
Received: from mail.nfschina.com (unknown
 [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
 by gabe.freedesktop.org (Postfix) with ESMTP id 725D410E157
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 07:59:14 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 12E6E1E80D27;
 Wed, 15 Jun 2022 15:52:43 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5N6kuqPlSIw; Wed, 15 Jun 2022 15:52:40 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
 (Authenticated sender: liqiong@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id A37F11E80CFF;
 Wed, 15 Jun 2022 15:52:39 +0800 (CST)
From: Li Qiong <liqiong@nfschina.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: check for allocation failure of kstrdup_const()
Date: Wed, 15 Jun 2022 15:53:09 +0800
Message-Id: <20220615075309.18955-1-liqiong@nfschina.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 15 Jun 2022 18:36:18 +0000
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
Cc: yuzhe@nfschina.com, Li Qiong <liqiong@nfschina.com>, renyu@nfschina.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the possible failure of the kstrdup_const(), it should
be better to check it and handle it.

Signed-off-by: Li Qiong <liqiong@nfschina.com>
---
 drivers/gpu/drm/drm_managed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 4cf214de50c4..d9bd4a9da559 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -151,6 +151,8 @@ int __drmm_add_action(struct drm_device *dev,
 	}
 
 	dr->node.name = kstrdup_const(name, GFP_KERNEL);
+	if (!dr->node.name)
+		return -ENOMEM;
 	if (data) {
 		void_ptr = (void **)&dr->data;
 		*void_ptr = data;
@@ -197,6 +199,8 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 		return NULL;
 	}
 	dr->node.name = kstrdup_const("kmalloc", GFP_KERNEL);
+	if (!dr->node.name)
+		return NULL;
 
 	add_dr(dev, dr);
 
-- 
2.25.1

