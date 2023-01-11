Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489176654D3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 07:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D44F10E075;
	Wed, 11 Jan 2023 06:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EC610E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673419758; x=1704955758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mzyw4sSKnGjfAn0xnw+Xn17x7+WHE9K4y3Ab9WygkTw=;
 b=Uuk0ylGqn1xSUCDr04vEIWFmfNnQROBeU/XGuX6wKwNeEPTaxhGM08kS
 ffwzr5UgpqEBED4Vi5T3Fj03E2WGZuneWgZ7bm3v73lWIrXqQm3/Ovb4H
 /sYoqiZhx1JmI4wGl5MCfUZjs9ZUbEC16FytHepM0I1gffOy1ffPSnv6c
 OU4ZdBvibvbUpTY2oAOU5jHnFdyAJvKYo9Ma1L3EPrv7PLe7t0lMZ9OvR
 yFtNjRto+7e9+esCdaQ2zzYIn3i2sZbh75TsH/RhxjPFkbzVtiqFnMJY9
 5Bv8Get6DxcpAhkPLU09S+dKTb8vFgYy+YyJtfPm/rRr2OQkdOjYvuuF1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="385650605"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="385650605"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 22:49:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="746056694"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="746056694"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 22:49:17 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/virtio: Add hotplug_mode_update and suggested_x/y
 properties (v2)
Date: Tue, 10 Jan 2023 22:29:34 -0800
Message-Id: <20230111062936.909330-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These properties provide a way to influence the userspace with regard
to positioning of the outputs and also enable it to look for new
preferred modes when hotplug interrupts occur. 

These properties are currently used by other virtual GPU drivers
such as vmwgfx and qxl.

Testcase: After positioning the VMM's (e.g, Qemu) windows on various
monitors and launching the Guest VM, run the get-state tool (tools/
get-state.py) associated with Mutter to ensure that the Hosts' and
Guests' outputs are aligned.

v2: Fixed the sparse check warning associated with patch #1 and
    also improved the commit message in patch #2.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (2):
  drm/virtio: Attach and set suggested_x/y properties for the connector
    (v2)
  drm/virtio: Add hotplug_mode_update property to ensure position info
    is read (v2)

 drivers/gpu/drm/virtio/virtgpu_display.c | 19 +++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 14 ++++++++++++++
 3 files changed, 35 insertions(+)

-- 
2.37.2

