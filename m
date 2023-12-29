Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC882008F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 17:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5B110E0CC;
	Fri, 29 Dec 2023 16:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3A910E0A1;
 Fri, 29 Dec 2023 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ABg5Sqt7TFlZw1Klt78C3Soq+vNJU8zHohfV779ACh0=; b=ZCUUkAD+ao93/XPJ6PDudAlkS3
 jfNKaC/+Y27+ERYFG+t4/UzjGvF9tiuhp5DIbZbmPXzXHO51ubr9nknYfRVr/CD8rvx1vObNwch02
 DPdSscgoBYzxnRRlrsAEDW0vBZiVaQxS26Q9/DHdfj6oOiHZq4i5d4HsmhTLOw1+G1D82KbwRp+od
 DfsXtPBuktFtBNhM16upNBElWMkboZknJUmDqWLBl/4nhYsfCQ4cTuqeRlDo18eXjw7A8mP3/y8RH
 BmKiTvcq4jObNs4Lid7sxZnRVgVZYg1R7n5AtP0AgIikBTVlJRPtga77RkJ+lv2LOekl0QO8VbxhQ
 Thtr/JqQ==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rJFsN-001Xtn-O0; Fri, 29 Dec 2023 17:38:23 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, qingqing.zhuo@amd.com
Subject: [RFC PATCH] drm/amd/display: fix bandwidth validation failure on DCN
 2.1
Date: Fri, 29 Dec 2023 15:25:00 -0100
Message-ID: <20231229163821.144599-1-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IGT `amdgpu/amd_color/crtc-lut-accuracy` fails right at the beginning of
the test execution, during atomic check, because DC rejects the
bandwidth state for a fb sizing 64x64. The test was previously working
with the deprecated dc_commit_state(). Now using
dc_validate_with_context() approach, the atomic check needs to perform a
full state validation. Therefore, set fast_validation to false in the
dc_validate_global_state call for atomic check.

Fixes: b8272241ff9d ("drm/amd/display: Drop dc_commit_state in favor of dc_commit_streams")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

Hi,

It's a long story. I was inspecting this bug report:
- https://gitlab.freedesktop.org/drm/amd/-/issues/2016
and noticed the IGT test `igt@amdgpu/amd_color@crtc-lut-accuracy`
mentioned there wasn't even being executed on a laptop with DCN 2.1
(HP HP ENVY x360 Convertible 13-ay1xxx/8929). The test fails right at
the beginning due to an atomic check rejection, as below:

Starting subtest: crtc-lut-accuracy
(amd_color:14772) igt_kms-CRITICAL: Test assertion failure function igt_display_commit_atomic, file ../lib/igt_kms.c:4530:
(amd_color:14772) igt_kms-CRITICAL: Failed assertion: ret == 0
(amd_color:14772) igt_kms-CRITICAL: Last errno: 22, Invalid argument
(amd_color:14772) igt_kms-CRITICAL: error: -22 != 0
Stack trace:
  #0 ../lib/igt_core.c:1989 __igt_fail_assert()
  #1 [igt_display_commit_atomic+0x44]
  #2 ../tests/amdgpu/amd_color.c:159 __igt_unique____real_main395()
  #3 ../tests/amdgpu/amd_color.c:395 main()
  #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
  #6 [_start+0x21]
Subtest crtc-lut-accuracy failed.

Checking dmesg, we can see that a bandwidth validation failure causes
the atomic check rejection:

[  711.147663] amdgpu 0000:04:00.0: [drm] Mode Validation Warning: Unknown Status failed validation.
[  711.147667] [drm:amdgpu_dm_atomic_check [amdgpu]] DC global validation failure: Bandwidth validation failure (BW and Watermark) (13)
[  711.147772] [drm:amdgpu_irq_dispatch [amdgpu]] Unregistered interrupt src_id: 243 of client_id:8
[  711.148033] [drm:amdgpu_dm_atomic_check [amdgpu]] Atomic check failed with err: -22

I also noticed that the atomic check doesn't fail if I change the fb
width and height used in the test from 64 to 66, and I can get the test
execution back (and with success). However, I recall that all test cases
of IGT `amd_color` were working in the past, so I bisected and found the
first bad commit:

b8272241ff9d drm/amd/display: Drop dc_commit_state in favor of dc_commit_streams

Bringing the `dc_commit_state` machinery back also prevents the
bandwidth validation failure, but the commit above says
dc_commit_streams validation is more complete than dc_commit_state, so I
discarded this approach.

After some debugging and code inspection, I found out that avoiding fast
validation on dc_validate_global_state during atomic check solves the
issue, but I'm not sure if this change may affect performance. I
compared exec time of some IGT tests and didn't see any differences, but
I recognize it doesn't provide enough evidence.

What do you think about this change? Should I examine other things? Do
you see any potential issue that I should investigate? Could you
recommend a better approach to assess any side-effect of not enabling
fast validation in the atomic check?

Please, let me know your thoughts.

Happy New Year!

Melissa

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2845c884398e..4f51a7ad7a3c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10745,7 +10745,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			DRM_DEBUG_DRIVER("drm_dp_mst_atomic_check() failed\n");
 			goto fail;
 		}
-		status = dc_validate_global_state(dc, dm_state->context, true);
+		status = dc_validate_global_state(dc, dm_state->context, false);
 		if (status != DC_OK) {
 			DRM_DEBUG_DRIVER("DC global validation failure: %s (%d)",
 				       dc_status_to_str(status), status);
-- 
2.43.0

