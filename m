Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224579F6D64
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 19:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C99A10E26D;
	Wed, 18 Dec 2024 18:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="HiFJFjWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Wed, 18 Dec 2024 18:34:20 UTC
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F3C10E26D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 18:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1734545950; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kPTjHflZU9AtAGwqy7w2e/P7WX+uwViRu/FUIgRK4BuixA2BaU0qLt4KG1JitbwPsqq5KMuXn7lE6EbyvaBJ22TNaFw0FtW6sxAOUJHwxYlzCIN09oJ/wynO0PRhFV3slwhcBLA5kRj7fsLQ3NDgcnN4lCDSO5/r1H2I3pu38KY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1734545950;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=B7xPVJeNZtoUBRQXmKc9FBZ8Cl1FYcG/fjzjdtCG+zE=; 
 b=U4Uoj6b25Lu4vx4O8UlWbxrf/fzI6Q9dO7acH6Fw0pHU8TA8Mdx3kngvxgM/SvuCafwCbb2uk8t4kdJwfYe9FzTnBBVAXZmB/u25U7By4WEcfD0sZPv0rnOwmbA3B5au30Jgfw4MQXgbAhfHklwV0cbCtv3uaVycXXT0rDkGNaY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734545950; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=B7xPVJeNZtoUBRQXmKc9FBZ8Cl1FYcG/fjzjdtCG+zE=;
 b=HiFJFjWjX2Qo2guP8+FUA0Etay5i5jXMnDIW814GC1Jnsk9hBxRF1DTwM6NtXUwW
 CE1xW74h9J8/vV2ljYLs1UwriovZS9T48p9mdcitao2qcBQrLPtcYtsCB5eNZOAFqUx
 EkX93rXJclArgeVRNRxe7JcoP/1pMRJjO6eZW78I=
Received: by mx.zohomail.com with SMTPS id 1734545948823465.14538815970343;
 Wed, 18 Dec 2024 10:19:08 -0800 (PST)
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
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [PATCH v5 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
Date: Thu, 19 Dec 2024 02:18:42 +0800
Message-ID: <20241218181844.886043-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218181844.886043-1-adrian.larumbe@collabora.com>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
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

From: Adrián Larumbe <adrian.larumbe@collabora.com>

A previous commit enabled display of driver-internal kernel BO sizes
through the device file's fdinfo interface.

Expand the description of the relevant driver-specific key:value pairs
with the definitions of the new drm-*-internal ones.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 Documentation/gpu/panthor.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
index 3f8979fa2b86..23aa3d67c9d2 100644
--- a/Documentation/gpu/panthor.rst
+++ b/Documentation/gpu/panthor.rst
@@ -26,6 +26,10 @@ the currently possible format options:
      drm-cycles-panthor:     94439687187
      drm-maxfreq-panthor:    1000000000 Hz
      drm-curfreq-panthor:    1000000000 Hz
+     drm-total-internal:     10396 KiB
+     drm-shared-internal:    0
+     drm-active-internal:    10396 KiB
+     drm-resident-internal:  10396 KiB
      drm-total-memory:       16480 KiB
      drm-shared-memory:      0
      drm-active-memory:      16200 KiB
@@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
 
 Where `N` is a bit mask where cycle and timestamp sampling are respectively
 enabled by the first and second bits.
+
+Possible `drm-*-internal` keys are: `total`, `active`, `resident` and `shared`.
+These values convey the sizes of the internal driver-owned shmem BO's that
+aren't exposed to user-space through a DRM handle, like queue ring buffers,
+sync object arrays and heap chunks. Because they are all allocated and pinned
+at creation time, `drm-resident-internal` and `drm-total-internal` should always
+be equal. `drm-active-internal` shows the size of kernel BO's associated with
+VM's and groups currently being scheduled for execution by the GPU.
+`drm-shared-internal` is unused at present, but in the future it might stand for
+the size of executable FW regions, since they do not belong to an open file context.
-- 
2.47.0

