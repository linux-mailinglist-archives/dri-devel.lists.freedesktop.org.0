Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DC98B8FE1
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 20:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820A910E485;
	Wed,  1 May 2024 18:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RRVqkC8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF3110E485
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 18:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714589454;
 bh=iXioOwjNVyjF8VZrGx4GWEFnxOxL2Al4w5WomiTPGIU=;
 h=From:To:Cc:Subject:Date:From;
 b=RRVqkC8P/rsb+dbc/R1mwGtLHmaiilP1yUkEgAO6/m65eyY8/7Ub7SZcFe+wbIzKb
 OE62C0EToDkoFZPP3RZJvjwVuoyXVIpsGm8+nB+Zt0sCufo/964bgtDOKQZvOINHn0
 LRBwpF7ZcM6+48vlC2tXxACeEbBXDqFfsfHiSE1fqZKYUzkN9tPbAoNR5mi+ylEjAW
 T6iPuJWBZTQeiYPaCofwbiHE1g7KeUIU2q5OtCv8j1BuML0Bm2mvfQEObIuXmTQ3ub
 C1rFgjp+u5n1kstG8kaPcsWeceSoJjLbP9+tDA+IzX12vccxS9V0skRoVNtfNvZ2SK
 T5kf3N0zmQlnA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B1D793781F9A;
 Wed,  1 May 2024 18:50:53 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, Adrian Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] drm: Add ioctl for querying a DRM device's list of
 open client PIDs
Date: Wed,  1 May 2024 19:50:42 +0100
Message-ID: <20240501185047.3126832-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
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

This is v2 of the patch being discussed at
https://lore.kernel.org/dri-devel/20240403182951.724488-1-adrian.larumbe@collabora.com/

In the original patch, a DRM device sysfs attribute file was chosen as the
interface for fetching the list of active client PIDs.

That came with a hosts of problems:
 - Normal device attributes can only send back up to a page worth of data, which might
 be not enough if many clients are opening the DRM device.
 - The binary attribute interface is meant for immutable virtual files, but the list of
 active PIDs can grow and shrink between successive calls of show().

This led me to believe sysfs is not the right tool for the job, so switched over
to a custom DRM ioctl that does the same thing.

In order to test this patch, one can use WIP branches for both libdrm and igt at:

https://gitlab.freedesktop.org/larumbe/igt-gpu-tools/-/tree/drm-clients-ioctl?ref_type=heads
https://gitlab.freedesktop.org/larumbe/drm/-/tree/drm-clients-ioctl?ref_type=heads

I've only tested it with gputop, but intel-gputop should work also.

Adrián Larumbe (1):
  drm: Add ioctl for querying a DRM device's list of open client PIDs

 drivers/gpu/drm/drm_internal.h |  1 +
 drivers/gpu/drm/drm_ioctl.c    | 89 ++++++++++++++++++++++++++++++++++
 include/uapi/drm/drm.h         |  7 +++
 3 files changed, 97 insertions(+)

-- 
2.44.0

