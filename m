Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718563F216C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 22:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54586E9D3;
	Thu, 19 Aug 2021 20:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708956E9D6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 20:14:47 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id m26so6556743pff.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWonK40nfLuKYWvrqlegwHOX79F+iH7r7S8ceDKJ73w=;
 b=IJptv6+ED2SgpSRkeJi/2ho6iTHaXtYfyLiySxQuoNMdF1AasxvuCUFZHXoetmVfVl
 0evldTvTyMXXeS4wZD1+qp7lEf29/Dq+N9wdcm+G9qpFgGqlvMKRRlkipdTCLOQiHMXO
 YdqtUQrJqZysCWHTXjCxeVcMUcIAJh8qGptiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWonK40nfLuKYWvrqlegwHOX79F+iH7r7S8ceDKJ73w=;
 b=uX5zgUf6kTGSaYT1biQn6Z5iP5SwzrVQMgHvHlotg1zKvvotRAN7683AgPOWR4QxNm
 ESNTGCfYfXs9qfHGGhWWmv2+Sj/xfCgdLPSwr8h03gZA+Eapz3iwU/MiEa2DKEWTahGn
 gTqKQ4RHCC17aKitkImxUshSRjrosNNJvQBy2StWSqlfm+OwJlhiP+GQcHgbHMgQASdj
 4XkGoQAg//JiGkyvF96y8IV4gJS2oPOtRlrvDGdbDcJgdzdExBUWCe9YUmGnkXX9riNh
 hbvk5p58W861sDucTpoT3rbcGFWRspeJx0nG0qBi/Ft7IZk50lHehT08FiqIw2FE4wwk
 4dDQ==
X-Gm-Message-State: AOAM532IyloU0+9f0VqliukvFQMPHVbHIsxci+8wO+F/mtWvE4u/1P7u
 Js0X36pAerLjw7mla1knMVVLMw==
X-Google-Smtp-Source: ABdhPJwOnooA//ZI2yY2w3HhhA71tc7MYj5UAHPJaeMdESG6/Mo5ArqPp78/8chRXBFrSXp80yNy4g==
X-Received: by 2002:aa7:850c:0:b0:3e2:edf3:3d09 with SMTP id
 v12-20020aa7850c000000b003e2edf33d09mr9540100pfn.42.1629404087013; 
 Thu, 19 Aug 2021 13:14:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j4sm5109612pgi.6.2021.08.19.13.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 13:14:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: Kees Cook <keescook@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Jiawei Gu <Jiawei.Gu@amd.com>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Dennis Li <Dennis.Li@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 David M Nieto <David.Nieto@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Lee Jones <lee.jones@linaro.org>, John Clements <John.Clements@amd.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] drm/amd/pm: And destination bounds checking to struct copy
Date: Thu, 19 Aug 2021 13:14:41 -0700
Message-Id: <20210819201441.3545027-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6384; h=from:subject;
 bh=cvRZIn3RJBaQNBAJjwgDTl32BXjr/3MDNasdqtotH60=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHruwFDFDjn9GfKm+ZpkXhmC4GSPPLnOXnRs08yoS
 3gaj152JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYR67sAAKCRCJcvTf3G3AJsiZD/
 463O5ZlWD/33hUv4/iLJRdRrEpVzMn1Znf6F0qdUkO9B3eGv+E0ybaUS6z9Z4PMWmO2DucTecwo9TR
 VC3sh27JAPDo9hR1O9Wsz80Yhhqu8QCrcGSEnMYqf3KD1q/SswU4w2qOB346yhWGA5FqqHSIyZiVZz
 MbmFs+nxIG9PoQrqq7Sul683ADQkTAt7X0avOZ8LTna2XDizljUnY6dJ2gpOR/NKa3Eme9xXYVshvm
 BOj8QKhMS09oJ94jq5n1UJuEod5emDIu2G7PmdsSUOXyIv3Cq9+kEJNejeZh2RbDL0nS5q/TXhwXNu
 7tUYH8xuLZu+LE9CQH6Xn+XnBmgfTMTASx4aoaSu85Ys0kt1moUmpPuKvfz1L0L5kd1DrNfmUj70Cx
 qOcT3NvuR5tUUF7b9D736pwe/dNrFi2hYHTZ5P1nz3Oh+7bhzDOGUXg+IVZMqbUagp8Req9iSxoL29
 FRE2hrE/MOM3Mm9V25yZTo35nf4friJHDQbMy9I5dZa7JhEYd+TzUzKSX/p4Dzi2F0I9bvc1RZ3S0S
 Qg1CA3pbZ6kQo23yrHotBS/oPiKY292DX02PtOMNxUwWtyS9uIFmv99+kAwpsa/zKB+IGhLxaTx26Q
 +kYyapDKFaIWlDpFgeZWq93rbRY5dv/DZ8+2PIY1nJuDhKtsarlRZnjifJFQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

The "Board Parameters" members of the structs:
	struct atom_smc_dpm_info_v4_5
	struct atom_smc_dpm_info_v4_6
	struct atom_smc_dpm_info_v4_7
	struct atom_smc_dpm_info_v4_10
are written to the corresponding members of the corresponding PPTable_t
variables, but they lack destination size bounds checking, which means
the compiler cannot verify at compile time that this is an intended and
safe memcpy().

