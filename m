Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6F79F6D08
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 19:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074D510E004;
	Wed, 18 Dec 2024 18:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="IVBOhqFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536A610E004
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 18:19:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1734545942; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=J1+VdF/61IB2Yw5bOx6h0SwY3C+O1N7RIrwxzlIVoi5LQsPGE52nXdbDrOtKxNA0ukli7bS7tD4/t4zNqW8srR+95WruUzgvRRH+4vgplYbIYSn53SVmvj1DVtvMDWaj2LoZHj34e1F0wolg1+RtgwwzZK1dLr+H9qNVnpE7KcI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1734545942;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8cY4jYIfNyjf6S2V1Zs4xoxf4UrzeLsp73JFznKOOQ4=; 
 b=Rp+FLqLNM8pDJc6kaOvaOWVI7ssyg3i/nkm7LIyY8BEWi8SnYuQVGbl6my5dGHLaCIcdBGMmGj53fyk2OntFSfz5to6y/9cumE/qngx5hVgiPwgcyRydvS7KAfRt080kzpUMGtPolYYV4VbKFf6KsqM/SFbmJjTwLkLM9ZaCs8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734545942; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8cY4jYIfNyjf6S2V1Zs4xoxf4UrzeLsp73JFznKOOQ4=;
 b=IVBOhqFOTa1Y7fbhhendcVSeX2H7yulsHzkJwGcd6Vcfv0l9SnTTIv3KRJad8mBL
 TRYqLOjf+lO/MlT1N5DZqmNUT/czIdHYkoJOxqtwsmkq6JEBHgA8h8f3doCoh8eb9dI
 9U9PmZwylYxxvVj3l7c/zNOrx+1PiqectzN2EeOc=
Received: by mx.zohomail.com with SMTPS id 1734545940363911.0358164525893;
 Wed, 18 Dec 2024 10:19:00 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Mart=C3=ADnez=20Larumbe?=
 <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: "Cc:kernel"@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] drm/panthor: Display size of internal kernel BOs
 through fdinfo
Date: Thu, 19 Dec 2024 02:18:40 +0800
Message-ID: <20241218181844.886043-1-adrian.larumbe@collabora.com>
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

This patch series enables display of the size of driver-owned shmem BO's that aren't
exposed to userspace through a DRM handle.

Discussion of previous revision can be found here [1].

Changelog:
v5:
 - Replaced down_write semaphore with the read flavour
 - Fixed typo and added explicit description for drm-shared-internal in
 the fdinfo documentation file for Panthor.
v4:
 - Remove unrelated formating fix
 - Moved calculating overall size of a group's kernel BO's into
 its own static helper.
 - Renamed group kernel BO's size aggregation function to better
 reflect its actual responsibility.

[1] https://lore.kernel.org/dri-devel/20241211163436.381069-1-adrian.larumbe@collabora.com/

Adrián Larumbe (2):
  drm/panthor: Expose size of driver internal BO's over fdinfo
  Documentation/gpu: Add fdinfo meanings of drm-*-internal memory tags

 Documentation/gpu/panthor.rst           | 14 +++++++
 drivers/gpu/drm/panthor/panthor_drv.c   | 12 ++++++
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
 drivers/gpu/drm/panthor/panthor_mmu.c   | 35 +++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  4 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 52 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  4 ++
 8 files changed, 148 insertions(+), 1 deletion(-)


base-commit: 6a8d72b80807ad45229c0f5a17e3be843b15a703
-- 
2.47.0

