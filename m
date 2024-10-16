Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDFD9A0937
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 14:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C849910E5D4;
	Wed, 16 Oct 2024 12:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IgJvzQCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7251B10E065
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CgCMF7jVV2HzUGZAqGPt4/BgaE6QSzmes4Zgq9Zk9zU=; b=IgJvzQCGI/2dezLEyLMosxMbeU
 NYXOLapmqdFVMLsZJGJ1JMwqC+MiwRKqzjLgNXthXsbOHXU7lmhgeXbTKz4blnWLvbDDV3tveeOh0
 QvbsOWerthYcZda30tzHUlBeDnu3mPu/Q0yy/234CuhA8EiWJ8zLM65Dn/oqeSR5AzoRONctu53Dh
 50QsvtZFFdHMxCyez9gIsGN2bCwYtS1ichBWm2wyhFqj+fcVmQTzP52HIVOvFZPKb+YLm78Tqaqzg
 4xSwqFh/0tv6PdUihe9hyAoYQ2/Ti4o5Xbw28DXD1tiO6M7xoF2VBjGYGht1u4u+Nb8+LH+prcqtO
 tU8kdHbw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t130i-00Ajic-8q; Wed, 16 Oct 2024 14:20:16 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v2 0/5] Small DRM scheduler improvements
Date: Wed, 16 Oct 2024 13:20:08 +0100
Message-ID: <20241016122013.7857-1-tursulin@igalia.com>
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

v2:
 * Tweaks to commit messages and rename of some leftover rq_lock naming inside
   kerneldoc.

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
 include/drm/gpu_scheduler.h              | 34 ++++++++++---------
 3 files changed, 61 insertions(+), 47 deletions(-)

-- 
2.46.0

