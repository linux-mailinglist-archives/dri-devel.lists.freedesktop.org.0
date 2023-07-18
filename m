Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75BE758767
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 23:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3820710E3CC;
	Tue, 18 Jul 2023 21:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA9810E3C6;
 Tue, 18 Jul 2023 21:44:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C24B60DC4;
 Tue, 18 Jul 2023 21:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC22C433C9;
 Tue, 18 Jul 2023 21:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689716680;
 bh=jWlvcID35qyNtU9PJLzd4/sdaK/gJ+Q9QVB2184F8e0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HSREdwlEhnf12riGluN+bX8K25XBDWkXzBk08230Uw3n9jT41cjujJ9mbE2PGnINJ
 6TCWl5/6q6mvPahzB0nR6xzKza6gJBuHAGlcO3btWxTKEjDdsf98pBHKaoKWBomCV2
 vc+A9XtkMIPZfgJRREPHb3zbDYnKo1bVhT29joO+MUvtXrMy3XYJBuqvGg9GstPVPw
 9LvrJcCcDpaJuWTDVaw5071/gFf751dDNhEYxjiWBwvIwzMhk1rg0+ltRQo7zw8Uiq
 MlhJ6TOkq4wQUH6DNwI0vQs86rZR0My7XaTMV/KRq1HYzKdEZikbVXM8Z/jlTMbuZJ
 VcWdD2X2QLi8w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 18 Jul 2023 14:44:19 -0700
Subject: [PATCH 1/2] drm/v3d: Avoid -Wconstant-logical-operand in
 nsecs_to_jiffies_timeout()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-1-36ed8fc8faea@kernel.org>
References: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
In-Reply-To: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, emma@anholt.net, 
 mwen@igalia.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=nathan@kernel.org;
 h=from:subject:message-id; bh=jWlvcID35qyNtU9PJLzd4/sdaK/gJ+Q9QVB2184F8e0=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCnb2Y/1CLp6mx1bP2HZyv8yZXx127Wn9qckXdwVVrNLz
 cxTrIe7o5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExk1gxGhpVVB97faX9o5LDl
 VFn2pUnKci65Hbw2Lxee4k/zzfK/x8PwP67nxtZwvWVXDv61de1WurA2nY//fN7T3onsm/ovNVQ
 lMwAA
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
Cc: trix@redhat.com, intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 ndesaulniers@google.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 justinstitt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A proposed update to clang's -Wconstant-logical-operand to warn when the
left hand side is a constant shows the following instance in
nsecs_to_jiffies_timeout() when NSEC_PER_SEC is not a multiple of HZ,
such as CONFIG_HZ=300:

  In file included from drivers/gpu/drm/v3d/v3d_debugfs.c:12:
  drivers/gpu/drm/v3d/v3d_drv.h:343:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    343 |         if (NSEC_PER_SEC % HZ &&
        |             ~~~~~~~~~~~~~~~~~ ^
  drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: use '&' for a bitwise operation
    343 |         if (NSEC_PER_SEC % HZ &&
        |                               ^~
        |                               &
  drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: remove constant to silence this warning
  1 warning generated.

Turn this into an explicit comparison against zero to make the
expression a boolean to make it clear this should be a logical check,
not a bitwise one.

Link: https://reviews.llvm.org/D142609
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/v3d/v3d_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index b74b1351bfc8..7f664a4b2a75 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -340,7 +340,7 @@ struct v3d_submit_ext {
 static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)
 {
 	/* nsecs_to_jiffies64() does not guard against overflow */
-	if (NSEC_PER_SEC % HZ &&
+	if ((NSEC_PER_SEC % HZ) != 0 &&
 	    div_u64(n, NSEC_PER_SEC) >= MAX_JIFFY_OFFSET / HZ)
 		return MAX_JIFFY_OFFSET;
 

-- 
2.41.0

