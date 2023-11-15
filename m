Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C762D7EBC01
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 04:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1901D10E406;
	Wed, 15 Nov 2023 03:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204510E406;
 Wed, 15 Nov 2023 03:35:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0D1E2CE113D;
 Wed, 15 Nov 2023 03:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A931C433C9;
 Wed, 15 Nov 2023 03:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700019319;
 bh=BPXcmbIHJIlBqHjEjTXsb/rxW6/LFGR3qAUvhVYpjtQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=biKCh8gMahT5jWRoy1sdaTeudzg3ldSbohqGdGcArd/w+CX65gQAkMeKk7SZWI4Lj
 3nipCFMksJEhqLWxmEhRzFVt86tGqbtTDNpE6Pl1xwEaQRtA47LNs1A+kbgPLxnmWz
 Kajel7/E8bslKSFjedW3ssld6IsImWpaurADmhVOG+CZ6PY9LZ8pvUOvFrbRaustdD
 I35Cz+l8OTbvLGBI1bs9X7RzGhyNisiv9Sm31Ngn1LtGV7N8/4U1JiACICiWAfDGwL
 JfzpyaB+4GBv4xTIVmpfAxhcbU7riYlggilp53ObIkDk5Y19GupjTHaBuueMiHrxwi
 eMd5eh7/bxt/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 2/6] drm/qxl: prevent memory leak
Date: Tue, 14 Nov 2023 22:34:46 -0500
Message-ID: <20231115033459.1228900-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115033459.1228900-1-sashal@kernel.org>
References: <20231115033459.1228900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.11
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
index 6492a70e3c396..404b0483bb7cb 100644
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

