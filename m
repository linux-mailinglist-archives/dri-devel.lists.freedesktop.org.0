Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6B2A10DE1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B999B10E439;
	Tue, 14 Jan 2025 17:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="W2rJtHEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEB210E439
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736876089; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OO53ulLxfAOZ5fh1H2Yd5wkJWYtQV1SEMiPLJNWBTb1ElhRsmTtepZRI6h9Rkbn+I4tLMb53vSiPXgU4AZA3DDhAOaAbSMuk0FVfDVgSHAfuyO/E0k0XWXbeCpaWf+kUueA8rsMOTslGls4u8mP5O98A5ejkLT2IpiwPy6lfn0U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736876089;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0WA6J/EhS4KkqUnGdo0KmY73cb+vgz8J3JE8d3pK9ns=; 
 b=ha2kO22xPJkMUEC93UCg4w69d1nZO7FkX56m5dROB8qNqepNd1jJUytARrbVxVk8hoBkv1oo3LGYzIY56VDHR64AMd7thsITe2IorJfzGTsSmzjKtkvOlm1urZqxSCDoZR25G1iXRIaV1uEuPHBGOWVvFY4bo68ACtGnhSvdpb8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736876089; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0WA6J/EhS4KkqUnGdo0KmY73cb+vgz8J3JE8d3pK9ns=;
 b=W2rJtHEpLUSTLklsNmXnkmH9jLOA5opKKrqfJ7DTgzgCF4lxmbAA5l740JKNWqKA
 4IYRcrVd4I+81qMoLEeZuqHCRX0v4BWgEi1VSGruaZ0XWf6WO+sfYAY5xZ5RQcEAgdF
 8RaDNaxyUT3FTGz38GuHPiaLK/Eyn7qruLNf2360=
Received: by mx.zohomail.com with SMTPS id 1736876087545581.0339826536529;
 Tue, 14 Jan 2025 09:34:47 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mihail Atanassov <mihail.atanassov@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>
Subject: [PATCH v8 4/4] Documentation/gpu: Add fdinfo meanings of
 panthor-*-memory tags
Date: Tue, 14 Jan 2025 17:34:03 +0000
Message-ID: <20250114173406.3060248-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
References: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
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
index 3f8979fa2b86..7a841741278f 100644
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
+size. `panthor-active-memory` shows the size of kernel BO's associated with
+VM's and groups currently being scheduled for execution by the GPU.
-- 
2.47.1

