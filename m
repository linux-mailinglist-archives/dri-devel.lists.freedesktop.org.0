Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B281FA7502B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD0D10EA74;
	Fri, 28 Mar 2025 18:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDjjiJTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E740510EA74;
 Fri, 28 Mar 2025 18:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185459; x=1774721459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kr30AlHlF/L5+FNjYzTKpNUPwojG2aS+GjC/uzcpwqU=;
 b=jDjjiJTuumL8ofp2ojp53lm8A9z7eakNOnnVxx3CBbO/E5rT7kiGl6CE
 RlThec+YTDMwWE77A1aAuwOcTVply8ElZa6jCySB/lJx8/fQ4lz3Bqrw5
 zfIJoyH59dT5ueCVWy3TR1qMMUPKesjHnyqyI0DcimA7L1FqgmLwboxND
 xnqjz39bqXa+Tr3uW7imJ8vQAMzpVGxCm5kggMv/JlvnlkxZDDoKqcSdy
 CMcdLPRI0lvvt4eXfmeKO07hjQA/cJSoM+t1iHkbG6TfK/xmZqYymkEJk
 Hu8h7TWiiqzsBi1nvz2TgcSLMDW5Ki10uWhQ7+Zl6c6H/7qJUDbnG/8E3 A==;
X-CSE-ConnectionGUID: 9MQfFVuzSYS3K6aZg226mg==
X-CSE-MsgGUID: TjyBJOdrQDCH54FoWYLEQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55926107"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55926107"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:10:58 -0700
X-CSE-ConnectionGUID: AioPYpapSxWpbJP2p2W/6Q==
X-CSE-MsgGUID: BX5yd2BnSuajC7ICDa8XsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="156435989"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.28])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:10:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] Replace xe_hmm with gpusvm
Date: Fri, 28 Mar 2025 18:10:29 +0000
Message-ID: <20250328181028.288312-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As a first step to moving userptr handling over to drm, replace the hmm
usage in xe over to gpusvm, which already offers similar functionality. As
some prep steps we also align on some of the missing pieces that were
already handled in xe_hmm.

v2:
  - Rework the gpusvm API based on feedback.
  - Unify SVM and userptr vm struct so we use the same notifier lock.
  - Drop the mark pages as dirty patch.
  - Various other improvements.

-- 
2.48.1

