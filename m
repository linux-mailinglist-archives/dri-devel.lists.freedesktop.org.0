Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C88CFDB72
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E659110E5AE;
	Wed,  7 Jan 2026 12:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lXgg1lUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0166510E5AE;
 Wed,  7 Jan 2026 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tVHO0GW+8aw+7qVIwZSwwR7hk1Za0j1CXqpRaTb2Wl4=; b=lXgg1lUhC2+xDwd9vaNxnJh3Vp
 IbWAsEuPjuVrEIxW9BVdgrOloa8RV1XVL66ZnfNFq083rdGphI+Q9RdwCPyYnU7oz/jRdijL02HWx
 WcfXmqMj4nMR/uoRwoInjHRiEry3BgLAjBIPU8feb+zmStRpGskkmtvYJ8VNyJhPSEB7eZ1nJ72G1
 nWxZfpM967vhn4ZUUCmnSby2CfcogJMhTwuIsngkjtSuVvdxguvG2O8aQqCR1OEyonmxxW3jeILDZ
 SZ2681NLPM35ad2VNk3DwszjAM+LepxID3qSlRBaGWz4mbxFt96KgiCKyAvOoe/Ik1z0Dej1xWOqz
 m38HBjiQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vdStJ-002Ysx-AJ; Wed, 07 Jan 2026 13:43:57 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 0/3] Simpler and more consistent handling of entities on missing
 hw blocks
Date: Wed,  7 Jan 2026 12:43:48 +0000
Message-ID: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
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

Trying to consolidate how entity creation and/or submission is rejected when
underlying hw ip block is missing.

Amdgpu appears to be the only user which can pass zero schedulers, or a single
NULL scheduler to drm_sched_entity_init(), so if I did not miss something subtle
and the first two patches are okay, then the last one removes handling for that
special case from the DRM scheduler.

Tvrtko Ursulin (3):
  drm/amdgpu: Reject impossible entities early
  drm/amdgpu: Remove redundant missing hw ip handling
  drm/sched: Disallow initializing entities with no schedulers

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  7 -------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  5 +++++
 drivers/gpu/drm/scheduler/sched_entity.c | 13 ++++---------
 3 files changed, 9 insertions(+), 16 deletions(-)

-- 
2.52.0

