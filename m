Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01AAACC565
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1B110E5D5;
	Tue,  3 Jun 2025 11:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PbG3ScOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A2510E5E2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7lN1DtYpG87aN4+PvR9YNEd3BqW9OLDTikYzCg3yntU=; b=PbG3ScOLUur+lSq74qBQM7tJ1h
 Lny35tfkgmEubXLYzoWElIdsf07u2Bp7eugHEi/JTPMn+tqvMUbnxoaL4+4DJLWK2KpOIBUL/vagC
 oBScIJY3h1SjVDUVra+rAWWwErJsW93diwrVfXPMmzsPGVgQl3BNdwA+19wEuuU4+rQt4y6PZWUaj
 PVnpYpzAoz6bcbDc+oZYrlhDN3haeh1kqWMTeX7D4BK4NB0i1LxS8lnmr7DCHmg7fy8Iakfm4Kf1h
 aKOrsyUXV/pOig4F/qKLHH2ltHOazkLR8g7xVD5K0dXnyQBNncybffMpVsqkVg7KGdXVdKZVA1DHu
 FYQYsYIw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uMPo9-00GeEc-33; Tue, 03 Jun 2025 13:27:53 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 0/2] TTM pool shrinker improvements
Date: Tue,  3 Jun 2025 12:27:48 +0100
Message-ID: <20250603112750.34997-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Just two small patches to make the TTM pool shrinker respect the shrink target
configured by the core, and to also signal the core it can cheaply free more
than the default 128 pages.

Motivation was that I was running some VK-CTS tests and noticed shrinker
callback was getting called quite a lot so thought why not make it a tiny bit
more respectful and efficient.

v2:
 * Simplify loop logic and improve commit message.

Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Tvrtko Ursulin (2):
  drm/ttm: Respect the shrinker core free target
  drm/ttm: Increase pool shrinker batch target

 drivers/gpu/drm/ttm/ttm_pool.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.48.0

