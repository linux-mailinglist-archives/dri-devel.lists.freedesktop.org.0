Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08C4F572E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C5510EEA7;
	Wed,  6 Apr 2022 08:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01AB10EDA5;
 Tue,  5 Apr 2022 17:36:10 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z12so24510859lfu.10;
 Tue, 05 Apr 2022 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yax7P8EHkvsWnyvnaOpe3ZP8r2G7HKN+i3pXtBsfClM=;
 b=eX6mY5a8lSH1hyqUbeznreGC7UTb6M0TABj5aCC7d1j7X8S5tKD7PEwqCQaBddz1/U
 WYtwfZYDDw/dYD4JRG69cicx99gRc3R8NnjE0szGGh5jJkHDDH5nlg7OI0bG7Kg8MvUt
 N+02SEESeCp662srZbhhQwqKi0sqlYTzC14XKEFwtf+XzOMQkJL0/ayQRgyL6zt44GOi
 2WpLLgAmNUr9+ojdOcvdbvkIjm2clTL7i6syEiYxeCCrWBRdEoiNP34kFDSfWc2U4KKK
 FpMo3KNFr4Fb3z/FJBcbBLfeTTQjOep3Ufsp+c/ZStiy+0xbxfOQ5uPnPUdxYBkipNHr
 btyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yax7P8EHkvsWnyvnaOpe3ZP8r2G7HKN+i3pXtBsfClM=;
 b=1MJqUy8lnadjDxMwoIOlY7g1oTN0z/JYMeEves2GSqPNVwInZxQyvZnk4/IZAPm3W6
 AIdtZZdHkuuNChRbLoLBzFGKOce2TyRZFPmR/B3BgcaISiV4YAaMTbcwT6dwB/YfdH5C
 wSGc593PjN1RYRsZHkQXqg8Lx67020XUKdHGbpdohTwP8SMWg4JUzhSyulWRkuQvMq3Z
 iKFmIJqxNgm0r7O9zMppoIa/p9SgDH00b+FzC8K13I7ynsL1esOR9PMjQo5uYjQEVKz3
 wU5sThQf/pSRO+KlO9Lj/mpMk79rnBR7K1OzCjfHBHbPR7+1APQrOGGf6trbq+WxJLKn
 JyJQ==
X-Gm-Message-State: AOAM531GAyoCDr7Sc1NPw31yGPo2uq0/ghiopbQBWV6gkbLFt9NqhWuO
 tWaSoPDznPlXB1LIHJ0JaMM=
X-Google-Smtp-Source: ABdhPJzAigPVYUbSH1vQDPC4sxC9WAI5tvVCVverTI7h3DMZJH8eYPENeqhDI61Vlsdt1H9euBwtiQ==
X-Received: by 2002:a05:6512:15a6:b0:44a:a117:f1d3 with SMTP id
 bp38-20020a05651215a600b0044aa117f1d3mr3461530lfb.216.1649180169117; 
 Tue, 05 Apr 2022 10:36:09 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:226e:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 i33-20020a0565123e2100b00452f78ea43dsm481430lfv.297.2022.04.05.10.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 10:36:08 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH 1/2] drm/amdgpu: Accessing to a null pointer
Date: Tue,  5 Apr 2022 20:36:12 +0300
Message-Id: <20220405173613.2611-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Apr 2022 08:00:38 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Jiawei Gu <Jiawei.Gu@amd.com>,
 Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A typo in the code. It was assumed that it was
possible to shift the pointer to sizeof(BIOS_ATOM_PREFIX) - 1.

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e729973af3c9..be9d61bcb8ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1426,7 +1426,7 @@ static void atom_get_vbios_pn(struct atom_context *ctx)
 
 	if (*vbios_str == 0) {
 		vbios_str = atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);
-		if (vbios_str == NULL)
+		if (vbios_str != NULL)
 			vbios_str += sizeof(BIOS_ATOM_PREFIX) - 1;
 	}
 	if (vbios_str != NULL && *vbios_str == 0)
-- 
2.35.1

