Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E4D02A26
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 13:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF9410E293;
	Thu,  8 Jan 2026 12:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="Ii68tg82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk
 [78.40.148.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A9010E293
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
 References; bh=h3WPAZwOdCVplvMNaq1hIEtPy126krS22W4TAcGNMNo=; b=Ii68tg82bEfUvz
 7YamHK3AV73XWtRvHDT/po5RRca7S8xBT9nmPxOFH3iXHSyxCnXuJh2bWRqRM7y0EANxBMqLCOAWs
 aZ8cDi1Km4GWfz3WRS/8v4u/FaKk/tvGVa/vITDIoDo2A+yOjHhYUxu+J44YXsVkHuwpZJptMfwJ/
 xZDpMWigQiHn5mc2yhCG8vXG7cASz67AdfKXQp5ZlmPsEp1zRSe3k6svzQjPOMO0CihlLar4t0Njr
 0MTmlBNi4eA1SU+g9KGtme7pM5+DpBYXVEeHZVbKJtiJBjZMzrRANpXqDXZrSQdk4uc4fAocvC4l4
 KgJPU57BzX8edg+kqmpQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1vdp8p-00BxHg-Nf; Thu, 08 Jan 2026 12:29:27 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
 (envelope-from <ben@rainbowdash>) id 1vdp8p-000000010Un-2AEB;
 Thu, 08 Jan 2026 12:29:27 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: simona@ffwll.ch, airlied@gmail.com, tursulin@ursulin.net,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] drm/i915/guc: make 'guc_hw_reg_state' static as it isn't
 exported
Date: Thu,  8 Jan 2026 12:29:26 +0000
Message-Id: <20260108122926.240224-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
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

The guc_hw_reg_state array is not exported, so make it static.
Fixes the following sparse warning:
drivers/gpu/drm/i915/i915_gpu_error.c:692:3: warning: symbol 'guc_hw_reg_state' was not declared. Should it be static?

Fixes: ba391a102ec11 ("drm/i915/guc: Include the GuC registers in the error state")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 7582ef34bf3f..303d8d9b7775 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -686,7 +686,7 @@ static void err_print_guc_ctb(struct drm_i915_error_state_buf *m,
 }
 
 /* This list includes registers that are useful in debugging GuC hangs. */
-const struct {
+static const struct {
 	u32 start;
 	u32 count;
 } guc_hw_reg_state[] = {
-- 
2.37.2.352.g3c44437643

