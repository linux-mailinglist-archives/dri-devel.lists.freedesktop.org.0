Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A981698939
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 01:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0245510E258;
	Thu, 16 Feb 2023 00:23:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6619810E004;
 Thu, 16 Feb 2023 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676507026; x=1708043026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RnesDDgqepqfT0uWzAdgo5yHmLl6tJ95OG6mwtT+4eQ=;
 b=HNysJIK1LkSIG3AJvpPF85zSF/BSAnaqXgfc8c57lWNpC50PggJb7yNi
 Z5w3Ry0jtclK5nXSsLn7tUEiAE8R/hdA0RNInGzTjz2oJ9F/u2tq8zCAe
 27ztl8Gp0Z3Y8NWpx19AhqCuvkjqodt/JdYHhjwTgRguO4XHdXEcuxVC5
 iOLgRleu9vrwz8SG8Vq4S10YJUZ2lZwwtKJplQ2iIQ1KbVYlf/28z7o7b
 5D3Lipge88l/Z9lYAXbSjgTQYPW4jZSx7i3+b84sNhbCFWWVziuhEfUi1
 Xm610r6sQ6Ol+0sv1/qVWuBgCOyv3AjC7KvE6HnFvnaNSvDQRmLPa67PE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311945703"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="311945703"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 16:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="843928656"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="843928656"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 15 Feb 2023 16:23:32 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/2] Don't use stolen memory or BAR mappings for ring
 buffers
Date: Wed, 15 Feb 2023 16:22:46 -0800
Message-Id: <20230216002248.1851966-1-John.C.Harrison@Intel.com>
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

Instruction from hardware arch is that stolen memory and BAR mappings
are unsafe for use as ring buffers. There can be issues with cache
aliasing due to the CPU access going to memory via the BAR. So, don't
do it.

v2: Dont use BAR mappings either.
Make conditional on LLC so as not to change platforms that don't need
to change (Daniele).
Add 'Fixes' tags (Tvrtko).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Daniele Ceraolo Spurio (1):
  drm/i915: Don't use BAR mappings for ring buffers with LLC

John Harrison (1):
  drm/i915: Don't use stolen memory for ring buffers with LLC

 drivers/gpu/drm/i915/gt/intel_ring.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.39.1

