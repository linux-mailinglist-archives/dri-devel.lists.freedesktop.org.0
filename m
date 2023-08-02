Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665476D718
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510FC10E568;
	Wed,  2 Aug 2023 18:47:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188A010E566;
 Wed,  2 Aug 2023 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691002046; x=1722538046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WZ7yYLbWFt2YGTY+WJucB/7wmSX97uoEaOxvN3SILJk=;
 b=hKUkm1gneO9vnR7+3cdJNQ9a2nVkjrsISjKFejq1Ss/tTDCAXN0XG7nP
 +m4QY47L40oyTFyabRk8/d4dsiuZkNw/b54UHdB+St5ETtjC73Y4eJAjm
 N8DT5oam2fr5BwbsLHmQU140GXHF1pDXlL3TYc8SFkdUF8wxB+H7MMRUU
 PtHJgRQNgvGwuYgWrHwpNPVUfax98MdqC7xkYp8ntoWoePk/fyeSII/I4
 rxxX2p6IcBoWu1w872DSg0fH0dNRweKyhGASr5iN1Udb3M8wwyLZwn9bU
 PC6p5Jn75kL4dEzGRo9C9GYdrIeWeYSJD0KN/yCBrhFflteBwTovaklbn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349966724"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="349966724"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 11:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="852975141"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="852975141"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 02 Aug 2023 11:47:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Fix potential null pointer deref in GuC 'steal
 id' test
Date: Wed,  2 Aug 2023 11:49:40 -0700
Message-Id: <20230802184940.911753-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

It was noticed that if the very first 'stealing' request failed to
create for some reason then the 'steal all ids' loop would immediately
exit with 'last' still being NULL. The test would attempt to continue
but using a null pointer. Fix that by aborting the test if it fails to
create any requests at all.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index 1fd760539f77b..bfb72143566f6 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -204,9 +204,9 @@ static int intel_guc_steal_guc_ids(void *arg)
 		if (IS_ERR(rq)) {
 			ret = PTR_ERR(rq);
 			rq = NULL;
-			if (ret != -EAGAIN) {
-				guc_err(guc, "Failed to create request %d: %pe\n",
-					context_index, ERR_PTR(ret));
+			if ((ret != -EAGAIN) || !last) {
+				guc_err(guc, "Failed to create %srequest %d: %pe\n",
+					last ? "" : "first ", context_index, ERR_PTR(ret));
 				goto err_spin_rq;
 			}
 		} else {
-- 
2.39.1

