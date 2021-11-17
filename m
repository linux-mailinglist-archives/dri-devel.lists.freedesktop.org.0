Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806794550BE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 23:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7C96E217;
	Wed, 17 Nov 2021 22:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5D66E1F4;
 Wed, 17 Nov 2021 22:50:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="233905370"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="233905370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 14:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="536467561"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 17 Nov 2021 14:50:08 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915/gt: RPS tuning for light media playback
Date: Wed, 17 Nov 2021 14:49:52 -0800
Message-Id: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.34.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

      Switch from tgl to adl, sees one particular media decode pipeline fit
into a single vcs engine on adl, whereas it took two on tgl. However, it
was observed that the power consumtpion for adl remained higher than for
tgl. One contibution is that each engine is treated individually for rps
evaluation, another is that it appears that we prefer to avoid low
frequencies (with no rc6) and use slightly higher frequencies (with lots
of rc6). So let's try tweaking the balancer to smear busy virtual
contexts across multiple engines (trying to make adl look more like
tgl), and tweak the rps evaluation to "race to idle" harder.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Chris Wilson (3):
  drm/i915/gt: Spread virtual engines over idle engines
  drm/i915/gt: Compare average group occupancy for RPS evaluation
  drm/i915/gt: Improve "race-to-idle" at low frequencies

 .../drm/i915/gt/intel_execlists_submission.c  | 80 ++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_rps.c           | 79 +++++++++++++-----
 2 files changed, 112 insertions(+), 47 deletions(-)

-- 
2.34.0

