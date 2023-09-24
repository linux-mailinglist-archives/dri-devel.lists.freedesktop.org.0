Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59A67AC88D
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 15:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94C010E18E;
	Sun, 24 Sep 2023 13:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3C10E15E;
 Sun, 24 Sep 2023 13:17:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7C69E60C24;
 Sun, 24 Sep 2023 13:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A27C433C7;
 Sun, 24 Sep 2023 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695561449;
 bh=lDq3UOUQY7o7x5pbXoiRH92AFPhE0J/Qm0xphQ23lAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jGnDGb/RIH4JhRL5JIVpeS/Q2akPYQ3LsAW8joAsbFsSM6QQKILmCqf9WMGOMa4RA
 qPoTfks+4TCFXbRaOeIN4ee7XmlWhJtOx7AzU4sycWZfUOXuOFFsmi3F0/YdEudtIg
 +B6WmJEPwsJqaBua9KWc21qIFWx2hSfCeD2vzsMsGQ2h014Xeewe8QUOb3W1mMHDiv
 HM7usWlXckM0Hm5KffVIOuOfIQKlM282lHEAThoz7eMypdBdmpKm3EuR4gdbyRQuXt
 NuC1BZ91eH8PgRA7yBlDaXaGRRAtxMUMArmEy39VxM+25WyjUABeEcEav/NKu7IE/N
 29lz6IIFAcYmA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 33/41] drm/amdgpu: Handle null atom context in
 VBIOS info ioctl
Date: Sun, 24 Sep 2023 09:15:21 -0400
Message-Id: <20230924131529.1275335-33-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131529.1275335-1-sashal@kernel.org>
References: <20230924131529.1275335-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.5
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
Cc: Sasha Levin <sashal@kernel.org>, evan.quan@amd.com,
 srinivasan.shanmugam@amd.com, guchun.chen@amd.com, Lang.Yu@amd.com,
 David Francis <David.Francis@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, marek.olsak@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Felix.Kuehling@amd.com, James.Zhu@amd.com, christian.koenig@amd.com,
 Graham.Sider@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Francis <David.Francis@amd.com>

[ Upstream commit 5e7e82254270c8cf8b107451c5de01cee2f135ae ]

On some APU systems, there is no atom context and so the
atom_context struct is null.

Add a check to the VBIOS_INFO branch of amdgpu_info_ioctl
to handle this case, returning all zeroes.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index f678bdd5f353d..b9fc7e2db5e59 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -940,12 +940,17 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			struct atom_context *atom_context;
 
 			atom_context = adev->mode_info.atom_context;
-			memcpy(vbios_info.name, atom_context->name, sizeof(atom_context->name));
-			memcpy(vbios_info.vbios_pn, atom_context->vbios_pn, sizeof(atom_context->vbios_pn));
-			vbios_info.version = atom_context->version;
-			memcpy(vbios_info.vbios_ver_str, atom_context->vbios_ver_str,
-						sizeof(atom_context->vbios_ver_str));
-			memcpy(vbios_info.date, atom_context->date, sizeof(atom_context->date));
+			if (atom_context) {
+				memcpy(vbios_info.name, atom_context->name,
+				       sizeof(atom_context->name));
+				memcpy(vbios_info.vbios_pn, atom_context->vbios_pn,
+				       sizeof(atom_context->vbios_pn));
+				vbios_info.version = atom_context->version;
+				memcpy(vbios_info.vbios_ver_str, atom_context->vbios_ver_str,
+				       sizeof(atom_context->vbios_ver_str));
+				memcpy(vbios_info.date, atom_context->date,
+				       sizeof(atom_context->date));
+			}
 
 			return copy_to_user(out, &vbios_info,
 						min((size_t)size, sizeof(vbios_info))) ? -EFAULT : 0;
-- 
2.40.1

