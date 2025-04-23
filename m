Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91296A97CA9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 04:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E86510E160;
	Wed, 23 Apr 2025 02:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Vs3jOZ75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D01A10E160
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 02:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745374374; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eyWU+rvnolQeP/RinfJuEu3JLD58+bB7op6emxYFUqrxLMEIXtwNNEa32GnjYNf2hMhBWo/xyevB0soaJ3DkTWVoONZTxhRnenC94ioYl/hdKepoIiOyeMQDdwDQU2URk7F3EZVaHbj9iIgX6IpG37XeKmLUFbRF2oB1eFimmPw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745374374;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RlNMSce+7Qyi64BSTjMp63mWrqfhtAqm3c0wzIuhgp0=; 
 b=luKAKYIWKwvy42YdT/mbaBQVQRDs+kuDGOg+VCAEfu/YvMs7YUn9Cif4mrMe39llB5fZ6k1CIwm5Q3YxwcPgwpxAh2XviILARDrTtVz4Kby4BEttpEvXlk1RssyHa96Eu/75p7rPqagUOCBlLHVM9GtpGPsr5rE8PByny9f2mK8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745374374; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=RlNMSce+7Qyi64BSTjMp63mWrqfhtAqm3c0wzIuhgp0=;
 b=Vs3jOZ751pHiLDJ8RCzy851VQOe0TGeasfDyF+vku7xsb55iRX0it5YJq5zVe98H
 BiI04KtIkNo2K6oKH41X6uI4XBdze0xYOYttIWP2dpYXFYfUnIlu/ZMs2+QEcQJDT/v
 V8e/Gc1tMlDRigE1aZ4961sA9ZZlJtOoNLLv0398=
Received: by mx.zohomail.com with SMTPS id 1745374372008988.5400713545316;
 Tue, 22 Apr 2025 19:12:52 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v10 0/4] Panthor BO tagging and GEMS debug display
Date: Wed, 23 Apr 2025 03:12:30 +0100
Message-ID: <20250423021238.1639175-1-adrian.larumbe@collabora.com>
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
https://lore.kernel.org/dri-devel/20250418022710.74749-1-adrian.larumbe@collabora.com/

Changelog:
v10:
 - Simplified printing of GEM state and usage flags: now they're printed numericaly,
   and their meanings given in the DebugFS file prelude
 - Some minor formating changes
 - Fixed all checkpatch issues with --strict

v9:
 - Added padding field to uAPI BO label ioctl struct
 - Simplified copying and bounds checking of label in ioctl function

v8:
 - Renamed NULL to NUL in comments describing NUL-terminated strings
 - Removed 'size' parameter from labelling ioctl() as max length can be
   handled by the kernel itself
 - Made sure to use kfree_const() everywhere labels are freed
 - Replaced maximum label size with numerical constant rather than page size
 - Added some warnings and checks in kernel BO labelling function

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
 drivers/gpu/drm/panthor/panthor_drv.c    |  69 +++++++-
 drivers/gpu/drm/panthor/panthor_fw.c     |   8 +-
 drivers/gpu/drm/panthor/panthor_gem.c    | 207 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h    |  86 +++++++++-
 drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c  |   9 +-
 include/uapi/drm/panthor_drm.h           |  23 +++
 9 files changed, 413 insertions(+), 11 deletions(-)

--
2.48.1
