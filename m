Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1217EBC23
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 04:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E2C10E40D;
	Wed, 15 Nov 2023 03:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496AF10E40D;
 Wed, 15 Nov 2023 03:39:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F130961518;
 Wed, 15 Nov 2023 03:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA5BC433C8;
 Wed, 15 Nov 2023 03:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700019541;
 bh=bcUStvzoYBQPxGOjaHvVyWseLm4bdC+hbtjNlPqnaJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L4SSRwB7FntGu3sWvBSW4D9+8CJ9niVhjwKTIBQaFsXkMHX7KLaFh5Xx29wZwGHkR
 TdsVyiookbxlP9M3m7YKE7mQXJiQaSymtzaN8ztIJMSv3x4lIWHETAAReT9jbGmeMC
 7+wn8m2/lKWeXx7bDa2/dXVsLaO72skVqFq7njehh+tFRM0SaaMVN63oaXxrv8zfRk
 DWTGN37HJEHk75yAZac5uxdU6VHGuEkDzAYjjYe0qjjzG1wbGN/CzlzTNoCJq/DLZB
 iJu6jDubhPzwBgc8feVLzw9XSU/L1ypT6In4Q3fLwqrK8c3fUeSUiMY+WQgjOvht93
 7TMxVFUNvPwKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 2/6] drm/qxl: prevent memory leak
Date: Tue, 14 Nov 2023 22:35:56 -0500
Message-ID: <20231115033608.1229058-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115033608.1229058-1-sashal@kernel.org>
References: <20231115033608.1229058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.62
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, kraxel@redhat.com, tzimmermann@suse.de,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

[ Upstream commit 0e8b9f258baed25f1c5672613699247c76b007b5 ]

The allocated memory for qdev->dumb_heads should be released
in qxl_destroy_monitors_object before qxl suspend.
otherwise,qxl_create_monitors_object will be called to
reallocate memory for qdev->dumb_heads after qxl resume,
it will cause memory leak.

Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
Link: https://lore.kernel.org/r/20230801025309.4049813-1-zhouzongmin@kylinos.cn
Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/qxl/qxl_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index a152a7c6db215..f91a86225d5e7 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1229,6 +1229,9 @@ int qxl_destroy_monitors_object(struct qxl_device *qdev)
 	if (!qdev->monitors_config_bo)
 		return 0;
 
+	kfree(qdev->dumb_heads);
+	qdev->dumb_heads = NULL;
+
 	qdev->monitors_config = NULL;
 	qdev->ram_header->monitors_config = 0;
 
-- 
2.42.0

