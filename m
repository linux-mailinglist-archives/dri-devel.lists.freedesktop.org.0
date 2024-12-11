Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0015C9ED211
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F05310EBAE;
	Wed, 11 Dec 2024 16:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="dsKcOo11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C3F10EBAE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:35:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733934893; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QMwAFdKmjJl+HPrmSnTxWjjwOBiNXW4q1T0mFWQlS5M9v1xuDIH4+PSfbKifJnT1vRiBJVD1hEE0APP2JAi/TtRv98olKTw5M19hRSt47geErHNbuWVZN9KU5YaszuD98MsjpWBlMIG6hHKJ0t4peavrY4J9eLGET1CFkBcCteI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733934893;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2lmNy/XM6hdTNY+7mSV2llZYnapRKFq/OVQAePLlARA=; 
 b=nXg9fQVyqZ9ITa4sP+3tMPgit8F6KD8gkpN72Y9NWEdgOnDWdmv2c8qEqmPP/yozfJtA/SHa5gr98F6g9JSoB9YI5qbAB0da6cjKUWfWF88+cNlHxujFTtdgWCStkjYK7vdq0UR9jHqmpQ9d9QEJYfogWX1GlyQAHqm3tlvXLtE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733934893; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2lmNy/XM6hdTNY+7mSV2llZYnapRKFq/OVQAePLlARA=;
 b=dsKcOo11YfYhiWUf2bimaYuexaEjNmVdr6ozpeHqs3WjavMqKjhIipPlUAkM80ev
 4qJKJJGFTisTIxRE9Q6u3eqtVifePumaNKdF0LSUSc4ywfcCCpHcR7egzXCXQYORI3A
 5djkIGKnF1KxGXrs4E9Jwz2wPNN0AyUiow9s/r6w=
Received: by mx.zohomail.com with SMTPS id 1733934891458566.2122633790219;
 Wed, 11 Dec 2024 08:34:51 -0800 (PST)
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
Subject: [PATCH v4 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
Date: Wed, 11 Dec 2024 16:34:32 +0000
Message-ID: <20241211163436.381069-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211163436.381069-1-adrian.larumbe@collabora.com>
References: <20241211163436.381069-1-adrian.larumbe@collabora.com>
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
with the definitions of the new drm-*-internal ones.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 Documentation/gpu/panthor.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
index 3f8979fa2b86..c6d8236e3665 100644
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
+Possible `drm-*-internal` key names are: `total`, `active` and `resident`.
+These values convey the sizes of the internal driver-owned shmem BO's that
+aren't exposed to user-space through a DRM handle, like queue ring buffers,
+sync object arrays and heap chunks. Because they are all allocated and pinned
+at creation time, `drm-resident-internal` and `drm-total-internal` should always
+be equal. `drm-active-internal` shows the size of kernel BO's associated with
+VM's and groups currently being scheduled for execution by the GPU.
+`drm-shared-memory` is unused at present, but in the future it might stand for
+the size of the Firmware regions, since they do not belong to an open file context.
-- 
2.47.0

