Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C7B899DC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F9510EA06;
	Fri, 19 Sep 2025 13:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="e0fqYeQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB4510EA06;
 Fri, 19 Sep 2025 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kEoA8CHfUgwpFQZ8+Lkt7O9KEo17+MPkR1Dy9WI7SHc=; b=e0fqYeQO5WG0ANU6AawVLkfHP5
 Ii49pLwgufpRTn4iOLej1rTDt8F2iwRQAtQSAM+MACxw2EPy7/NroGT2wgrk5j2a4zfFdtul74WPq
 wAz/AjaBS8lPCGtIO4exLdXiwSW2ybmoyP7Z/YYc6PNTx5T2kroSrXthPU8HcNxFJ0fJq2p8sdH8W
 wmT0D08HmYLtmbzQvff9wVRWWdOcfxe3/p2tw9WkqoGR9OssDtpKAwBqjreizoA3Nl9YsAtGV8okE
 n4uMniH4FEgbV3yzkMVqtSYSL+xZ7q49R3bWAnakSEv4zQqSS4AxTdCM0erFc+93jJl0hZvJW8/Vi
 YL/3b2Bg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzath-00E6IG-AM; Fri, 19 Sep 2025 15:11:33 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [RFC 0/2] ttm+amd: Reduce worst case latency when allocating large
 buffers
Date: Fri, 19 Sep 2025 14:11:25 +0100
Message-ID: <20250919131127.90932-1-tvrtko.ursulin@igalia.com>
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

Following the discussion from:
  https://lore.kernel.org/dri-devel/7c6a3aa0-c1eb-4726-988a-460c4895f615@amd.com/T/#m32a0260769a0ffb2f114d00066ef3bfda91f9fd6

Idea being that we can afford with no performance benefit to try less hard when
allocating contiguous backing store larger than the size which brings a
performance benefit for a specific GPU.

Cc: Christian König <christian.koenig@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

Tvrtko Ursulin (2):
  drm/ttm: Allow drivers to specify maximum beneficial TTM pool size
  drm/amdgpu: Configure max beneficial TTM pool allocation order

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  5 +++++
 drivers/gpu/drm/ttm/ttm_pool.c          | 15 +++++++++++++--
 include/drm/ttm/ttm_pool.h              | 10 ++++++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.48.0
