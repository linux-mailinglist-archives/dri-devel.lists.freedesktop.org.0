Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD1622781
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485CD10E2DC;
	Wed,  9 Nov 2022 09:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CFF10E12B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 09:50:15 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z18so26371023edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 01:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PC8s8cF2OyJcBZV0kCPqZwAqYghNKvo1Uaxmwzw5J0=;
 b=XCkkRaruS2Vl7vvn4R7cj3IvkpILjmpZY6Y1sl10zxcK3cyD6U5TW2oAuqDYHIjsGu
 F98lLwRiwT/o6UT+Ip6ubGF2WogZsvsZ+e6BmGhrbf8hcgWJrPXbTrdBpIMsnEW/7IVg
 sQoLOW5CWy5ywhdhfwjT/dXd4hZt8XPagXAxRYfVANRVISp+dgrTO7Rio/4cPNZdsna9
 FuqZCyFXMJL070JcAlO8uEuxrirshv7mkUT1lWAuILmEdiOx0HGZN/fggAEt8uqpBPXe
 m0nJlbHyuG4j4y7EdAeMEAypKBCkVCs2IRD3E5TrVi6UXLSnXYT03b9yGMTrvlTPJgqg
 kJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PC8s8cF2OyJcBZV0kCPqZwAqYghNKvo1Uaxmwzw5J0=;
 b=vOSDSF4upUUlwNo0SKWqWDONPiwkb8MYGx4QKfW5B1GbozWqSDfCBT3ijMec792sbL
 VGWkN+mfL5H+lA/PBoxJsrFn1CcejHyaOW2A1UTZHG7tcn9YJcpEQbOBdxNiFYWdIvQ4
 c0+QlTdRtLH+BpK5iG1onj6NjBvbwl1o0BWTV9ca9nN5iCp87KZe1XLbk408nQGgq0TQ
 KpfFmvNvBeeAUKYv8WU2tJ7ylCsZyJVUcrw7hzCvXW/i0iXlSh32Bp+lzXvLkFZCXYCB
 vXDOIbde77BlxSW4KkGVdibgrmlYNc9iBTS842jcN6OQ4OohTQ975eI1t8xu0EkHhj/X
 C6Qw==
X-Gm-Message-State: ACrzQf2K9VwqOE9b/lqcFTmjfeBThdYIjp6yReM9q0ObtUoDKhCgdd8u
 GqiOl5pDYDMZVMXJ3ZtlBO0=
X-Google-Smtp-Source: AMsMyM5XYEjuXKph2BcWKOcfHOA5o7u6F6xUGkXQVwTjIHSa3CGyJ0wIgzreFlD4a7H4seqKPhW7Lg==
X-Received: by 2002:a50:d6d1:0:b0:45f:9526:e35a with SMTP id
 l17-20020a50d6d1000000b0045f9526e35amr1124386edj.256.1667987414093; 
 Wed, 09 Nov 2022 01:50:14 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a1709062ecc00b00780f24b797dsm5604543eji.108.2022.11.09.01.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 01:50:13 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Alexander.Deucher@amd.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Shaoyun.Liu@amd.com
Subject: [PATCH 2/5] drm/amdgpu: stop resubmitting jobs for GPU reset v2
Date: Wed,  9 Nov 2022 10:50:07 +0100
Message-Id: <20221109095010.141189-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109095010.141189-1-christian.koenig@amd.com>
References: <20221109095010.141189-1-christian.koenig@amd.com>
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

Re-submitting IBs by the kernel has many problems because pre-
requisite state is not automatically re-created as well. In
other words neither binary semaphores nor things like ring
buffer pointers are in the state they should be when the
hardware starts to work on the IBs again.

Additional to that even after more than 5 years of
developing this feature it is still not stable and we have
massively problems getting the reference counts right.

As discussed with user space developers this behavior is not
helpful in the first place. For graphics and multimedia
workloads it makes much more sense to either completely
re-create the context or at least re-submitting the IBs
from userspace.

For compute use cases re-submitting is also not very
helpful since userspace must rely on the accuracy of
the result.

Because of this we stop this practice and instead just
properly note that the fence submission was canceled. The
only use case we keep the re-submission for now is SRIOV
and function level resets.

v2: as suggested by Sshaoyun stop resubmitting jobs even for SRIOV

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 0da55fd97df8..3a51c4c61833 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5294,11 +5294,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			if (!ring || !ring->sched.thread)
 				continue;
 
-			/* No point to resubmit jobs if we didn't HW reset*/
-			if (!tmp_adev->asic_reset_res && !job_signaled)
-				drm_sched_resubmit_jobs(&ring->sched);
-
-			drm_sched_start(&ring->sched, !tmp_adev->asic_reset_res);
+			drm_sched_start(&ring->sched, true);
 		}
 
 		if (adev->enable_mes && adev->ip_versions[GC_HWIP][0] != IP_VERSION(11, 0, 3))
-- 
2.34.1

