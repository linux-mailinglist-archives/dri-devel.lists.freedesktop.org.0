Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7004A63CA35
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 22:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345AF10E3E9;
	Tue, 29 Nov 2022 21:12:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC2B10E3E9;
 Tue, 29 Nov 2022 21:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669756369; x=1701292369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5wj9cQtrBnT0Vt4tE+ufyP8rz5Tby1AA1O2r9FIOr0c=;
 b=YxSkHvIwsXa65yt7BpNbWplm5bmYahhtjQz9ezxJTWgnEGzqA7MsOFuS
 Hgvz5uxkxAX+r58yAOM7dOGMcJUyUuPHsC5PB/pmQIBDih6pKsEvLLT2Y
 t2rObGuotqOC4/AMX/rUxzS/jztlWr6Cizy75kivFrMLn7S05eLe24Opb
 qB4FESuWQtUl7Kr425sLyBQiYM4zhJqLzWfloT19KU5JRGPjET+19AOp3
 kfcO24n/U+IH1VK8xnmK8Je3MviePeZQKeqmFStcnH89Xk4kyQAmuK1KJ
 R299I5wYwHAsfCRXZtF8Bd8FLU9QS3qrEqIWnry3c1x5HE8MVhFuT/fuS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="315261006"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="315261006"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 13:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="676576076"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="676576076"
Received: from relo-linux-5.jf.intel.com ([10.165.21.143])
 by orsmga001.jf.intel.com with ESMTP; 29 Nov 2022 13:12:48 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Allow error capture without a request / on reset failure
Date: Tue, 29 Nov 2022 13:12:51 -0800
Message-Id: <20221129211253.3183480-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
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

It is technically possible to get a hung context without a valid
request. In such a situation, try to provide as much information in
the error capture as possible rather than just aborting and capturing
nothing.

Similarly, in the case of a engine reset failure the GuC is not able
to report the guilty context. So try a manual search instead of
reporting nothing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915: Allow error capture without a request
  drm/i915/guc: Look for a guilty context when an engine reset fails

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 ++++-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 55 ++++++++++++++-----
 2 files changed, 54 insertions(+), 16 deletions(-)

-- 
2.37.3

