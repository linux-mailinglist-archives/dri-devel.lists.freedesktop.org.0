Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602C3A44699
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1B710E1EA;
	Tue, 25 Feb 2025 16:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SuNk+zdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6EE10E1AD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:44:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B376F5C014A;
 Tue, 25 Feb 2025 16:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1971CC4CEEC;
 Tue, 25 Feb 2025 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740501880;
 bh=ZX5eNqfG2UfwSXd6a7upCgYYCJX3G4CmXLdSAOkFdSg=;
 h=From:To:Cc:Subject:Date:From;
 b=SuNk+zdQlyrpthP0q5lo3IgJRdelSpuQfAw3eUDvMCuvc3oczkl84KZsDd0KMNZfk
 y86wUN5PYNfThF0Z8diUpfOyllDDJoJvm14DlAFKGpdQx6vVngAvcZr+ip6IJiXJ/t
 cZ3VpsqFPJGHK44Q+yxJJGBipYOaybJ0nJiIDzVNpd94Q4vM10Bxoe1JwLJJTHrGqF
 fEbmXuA0KKGVQ2V79J2UiHMjpuVx0DCYR0UddJGpG0aFvg7Cqn6LH5FKel9R6wpMpd
 YJXF7Oa3Z5ES2Wn1LRO6j18IM3Y4i8Q00+9QPyvgpyEEHv0OG5t5wTUW7oiyXIX2ic
 efdrgUHKDy8nQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dummycon: only build module if there are users
Date: Tue, 25 Feb 2025 17:44:21 +0100
Message-Id: <20250225164436.56654-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Dummycon is used as a fallback conswitchp for vgacon and fbcon
in the VT code, and there are no references to it if all three
are disabled, so just leave it out of the kernel image for
configurations without those.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/console/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index bc31db6ef7d2..1c4263c164ce 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -47,8 +47,7 @@ config SGI_NEWPORT_CONSOLE
 	  card of your Indy.  Most people say Y here.
 
 config DUMMY_CONSOLE
-	bool
-	default y
+	def_bool VT || VGA_CONSOLE || FRAMEBUFFER_CONSOLE
 
 config DUMMY_CONSOLE_COLUMNS
 	int "Initial number of console screen columns"
-- 
2.39.5

