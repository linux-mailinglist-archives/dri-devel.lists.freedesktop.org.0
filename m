Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAED2DE636
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 16:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD4D6E1E8;
	Fri, 18 Dec 2020 15:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B86E26E1F2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 15:08:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 724F91FB;
 Fri, 18 Dec 2020 07:08:57 -0800 (PST)
Received: from cubie.arm.com (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB9833F66B;
 Fri, 18 Dec 2020 07:08:56 -0800 (PST)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/komeda: Fix bit check to import to value of proper type
Date: Fri, 18 Dec 2020 15:08:12 +0000
Message-Id: <20201218150812.68195-1-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: liviu.dudau@arm.com, Carsten Haitzler <carsten.haitzler@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Carsten Haitzler <carsten.haitzler@arm.com>

KASAN found this problem. find_first_bit() expects to look at a
pointer pointing to a long, but we look at a u32 - this is going to be
an issue with endianess but, KSAN already flags this as out-of-bounds
stack reads. This fixes it by just importing inot a local long.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
index 452e505a1fd3..719a79728e24 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
@@ -137,9 +137,10 @@ komeda_pipeline_get_first_component(struct komeda_pipeline *pipe,
 				    u32 comp_mask)
 {
 	struct komeda_component *c = NULL;
+	unsigned long comp_mask_local = (unsigned long)comp_mask;
 	int id;
 
-	id = find_first_bit((unsigned long *)&comp_mask, 32);
+	id = find_first_bit(&comp_mask_local, 32);
 	if (id < 32)
 		c = komeda_pipeline_get_component(pipe, id);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
