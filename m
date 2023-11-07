Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB0D7E3D86
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7349310E5A4;
	Tue,  7 Nov 2023 12:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C62A10E5A0;
 Tue,  7 Nov 2023 12:29:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E6584611FE;
 Tue,  7 Nov 2023 12:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8109FC433C9;
 Tue,  7 Nov 2023 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360140;
 bh=7wbJdA3ghOcU/xwQGrXIOSq9/8v6+kYwE1zY/1YVvWc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c0ihbdil1CE5jFw7gCgBbVtOmBrErRaI+7vbEculHKXlPj91q/Jj5O0adS+TuJplC
 JOOgfL5kmgKUSXYsRdKvrkZ3cPlT66L2eX3YQJLWMzsdDN1hiycnYp83rljSGKKrbM
 k+y6go0iAS9ch2aQTocOpns0vd4rdeQWJu0Ropa+diY1G+9etbaQ/XEID/ctTJXFUN
 26gWNn7Sq5US7cRjyPipk34Vd6vI/7DWOr38ubbM93SYYLTHxeFWjnVk62aHJvRwLl
 3+S3VEGUHOfgoMkx4e4ZeaMX/EpZWIu6b3Q9PYJgx7XowjYLiNCQWIiqqi9U8FMNPo
 oKjOq+6qRKCug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 20/25] drm/amdgpu/vkms: fix a possible null
 pointer dereference
Date: Tue,  7 Nov 2023 07:26:59 -0500
Message-ID: <20231107122745.3761613-20-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122745.3761613-1-sashal@kernel.org>
References: <20231107122745.3761613-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
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
Cc: Sasha Levin <sashal@kernel.org>, guchun.chen@amd.com, Xinhui.Pan@amd.com,
 Ma Ke <make_ruc2021@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ma Ke <make_ruc2021@163.com>

[ Upstream commit cd90511557fdfb394bb4ac4c3b539b007383914c ]

In amdgpu_vkms_conn_get_modes(), the return value of drm_cvt_mode()
is assigned to mode, which will lead to a NULL pointer dereference
on failure of drm_cvt_mode(). Add a check to avoid null pointer
dereference.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index d60c4a2eeb0c5..06980b8527ff8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -239,6 +239,8 @@ static int amdgpu_vkms_conn_get_modes(struct drm_connector *connector)
 
 	for (i = 0; i < ARRAY_SIZE(common_modes); i++) {
 		mode = drm_cvt_mode(dev, common_modes[i].w, common_modes[i].h, 60, false, false, false);
+		if (!mode)
+			continue;
 		drm_mode_probed_add(connector, mode);
 	}
 
-- 
2.42.0

