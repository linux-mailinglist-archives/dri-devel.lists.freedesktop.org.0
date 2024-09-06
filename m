Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62C96FA59
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 20:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFA110EAC8;
	Fri,  6 Sep 2024 18:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HDWjHrzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA07C10EAC8;
 Fri,  6 Sep 2024 18:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B6Je/GuKTuzWI/jSUdpsY+Trv/9UUu9HqiWNpGJQlBs=; b=HDWjHrzm/mtLsWX/5RjzHLym0D
 ImJSMY5uvII+V7JavJQg6EZapNYm5FnTrbeA/W0lwWZAn5raU4x23MPiSIZPwQnyqMxdC93NCjifo
 zl+ZlMytgLBp426UZx9EKu2HX5wvtr3tYaOwcWvKuUMYzY+ex99ILcyXKTm/rse0bShfdQBGHiG6R
 lJasRPUfE6n5X+0Q+4eQdqtBJylS+cfXMHBa4Du16lV9pE0K3zQS3I+W+7Fo8MkoPEoqjawamN5ju
 NY89j+iOJK1Q4KGNxtHIoMufCfecOH5iP+Zlg6+/3nXMoKPcrv1ydWr/wzEI/FCW7ihnWmbqZzwOT
 Iow0CFvA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1smdM2-00AW7R-DO; Fri, 06 Sep 2024 20:06:41 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC 0/2] drm/amdgpu: No need for dynamic DRM priority?
Date: Fri,  6 Sep 2024 19:06:37 +0100
Message-ID: <20240906180639.12218-1-tursulin@igalia.com>
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

In a recent conversation with Christian there was a thought that dynamic DRM
scheduling priority changes are not required, or even not desired (actively
prevented?!), and can be ripped out.

For more context, starting point for that conversation was me observing that
they (dynamic changes) work relatively poorly - only if the entity is idle. As
such I proposed to fix it, but Christian countered with a proposal to rip it out
completely.

So for better or worse, that is what this RFC is about.

I can imagine something to regress, in theory at least, if there are clients
which use priority override in a way where today it could work, and on engines
with no hw priority support. In which case what would be somewhat spread over
different run queues would now permanently be where it started.

Advantage I guess is that removing it we can remove the misleading
drm_sched_entity_set_priority() from the core. Misleading because I suspect it
is quite difficult to figure out it has that "entity idle" behaviour (which
comes from the drm_sched_entity_select_rq() implementation details).

Another possibility is that people will hand wave away the concern priority
change might never happen as hypothetical. That in practice there would be an
idle point where it would trigger, and that for the rest we do not care.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>

Tvrtko Ursulin (2):
  drm/amdgpu: Remove dynamic DRM scheduling priority override
  drm/sched: Remove drm_sched_entity_set_priority

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  4 ----
 drivers/gpu/drm/scheduler/sched_entity.c | 22 ++--------------------
 include/drm/gpu_scheduler.h              |  2 --
 3 files changed, 2 insertions(+), 26 deletions(-)

-- 
2.46.0

