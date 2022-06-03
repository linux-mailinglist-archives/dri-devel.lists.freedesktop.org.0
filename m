Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F107453D328
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 23:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DFD10E8C3;
	Fri,  3 Jun 2022 21:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506EF10E8C3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 21:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654291437; x=1685827437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0HhBbqlJXV9Dpg5TjJyhTs67DS6u7ve+IhP3stHnjG8=;
 b=Gp+WmbiTnw0sN0hxpczkGYOUU832/w7CjZba4sR+OdFUwVXbUCk/NHWV
 dvFUeYju/qtRN7IAXBfQQihWN0s899RHzTmEd+9yQm+b9nHxgDAuU8KCk
 +dyUkS3IQgIzp7ON1E2LKUO19Avkn/Ax4XuOKh1ObR1hgs4h4fKfQgx1v
 +WX1f59HgP6wOP9kQ6CET4imKEZi2xlA8OmpvEBMZWwBsa2a0X7cAvdZQ
 iwOBE2wW9LPzfwJaQPH4pn2sOrore9v4oBioULj/A+QGFjfBGX6uQmJWI
 ssCxx74+9eO0LrBBe3DX0BqobkhaEFAVivYTjY9TIeiK2qUCoXROC9FAi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="256209622"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="256209622"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 14:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="668629846"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Jun 2022 14:23:56 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/virtio: fence handling in case of multi scanouts
Date: Fri,  3 Jun 2022 14:18:47 -0700
Message-Id: <20220603211849.27703-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Dongwon Kim <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current primary plane update flow when blob is enabled (for zero copy
display sharing) shows fence synchronization problems when multi planes
are referencing a same single large FB (i.e. multi displays in extended
mode). This is because there is only one fence bound to the FB and this
single fence is re-used asynchronously when flushing all associated
planes.

The way to prevent this is to assign the fence for each plane so that
flushing one plane won't be affecting or affected by other plane's flush
operation.

The 1st patch "drm/virtio: .release ops for virtgpu fence release" which
adds device specific release ops is for making the virtio_gpu fence freed
upon the last dma_fence_put call.

The 2nd patch "drm/virtio: fence created per cursor/plane update" contains
the main implementation of per-plane fence.

Dongwon Kim (2):
  drm/virtio: .release ops for virtgpu fence release
  drm/virtio: fence created per cursor/plane update

 drivers/gpu/drm/virtio/virtgpu_drv.h   |   1 -
 drivers/gpu/drm/virtio/virtgpu_fence.c |   8 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 103 ++++++++++---------------
 3 files changed, 47 insertions(+), 65 deletions(-)

-- 
2.20.1

