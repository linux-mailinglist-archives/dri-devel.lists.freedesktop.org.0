Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C503710EF0
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4093C10E17B;
	Thu, 25 May 2023 15:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E8510E16E;
 Thu, 25 May 2023 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685026943; x=1716562943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j9ytkrUa8q3pVMYoRdjs0nurynW1ehaGSGcjp6QPItc=;
 b=X/va84X+ACFi6076XapCdQ9hgVFNl+xXfA/ZYFSv1pu6jz5Bg29sBN6x
 pNtEFuMrKz3EouTSpaVSGvHYIU5rlaMN2guutsNcVLKJhxNJdmTTXa4xb
 bauiiEpQ7wI1+GV2krsD0EXTURtawwBvoMqRydY1mdp/q9eR7B4jrH5VT
 KE/xe+krDjr+JQ9SwyavV/+cF3VXEMSm7NPr/axqAt3Yhtcq3OneSzbhO
 WDJoFSrUFmgnh2nqN+YTS7X4KnhawLci3rLAa2hOGCBtn1tZAavt+KzBy
 ye4QpvUvE5KCN54RMK89A/pJEyqn7szZcXNi6it3nEJIz5jRKEIJlp50j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357156134"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="357156134"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="774696286"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="774696286"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.226])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:02:15 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/ttm: Reservation object individualization update 
Date: Thu, 25 May 2023 17:02:02 +0200
Message-Id: <20230525150205.194098-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of patches to modify the individualizing somewhat:

The motivation is that we run into trouble with the xe driver doing the
resv individualization in a clean way, having to grab the vm-wide sleeping
lock in a close- or release path which isn't really optimal. While
addressing that, some fly-by cleanups.

Patch 1: Makes sure the bulk move is removed at individualizing time, which is
convenient since we have all required locks.

Patch 2: Individualize even if fence copying fails.

Patch 3: Use a define instead of open-coded timeout


Thomas Hellström (3):
  drm/ttm: Clear the buffer object bulk move at individualize time
  drm/ttm: Clean up bo individualizing somewhat
  drm/ttm: Use a define for the resv wait timeout

 drivers/gpu/drm/ttm/ttm_bo.c | 73 +++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 31 deletions(-)

-- 
2.39.2

