Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0822C6389
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 12:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47826EB83;
	Fri, 27 Nov 2020 11:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 557FE6EB83
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:01:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17D8D31B;
 Fri, 27 Nov 2020 03:01:04 -0800 (PST)
Received: from cubie.arm.com (unknown [10.37.8.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D7103F71F;
 Fri, 27 Nov 2020 03:01:03 -0800 (PST)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/komeda: Handle NULL pointer access code path in error case
Date: Fri, 27 Nov 2020 11:00:54 +0000
Message-Id: <20201127110054.133686-1-carsten.haitzler@foss.arm.com>
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

komeda_component_get_old_state() technically can return a NULL
pointer. komeda_compiz_set_input() even warns when this happens, but
then proceeeds to use that NULL pointer tocompare memory content there
agains the new sate to see if it changed. In this case, it's better to
assume that the input changed as there is no old state to compare
against and thus assume the changes happen anyway.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index 8f32ae7c25d0..e8b1e15312d8 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -707,7 +707,8 @@ komeda_compiz_set_input(struct komeda_compiz *compiz,
 	WARN_ON(!old_st);
 
 	/* compare with old to check if this input has been changed */
-	if (memcmp(&(to_compiz_st(old_st)->cins[idx]), cin, sizeof(*cin)))
+	if (!old_st ||
+	    memcmp(&(to_compiz_st(old_st)->cins[idx]), cin, sizeof(*cin)))
 		c_st->changed_active_inputs |= BIT(idx);
 
 	komeda_component_add_input(c_st, &dflow->input, idx);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
