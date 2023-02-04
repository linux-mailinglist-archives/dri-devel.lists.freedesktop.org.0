Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF14068A7F3
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 04:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC4110E096;
	Sat,  4 Feb 2023 03:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0003810E096;
 Sat,  4 Feb 2023 03:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=FoOBybbVEq4nKcbNBz7lHZJ8Czql2ZLx6S2TZbuykFI=; b=sfUGQXYslsBr5DEQeDeBBallb8
 XOimGQpxsOTxBuSGQjWFxwjQJBeQk4Ve3pydj/XMNjzq+0a5taWQufh7rfVR83wc6uLn/pCNJ2pfO
 dvrrcA2LaHwbAlzoyIP/BogJOuE9Sf8Wj+FTrmrSt79sdebhMStK93K0omNsjhsGrlQo4Q7kLDXjd
 X98wDA8IbTOU8eevqlEziJJyEEh2R2pw5/dmCfOeFMslThs+JNuF9mp5R02gPUJ3oYHMmyrWigzll
 emCoIztijo/x1+xM6t5UEknovi4x86TYGdCn+p7+HpkGRQKEOvLs7TeOfsGCphOqvdTzfNHT1q1rV
 mFTIvzpQ==;
Received: from [2601:1c2:d00:6a60::9526] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pO9DE-004M4F-Ea; Sat, 04 Feb 2023 03:27:36 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/amdgpu: add complete header search path
Date: Fri,  3 Feb 2023 19:27:35 -0800
Message-Id: <20230204032735.22509-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "Signed-off-by : Sung Joon Kim" <sungkim@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The path for the "mod_info_packet.h" header file is
incomplete, so add its location to the header search path
in the amdgpu Makefile.

See on ARCH=alpha (275 times in one build).

In file included from ../drivers/gpu/drm/amd/amdgpu/amdgpu.h:90,
                 from ../drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:43:
../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fatal error: mod_info_packet.h: No such file or directory
   62 | #include "mod_info_packet.h"
      |          ^~~~~~~~~~~~~~~~~~~
compilation terminated.

Fixes: 5b49da02ddbe ("drm/amd/display: Enable Freesync over PCon")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Signed-off-by: Sung Joon Kim <sungkim@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/Makefile |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -34,6 +34,7 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/
 	-I$(FULL_AMD_PATH)/acp/include \
 	-I$(FULL_AMD_DISPLAY_PATH) \
 	-I$(FULL_AMD_DISPLAY_PATH)/include \
+	-I$(FULL_AMD_DISPLAY_PATH)/modules/inc \
 	-I$(FULL_AMD_DISPLAY_PATH)/dc \
 	-I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
 	-I$(FULL_AMD_PATH)/amdkfd
