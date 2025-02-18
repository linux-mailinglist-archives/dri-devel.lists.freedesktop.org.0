Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6EA3AC79
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EA810E00F;
	Tue, 18 Feb 2025 23:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="RDD8e6/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB6410E00F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:29:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739921332; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fbtMiNWJNfEFvjLP+UCS7AEuhjmEvh3Mp784IIrIaQztfKyNU8j3gYeGm5kbaRSjOLGxsSweTyMcHW4CbsBE06rKX1CeMMQcr9PflNFIZm3A3TKtJQuNzvya+VetR2dx+hA18twxxONWBsuQqOaBfLCVEYmwxyOfu3Wwf4BXE6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739921332;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/VbK0bFVHl3eeyl52XLPJbC8gAi7N3K90kqxYVrs00Y=; 
 b=A9SwUPpTYhjgOcp+RNYtMLIRhWmjO+jVDjybndPZF3QJ9180EfNCBQpd8nBR8R1wUprkGcvpLFpymcT+cjm81jl5kJNbtk4lf92+/Gpg5V34+hBjtunauuF9ElATQlH7pIWNZoFrKo17ISR5ArT6Cid81qGj7SQmPKoEKOZ5P9M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739921332; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=/VbK0bFVHl3eeyl52XLPJbC8gAi7N3K90kqxYVrs00Y=;
 b=RDD8e6/RMDuP2n4WpWlsmag8iJPiRbBd6GUVpY6F2uSKGte+4jD+syPI+oS45RhX
 9PDyDcg8M6xS08XJ17o05eokESsapQpC6xpgPVT+11DgWt3REY/j9k0DulF2vuimBSo
 CaU+MxQSUpLtivLszy4STVHHQGk7iNZsr+X1fUEI=
Received: by mx.zohomail.com with SMTPS id 1739921329343638.7558530500947;
 Tue, 18 Feb 2025 15:28:49 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [RFC PATCH 0/7] Introduce sparse DRM shmem object allocations
Date: Tue, 18 Feb 2025 23:25:30 +0000
Message-ID: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
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

This patch series is a proposal for implementing sparse page allocations
for shmem objects. It was initially motivated by a kind of BO managed by
the Panfrost driver, the tiler heap, which grows on demand every time the
GPU faults on a virtual address within its drm_mm-managed ranged.

Because keeping a struct page pointer array that can describe the entire
virtual range is wasteful when only a few backing pages have been
allocated, at Collabora we thought a sparse allocation approach with
xarrays was a more efficient choice.

Since sparse and 'dense' DRM shmem objects must be managed slightly
differently, the API is expanded to allow client drivers to create sparse
objects and also to expand their page backing range, but everything else
should remain as transparent as possible and be handled from within the DRM
shmem system itself.

Another side feature that was introduced in this patch series is an shmem
helper for non-blocking allocation of pages. This is motivated by the desire
to avoid deadlocks with the shrinker.

Adrián Larumbe (7):
  shmem: Introduce non-blocking allocation of shmem pages
  lib/scatterlist.c: Support constructing sgt from page xarray
  drm/prime: Let drm_prime_pages_to_sg use the page_array interface
  drm/shmem: Introduce the notion of sparse objects
  drm/shmem: Implement sparse allocation of pages for shmem objects
  drm/panfrost: Use shmem sparse allocation for heap BOs
  drm/panfrost/panthor: Take sparse objects into account for fdinfo

 drivers/gpu/drm/drm_gem.c               |  32 +++++
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 163 ++++++++++++++++++++++--
 drivers/gpu/drm/drm_prime.c             |   7 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  16 ++-
 drivers/gpu/drm/panfrost/panfrost_gem.h |   2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  85 +++---------
 drivers/gpu/drm/panthor/panthor_gem.c   |   4 +-
 include/drm/drm_gem.h                   |   3 +
 include/drm/drm_gem_shmem_helper.h      |  30 ++++-
 include/linux/scatterlist.h             |  47 +++++++
 include/linux/shmem_fs.h                |   7 +
 lib/scatterlist.c                       | 128 +++++++++++++++++++
 12 files changed, 435 insertions(+), 89 deletions(-)


base-commit: 4fd6ca90fc7f509977585d39885f21b2911123f3
--
2.47.1
