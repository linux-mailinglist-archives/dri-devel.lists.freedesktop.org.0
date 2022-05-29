Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB95370DA
	for <lists+dri-devel@lfdr.de>; Sun, 29 May 2022 13:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F5710E8F3;
	Sun, 29 May 2022 11:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF4610EDEC;
 Sun, 29 May 2022 07:26:43 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t2so100703pld.4;
 Sun, 29 May 2022 00:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vu4dWIGyiffGhwd6i2g4sM9fvK38UUljjdIsvD/ie+k=;
 b=goZbCuiBnSnrlpSgfR4+/waxWDv6G6G0CVOjrka6t/U99poMFi07YHChR8JAwrBDlQ
 9Ay7BapxJmwVmbh4l8nIn95Hcb0z14HfIvU21mo8mYzN6Lpr8Oaikr4pJ8b+BzhNjwR7
 UGrLtBVQ17ccQQIK7yWgFSVxFbmKGg1IiFkN0yC7Pd1Mvm8t2xxZzpkcv42S2rAXtJSC
 ZxtP+s8Ir4Lys1gJVMuwuv3XwVpez92vxf8smoBOUrCBMGUKW8AVFItZR8zkdFUGQizU
 wPvxdvpDyojvaqQ95ki3X2qVC5WnAoYjumDwQt468pMFHGYp02KgiqTUaKI2XEVMvWMe
 ivYA==
X-Gm-Message-State: AOAM531mfKq1GbMZAycSVY5wYLxTKzpOZ0JPKFK1uVV8lM0G9PQROlqd
 az9xST7ejxR/7B+je9BD0w==
X-Google-Smtp-Source: ABdhPJzDFqMQ8MoMUp9uXAH6WqII1t+98/oFdCydP9hOJQWN8ccihKXmsmTEqRfLtPSlDiDi98wevg==
X-Received: by 2002:a17:90b:224a:b0:1e2:7afb:3367 with SMTP id
 hk10-20020a17090b224a00b001e27afb3367mr11946655pjb.37.1653809203357; 
 Sun, 29 May 2022 00:26:43 -0700 (PDT)
Received: from localhost.localdomain (ns1003916.ip-51-81-154.us.
 [51.81.154.37]) by smtp.gmail.com with ESMTPSA id
 h24-20020aa796d8000000b0050df474e4d2sm6448333pfq.218.2022.05.29.00.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 00:26:42 -0700 (PDT)
From: sunliming <sunliming@kylinos.cn>
To: alexander.deucher@amd.com, hristian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 mike@fireburn.co.uk, Xiaojian.Du@amd.com, evan.quan@amd.com
Subject: [PATCH] drm/amdgpu: fix a missing break in gfx_v11_0_handle_priv_fault
Date: Sun, 29 May 2022 15:26:31 +0800
Message-Id: <20220529072631.307922-1-sunliming@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 29 May 2022 11:50:28 +0000
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
Cc: kernel test robot <lkp@intel.com>, kelulanainsley@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 sunliming@kylinos.cn, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following w1 warning:

drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:5873:2: warning: unannotated
fall-through between switch labels [-Wimplicit-fallthrough].

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index cb581cfc7464..628d3536938e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -6028,6 +6028,7 @@ static void gfx_v11_0_handle_priv_fault(struct amdgpu_device *adev,
 		break;
 	default:
 		BUG();
+		break;
 	}
 }
 
-- 
2.25.1

