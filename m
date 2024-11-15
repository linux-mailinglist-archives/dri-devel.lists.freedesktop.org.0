Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A209CDC6E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 11:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BC310E27A;
	Fri, 15 Nov 2024 10:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="B0oY8QGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32010E835
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 10:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lwzjZETnAn/U0GdSHXrexzwJt2pI2xjCNDXHEZVV+7s=; b=B0oY8QGBLSeIQ6ZnFPKKLvBv2j
 cXiS/hHoraOzjekPRv6DtzU6Llxbb1I2hVwttq39IrVk8qp+kxh0JRaVeDciFx1i5qvm8a7jAwFyn
 VopEvEVsjg3NBNOR4Py+CDZMpSC5WZgfDIu1mbPRMefHsY/Ry+fVayfDz5LlII/njeAincmhKdCKt
 0Nih0ZWF/k5sruZN/0ICpDLk1oOQP9JQxBnGROqMxBSG48nUoJsD0Dfyiug1Elo5VAhowmVkeWsJw
 aTa+Qn6rQf8LTp8Xye47hTCZvPKrM01iWVtZD4/P5XacLxFW1HyHNkMUiAEQKphNS+XV77h/DW5nF
 o/6tO82w==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tBtSd-007EAT-Il; Fri, 15 Nov 2024 11:21:55 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 0/5] Fixes etc for fence merging
Date: Fri, 15 Nov 2024 10:21:48 +0000
Message-ID: <20241115102153.1980-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Consolidated series as an simpler alternative to
https://lore.kernel.org/dri-devel/20241024124159.4519-3-christian.koenig@amd.com/.

Hopefully fixes https://gitlab.freedesktop.org/drm/amd/-/issues/3617.

First two patches are fixes followed by one optimisation and then Christian's
and my selftest additions.

Cover letter now because it grew to five patches.

Please test and/or suggest more test cases to look at.

Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de

Christian König (1):
  dma-buf: add selftest for fence order after merge

Tvrtko Ursulin (4):
  dma-fence: Fix reference leak on fence merge failure path
  dma-fence: Use kernel's sort for merging fences
  dma-fence: Add a single fence fast path for fence merging
  dma-fence: Add some more fence-merge-unwrap tests

 drivers/dma-buf/dma-fence-unwrap.c    | 137 ++++++-------
 drivers/dma-buf/st-dma-fence-unwrap.c | 268 +++++++++++++++++++++++++-
 2 files changed, 335 insertions(+), 70 deletions(-)

-- 
2.46.0

