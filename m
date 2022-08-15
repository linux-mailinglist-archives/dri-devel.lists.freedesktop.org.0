Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F215B5935F9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 21:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EEBD25A5;
	Mon, 15 Aug 2022 19:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E79D251F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:59:51 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id fy5so15059863ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=H9WTXJxC0k6R+cX+DIl2M/kL4d+bV50OWP4NxIVQy5M=;
 b=loqB4sIZX1aXE5bgF3DuMWIhaaVlJgslrn/nUkEPZGgBgOS0gWF90MamLoIEHf6UZ8
 ZKbCb8tYIkQ29LuL21xfeoBQ7CaGu/xAyUB3u67e822T/06UxZwhM2OQndpFhxvk8tL8
 fU33Ac4n6g3qxfxWBV8y+k+neEJds+IInVBg6U2C5bbYKJGI7C2dmXHIshCxpmTlmn+5
 SFnVHJc9ePADZHQ44xRw8qQB231ZdAEWEL6ZaeRfgB0mtf1FkPJxNwNO4M5odGu/7TkS
 0S5ojPgtnYuA0GkG2aRSG/+LqUo+Di8c1ZQyYdcjw3As6kXrpbDXLRV9yg3LXduZHbvy
 77Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=H9WTXJxC0k6R+cX+DIl2M/kL4d+bV50OWP4NxIVQy5M=;
 b=kDZSMO9NhJfWfplfiwZdK45LODuLUwmPswCs6JUL6sRot4rby2/9AYkCjAdta7vgiI
 1h3SrW4oG3xCJpHIM+7yX9vWpJklAs0jW7i23DguATDLWybDCIKtxOrSAwbAjG6lqA5u
 u2H/6rKMzeE3dSYo+Is9u8sIrpD42BibGaNFGEruGWc2ngGEkcqRH2jkimQGCNOY8xQo
 tjcYMh7JPAhuBge/q6UBq6q1rNgz9om3ULBdWA/aId/uZ+KmcEFdvQQrp+IBEw0CKsRR
 qXpVCFX623bFzY1L9cuyIuhtalLlRuMtS9jmy/o9sDB+ni1qahFdOgOtBZdQltsTp2rS
 3RAA==
X-Gm-Message-State: ACgBeo0aTr+N2clDDedS+sG0mjMcUU5QZf8k5OWV4PpYEYkGBvxXW7+o
 LrV1jBZ5IAocOasXjj2FRxfRuKYjaFM=
X-Google-Smtp-Source: AA6agR6gL/Ebe/O7qxgj7YrRO7698sAsToVVoUGcwy2r7LzsBFPpBOBExM2kAKmajdYeiW4unHjgjA==
X-Received: by 2002:a17:906:cc0e:b0:731:6844:880a with SMTP id
 ml14-20020a170906cc0e00b007316844880amr11223645ejb.514.1660589990826; 
 Mon, 15 Aug 2022 11:59:50 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm3553805ejd.28.2022.08.15.11.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:59:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/10] drm/amdgpu: cleanup instance limit on VCN4
Date: Mon, 15 Aug 2022 20:59:38 +0200
Message-Id: <20220815185940.4744-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815185940.4744-1-christian.koenig@amd.com>
References: <20220815185940.4744-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to what we did for VCN3 use the job instead of the parser
entity. Cleanup the coding style quite a bit as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 46 +++++++++++++++------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index ca14c3ef742e..a59418ff9c65 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1328,21 +1328,23 @@ static void vcn_v4_0_unified_ring_set_wptr(struct amdgpu_ring *ring)
 	}
 }
 
-static int vcn_v4_0_limit_sched(struct amdgpu_cs_parser *p)
+static int vcn_v4_0_limit_sched(struct amdgpu_cs_parser *p,
+				struct amdgpu_job *job)
 {
 	struct drm_gpu_scheduler **scheds;
 
 	/* The create msg must be in the first IB submitted */
-	if (atomic_read(&p->entity->fence_seq))
+	if (atomic_read(&job->base.entity->fence_seq))
 		return -EINVAL;
 
-	scheds = p->adev->gpu_sched[AMDGPU_HW_IP_VCN_ENC]
-		[AMDGPU_RING_PRIO_0].sched;
-	drm_sched_entity_modify_sched(p->entity, scheds, 1);
+	scheds = p->adev->gpu_sched[AMDGPU_HW_IP_VCN_DEC]
+		[AMDGPU_RING_PRIO_DEFAULT].sched;
+	drm_sched_entity_modify_sched(job->base.entity, scheds, 1);
 	return 0;
 }
 
-static int vcn_v4_0_dec_msg(struct amdgpu_cs_parser *p, uint64_t addr)
+static int vcn_v4_0_dec_msg(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
+			    uint64_t addr)
 {
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_bo_va_mapping *map;
@@ -1413,7 +1415,7 @@ static int vcn_v4_0_dec_msg(struct amdgpu_cs_parser *p, uint64_t addr)
 		if (create[0] == 0x7 || create[0] == 0x10 || create[0] == 0x11)
 			continue;
 
-		r = vcn_v4_0_limit_sched(p);
+		r = vcn_v4_0_limit_sched(p, job);
 		if (r)
 			goto out;
 	}
@@ -1426,32 +1428,34 @@ static int vcn_v4_0_dec_msg(struct amdgpu_cs_parser *p, uint64_t addr)
 #define RADEON_VCN_ENGINE_TYPE_DECODE                                 (0x00000003)
 
 static int vcn_v4_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
-				struct amdgpu_job *job,
-				struct amdgpu_ib *ib)
+					   struct amdgpu_job *job,
+					   struct amdgpu_ib *ib)
 {
-	struct amdgpu_ring *ring = to_amdgpu_ring(p->entity->rq->sched);
-	struct amdgpu_vcn_decode_buffer *decode_buffer = NULL;
+	struct amdgpu_ring *ring = to_amdgpu_ring(job->base.entity->rq->sched);
+	struct amdgpu_vcn_decode_buffer *decode_buffer;
+	uint64_t addr;
 	uint32_t val;
-	int r = 0;
 
 	/* The first instance can decode anything */
 	if (!ring->me)
-		return r;
+		return 0;
 
 	/* unified queue ib header has 8 double words. */
 	if (ib->length_dw < 8)
-		return r;
+		return 0;
 
 	val = amdgpu_ib_get_value(ib, 6); //RADEON_VCN_ENGINE_TYPE
+	if (val != RADEON_VCN_ENGINE_TYPE_DECODE)
+		return 0;
 
-	if (val == RADEON_VCN_ENGINE_TYPE_DECODE) {
-		decode_buffer = (struct amdgpu_vcn_decode_buffer *)&ib->ptr[10];
+	decode_buffer = (struct amdgpu_vcn_decode_buffer *)&ib->ptr[10];
 
-		if (decode_buffer->valid_buf_flag  & 0x1)
-			r = vcn_v4_0_dec_msg(p, ((u64)decode_buffer->msg_buffer_address_hi) << 32 |
-						decode_buffer->msg_buffer_address_lo);
-	}
-	return r;
+	if (!(decode_buffer->valid_buf_flag  & 0x1))
+		return 0;
+
+	addr = ((u64)decode_buffer->msg_buffer_address_hi) << 32 |
+		decode_buffer->msg_buffer_address_lo;
+	return vcn_v4_0_dec_msg(p, job, addr);
 }
 
 static const struct amdgpu_ring_funcs vcn_v4_0_unified_ring_vm_funcs = {
-- 
2.25.1

