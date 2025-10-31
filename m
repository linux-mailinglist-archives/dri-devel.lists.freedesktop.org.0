Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAEAC25E55
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF94910EB88;
	Fri, 31 Oct 2025 15:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XMNsbFrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F7710E2E5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761925710;
 bh=JTkrRwajOo2RousN0dVCap0DaPrw8XbVAAOorToo06Q=;
 h=From:To:Cc:Subject:Date:From;
 b=XMNsbFrmu9sjvZjMDEO/JCYZH6qjAb0H8GJLPfzVrFoYM6alobleuhgzBxhaQC2YE
 FZN4bDO/SInW9o3WBgE/NjMSsBRRvr9iQ0ghB7EEFX1B29ZGcI9dEolPt88Nol531E
 5ZHXSj6mww49KNO9aDPDkKvZlHu8FSQ+OlabsulL6hC3PFK5hJzCXI8X5zIpxolA1P
 CBOf8sV3fqwTlkVhjEbC5r7dSA+m3jS7dgog8DDqw2tPmObNGEsQA9RN9I0nvGlFLQ
 zvPs4qd6L7E12l1mNhVBMGHCkw4LFbmhbktTEgiabFcJ5JkhRhdVIfWEvrYkQNRbNU
 aauwUAx4We7Ew==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F00A017E1401;
 Fri, 31 Oct 2025 16:48:29 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>,
 kernel@collabora.com
Subject: [PATCH v1 0/4] drm/panthor: Misc fixes
Date: Fri, 31 Oct 2025 16:48:14 +0100
Message-ID: <20251031154818.821054-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This is a set of fixes for bugs I ran into while looking at [1].
Hopefully that's enough to recover from AS_ACTIVE bit stuck
situations, but it'd be good to understand why the MMU block is
completely blocked in some cases and try to come up with better
mitigations than a full GPU reset.

Regards,

Boris

[1]https://gitlab.freedesktop.org/panfrost/linux/-/issues/57

Boris Brezillon (4):
  drm/panthor: Fix UAF on kernel BO VA nodes
  drm/panthor: Add support for atomic page table updates
  drm/panthor: Make panthor_vm_[un]map_pages() more robust
  drm/panthor: Relax check in panthor_sched_pre_reset()

 drivers/gpu/drm/panthor/panthor_gem.c   |  14 +-
 drivers/gpu/drm/panthor/panthor_mmu.c   | 250 +++++++++++++-----------
 drivers/gpu/drm/panthor/panthor_sched.c |   2 -
 3 files changed, 141 insertions(+), 125 deletions(-)

-- 
2.51.0

