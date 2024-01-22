Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FF183660F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE90810F26F;
	Mon, 22 Jan 2024 14:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354C710F292
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 14:57:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADD9261518;
 Mon, 22 Jan 2024 14:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C10FC43399;
 Mon, 22 Jan 2024 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935477;
 bh=I32G/hUKa6KyI2BniBMuFm3YI0BHeflPK5hT6eizRBI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iBi83o0rYTEEVl+gzRnGQY0VTm9tgJHYzUVAFBfqa5UQUt8Br4PpYTNEKOCUFr7X0
 McUfPxh9PHyIwTl52jwq6GWxHR/LMdKLUCD23Vve61DAG3Mb79yzdf/e6h2Jy6t4r1
 +7Nafpu9BlZeG+rgSbqG7zeXqWOKeST78GP3wBjr0M6Otwmb7u7bBJW+TzG29W70QZ
 YRZ1gOpoA8g5n6se2jYMYjul9zRbxJ4EZgB1736wwmiPwM3yQx4bxdh+6FMGYeEwYU
 LVQNgJUZvTjV7VLALC8mKhj2m47AB4Lefzl34K5LYWzovfUzPywYjjxlR9r3zFvyxj
 R5nFk5I+fUSpw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 24/88] drm/drm_file: fix use of uninitialized
 variable
Date: Mon, 22 Jan 2024 09:50:57 -0500
Message-ID: <20240122145608.990137-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, daniel@ffwll.ch,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

[ Upstream commit 1d3062fad9c7313fff9970a88e0538a24480ffb8 ]

smatch reports:

drivers/gpu/drm/drm_file.c:967 drm_show_memory_stats() error: uninitialized symbol 'supported_status'.

'supported_status' is only set in one code path. I'm not familiar with
the code to say if that path will always be ran in real life, but
whether that is the case or not, I think it is good to initialize
'supported_status' to 0 to silence the warning (and possibly fix a bug).

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231103-uninit-fixes-v2-1-c22b2444f5f5@ideasonboard.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 446458aca8e9..54a7103c1c0f 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -958,7 +958,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 {
 	struct drm_gem_object *obj;
 	struct drm_memory_stats status = {};
-	enum drm_gem_object_status supported_status;
+	enum drm_gem_object_status supported_status = 0;
 	int id;
 
 	spin_lock(&file->table_lock);
-- 
2.43.0

