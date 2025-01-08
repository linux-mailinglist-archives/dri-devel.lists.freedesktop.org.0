Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF63EA066CF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 22:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077D810E947;
	Wed,  8 Jan 2025 21:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="EzgMR0GV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB43610EC90
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 21:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736370215; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cVl+ryPb2apeWILXP0Uc8S5mznBHqwUSSNQhfLlPZh4RAzNlyvogUagFHELaY4QlakJX4EBZ41dxyL1uoGTEL2ZHYiTb7fbne7g4qfq85CruZHXUTCrYQZl2q7pRGYiR6YtQX9LD6bUyvIoY5eSs1Losv8nAT7gQBQuwKiqtgx4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736370215;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wNaB1y8CPCW4MU5KNXHb/rWezDgTcc6rjkhqAnOZx4E=; 
 b=CLPfkRWC37FQjt2mMsed7zGGFutQszyTPIVG/Mjdmi2OX2I3NeEwVnH39tTh7n4ONEIUsJNRYK78FVjePP8BhVzBqKZeg46jP4G8ru1Lo9ncAumDfv4y14uU/MrtpBn92cgysJCW9CB2azikTpLjauATplxfrNeLfeX3+iElNiQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736370215; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=wNaB1y8CPCW4MU5KNXHb/rWezDgTcc6rjkhqAnOZx4E=;
 b=EzgMR0GV9Ok58NME2JbKWG+Um1JXJf/EIhNJeKkEdC/aHaO4K8rF/mDa2tX/wOX/
 WVQ+3HoAEzR2iGdwgQZWHE7iqKxQ2zsZYxoPG5n4MGoCGSsI53Oqilz/uU01ID2eOFz
 +TkdDyWIcociL3WqLRPSkM4k11LMtyMy1yHKaz0I=
Received: by mx.zohomail.com with SMTPS id 1736370214840680.0859912850773;
 Wed, 8 Jan 2025 13:03:34 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>
Subject: [PATCH v7 4/4] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
Date: Wed,  8 Jan 2025 21:02:41 +0000
Message-ID: <20250108210259.647030-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108210259.647030-1-adrian.larumbe@collabora.com>
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
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

A previous commit enabled display of driver-internal kernel BO sizes
through the device file's fdinfo interface.

Expand the description of the relevant driver-specific key:value pairs
with the definitions of the new panthor-*-memory ones.

Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 Documentation/gpu/panthor.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
index 3f8979fa2b86..76e03304fe7a 100644
--- a/Documentation/gpu/panthor.rst
+++ b/Documentation/gpu/panthor.rst
@@ -26,6 +26,8 @@ the currently possible format options:
      drm-cycles-panthor:     94439687187
      drm-maxfreq-panthor:    1000000000 Hz
      drm-curfreq-panthor:    1000000000 Hz
+     panthor-resident-memory:        10396 KiB
+     panthor-active-memory:  10396 KiB
      drm-total-memory:       16480 KiB
      drm-shared-memory:      0
      drm-active-memory:      16200 KiB
@@ -44,3 +46,11 @@ driver by writing into the appropriate sysfs node::
 
 Where `N` is a bit mask where cycle and timestamp sampling are respectively
 enabled by the first and second bits.
+
+Possible `panthor-*-memory` keys are: `active` and `resident`.
+These values convey the sizes of the internal driver-owned shmem BO's that
+aren't exposed to user-space through a DRM handle, like queue ring buffers,
+sync object arrays and heap chunks. Because they are all allocated and pinned
+at creation time, only `panthor-resident-memory` is necessary to tell us their
+size. `panthor-resident-active` shows the size of kernel BO's associated with
+VM's and groups currently being scheduled for execution by the GPU.
-- 
2.47.1

