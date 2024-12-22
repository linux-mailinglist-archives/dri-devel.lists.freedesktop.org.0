Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0399FA784
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 19:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0F010E1B8;
	Sun, 22 Dec 2024 18:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="AUc7Mzr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B462410E1B8;
 Sun, 22 Dec 2024 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=khruvrtBZOjm1Q396MscA11s7dVcIV/GWd7Wg6z81ic=; b=AUc7Mzr6a/Ucc/h4
 ETi89xhDvY4YgnEUz+Gjrr38WMs8NDJtywv+J0iizLysF7hbF7bybb7QftWGu749g5pXkh/ogrtK9
 zrRmM0Oi8pQ36HBS4FK5mIIoTORWrxR6F+k7Z/R5kIGdT9YnHcU6eiU9WJ0fDsB5VrMgmdHUKTBqy
 gJGdxJn4ISvyLIgDen2id7lPOTvekCf9f14LO0u41uO5FTi1rpwfy0AtAsiXlHkvKYJjYn8b3WphU
 9FTklI7x9tAJJyiV9w0qutiTIjoeFuO/8Y8qNYT+ceyFYseME82cRkrXuFSTQfpqy4ZgPVy1TjMvg
 N694bB3seYgQXD0lUQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tPQMI-006mf6-33;
 Sun, 22 Dec 2024 18:07:18 +0000
From: linux@treblig.org
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 intel-gfx@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/i915: Remove unused intel_huc_suspend
Date: Sun, 22 Dec 2024 18:07:15 +0000
Message-ID: <20241222180716.244537-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

intel_huc_suspend() was added in 2022 by
commit 27536e03271d ("drm/i915/huc: track delayed HuC load with a
fence")
but hasn't been used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 13 -------------
 drivers/gpu/drm/i915/gt/uc/intel_huc.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index d7ac31c3254c..b3cbf85c00cb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -427,19 +427,6 @@ void intel_huc_fini(struct intel_huc *huc)
 		intel_uc_fw_fini(&huc->fw);
 }
 
-void intel_huc_suspend(struct intel_huc *huc)
-{
-	if (!intel_uc_fw_is_loadable(&huc->fw))
-		return;
-
-	/*
-	 * in the unlikely case that we're suspending before the GSC has
-	 * completed its loading sequence, just stop waiting. We'll restart
-	 * on resume.
-	 */
-	delayed_huc_load_complete(huc);
-}
-
 static const char *auth_mode_string(struct intel_huc *huc,
 				    enum intel_huc_authentication_type type)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index ba5cb08e9e7b..d5e441b9e08d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -57,7 +57,6 @@ int intel_huc_sanitize(struct intel_huc *huc);
 void intel_huc_init_early(struct intel_huc *huc);
 int intel_huc_init(struct intel_huc *huc);
 void intel_huc_fini(struct intel_huc *huc);
-void intel_huc_suspend(struct intel_huc *huc);
 int intel_huc_auth(struct intel_huc *huc, enum intel_huc_authentication_type type);
 int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
 				     enum intel_huc_authentication_type type);
-- 
2.47.1

