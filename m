Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC67F99C765
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 12:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304C510E138;
	Mon, 14 Oct 2024 10:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UcjdX7H6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B477710E138
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7VwmPhDh+tMCb7vTvOy+1xnCjUYEJ1n7guNfv2atthc=; b=UcjdX7H6UVkPBMUH8i9FQmbR1X
 +UcNhyW0AdZSMt4ATmwtnPz1Hn8X2zuTS1cjwp2PvYm2lrnp2ryNbfZR16WXTzgjYDi/F+sZG8gkW
 9grucQlq+6Ly3D5kz6Wn2ORpU5fcyolCBK2PMVLsJEhqRO+Rr9exognPDZx9tLUtF1u3m+wxg7yvs
 89bXAzOT0uSHw28sNHgeKAM00gZcoDGzeskP4KdP8kJtJA66mcWemlqO0QLqiYAKdzuCwLlbg6azQ
 gVTNixqORYdgyiLr11Lyj5YWyCWTS+0YKb9NUmzilOOi1SlQC/I41TVSKgnV1X7TWP9qFtoGSoOV4
 vvAb9SXg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t0Ib1-009J6a-JV; Mon, 14 Oct 2024 12:46:39 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 0/5] Small DRM scheduler improvements
Date: Mon, 14 Oct 2024 11:46:32 +0100
Message-ID: <20241014104637.83209-1-tursulin@igalia.com>
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

Leftovers from the earlier "DRM scheduler fixes and improvements" series.

It looks the fixes have now propagated back to drm-misc-next so this should now
be mergeable.

It also needed a small rebase to account for one revert and one spelling fix
which landed in the meantime.

As a reminder, what remains are kerneldoc improvements, struct layout tweaks for
clarity, one trivial cleanup for the FIFO mode, and most importantly two spin
lock-unlock cycles are removed from the push job path by pulling taking of the
locks one level up.

I smoke tested it on the Steam Deck and lockdep seems happy.

Cc: Christian König <christian.koenig@amd.com>
Cc: Philipp Stanner <pstanner@redhat.com>

Tvrtko Ursulin (5):
  drm/sched: Optimise drm_sched_entity_push_job
  drm/sched: Stop setting current entity in FIFO mode
  drm/sched: Re-order struct drm_sched_rq members for clarity
  drm/sched: Re-group and rename the entity run-queue lock
  drm/sched: Further optimise drm_sched_entity_push_job

 drivers/gpu/drm/scheduler/sched_entity.c | 42 +++++++++++++++---------
 drivers/gpu/drm/scheduler/sched_main.c   | 32 +++++++++---------
 include/drm/gpu_scheduler.h              | 28 +++++++++-------
 3 files changed, 58 insertions(+), 44 deletions(-)

-- 
2.46.0

