Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8437E7615
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFAB10E395;
	Fri, 10 Nov 2023 00:53:48 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CE410E395;
 Fri, 10 Nov 2023 00:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699577624; x=1731113624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JOfxS4an4m9zbwlBhKKTPMpxehoWiWRgX+fzja2Aipg=;
 b=MiJcVqt9SLU5NTm5HI1xb8GxJVOm4g1udekLl/9sqH7IjSwo8AysPKQN
 a2vj1FWhAPbabQnNm1qstJhI76pIiLtZzc0Ut9NWr0/5FpcJQytmDbvH7
 bi2CtmPRDSuTrdKTJcmBjLa6j48QMRfyNeVL2bwkHohoYQzRl8Es1xD05
 iQ/z7/Hp/ggKkN9i9k6jBu9+vxDYiDvUrCGShPHYZ0Aof8M4aw1DJ0/9y
 toi1Y2CCORHxS2KOKErnShq639dJY4+2um1G3ujjpsl/4kMQbenrQr0Oe
 yD5UbtN3tMD6Rp5gj/l0ej73uRQYK7plHw6zTacXq2hy5Cj0g+6OElTVA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11654502"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="11654502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 16:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887206112"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="887206112"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 16:53:41 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Don't send double context enable/disable requests
Date: Thu,  9 Nov 2023 16:54:07 -0800
Message-ID: <20231110005409.304273-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
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

The driver could sometimes send context enable/disable requests when a
previous request was still pending. This is not allowed. So stop doing
it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/guc: Don't double enable a context
  drm/i915/guc: Don't disable a context whose enable is still pending

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 33 +++++++++++++++----
 1 file changed, 26 insertions(+), 7 deletions(-)

-- 
2.41.0

