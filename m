Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEAB8B11FC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 20:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E61D113D16;
	Wed, 24 Apr 2024 18:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CCynUCQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE44113D15;
 Wed, 24 Apr 2024 18:19:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0FF2C619F8;
 Wed, 24 Apr 2024 18:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C72C113CD;
 Wed, 24 Apr 2024 18:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713982770;
 bh=30OvYjSJuD34vtY83bLWHG2lOubZjPNjxBpPZF5csZQ=;
 h=From:Subject:Date:To:Cc:From;
 b=CCynUCQrk/isnXaumy6k68iQuGWn7yV0on+rsBTrba18OPD2EL1NnTk16g60IKxCi
 7TqzKwia9Q0DD3CLFwqkpPyQNU5DXpTqmyaCr9fRmWU1qtP0SqmKoncMAvRiKzsHjr
 BMTuyuFASUGaJYjgZGVrgJKdjlPS+MZOmJTEj6velIz6NyEUKA7eL68RgTqLtjN/Lb
 aVL0K1xGiTa9c2OROeKFy0TYlQbLVmpkMWUbFdmPemSLtP5cK5eugluyDPR0Vhx2ce
 3X0nAVibV6g/z+oeW07vg/q0YFjKMzHKgnqGW7jZHndWCzLdY+C1LSKc1ZnOWtaZpM
 KVAAZhh3pimxg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] drm/amd/display: Use frame_warn_flag consistently in
 dml2 Makefile
Date: Wed, 24 Apr 2024 11:19:25 -0700
Message-Id: <20240424-amdgpu-dml2-fix-frame-larger-than-dcn401-v1-0-5659f8fa8816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1NKWYC/x2N0QrCMAxFf2Xk2UBbIoq/Ij6ENamBtY5UhzD27
 xYfD9xzzw5d3KTDbdrBZbNurzYgniaYn9yKoOXBkEKiQImQay7rB3NdEqp9UZ2r4MJexPE9FMx
 zoxCRrqoXiXqOwjDuVpex/6fuj+P4AcsXRaV6AAAA
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=743; i=nathan@kernel.org;
 h=from:subject:message-id; bh=30OvYjSJuD34vtY83bLWHG2lOubZjPNjxBpPZF5csZQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGmavoaWzh3W7YLNW6/mH1JrOOHp2f4lemnp8ZPSfx9P9
 53ZJafXUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbyJo+R4frC2pxwzw/2G4Rn
 XYkpvbih82JJ/LHFYY/fnYowLayxe8bI8MhTv/gHZz7D6f1VrQciG5PWlguvMhGL6OP75LLr1B0
 PLgA=
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

This series resolves a couple instances of -Wframe-larger-than from
the new display code that appear with newer versions of clang along
without another inconsistency I noticed while fixing this, which have
been accounted for with the $(frame_warn_flag) variable.

---
Nathan Chancellor (2):
      drm/amd/display: Add frame_warn_flag to dml2_core_shared.o
      drm/amd/display: Fix CFLAGS for dml2_core_dcn4_calcs.o

 drivers/gpu/drm/amd/display/dc/dml2/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: d60dc4dd72412d5d9566fdf391e4202b05f88912
change-id: 20240424-amdgpu-dml2-fix-frame-larger-than-dcn401-48ff7e1f51ea

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

