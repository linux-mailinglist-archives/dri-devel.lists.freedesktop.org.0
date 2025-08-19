Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8DB2B602
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 03:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140A010E502;
	Tue, 19 Aug 2025 01:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zTmk+N62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415A110E502
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:31:11 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-32326e7baa1so3809492a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755567071; x=1756171871; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6PYDnfjcx7DpUU83wY0yl1Hf8rMD2pVEbU9c35OZ+h8=;
 b=zTmk+N62dTPgXjOI0waKUaDYsAMIIIYVwWQQzZUbpdXeUbEPy9vPUGX4x+MsrMzzZ1
 eSbwuY96wC8IcPqAhJE2AQ9bTgiqIckrvd+O34x8EFcU7ldeqwjEzMMLa1g84+dQ1bms
 C6XY/wO5a1DqWdrPVB9jibtPoSlrQzy6ZqvuX5aTQ4KCjJfpSWlNQTLVvfK8vdZJbGmP
 kiMuWcg2UdglZjrM75cGo7hHC7uVgnUen7wQkE2hZ/4eIKv2sjAxktOnUnRRx5FHLmjO
 87fGTaHd6TbUuubnzqegIvIHRdXSTAcz/9e/wZLUKCyyYQ8d2JSIP7gUF1RdhURcxFi0
 rOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755567071; x=1756171871;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6PYDnfjcx7DpUU83wY0yl1Hf8rMD2pVEbU9c35OZ+h8=;
 b=Y1NfcXzYz3prqpYoXhK4ZLqks/x8pBtHj+zT371xd94CRALhFo/CDeR1xP7KzuylQ3
 /r7OAdn0hs+3qts1cdC2wPWHvT1r4oJjsevcpaio3UOPJIG7l43QrqIFpVYCxDF/FFVE
 87Nc16JW4AYrsf2HbFPzCyndDKqC0FcXokd/R+RGPxqBFd/3E32PUkl5L6zlaRIytf42
 ontGk5AF7hcOrYHCGJoiOefgmnb5N+f+29VbW7qbSyFDaNoALG23915H7F/IWJGOwQn1
 3jj+QeO3Oroi0fQdX2K3ZMbJ9Sq+YBp6gOJNSJf5ZZHliw/lne01ZtZwEXCsSwXhh93U
 R2GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAhTYotcIEzxeSPYAV65+dq80LVDvVIP/8LkdBm/aW5cWq6xPYDztjaDIF59F4vK+BW5kEEOPtXyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhRFr33hnOaK0iRE/LwL3mcgAchXzl9ckF0ihoWhsfsMpIGOic
 ceTnyGbx+0f7fPGne5VWRfsoWpiy+mN8OHhMNv385pqFvWJC05uet0JaYvK9iNHjVoI=
X-Gm-Gg: ASbGncsVZoNm39PoIF4aq2u8W+9t5MMN69UoilTGqxvacwHl0Jvc3X6BLvcM8cXI1Tn
 3cO8jidD2QLDfcjXQ9zgs64o0kHdOtubJg28Jm+1/98gpemV3J/x4hU3ezoyrMbSmBy4qCuJLBx
 oOKEai+kLxof0fOE7juscSZ28UfZrgFbNJSp0hry80PXaU5pJ8GmDgfLaKr/wBbmi6/drOugOgF
 tF8Ez0DYkURFS57OthTHdx6MAV9xbWc5G4im71p0hXLrqjqb5PjqmOipQglNyC/jj6vhViPNtGg
 JryB7PJIex7cx+/opZB5tJG5UiRwfyAbThQ8QlRJObjM8B23SyslR//8cXUYMIdJyMtVdMw03OO
 Smwyd1Mq5OkLzgD6CPQ==
X-Google-Smtp-Source: AGHT+IG0xxURHdyn3w0qMS0E9bqiQc2e0Lfkc1QGH12O2UaVjhiGMXu9F2tJLJcIU5aM+B4XO77ohQ==
X-Received: by 2002:a17:90b:52c6:b0:323:7e80:8818 with SMTP id
 98e67ed59e1d1-32497119cd6mr1183212a91.37.1755567070605; 
 Mon, 18 Aug 2025 18:31:10 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:31:10 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:30:55 +0800
