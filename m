Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4149C5A6E8B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 22:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C530F10E13C;
	Tue, 30 Aug 2022 20:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6002410E12F;
 Tue, 30 Aug 2022 20:34:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F2A1DB81D9E;
 Tue, 30 Aug 2022 20:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6B3C433B5;
 Tue, 30 Aug 2022 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661891684;
 bh=WVBuKJ212UE+zzf0H8C8ieZNG0AG50VfiOb6I0YS3mY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l857E0wjwijunpEOX5+FnvlEt3Pa+7McmDTdjsacbFfKqnrocXE9XzJlOZNDeTI/M
 YlFLCasAqWoq8VoRElFMHmADOCu8AjDnN79mCzgcZMPBJRSOiGBOROdFn14Rnx6KSi
 6tBufBfgBsDP4GLJgSX6DMUx3RScq7rZnbycOpCr0ppVOIFQ0uhbGTt8WmBFiEOhqn
 /zi0m8qgOVqawTk4MJR2nfscKoN+RR7KNKhGn4o0J20IQtgOXwZByTrunv+abK2eM/
 Ncb6Y4TgRDRulyJZd7YYK/CKrB0Nw3zdXl9f8OrTrL1zLPLzCNwu5oJ07369vHrxty
 kNTwI+DczR/+g==
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH 5/5] drm/amd/display: Mark dml30's UseMinimumDCFCLK() as
 noinline for stack usage
Date: Tue, 30 Aug 2022 13:34:09 -0700
Message-Id: <20220830203409.3491379-6-nathan@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830203409.3491379-1-nathan@kernel.org>
References: <20220830203409.3491379-1-nathan@kernel.org>
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 amd-gfx@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function consumes a lot of stack space and it blows up the size of
dml30_ModeSupportAndSystemConfigurationFull() with clang:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3542:6: error: stack frame size (2200) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
  void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
       ^
  1 error generated.

Commit a0f7e7f759cf ("drm/amd/display: fix i386 frame size warning")
aimed to address this for i386 but it did not help x86_64.

To reduce the amount of stack space that
dml30_ModeSupportAndSystemConfigurationFull() uses, mark
UseMinimumDCFCLK() as noinline, using the _for_stack variant for
documentation. While this will increase the total amount of stack usage
between the two functions (1632 and 1304 bytes respectively), it will
make sure both stay below the limit of 2048 bytes for these files. The
aforementioned change does help reduce UseMinimumDCFCLK()'s stack usage
so it should not be reverted in favor of this change.

Link: https://github.com/ClangBuiltLinux/linux/issues/1681
Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index b7fa003ffe06..6991a68061ef 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -6497,7 +6497,7 @@ static double CalculateUrgentLatency(
 	return ret;
 }
 
-static void UseMinimumDCFCLK(
+static noinline_for_stack void UseMinimumDCFCLK(
 		struct display_mode_lib *mode_lib,
 		struct vba_vars_st *v,
 		int MaxPrefetchMode,
-- 
2.37.2

