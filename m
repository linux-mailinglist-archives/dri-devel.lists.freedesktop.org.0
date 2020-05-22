Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B951DEE38
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 19:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE46B6EA10;
	Fri, 22 May 2020 17:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1746EA10;
 Fri, 22 May 2020 17:29:29 +0000 (UTC)
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7338206C3;
 Fri, 22 May 2020 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590168569;
 bh=noVq5vIzK2zOX8f731NA23cZdVRrWDncOL4AESsRsPg=;
 h=Date:From:To:Cc:Subject:From;
 b=sw+5iUX6i1Ax9MaJRERLYh2ki2CKYhNykMEqas7Ctlfz6msB9sN4MXsg7L1VIWqjx
 3RcjOaMXlp6CL6yNlzef+jlOxjnKn6W9NQqhAcMSd5NVEDKs+f70fdKlcVBFj0c8lv
 XUzwUNpJixMJWyEAI62JI9PKfm3YskgKeQkPkqqM=
Date: Fri, 22 May 2020 12:34:19 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/radeon/dpm: Replace one-element array and use
 struct_size() helper
Message-ID: <20200522173419.GA2297@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current codebase makes use of one-element arrays in the following
form:

struct something {
    int length;
    u8 data[1];
};

struct something *instance;

instance =3D kmalloc(sizeof(*instance) + size, GFP_KERNEL);
instance->length =3D size;
memcpy(instance->data, source, size);

but the preferred mechanism to declare variable-length types such as
these ones is a flexible array member[1][2], introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on. So, replace
the one-element array with a flexible-array member.

Also, make use of the new struct_size() helper to properly calculate the
size of struct NISLANDS_SMC_SWSTATE.

This issue was found with the help of Coccinelle and, audited and fixed
_manually_.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Use type size_t instead of u16 for state_size variable.

 drivers/gpu/drm/amd/amdgpu/si_dpm.h | 2 +-
 drivers/gpu/drm/radeon/ni_dpm.c     | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.h b/drivers/gpu/drm/amd/amdg=
pu/si_dpm.h
index 6b7d292b919f3..bc0be6818e218 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dpm.h
+++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.h
@@ -781,7 +781,7 @@ struct NISLANDS_SMC_SWSTATE
     uint8_t                             levelCount;
     uint8_t                             padding2;
     uint8_t                             padding3;
-    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[1];
+    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
 };
 =

 typedef struct NISLANDS_SMC_SWSTATE NISLANDS_SMC_SWSTATE;
diff --git a/drivers/gpu/drm/radeon/ni_dpm.c b/drivers/gpu/drm/radeon/ni_dp=
m.c
index b57c37ddd164c..abb6345bfae32 100644
--- a/drivers/gpu/drm/radeon/ni_dpm.c
+++ b/drivers/gpu/drm/radeon/ni_dpm.c
@@ -2685,11 +2685,12 @@ static int ni_upload_sw_state(struct radeon_device =
*rdev,
 	struct rv7xx_power_info *pi =3D rv770_get_pi(rdev);
 	u16 address =3D pi->state_table_start +
 		offsetof(NISLANDS_SMC_STATETABLE, driverState);
-	u16 state_size =3D sizeof(NISLANDS_SMC_SWSTATE) +
-		((NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE - 1) * sizeof(NISLANDS=
_SMC_HW_PERFORMANCE_LEVEL));
+	NISLANDS_SMC_SWSTATE *smc_state;
+	size_t state_size =3D struct_size(smc_state, levels,
+			NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE);
 	int ret;
-	NISLANDS_SMC_SWSTATE *smc_state =3D kzalloc(state_size, GFP_KERNEL);
 =

+	smc_state =3D kzalloc(state_size, GFP_KERNEL);
 	if (smc_state =3D=3D NULL)
 		return -ENOMEM;
 =

-- =

2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