Since the header files are effectively immutable[1] and a struct_group()
cannot be used, nor a common struct referenced by both sides of the
memcpy() arguments, add a new helper, memcpy_trailing(), to perform the
bounds checking at compile time. Replace the open-coded memcpy()s with
memcpy_trailing() which includes enough context for the bounds checking.

"objdump -d" shows no object code changes.

[1] https://lore.kernel.org/lkml/e56aad3c-a06f-da07-f491-a894a570d78f@amd.com

Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Feifei Xu <Feifei.Xu@amd.com>
Cc: Likun Gao <Likun.Gao@amd.com>
Cc: Jiawei Gu <Jiawei.Gu@amd.com>
Cc: Evan Quan <evan.quan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/lkml/CADnq5_Npb8uYvd+R4UHgf-w8-cQj3JoODjviJR_Y9w9wqJ71mQ@mail.gmail.com
---
Alex, I dropped your prior Acked-by, since the implementation is very
different. If you're still happy with it, I can add it back. :)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 25 +++++++++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  6 ++---
 .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   |  8 +++---
 .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    |  5 ++--
 4 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 96e895d6be35..4605934a4fb7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1446,4 +1446,29 @@ static inline int amdgpu_in_reset(struct amdgpu_device *adev)
 {
 	return atomic_read(&adev->in_gpu_reset);
 }
+
+/**
+ * memcpy_trailing - Copy the end of one structure into the middle of another
+ *
+ * @dst: Pointer to destination struct
+ * @first_dst_member: The member name in @dst where the overwrite begins
+ * @last_dst_member: The member name in @dst where the overwrite ends after
+ * @src: Pointer to the source struct
+ * @first_src_member: The member name in @src where the copy begins
+ *
+ */
+#define memcpy_trailing(dst, first_dst_member, last_dst_member,		   \
+		        src, first_src_member)				   \
+({									   \
+	size_t __src_offset = offsetof(typeof(*(src)), first_src_member);  \
+	size_t __src_size = sizeof(*(src)) - __src_offset;		   \
+	size_t __dst_offset = offsetof(typeof(*(dst)), first_dst_member);  \
+	size_t __dst_size = offsetofend(typeof(*(dst)), last_dst_member) - \
+			    __dst_offset;				   \
+	BUILD_BUG_ON(__src_size != __dst_size);				   \
+	__builtin_memcpy((u8 *)(dst) + __dst_offset,			   \
+			 (u8 *)(src) + __src_offset,			   \
+			 __dst_size);					   \
+})
+
 #endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index 8ab58781ae13..1918e6232319 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -465,10 +465,8 @@ static int arcturus_append_powerplay_table(struct smu_context *smu)
 
 	if ((smc_dpm_table->table_header.format_revision == 4) &&
 	    (smc_dpm_table->table_header.content_revision == 6))
-		memcpy(&smc_pptable->MaxVoltageStepGfx,
-		       &smc_dpm_table->maxvoltagestepgfx,
-		       sizeof(*smc_dpm_table) - offsetof(struct atom_smc_dpm_info_v4_6, maxvoltagestepgfx));
-
+		memcpy_trailing(smc_pptable, MaxVoltageStepGfx, BoardReserved,
+				smc_dpm_table, maxvoltagestepgfx);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 2e5d3669652b..b738042e064d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -431,16 +431,16 @@ static int navi10_append_powerplay_table(struct smu_context *smu)
 
 	switch (smc_dpm_table->table_header.content_revision) {
 	case 5: /* nv10 and nv14 */
-		memcpy(smc_pptable->I2cControllers, smc_dpm_table->I2cControllers,
-			sizeof(*smc_dpm_table) - sizeof(smc_dpm_table->table_header));
+		memcpy_trailing(smc_pptable, I2cControllers, BoardReserved,
+				smc_dpm_table, I2cControllers);
 		break;
 	case 7: /* nv12 */
 		ret = amdgpu_atombios_get_data_table(adev, index, NULL, NULL, NULL,
 					      (uint8_t **)&smc_dpm_table_v4_7);
 		if (ret)
 			return ret;
-		memcpy(smc_pptable->I2cControllers, smc_dpm_table_v4_7->I2cControllers,
-			sizeof(*smc_dpm_table_v4_7) - sizeof(smc_dpm_table_v4_7->table_header));
+		memcpy_trailing(smc_pptable, I2cControllers, BoardReserved,
+				smc_dpm_table_v4_7, I2cControllers);
 		break;
 	default:
 		dev_err(smu->adev->dev, "smc_dpm_info with unsupported content revision %d!\n",
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index c8eefacfdd37..a6fd7ee314a9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -409,9 +409,8 @@ static int aldebaran_append_powerplay_table(struct smu_context *smu)
 
 	if ((smc_dpm_table->table_header.format_revision == 4) &&
 	    (smc_dpm_table->table_header.content_revision == 10))
-		memcpy(&smc_pptable->GfxMaxCurrent,
-		       &smc_dpm_table->GfxMaxCurrent,
-		       sizeof(*smc_dpm_table) - offsetof(struct atom_smc_dpm_info_v4_10, GfxMaxCurrent));
+		memcpy_trailing(smc_pptable, GfxMaxCurrent, reserved,
+				smc_dpm_table, GfxMaxCurrent);
 	return 0;
 }
 
-- 
2.30.2

