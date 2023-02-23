Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE356A0E73
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 18:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA2A10EC41;
	Thu, 23 Feb 2023 17:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B303710E4EA;
 Thu, 23 Feb 2023 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677172454; x=1708708454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9wqnS28LWmkNo8s5BgdFsr4sjzTmpk5AzveIH/wBvYI=;
 b=bNCENio8OjL9yjppfVgDh/opfptI4fL8GmWSWosRjTsmMDI5yKGdGOK9
 eJhrfJ2ABCVyl9Dmfa5u+a46ht58Z77HBAuuXeOcqCkMLG4CMMoNigScX
 UsJl7UjyJVU4cyDx7lLWY0SegmDjSLeeXmOwJLw0G2Nlcg0t2V2UHWpI5
 x5dfacVZnEy+QVefmUXPfyQCu3w+tzTinOiFYXE9fKXEZz9P0ijrVGkZY
 KigEdMoqgTcW4TbyfoaTvTr7j8HjoJ+KmEMlKHXUpGgSQBh9QTlflAfdZ
 ylZKxtrt8lH5tYJSSpxLhUNqfyWJsK/pOrKA2gZfv2M5vAIjT405cMNLH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331944902"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="331944902"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 09:14:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="1001489604"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="1001489604"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 09:14:14 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] Fix a couple of issues with the GSC worker timing
Date: Thu, 23 Feb 2023 09:21:18 -0800
Message-Id: <20230223172120.3304293-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of fixes for issue related to synchronization of the GSC worker
start/end with kernel init/fini and suspend/resume. See the individual
commit messages for details.

Note: not fixes tag since MTL is still under force probe

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele Ceraolo Spurio (2):
  drm/i915/gsc: flush the GSC worker before wedging on unload
  drm/i915/gsc: Fix race between HW init and GSC FW load

 drivers/gpu/drm/i915/gt/intel_gt.c        | 23 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c | 21 ++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  7 ++++---
 4 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.37.3

