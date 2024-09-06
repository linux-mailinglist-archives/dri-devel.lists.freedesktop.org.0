Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C3B96FA57
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 20:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD87510EAC9;
	Fri,  6 Sep 2024 18:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="g6nfFjK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9B310EAC0;
 Fri,  6 Sep 2024 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+WIPXRwbeYe980Y2BQPwLdcVOViyRi/orFDevE7mMbU=; b=g6nfFjK9M0q8lJFLgiGlnxG+tR
 e3HkSryIy77327V1EgXP1xxVrxWvhP2lwOc1osCl8DpHk0AHIsjfhDeyL9fNSgbsJC8jsX3cV9Lzk
 RtZC2/2rnwkUXxsMdcFr8N4rxkdhW9tbu6zszFGtMoynarx0q9UI41oBIeV7VXyomYRtHY8VyvnJr
 sNdtxNbmyReqtA2FM51XesQpJg3CaJq4xZm3gn1uWrvlBrOTd9y6nDu5yhIcIPIr1wChAF4zlA0O+
 j9OIfLmX8QzzpALJdnVupKcZVz0WtKv6zhT5ibiOjbxfxjDb3VizXVI2vaV9JMCC1gKbO/CeiZiPd
 0/jchk7A==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1smdLk-00AW6F-Bj; Fri, 06 Sep 2024 20:06:23 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 0/4] DRM scheduler fixes, or not, or incorrect kind
Date: Fri,  6 Sep 2024 19:06:14 +0100
Message-ID: <20240906180618.12180-1-tursulin@igalia.com>
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

In a recent conversation with Christian there was a thought that
drm_sched_entity_modify_sched() should start using the entity->rq_lock to be
safe against job submission and simultaneous priority changes.

The kerneldoc accompanying that function however is a bit unclear to me. For
instance is amdgpu simply doing it wrongly by not serializing the two in the
driver? Or is the comment referring to some other race condition than which is
of concern in this series?

To cut the long story short, first three patches try to fix this race in three
places I *think* can manifest in different ways.

Last patch is a trivial optimisation I spotted can be easily done.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Tvrtko Ursulin (4):
  drm/sched: Add locking to drm_sched_entity_modify_sched
  drm/sched: Always wake up correct scheduler in
    drm_sched_entity_push_job
  drm/sched: Always increment correct scheduler score
  drm/sched: Optimise drm_sched_entity_push_job

 drivers/gpu/drm/scheduler/sched_entity.c | 17 ++++++++++++-----
 drivers/gpu/drm/scheduler/sched_main.c   | 21 ++++++++++++++-------
 include/drm/gpu_scheduler.h              |  1 +
 3 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.46.0