Subject: [PATCH v15 01/13] drm/msm: Do not validate SSPP when it is not ready
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-1-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=3970;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=kTeOmxXhQ+ch50lt+D0cO3o/E47sgOg8CG5Ss5YITlM=;
 b=KB+TS9xLpfwaJ20L1fl9jkfQGuhI01ifSAlgyQxfwui9tw3ZeUGxKruSD5bIdmyqmVNTFvPEG
 U0sZDLWpkeWBFv4EjlOFI+yAJ+wBEoLbHx0JCbH6fem6+NkA5wTJE5l
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Current code will validate current plane and previous plane to
confirm they can share a SSPP with multi-rect mode. The SSPP
is already allocated for previous plane, while current plane
is not associated with any SSPP yet. Null pointer is referenced
when validating the SSPP of current plane. Skip SSPP validation
for current plane.

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000888ac3000
[0000000000000020] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 4 UID: 0 PID: 1891 Comm: modetest Tainted: G S                  6.15.0-rc2-g3ee3f6e1202e #335 PREEMPT
Tainted: [S]=CPU_OUT_OF_SPEC
Hardware name: SM8650 EV1 rev1 4slam 2et (DT)
pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : dpu_plane_is_multirect_capable+0x68/0x90
lr : dpu_assign_plane_resources+0x288/0x410
sp : ffff800093dcb770
x29: ffff800093dcb770 x28: 0000000000002000 x27: ffff000817c6c000
x26: ffff000806b46368 x25: ffff0008013f6080 x24: ffff00080cbf4800
x23: ffff000810842680 x22: ffff0008013f1080 x21: ffff00080cc86080
x20: ffff000806b463b0 x19: ffff00080cbf5a00 x18: 00000000ffffffff
x17: 707a5f657a696c61 x16: 0000000000000003 x15: 0000000000002200
x14: 00000000ffffffff x13: 00aaaaaa00aaaaaa x12: 0000000000000000
x11: ffff000817c6e2b8 x10: 0000000000000000 x9 : ffff80008106a950
x8 : ffff00080cbf48f4 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000438 x3 : 0000000000000438
x2 : ffff800082e245e0 x1 : 0000000000000008 x0 : 0000000000000000
Call trace:
 dpu_plane_is_multirect_capable+0x68/0x90 (P)
 dpu_crtc_atomic_check+0x5bc/0x650
 drm_atomic_helper_check_planes+0x13c/0x220
 drm_atomic_helper_check+0x58/0xb8
 msm_atomic_check+0xd8/0xf0
 drm_atomic_check_only+0x4a8/0x968
 drm_atomic_commit+0x50/0xd8
 drm_atomic_helper_update_plane+0x140/0x188
 __setplane_atomic+0xfc/0x148
 drm_mode_setplane+0x164/0x378
 drm_ioctl_kernel+0xc0/0x140
 drm_ioctl+0x20c/0x500
 __arm64_sys_ioctl+0xbc/0xf8
 invoke_syscall+0x50/0x120
 el0_svc_common.constprop.0+0x48/0xf8
 do_el0_svc+0x28/0x40
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x144/0x168
 el0t_64_sync+0x198/0x1a0
Code: b9402021 370fffc1 f9401441 3707ff81 (f94010a1)
---[ end trace 0000000000000000 ]---

Fixes: 3ed12a3664b36 ("drm/msm/dpu: allow sharing SSPP between planes")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 01171c535a27c8983aab6450d6f7a4316ae9c4ee..d20233ccd8df612fb6eee15242669510cf883c26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -922,6 +922,9 @@ static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
 	if (MSM_FORMAT_IS_YUV(fmt))
 		return false;
 
+	if (!sspp)
+		return true;
+
 	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
 	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
 		return false;
@@ -1028,6 +1031,7 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
 		return false;
 
+	/* Do not validate SSPP of current plane when it is not ready */
 	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
 	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
 		return false;

-- 
2.34.1

