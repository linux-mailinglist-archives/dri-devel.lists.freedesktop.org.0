Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B007338AD70
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EE06F421;
	Thu, 20 May 2021 12:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FE78915F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:16 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a4so17424026wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aa3gg5EuMa9A5nk5o0d0T8SZ6WR+4Hli7trc1GNqVzE=;
 b=P/8FbvIM/h7Ij52WQCkLtGbmLfZt2AIUofpELl7aKx9cVVKxRhCPQWSTqLoL+D5ek0
 3e7FpGFtcDBnwmpnAo9QDgzBiqYfUul8fsWJeAdJ7gqxXWD3KfNPqhNmL0hOBgD8iCLs
 RHzl84pChy/3XbBLbG+ny0C3LSao4HP+jP1MS08fMA09Bv1MtJYVhGkCT6RL8+WsnmG6
 2IpoNRsoY7lJhmH+oP52+LkzipwOSevCUEQlu28ZqIaOJy+zUHSR8XzhYCrK4pomOiQM
 H9hu5ChdIaJPBw6CSJrYMjgHUW9+6vQGnmLJfH42Xr7yZ3VgkiBDkOTrowlpSuVIksnb
 9qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aa3gg5EuMa9A5nk5o0d0T8SZ6WR+4Hli7trc1GNqVzE=;
 b=IA4k/hpJSaWA20b+J1b8JqjgeOyVtuEqXCTYFgKtCSy1/nasA+w8kRcdL3QIDQl89v
 MaVsR9+h/0hic1juOEe019DxbsLsYz1wQ5syGsWEPUuzt7+if+OjFEo4xsTB1N2XQALi
 XlGNew23xzBsTOY8pDy+CgGHY5BtDsnvp9I+fIlPvc3dGqkSn9A/XUxZ0QdUTuNNAxoc
 HtFsr6QVsyS+N5HMPoDERzrOXUGmfpM5y4QciN9gFDOvIRuClTjCZXWl5XGwFzL1WEKu
 eVkAFI+o+oM4NeF7AQqqlLeRVso8wAzzykY1dMyeSRJjetnzSffFV4lM0j2e0+W0saN9
 MZig==
X-Gm-Message-State: AOAM531f7gV7ONmZVOafz53W7es4kWriUssRG3DLDOSEG0snyqGfOZLG
 RjT5CQXubnxtuTtGC+rnkIje2Q==
X-Google-Smtp-Source: ABdhPJxcm94XcnPIlXpI+aoOcisifK8IL9R99fLfefdLdPJx9Qsa0SXHZUEbROwc7y4h4Dww96AGxA==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr4038472wrt.189.1621512195526; 
 Thu, 20 May 2021 05:03:15 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:15 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/38] drm/amd/amdgpu/gmc_v7_0: Fix potential copy/paste issue
Date: Thu, 20 May 2021 13:02:33 +0100
Message-Id: <20210520120248.3464013-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c:526: warning: expecting prototype for gmc_v8_0_set_fault_enable_default(). Prototype was for gmc_v7_0_set_fault_enable_default() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 210ada2289ec9..8e282169f99eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -516,7 +516,7 @@ static void gmc_v7_0_get_vm_pte(struct amdgpu_device *adev,
 }
 
 /**
- * gmc_v8_0_set_fault_enable_default - update VM fault handling
+ * gmc_v7_0_set_fault_enable_default - update VM fault handling
  *
  * @adev: amdgpu_device pointer
  * @value: true redirects VM faults to the default page
-- 
2.31.1

