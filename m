Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A26273C60
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133BC6E178;
	Tue, 22 Sep 2020 07:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFD66E054;
 Tue, 22 Sep 2020 05:48:22 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id f11so8924155qvw.3;
 Mon, 21 Sep 2020 22:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a6SQCCgOvcVnYbZwR03FGL/qrYw5HjNsY2fRdLjl82U=;
 b=tyxd8motev6kgLZAmtucstDnnqDnmRrH1bXuX8dpwrbECLXnH1JtDxKqoxjgE0uC84
 7n9GPEGtLPig1f11FKwN4BbeUiL1H/uO1foqLPkARf/52IgAKH7ztxlGaHfn526dxaZJ
 NPqKyOEc281EQ9Uab7r0EdPwKX0dUaJnPSKEokB9UWfFPSVNz8HMkBbbCKUGeh/VmQHK
 b+hqP2KuGBETHFdMYNxVA/P4hCdE7gUbgI0JS6i+iJyLP1oMz1gaYc2yGX8On+Baqodm
 qpr+KvJnF+ZqjtAwln2PwQLrkuTppySz8EskYw5z/3PQZpru3gb+V5z7k2L8P+HyAbIu
 BVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a6SQCCgOvcVnYbZwR03FGL/qrYw5HjNsY2fRdLjl82U=;
 b=oushioi3Q1RzRc3GPHVpKZ4RC6LeCJdhqwQExfsosPu2ihf8FvkHqsfrlThynDt6qC
 t65ki1crXKcM4LBtzwL5VUEh6SNvvl2r/KqLPeMBg0avUMneWK4tdVOI3326y/uzJFkv
 VaYd+1doeCfmXDRW+uerVEGgLpTaPmVfzMY5h9fDrsdr79ta76KDqw0/7zudOLL9Xf46
 hVNsh2nBrfT39/q3d/8UXPpR7LqhD+sfLCbAQ5PY0fbVtO/hqQ7GA/0fBMEwRpOh3l7t
 7seRZPw8jer/ZSVv1800eoN0FZ3VrsPuqA8gh9JIxiPjtmDIKN/teb5i+eTKW6KqWa+f
 E9sQ==
X-Gm-Message-State: AOAM531xDj9h95s/TlJEHkS8WFhZd6OxSb08Zi20D+912REe/fpUOO3R
 nWnoG1R7e3XUJHIcziQUsPk=
X-Google-Smtp-Source: ABdhPJwDGs7jGImCpG+LB2Wp3WIK7lBkKjX1BDHsgY5T+UNvYa3EP/dCUzbFJjmmzMUvzLl0gjP1ew==
X-Received: by 2002:a0c:a4c5:: with SMTP id x63mr4315522qvx.58.1600753701601; 
 Mon, 21 Sep 2020 22:48:21 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id i187sm10961909qke.43.2020.09.21.22.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 22:48:19 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/display: Simplify condition in try_disable_dsc
Date: Mon, 21 Sep 2020 22:47:43 -0700
Message-Id: <20200922054743.2422929-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:36 +0000
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:637:8:
warning: logical not is only applied to the left hand side of this
comparison [-Wlogical-not-parentheses]
                                && !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
                                   ^                             ~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:637:8:
note: add parentheses after the '!' to evaluate the comparison first
                                && !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
                                   ^
                                    (
)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:637:8:
note: add parentheses around left hand side expression to silence this
warning
                                && !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
                                   ^
                                   (                            )
1 warning generated.

The expression "!a == 0" can be more simply written as "a", which makes
it easier to reason about the logic and prevents the warning.

Fixes: 0749ddeb7d6c ("drm/amd/display: Add DSC force disable to dsc_clock_en debugfs entry")
Link: https://github.com/ClangBuiltLinux/linux/issues/1158
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 9d7333a36fac..0852a24ee392 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -634,7 +634,7 @@ static void try_disable_dsc(struct drm_atomic_state *state,
 	for (i = 0; i < count; i++) {
 		if (vars[i].dsc_enabled
 				&& vars[i].bpp_x16 == params[i].bw_range.max_target_bpp_x16
-				&& !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
+				&& params[i].clock_force_enable) {
 			kbps_increase[i] = params[i].bw_range.stream_kbps - params[i].bw_range.max_kbps;
 			tried[i] = false;
 			remaining_to_try += 1;

base-commit: 6651cdf3bfeeaeb499db11668313666bf756579a
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
