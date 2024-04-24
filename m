Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9CF8B10A4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB91113CA7;
	Wed, 24 Apr 2024 17:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="i3Zm2/hV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D0C113CAD;
 Wed, 24 Apr 2024 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978365; x=1714583165; i=friedrich.vock@gmx.de;
 bh=H7VMHB2XIt5Ji+iMj0qWT7cVsj6+B4AwJL4OaG572YU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=i3Zm2/hV6LZBaEUm9NEqvFvwRhsh1a9Rc5pCtKV7wIQYUOrDaVnouckFonm+4m3y
 dtgAs72oSNMaEHlNA1ktA/Q0J6Gj7leGCKcxqSegh5sri3V2+1a1z6ZOn7b8hNwW2
 ibHUriclGKzVDh/KqPArrfLB6TnldT+z5TLxQRgd+JdZaWONcutzBLoeHz6McyEy2
 0mb61tbCpJwDCgFGnb8Q/CfntsdQ+Jtpjv14T4i6vxP5BU2G5FJIqSZPMtIh+zuFw
 ZQMJEQ21HBQ2wlKsFkRQJkCNU2PVIng5NjcCJVOr++S6DXXHR9FxPvP7bvCFGVVdA
 zy83ymX6+FDoen8X9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrhQ6-1sVfCx46iK-00nLKX; Wed, 24
 Apr 2024 19:00:44 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 17/18] drm/amdgpu: Implement EVICTED_VRAM query
Date: Wed, 24 Apr 2024 18:57:07 +0200
Message-ID: <20240424165937.54759-18-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5Vv+AbzY2a6d8vtzoZ+0TUGOmyjxTopNk7iJ4VOIoTC6AReH5ye
 4UrraQ0dfRdRaFpy4+95K76+fMzW5SurymFZrKBscBMvydio7jq48JxCXVyqE0UTsmav65h
 oZ4XzahI3J5jwgpLkbZZC4oXQDYkyb7Kgy/fi3/bgGhaOLtHsLMF22a2YByzwJfsm1TCLBU
 e1ZSrSmUHkMSyftiJwuOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nNtNWCuqJpI=;kQWZfBQx4mRjGJegqOGyZkGhh6B
 n+ci23YNLHk77N82aduDzRARQmJG+8xkbHXPb22ALkKetFDmYcEjOf+MpDrzlwu6dw38E7xwH
 VZOY5MkZloP+8yyDb9y2gV2TORnbT9gWKaLycgGn6efPtB+sP58XlXeZpncHRsPbIuo375yW/
 D380TpWar3z0iHv7+PwzjifuaI4AZz2dKDmnAtIPVybVpBDtcPOiCn4rW18qh8sgLzGGn+z9b
 G6EG2u3WjyxiMCBqhs6Foa1+6GGJjiGx54rg9S2KwWC6C/fuUr4HoTnu8Q4VKAVsaRFOxCSjx
 HB7Npi/eJD9F24UHQ4uK0hNqLTQsiSCdhU6zlWz/ZsOaXdyJcoS6aKMZRz8YAix6Ze2zb//5X
 zg7/C3t+fSd8aDxtf2Q8Z7CAinY7tgH/dwniM/bjQ0s64iqdlx24OB73QSOcW8C3Xj5fE4JMm
 izMKyX5/IiIv6Z7iHHYnvQalNgnXdCIaAEKfMryBCR3UdEURWCHAGihKlYsEtAKFO8znq4EUX
 gNbHmiOjYzH95BUq1AMnjRjlLam/eyOQ8o7VrQlr/1z7sc3FgFJdT9e/9MReUHosdWvXQGu0+
 c0eibzQfAxD0WMthyFqQyQPu5jWzbDrHuEM3yuan/QndVWg1KXBBoplhDwF+XmbId0U9OX9YU
 zRjbz/53RQe6JADSHO6EY8Q0tAMufs2wwgEdzUwgj3+qpzIdzF1qfi+oZ/s4j6j0oz3L7g75o
 KF3F98JeUiRVvuBOmTA6h+alEcjFm+Tijslv59pNp2zIn4XWwZNPgp7ZUDVgPf5OhtP/A5F2w
 QwaB74PzESh1bv7GDrvTAI6poNN9DcTDMj5vyrtiJ7j2Y=
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

Used by userspace to gauge the severity of memory overcommit and make
prioritization decisions based on it.

Used by userspace to gauge the severity of memory overcommit and make
prioritization decisions based on it.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 3 +++
 include/uapi/drm/amdgpu_drm.h           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_kms.c
index 924baf58e3226..8cba30144bac6 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1246,6 +1246,9 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *=
data, struct drm_file *filp)
 		return copy_to_user(out, &gpuvm_fault,
 				    min((size_t)size, sizeof(gpuvm_fault))) ? -EFAULT : 0;
 	}
+	case AMDGPU_INFO_EVICTED_VRAM:
+		ui64 =3D ttm_resource_manager_evicted_bytes(&adev->mman.vram_mgr.manage=
r);
+		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	default:
 		DRM_DEBUG_KMS("Invalid request %d\n", info->query);
 		return -EINVAL;
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 53552dd489b9b..5d04719386686 100644
=2D-- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -920,6 +920,8 @@ struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
 #define AMDGPU_INFO_MAX_IBS			0x22
 /* query last page fault info */
 #define AMDGPU_INFO_GPUVM_FAULT			0x23
+/* query size of evicted vram allocations */
+#define AMDGPU_INFO_EVICTED_VRAM                0x24

 #define AMDGPU_INFO_MMR_SE_INDEX_SHIFT	0
 #define AMDGPU_INFO_MMR_SE_INDEX_MASK	0xff
=2D-
2.44.0

