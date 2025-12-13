Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BC8CBA840
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 11:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7132510E2D5;
	Sat, 13 Dec 2025 10:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SU7c01Fj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA79F10E2D5;
 Sat, 13 Dec 2025 10:58:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 46B45403C1;
 Sat, 13 Dec 2025 10:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B50DC4CEF7;
 Sat, 13 Dec 2025 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765623508;
 bh=Ucl3OPnHpTM6oU8v9dwhOz9vILAPPYr9o2OmUxvb5Qc=;
 h=From:Subject:Date:To:Cc:From;
 b=SU7c01FjXKiM+eeefYYCv06yZ59yc2IkIf9mMec5Ya3pUfS1QOkb0I37fwLJ0xSFs
 73IzHqHT8egUpSInuUP7b+4v0GMd9X2Ke1Waieub8mHNNkRqUw6cHIMqzVQKjG1aDW
 RmpoBZDkHNI0PVBDczktGs856V8g+bceox75iTfaYD+8ze78smKGdmxBdYlBygOM9d
 7gziIc8GXjsV1az4zMaYkVPg+sRgtxlkSIEUlHPextvUhy3Pw2/PpVGd2W+ApcJlZe
 ouTZn7K8h/BFanlbXohAOaNtqlnpNT90VjCShVZMX4rvw1lIRVxWwFrqlECvulIUsF
 yfsfxbdHHzlUA==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] drm/amd/display: Address -Wframe-larger-than with clang-22
Date: Sat, 13 Dec 2025 19:58:09 +0900
Message-Id: <20251213-dml-dcn30-avoid-clang-frame-larger-than-v1-0-dd3d74b76a17@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMFGPWkC/yWNywrCMBBFf6XM2oE8VKi/Ii6myaSOpKlMahFK/
 92oywPnnrtBZRWucOk2UF6lylwa2EMH4U5lZJTYGJxxJ+usxzhljKF4g7TOEjHkZmFSmhgz6ci
 KSxuiP1OK/tjb3gzQak/lJO/f0/X25/oaHhyWbx72/QNqdHdMiwAAAA==
X-Change-ID: 20251213-dml-dcn30-avoid-clang-frame-larger-than-36afd349190b
To: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Ucl3OPnHpTM6oU8v9dwhOz9vILAPPYr9o2OmUxvb5Qc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJm2bhccWGtvP/5seSEpl0M4+qX73BSetX2ddftnW8htM
 otKv8LRUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACZibMfIsPL35r1KElxeVo1K
 HKxyz000jicIFYndiJrY2rBSrCVmMcM/o0r+8y68svN4mtLE/73Qlp0362VNx9flrwKnRxV6G29
 iBwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Hi all,

This series addresses a new instance of -Wframe-larger-than in
drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c with
clang-22 (current main). This is similar to previous fixes that I have
done in other dml folders such as:

  a3fef74b1d48 ("drm/amd/display: Reduce number of arguments of dml32_CalculatePrefetchSchedule()")
  c4be0ac987f2 ("drm/amd/display: Reduce number of arguments of dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()")

This was done fairly mechanically, so let me know if there are any
issues, as it has only been build tested.

---
Nathan Chancellor (2):
      drm/amd/display: Reduce number of arguments of dcn30's CalculatePrefetchSchedule()
      drm/amd/display: Reduce number of arguments of dcn30's CalculateWatermarksAndDRAMSpeedChangeSupport()

 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c | 545 ++++++---------------
 1 file changed, 139 insertions(+), 406 deletions(-)
---
base-commit: f24e96d69f5b9eb0f3b9c49e53c385c50729edfd
change-id: 20251213-dml-dcn30-avoid-clang-frame-larger-than-36afd349190b

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

