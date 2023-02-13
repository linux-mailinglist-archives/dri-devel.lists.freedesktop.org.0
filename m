Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71B3694682
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 14:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8152D10E5BB;
	Mon, 13 Feb 2023 13:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34B10E5B9;
 Mon, 13 Feb 2023 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676293601; x=1707829601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wxjrIZer9NQNNCDwLw9zPfywX9siPZar9bKA/wzCcAY=;
 b=EzZNjGTfZrjEdZilylpvBvLnuwdPjJLyR1uDo3yQ7A8rh5RDUA4prXwM
 C5tmkW2978UYoBY1IkbnQaPjHgXpYXiJF5x+1Aj66IlugE5YT2NcY/9we
 zd/1v246crAmySZgxKdPnoLRDLjsBJPXFAUrZ7sm1Ukyp9U7syGIf6V0o
 PnxsOuW2oxOqVzdk08XpvxHR0jjeXduM4+AcTqM6CoE84/OYDyVrUEcJZ
 LvqE0GXMEwiDpoYVVqa+CZdCqgdxa5hPcrGyhJuV6ERyNCIxwyN0AGUWU
 5j+HW6RqosNXKfWfxaFN1yd14ry+nkKa8k9JkyNwk45qJmgXA3eu00fSZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="314526482"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="314526482"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 05:06:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670811523"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="670811523"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.172])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 05:06:37 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH 0/1] drm/i915/active: Fix misuse of non-idle barriers as fence
 trackers
Date: Mon, 13 Feb 2023 14:05:45 +0100
Message-Id: <20230213130546.20370-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test-with: <20230213095040.13457-2-janusz.krzysztofik@linux.intel.com>

Users reported oopses on list corruptions when using i915 perf with a
number of concurrently running graphics applications.  Root cause analysis
pointed out to an issue in barrier processing code -- a race among perf
open / close replacing active barriers with perf requests on kernel
contexts and concurrent barrier preallocate / acquire operations performed
during user context first pin / last unpin.

Respect results of barrier deletion attempts -- mark the barrier as idle
only after successfully deleted from the list.  Then, before proceeding
with setting our fence as the one currently tracked, make sure that the
tracker we've got is not a non-idle barrier.  If that check fails, don't
use that tracker but go back and try to acquire a new, usable one.

Note:
I'm submitting this fix with a request to CI for testing it with a new
subtest igt@gem_barrier_race@remote-request, developed for that case,
not yet in upstream IGT.  I've selected trybot submission of the test,
with the test added to BAT testlist, to get results from the widest
possible HW range.

Janusz Krzysztofik (1):
  drm/i915/active: Fix misuse of non-idle barriers as fence trackers

 drivers/gpu/drm/i915/i915_active.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

-- 
2.25.1

