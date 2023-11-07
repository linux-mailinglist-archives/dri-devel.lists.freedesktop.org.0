Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C27E3DBB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCDB10E5BD;
	Tue,  7 Nov 2023 12:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E546910E5BC;
 Tue,  7 Nov 2023 12:30:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3BF46CE0EE4;
 Tue,  7 Nov 2023 12:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D64C433C8;
 Tue,  7 Nov 2023 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360230;
 bh=il0AiPPbAIBL0vfiS/CCkdxk9nh3/ViTZzuK06f5fdk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XB2nFnvWqf6CcI2ZBfoMObWj8IS1FAI/XPPU8P3HE0VVAPeUbll1EQMRYR4VpffSI
 Gue+FF7K+iNWGf4wdtuuWuE4dgOIJVdEdQhGj+XAfcRMcUAdZHsdnqkSIWfVfM60Wk
 WlN/rDagva659XPDxQpd+Jv4Zk+x9dxOYhOj9XcoeiI5/12dFsCJCSyGmxZqkY4mOA
 ybQe00A74IMdPIqLu0BFAZG3RkB081UfOcHRJBgozq3at4R4Rzn51yjTScQ3qVCvON
 TOVuIfBx/7rqOcZ8PnRTFras3t3NhuNT+iKEmY0SWxdJ8F8iTmbAZkql9op4NY0hEi
 GUxLiQiB3nQyw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 15/20] drm/amdgpu/vkms: fix a possible null
 pointer dereference
Date: Tue,  7 Nov 2023 07:29:09 -0500
Message-ID: <20231107122940.3762228-15-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122940.3762228-1-sashal@kernel.org>
References: <20231107122940.3762228-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.137
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
index 4e8274de8fc0c..083f9c637a82e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -238,6 +238,8 @@ static int amdgpu_vkms_conn_get_modes(struct drm_connector *connector)
 
 	for (i = 0; i < ARRAY_SIZE(common_modes); i++) {
 		mode = drm_cvt_mode(dev, common_modes[i].w, common_modes[i].h, 60, false, false, false);
+		if (!mode)
+			continue;
 		drm_mode_probed_add(connector, mode);
 	}
 
-- 
2.42.0

