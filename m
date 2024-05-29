Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B38F8D408C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 23:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21E410E02A;
	Wed, 29 May 2024 21:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f2X4hHsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878FD10E02A;
 Wed, 29 May 2024 21:54:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E45C61EE2;
 Wed, 29 May 2024 21:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92088C113CC;
 Wed, 29 May 2024 21:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717019690;
 bh=HubSPfyP2gcmAlDBmjXy0OS5ZIb9AVBkOehzd0IkMJU=;
 h=From:Date:Subject:To:Cc:From;
 b=f2X4hHsP7VflI6j2b+yLzuKyU//vnyepAiRkKtDXHe1TWT7crdFkHUAtaIEkpinD8
 7n8kGFPWSW4sQ7Dg4y9L7llUFSKEHTHdlXlbGTQr5KyqCQSQJbTdfHkHrwofYD6Hg5
 SUL0EHT7lT0iRH3Kc0YXct3pkMPxavEOD21Eukjm+E/l90vMRWI0Nd/ReEzFs0JZFk
 e3sH3D4vev4Naf74nyO0vVYBC9bp9bBw4QmlWhaArwG+jWTreVv4WwvhbdQh7C8RX+
 K89wBFAdmvXHPg2PDCdbz7Q/qQz267N67hm8brA1EJBT72Cy7eqvQAnkZCnQUnnRo9
 3eaD1ga37pJ6Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 29 May 2024 14:54:44 -0700
Subject: [PATCH] drm/radeon: Remove __counted_by from StateArray.states[]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-drop-counted-by-radeon-states-state-array-v1-1-5cdc1fb29be7@kernel.org>
X-B4-Tracking: v=1; b=H4sIACSkV2YC/yWNMQ7CMAwAv1J5xlISCqJ8BTGY2ICXpLIDoqr6d
 yKYTrfcreBiKg7nYQWTt7rW0iXuBshPKg9B5e6QQhrDIU3IVmfM9VWaMN4WNGKpBb1RE/8DyYw
 WDHHaH1l4zPEEvTeb3PXze12u2/YFmCECTXsAAAA=
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Kees Cook <keescook@chromium.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587; i=nathan@kernel.org;
 h=from:subject:message-id; bh=WM6L9YAcsuS5kpYlxkPAbO8l6FEcdWt/F6/Iq2QZsVY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGnhSzQDNsz59den+ldShqZTVq2iSnSN3I/LZ7vbAo8X8
 EzqD37dUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbSGszIsK/h2yntw0f4Y++X
 eKx4d4h7rnzXCoFM5d4NFlHPLZwqjRn+GVWt/ykSY89hed24bttqjsw5+2ua31yfUffFPjJHIMe
 bDQA=
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

From: Bill Wendling <morbo@google.com>

Work for __counted_by on generic pointers in structures (not just
flexible array members) has started landing in Clang 19 (current tip of
tree). During the development of this feature, a restriction was added
to __counted_by to prevent the flexible array member's element type from
including a flexible array member itself such as:

  struct foo {
    int count;
    char buf[];
  };

  struct bar {
    int count;
    struct foo data[] __counted_by(count);
  };

because the size of data cannot be calculated with the standard array
size formula:

  sizeof(struct foo) * count

This restriction was downgraded to a warning but due to CONFIG_WERROR,
it can still break the build. The application of __counted_by on the
states member of 'struct _StateArray' triggers this restriction,
resulting in:

  drivers/gpu/drm/radeon/pptable.h:442:5: error: 'counted_by' should not be applied to an array with element of unknown size because 'ATOM_PPLIB_STATE_V2' (aka 'struct _ATOM_PPLIB_STATE_V2') is a struct type with a flexible array member. This will be an error in a future compiler version [-Werror,-Wbounds-safety-counted-by-elt-type-unknown-size]
    442 |     ATOM_PPLIB_STATE_V2 states[] __counted_by(ucNumEntries);
        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

Remove this use of __counted_by to fix the warning/error. However,
rather than remove it altogether, leave it commented, as it may be
possible to support this in future compiler releases.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/2028
Fixes: efade6fe50e7 ("drm/radeon: silence UBSAN warning (v3)")
Signed-off-by: Bill Wendling <morbo@google.com>
Co-developed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/radeon/pptable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/pptable.h b/drivers/gpu/drm/radeon/pptable.h
index b7f22597ee95..969a8fb0ee9e 100644
--- a/drivers/gpu/drm/radeon/pptable.h
+++ b/drivers/gpu/drm/radeon/pptable.h
@@ -439,7 +439,7 @@ typedef struct _StateArray{
     //how many states we have 
     UCHAR ucNumEntries;
     
-    ATOM_PPLIB_STATE_V2 states[] __counted_by(ucNumEntries);
+    ATOM_PPLIB_STATE_V2 states[] /* __counted_by(ucNumEntries) */;
 }StateArray;
 
 

---
base-commit: e64e8f7c178e5228e0b2dbb504b9dc75953a319f
change-id: 20240529-drop-counted-by-radeon-states-state-array-01936ded4c18

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

