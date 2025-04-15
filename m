Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD7A89D93
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164DB10E759;
	Tue, 15 Apr 2025 12:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ubMczIaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DDF10E0EB;
 Tue, 15 Apr 2025 12:19:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E5C42A49F4A;
 Tue, 15 Apr 2025 12:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7286AC4CEDD;
 Tue, 15 Apr 2025 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744719549;
 bh=ZXQ6hDhSI4430uuHaK9P1SM9exODYN0ru/5bciErF30=;
 h=From:To:Cc:Subject:Date:From;
 b=ubMczIaYX+WclUcufziZyoz5Lfa6B6XTyicQB5Tnqj8cMIHyvDq9ZEYMhPFGtK3Rk
 iaZVrUfK8dw4eIcRSyvXYCF11NMXFPn7SiHbw6lDJtoVhN4p8KCDYrHCdcZWK7wJGB
 p+qhXhsnXEn/AfoCqihsgNUAJ8Vd4xg7/YXHPBGN9P7qpwhZWvfhzGUb+lwNL6lpzv
 YnWuc2YkdXM+fGSFfJtPSL4bNqa7kG4Nwz/r+i+iU0khqTtpQIljBSIUcpTdT2nbxu
 wBkPSPa9DPu7sxGOX1rQ5p2t5iYohuRDm62+KT+PeF62xglDmKz4MChUWCPo3sP4co
 TEVqKQmVyuZoQ==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 0/2] drm/nouveau: Don't set signaled fences' error codes
Date: Tue, 15 Apr 2025 14:18:59 +0200
Message-ID: <20250415121900.55719-2-phasta@kernel.org>
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

Changes in v2:
  - Only fix the issue by checking for a fence being signaled in
    nouveau_fence_context_kill(), before setting the fence's error.
    (Christian, Danilo)
  - Drop cleanup patches. Instead, idiomaticize for-each-loops.

Was called "Fix & improve nouveau_fence_done()" before.

I've tested this with KASAN & kmemleak.

P.

Philipp Stanner (2):
  drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()
  drm/nouveau: nouveau_fence: Standardize list iterations

 drivers/gpu/drm/nouveau/nouveau_fence.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.48.1

