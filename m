Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC099935103
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 19:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9179910EA4F;
	Thu, 18 Jul 2024 17:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K7XaI/Do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5777310EA4F;
 Thu, 18 Jul 2024 17:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 66376CE19D4;
 Thu, 18 Jul 2024 17:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A38C4AF0C;
 Thu, 18 Jul 2024 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721322011;
 bh=mlpP4ffiXBG1uroeqwi9S6JOrz0k+lbPbkdmr3wYVUA=;
 h=From:To:Cc:Subject:Date:From;
 b=K7XaI/DoLjWXi7HV1yiAt2ms9htBVUIiCQiZdh5tojMVv3FKUTISfK5eLxyHM3ZRN
 gc7bRqB/MEhokoRc3jgR18yVKrMT3yDdsQiUhjvetnhkhiM7CnsYoXpzTVDB+t7Zkl
 557rgK+OEa+GqbGamZFC+k45+U95oKG7HQcj5r3CtpPPEb3xJgxQs02ZaSjuwfkr9L
 Rfrb55Yc/AD+ziWGst47lm+SrJzuoWzX+EhA9mCvPXzBXk2FmT/LT2xnsSvzWtnZ37
 Zf6+5sNGonNdfB+EovpB/0frOMJukCUJ9dzyBdmq/hDo6ZsRnPjaWagaGXv43EE6VX
 H/qRG4MKYneWQ==
From: Danilo Krummrich <dakr@kernel.org>
To: lyude@redhat.com,
	airlied@redhat.com,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/3] Nouveau fixes for TTM refcount rework
Date: Thu, 18 Jul 2024 18:58:45 +0200
Message-ID: <20240718165959.3983-1-dakr@kernel.org>
X-Mailer: git-send-email 2.45.2
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

Hi Christian,

Those three patches should unblock your series to use GEM references instead of
TTM ones.

@Lyude, Dave: Can you please double check?

- Danilo

Danilo Krummrich (3):
  drm/nouveau: prime: fix refcount underflow
  drm/nouveau: bo: remove unused functions
  drm/nouveau: use GEM references instead of TTMs

 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 43 +++++++++++++++------
 drivers/gpu/drm/nouveau/dispnv50/disp.c |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h    | 50 ++-----------------------
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  4 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c |  3 +-
 drivers/gpu/drm/nouveau/nv10_fence.c    |  2 +-
 drivers/gpu/drm/nouveau/nv17_fence.c    |  2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c    |  2 +-
 drivers/gpu/drm/nouveau/nv84_fence.c    |  4 +-
 10 files changed, 46 insertions(+), 70 deletions(-)


base-commit: 99e0fb8b087120b5a7019f1cff6c5c2b5b925ae5
-- 
2.45.2

