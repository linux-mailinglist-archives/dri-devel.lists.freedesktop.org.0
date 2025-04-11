Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1CAA86132
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F4B10EBE9;
	Fri, 11 Apr 2025 15:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Sm+UKc6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2DA10EBE9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:04:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744383852; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JbIELZ5HVOaXB8E3hyycOfIQ0cttdyFCWHdKH9wN54CzJoz7HysrSPT/UuW/BkUx8rmss7F3+Tk6DjgAzLuySJQk74l1VN01Ys0PUAZwfS0lI4b/Y+71K41OD6f63h1GPOD5r5H+qZ31ehaxKIywyYJDKIaSgtOqhD8CyfEB7O8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744383852;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hJU7RtOEpjvauYnpptgY/NOnrt4iNsj+/WuzVjWFgN0=; 
 b=Rg9YRJaX5+VH5n1nQ7ch5mSyBuvKeF/zVuuPuEGYVUcMfq4Vk5gKnYOM3z+GO3P+75zRxvXEphokdhDsetU6+LIVI9qs637TBoLyRTwL5YScGKS6YmFcewTKVgMWtlX+kU3doCqeXO4hUDBEywhx9NW6O2RRGBM7N8A0yqkSyg4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744383852; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=hJU7RtOEpjvauYnpptgY/NOnrt4iNsj+/WuzVjWFgN0=;
 b=Sm+UKc6ahyFPmIZ2aUdipPdjXsxUMfU+A7Bm51VRS1uosIGFvCoUDzSeD+No6XZz
 pVHl6WOx+YoXSGSh/rIvpXg/e6z0Z9hnoiKTvA6xveXh59TvUE8N9FG2tsBbjZ3uZM1
 7Pt5VXO04/rtYLeEctIxduIu+CCSBwqTPsHUmpk0=
Received: by mx.zohomail.com with SMTPS id 17443838508591016.5289892434001;
 Fri, 11 Apr 2025 08:04:10 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: "To : Boris Brezillon" <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v7 0/4] Panthor BO tagging and GEMS debug display
Date: Fri, 11 Apr 2025 16:03:48 +0100
Message-ID: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
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

This patch series is aimed at providing UM with detailed memory profiling
information in debug builds. It is achieved through a device-wide list of
DRM GEM objects, and also implementing the ability to label BO's from UM
through a new IOCTL.

The new debugfs file shows a list of driver DRM GEM objects in tabular mode.
To visualise it, cat sudo cat /sys/kernel/debug/dri/*.gpu/gems.
To test this functionality from UM, please refer to this Mesa patch series:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224

Discussion of previous revision of this patch series can be found at:
https://lore.kernel.org/dri-devel/20250409212233.2036154-1-adrian.larumbe@collabora.com/T/#t

Changelog:
v7:
 - Improved formating of DebugFS GEM's status and usage flags
 - Deleted some spurious white spaces
 - Renamed usage flags setting function

v6:
 - Replaced some mutex calls with scoped guards
 - Documented data size limits in the label ioctl
 - Simplified GEMS status flags treatment (Panthor doesn't use madvise)
 - Fixed some array size and string bugs
 - Improved the naming of GEM status and usage flags to reflect their meaning
 - Improved the formatting of the output table

v5:
 - Kept case and naming of kernel BO's consistent
 - Increased the driver minor after new ioctl
 - Now adds BO to debugfs GEMs list at GEM object creation time
 - No longer try to hide BO creator's name when it's a workqueue or modprobe
 - Reworked the procedure for printing GEM state and kernel BO flags
 - Turned kernel BO flags and GEM state flags into bit enums
 - Wait until BO state is marked as initialied for debugfs display

v4:
 - Labelled all kernel BO's, not just heap chunks.
 - Refactored DebugGFs GEMs list handling functions
 - Added debugfs GEMS node mask to tell different kinds of BO's

Adrián Larumbe (4):
  drm/panthor: Introduce BO labeling
  drm/panthor: Add driver IOCTL for setting BO labels
  drm/panthor: Label all kernel BO's
  drm/panthor: show device-wide list of DRM GEM objects over DebugFS

 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |  11 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  68 ++++++-
 drivers/gpu/drm/panthor/panthor_fw.c     |   8 +-
 drivers/gpu/drm/panthor/panthor_gem.c    | 225 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h    |  80 +++++++-
 drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c  |   9 +-
 include/uapi/drm/panthor_drm.h           |  23 +++
 9 files changed, 424 insertions(+), 11 deletions(-)

--
2.48.1
