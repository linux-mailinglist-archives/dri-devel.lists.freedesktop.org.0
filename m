Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CE9666917
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 03:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF8010E2D8;
	Thu, 12 Jan 2023 02:53:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E3F10E2D8;
 Thu, 12 Jan 2023 02:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673492022; x=1705028022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tnptB7XLo9FR7ofNuCZUlZqPT3VO4yLjo/bGs073QCQ=;
 b=ikH/gMAhVqXV93PxzjxY/fUGj8iPfx6VPdP6Z/aHdezoIlUcMF0BWKcp
 geFYmJPhnHkevM8t7ZwAhCNwZzE9Ei6FSVMOt+MKDdaZkcygaU1NDLG0k
 nuHNGzAhZvg6/D2cJ95O2uVax/uDxT/+6Vrr0AqLS8yf1jYUJyDJchYUr
 88lvFdqSqm5i70iTMvrHrLlpDBDexGrLOV3YJNesIHSg2l6xe6ahnthEE
 arcNGaH5SyV6Lc7c99EJZ3LwFOnsegIfBRI89ZWQ9D8CzT9dnYzxdKwAq
 +keIquB0IRw3pCO0U0x6tiiYW2HBS4NuQofGWvheZZDBE7sfJwkBdIKwe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350823498"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="350823498"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 18:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="986359623"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="986359623"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jan 2023 18:53:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/4] Allow error capture without a request / on reset failure
Date: Wed, 11 Jan 2023 18:53:07 -0800
Message-Id: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
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

Similarly, in the case of an engine reset failure the GuC is not able
to report the guilty context. So try a manual search instead of
reporting nothing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/i915: Allow error capture without a request
  drm/i915: Allow error capture of a pending request
  drm/i915/guc: Look for a guilty context when an engine reset fails
  drm/i915/guc: Add a debug print on GuC triggered reset

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 21 ++++++-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 59 +++++++++++++------
 2 files changed, 60 insertions(+), 20 deletions(-)

-- 
2.39.0

