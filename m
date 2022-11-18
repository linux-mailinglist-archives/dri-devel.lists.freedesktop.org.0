Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2AA62EB53
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 02:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC2410E6AA;
	Fri, 18 Nov 2022 01:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698F110E6AA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 01:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668736285; x=1700272285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2kTbBef7C0z/cCg9FZdR5E/Iyifz+jGI5ikjTKXEenc=;
 b=XToeKqqUlwQ+2ZOScDbjFW4Q9zhYV93KhdjkLrMnTd6lgNp6wc46Hb6o
 +1yxixSGEdUvLoSSIdQI219gav1HrPCuS1boiDfPQVNMlqTfbDk1Fcurw
 82gtXEIzhG3P+ZYdqT2G43b6wWxjE9kdadpka3o78amcG34jh7OtjbbCO
 VCilVEB0ozQHbxS/+COZFinVmSNek/p6HgFGoF0TZANO3PvMweLgD6kSw
 oS/kyrBzfjXRmpkig0YpnSq1BgwOEDSKKvpqRCl2RYLGRQk8LenbyrFS8
 IFLI4BKasK2s9vK8GAgY473/lYnpxz6XmG01sc9M3qXLx7h/uI+0APxEe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="399313863"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="399313863"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:51:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="590843004"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="590843004"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:51:23 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/2] drm/virtio: Add hotplug_mode_update and suggested_x/y
 properties
Date: Thu, 17 Nov 2022 17:30:52 -0800
Message-Id: <20221118013054.182304-1-vivek.kasireddy@intel.com>
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

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (2):
  drm/virtio: Attach and set suggested_x/y properties for the connector
  drm/virtio: Add the hotplug_mode_update property for rescanning of
    modes

 drivers/gpu/drm/virtio/virtgpu_display.c | 19 +++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 12 ++++++++++++
 3 files changed, 33 insertions(+)

-- 
2.37.2

