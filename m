Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1A4284739
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D606E3AC;
	Tue,  6 Oct 2020 07:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9406E0E4;
 Tue,  6 Oct 2020 04:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:Cc:From:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Dt6GxUiiNucMJVb8insT90iPuGdOD6EG4FZ0RccNAMI=; b=m1TmLnvP1zb+gBR5X8PaSFHKAQ
 LgPis6cwWOZTnfJm2d22Cz6eTicstsnc9GrWWPi8Nap0uFabAaCeqneFSMqS7LDWNzUC4nUqAkJbl
 wnKF4vP5M+cJpKYAqlSrMxeCZBkeYXeaJAG1UpNXfsr+Mn7eSY8GM2lV93MrsoiDmfZpC+Kk5aDs/
 v3TdzyPj7KsTU0d7yyaUeF+sS8IaG3OkTBTagEe3wpAH1A+ZIHNBOZYZDZE9uDHSyoKQWClXh24FG
 FcJciAgxOSqEuHahBeSS2JyqHAFegQpGCwPUOq7OloHiP8IOxkWj5zN/8LfZjHAlGiWkthTmhYKls
 iEYLfUNA==;
Received: from [2601:1c0:6280:3f0::2c9a]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPevb-0008JQ-K8; Tue, 06 Oct 2020 04:50:19 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [RFC PATCH] DRM: amd: powerplay: don't undef pr_warn() {causes ARC
 build errors}
Message-ID: <9c86375d-34a9-6584-0069-452b193076d6@infradead.org>
Date: Mon, 5 Oct 2020 21:50:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: Evan Quan <evan.quan@amd.com>, kernel test robot <lkp@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

arch/arc/ implements BUG_ON() with BUG(). ARC has its own BUG()
function and that function uses pr_warn() as part of its implementation.

Several (8) files in amd/powerplay/ #undef various pr_xyz() functions so
that they won't be used by these drivers, since dev_() functions are
preferred here and the #undefs make the pr_() functions unavailable.

Hence the following build errors are reported in ARC builds:

../drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c: In function 'navi10_fill_i2c_req':
../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]

../drivers/gpu/drm/amd/amdgpu/../powerplay/sienna_cichlid_ppt.c: In function 'sienna_cichlid_fill_i2c_req':
../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]

Fixes: 55084d7f4022 ("drm/amd/powerplay: forbid to use pr_err/warn/info/debug")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Evan Quan <evan.quan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
---
Another alternative is for amd/powerplay/ drivers not to use BUG()
or BUG_ON().
A third alternative is to ask the ARC developers to implement BUG()
without using any pr_() functions.

 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |    2 +-
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- lnx-59-rc7.orig/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ lnx-59-rc7/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -52,7 +52,7 @@
  * They are more MGPU friendly.
  */
 #undef pr_err
-#undef pr_warn
+//#undef pr_warn
 #undef pr_info
 #undef pr_debug
 
--- lnx-59-rc7.orig/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ lnx-59-rc7/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -54,7 +54,7 @@
  * They are more MGPU friendly.
  */
 #undef pr_err
-#undef pr_warn
+//#undef pr_warn
 #undef pr_info
 #undef pr_debug
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
