Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022B6A0000E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 21:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8EE10E095;
	Thu,  2 Jan 2025 20:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="KRZEopUw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639B110E095
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 20:38:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1735850312; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AiAwH8ukhPamW3cHFuAS21hyVfWSs4TNwYemRDzikIzc/2xiP4APopqXumBRT2m4jd/ZbznBkkzdNtj21yv1+6PFX5Gc9yYCvvHTcftJp3f4p7EyzOMt9aQTN3r+OC5fCBsbnO4WyLkoStOWA7602fzGKyD0Ysv6b3hGJ3P91bM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1735850312;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lcK5++gZNrfgTwYzjN2bYWBlMPBgdZql/T5sAw5NZX8=; 
 b=iRmJz2lc+XlKZfugfNnzAgKMSlnbmHyjqaxK3gO9nX0ODAIhDgKMGLWlopPB0UuZNFiYtjGRatGOD908i8PJsXbblj2wtfeiHD/Aseoqy5JAf85TkaFgB1rWjWj1q2eTr18HLZbN58XfnqEwKkLrc5IPWBBfraOGch6aQnTEWHI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735850312; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=lcK5++gZNrfgTwYzjN2bYWBlMPBgdZql/T5sAw5NZX8=;
 b=KRZEopUwIVihVSE9pgmpyN9tkzs8At6W2Mcu7cCVGayNk8lXhsxY33ckPeZKdSaA
 3jjjMqJ1IUrQfQyNLRlUqeU3VFcre6NCx/0wrPsygpyyCN5D0SOuzBwdJ6o7biEH/rt
 H7ES5Et6z/Zgme0anKddAkCxlnVgWTsQaaqiVZ+c=
Received: by mx.zohomail.com with SMTPS id 1735850309957333.4011501291858;
 Thu, 2 Jan 2025 12:38:29 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] drm/panthor: Display size of internal kernel BOs
 through fdinfo
Date: Thu,  2 Jan 2025 20:38:12 +0000
Message-ID: <20250102203817.956790-1-adrian.larumbe@collabora.com>
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
v6:
 - Replace up_write with up_read, which was left out in the previous version
 - Fixed some minor comment and documentation issues reported by the kernel test robot
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

[1] https://lore.kernel.org/dri-devel/20241218181844.886043-1-adrian.larumbe@collabora.com/

Adrián Larumbe (2):
  drm/panthor: Expose size of driver internal BO's over fdinfo
  Documentation/gpu: Add fdinfo meanings of drm-*-internal memory tags

 Documentation/gpu/panthor.rst           | 14 +++++++
 drivers/gpu/drm/panthor/panthor_drv.c   | 12 ++++++
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
 drivers/gpu/drm/panthor/panthor_mmu.c   | 35 +++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 52 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  2 +
 8 files changed, 145 insertions(+), 1 deletion(-)

-- 
2.47.0

