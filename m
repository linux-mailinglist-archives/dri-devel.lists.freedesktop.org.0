Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0F15C3EB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 16:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A6D6E334;
	Thu, 13 Feb 2020 15:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 464 seconds by postgrey-1.36 at gabe;
 Thu, 13 Feb 2020 15:51:13 UTC
Received: from condef-02.nifty.com (condef-02.nifty.com [202.248.20.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098756E334;
 Thu, 13 Feb 2020 15:51:12 +0000 (UTC)
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-02.nifty.com
 with ESMTP id 01DFegIl005228; Fri, 14 Feb 2020 00:40:42 +0900
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net
 [126.93.102.113]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id 01DFdZHX005809;
 Fri, 14 Feb 2020 00:39:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 01DFdZHX005809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1581608378;
 bh=IlwdwKMAl2Y7tol907IK801j7CE31/4yLlpyncvGYes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nLcZQrzTMOdJOuMTafwrQ7IZiK6NZOr3c+6c42sh+n4IrIeonrmLFPM/yBMIXd5uj
 i2jCRD80XdltMSpGR9KjT+ypoF9CFA37E8iFR6rLXgelgwUPXHwOFqwTnSOsMyVOi/
 07+ewsRRDXgQz6cNUfMZ0UDkPyCCZRtPcHJnNq8aG8sJxUGPy23r5QDlYkzt8hBw0G
 GxdhNCIRbG0w+h+kbmew+LeNeKv/cljCEGCa5/qJ/780rdudasBQZz12N8X1DQSh1V
 AxhItSv6F3mFRYV8c3FbxEFMVGOJIh0E9onqMqEtB5dg9HJhNWWQqYNlgk8cwRJBBe
 lsBZbP8V7xUFg==
X-Nifty-SrcIP: [126.93.102.113]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=8F=AB=D3nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/radeon: use pattern rule to avoid code duplication in
 Makefile
Date: Fri, 14 Feb 2020 00:39:26 +0900
Message-Id: <20200213153928.28407-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200213153928.28407-1-masahiroy@kernel.org>
References: <20200213153928.28407-1-masahiroy@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This Makefile repeats similar build rules. Use a pattern rule.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/gpu/drm/radeon/Makefile | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
index fda115cefe4d..480a8d4a3c82 100644
--- a/drivers/gpu/drm/radeon/Makefile
+++ b/drivers/gpu/drm/radeon/Makefile
@@ -9,34 +9,7 @@ targets := rn50_reg_safe.h r100_reg_safe.h r200_reg_safe.h rv515_reg_safe.h r300
 quiet_cmd_mkregtable = MKREGTABLE $@
       cmd_mkregtable = $(obj)/mkregtable $< > $@
 
-$(obj)/rn50_reg_safe.h: $(src)/reg_srcs/rn50 $(obj)/mkregtable FORCE
-	$(call if_changed,mkregtable)
-
-$(obj)/r100_reg_safe.h: $(src)/reg_srcs/r100 $(obj)/mkregtable FORCE
-	$(call if_changed,mkregtable)
-
-$(obj)/r200_reg_safe.h: $(src)/reg_srcs/r200 $(obj)/mkregtable FORCE
-	$(call if_changed,mkregtable)
-
-$(obj)/rv515_reg_safe.h: $(src)/reg_srcs/rv515 $(obj)/mkregtable FORCE
-	$(call if_changed,mkregtable)
-
-$(obj)/r300_reg_safe.h: $(src)/reg_srcs/r300 $(obj)/mkregtable FORCE
-	$(call if_changed,mkregtable)
-
-$(obj)/r420_reg_safe.h: $(src)/reg_srcs/r420 $(obj)/mkregtable FORCE
-	$(call if_changed,mkregtable)
-
-$(obj)/rs600_reg_safe.h: $(src)/reg_srcs/rs600 $(obj)/mkregtable FORCE
-	$(call if_changed,mkregtable)
-
-$(obj)/r600_reg_safe.h: $(src)/reg_srcs/r600 $(obj)/mkregtable FORCE
-	$(call if_changed,mkregtable)
-
-$(obj)/evergreen_reg_safe.h: $(src)/reg_srcs/evergreen $(obj)/mkregtable FORCE
-	$(call if_changed,mkregtable)
-
-$(obj)/cayman_reg_safe.h: $(src)/reg_srcs/cayman $(obj)/mkregtable FORCE
+$(obj)/%_reg_safe.h: $(src)/reg_srcs/% $(obj)/mkregtable FORCE
 	$(call if_changed,mkregtable)
 
 $(obj)/r100.o: $(obj)/r100_reg_safe.h $(obj)/rn50_reg_safe.h
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
