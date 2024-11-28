Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D499DBD33
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 22:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064DF10ED60;
	Thu, 28 Nov 2024 21:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Rc1HfQh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E8210ED59
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 21:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732828358; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fmHMTOpk7VbqBlZccsNcptSbYwPyS9knyfkbMRnKPmZhkawQ++79sNQoodUdhPv//2JnhRNBeBAV9gT1jMMBdLM0IjWhwjBsJiOeDOIOCk5fIOfAI5QVsfKORHku31YMAwJysZ3tjj+q8e7c8gtoonTCHsL188Oe21HsNj0SeJI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732828358;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3tYBP50ESNPd772Z53QfhHT3Uqd4F/skk0jQayoesP0=; 
 b=MKrV9vNGMN4bI9JmdlnPavf/xKaRVkvXU86XiLmqZkGU6qxbueu1kmv3qrfpbkeuret7GMwHiD6o/4hJktvGXXBGokjnufkBQDPbzwT1Tx5g6xswKRHSa/mJ/G/+CcXdSCTncn5SnRn2lqcwE2Qah8/FroK2gIHOvj8sW3JmV9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732828358; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=3tYBP50ESNPd772Z53QfhHT3Uqd4F/skk0jQayoesP0=;
 b=Rc1HfQh8oPf2qHjT8iYCd4v7adp5YEYHUFwzCU/PJCwWRUyNkOpLidst5bwG2WfI
 /vl0FVgieQidf1iYfyjzvOPzQH8SVxxXV9ZyvGwBzRdsl1N59aeFl37I5VTGWpRN+5g
 8pVrEVCxt+qafdIfVxlbJOe74ymYTx7vk4fpKn3w=
Received: by mx.zohomail.com with SMTPS id 173282835791530.02219913833926;
 Thu, 28 Nov 2024 13:12:37 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] Some Panfrost fixes and improvements
Date: Thu, 28 Nov 2024 21:06:15 +0000
Message-ID: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.0
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

This is v2 of https://lore.kernel.org/dri-devel/20241014233758.994861-1-adrian.larumbe@collabora.com/

This patch series is a collection of minor fixes and improvements I came up
with while working on driver related stuff.

Changelog:

v2:
 - Removed commit that provided an explicit fence cleanup function
 - Added commit for removing unused Panfrost device structure member
 - Refactored how optional job interrupt reenabling during reset is handled
 - Make the way errors and successful return values are delivered from inside
  panfrost_mmu_as_get more according to standard.
 - Simplify unmapping of already mapped area when mapping the pages of a BO
 - Fixing management of runtime-PM reference counts when failing HW job submission.

Adrián Larumbe (8):
  drm/panfrost: Replace DRM driver allocation method with newer one
  drm/panfrost: Handle inexistent GPU during probe
  drm/panfrost: Handle job HW submit errors
  drm/panfrost: Handle error when allocating AS number
  drm/panfrost: Handle page mapping failure
  drm/panfrost: Make re-enabling job interrupts at device reset optional
  drm/panfrost: Add forward declaration and types header
  drm/panfrost: Remove unused device property

 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  4 +-
 drivers/gpu/drm/panfrost/panfrost_device.c    | 60 ++++++------
 drivers/gpu/drm/panfrost/panfrost_device.h    |  9 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 68 +++++--------
 drivers/gpu/drm/panfrost/panfrost_dump.c      |  8 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  6 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  4 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c       | 64 +++++++-----
 drivers/gpu/drm/panfrost/panfrost_job.c       | 97 +++++++++++--------
 drivers/gpu/drm/panfrost/panfrost_job.h       |  3 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       | 90 ++++++++++++-----
 drivers/gpu/drm/panfrost/panfrost_mmu.h       |  3 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   | 31 +++---
 13 files changed, 256 insertions(+), 191 deletions(-)


base-commit: e511f8fc3b2786999987901dad94c1548e091040
-- 
2.47.0

