Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F5B9ED20F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F22110E1CE;
	Wed, 11 Dec 2024 16:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="WHT4wOwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D020D10E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:35:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733934887; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hFwO3hozzfeWnSx24Ww8Dl5opS9oZ2SFDgQRPrbwMGpzMkdPwOqOlgeGvrVJtTI3nXqck460bTLMYDHC7jMZl6NLr5yQzod1jLjJoAen4ijThZdt64FuJtIVrhGV4ABoZhpFaF4X40T0TIGGYpR/oElW6p5Ta9JO03eayCJp5Ac=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733934887;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HDsZiPXRiyT2DtFdDqPzRkEMG3ihCmTo/xJvACrvICs=; 
 b=OfTVOdlf2ACd+/dHgTdkKHkZZXaIPJr/5fbwhkw300KGBIqSJyArf4oatCaFphgQg1kD+B2iYL1ibehSXOR2d0yzZP/xLdA5q2AIeKchilRlyopV/k+WyMwDhMBWqbFTqhyO+8FjwP0wuv36kRibgbViZVD8Dk8BNNfp1YJceD8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733934887; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HDsZiPXRiyT2DtFdDqPzRkEMG3ihCmTo/xJvACrvICs=;
 b=WHT4wOwtHDZy8dUma01ejXv1nxZd+GU6JmRJU2pav9AOdMAzkILcthe0+0Ek+cRM
 KQ4mYnVoVd0pJ9P1zrhJAdvOgrD2HDJygbiX1jed6M2zsI1VW07gUSuoR9Tpc4JGwjN
 DOvfl7tSSLFkgtssCtSgJuo8/otoMq+f8Xs5vWXg=
Received: by mx.zohomail.com with SMTPS id 1733934886492542.7231123372303;
 Wed, 11 Dec 2024 08:34:46 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] drm/panthor: Display size of internal kernel BOs
 through fdinfo
Date: Wed, 11 Dec 2024 16:34:30 +0000
Message-ID: <20241211163436.381069-1-adrian.larumbe@collabora.com>
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

v4:
 - Remove unrelated formating fix
 - Moved calculating overall size of a group's kernel BO's into
 its own static helper.
 - Renamed group kernel BO's size aggregation function to better
 reflect its actual responsibility.

[1] https://lore.kernel.org/dri-devel/20241205233915.2180630-1-adrian.larumbe@collabora.com/

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


base-commit: c6eabbab359c156669e10d5dec3e71e80ff09bd2
-- 
2.47.0

