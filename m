Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74DCB58F09
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C92B10E6BB;
	Tue, 16 Sep 2025 07:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="jtyIs3jT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85A3E10E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 23:46:20 +0000 (UTC)
Received: from mrdev.corp.microsoft.com
 (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
 by linux.microsoft.com (Postfix) with ESMTPSA id A6840212329C;
 Mon, 15 Sep 2025 16:46:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A6840212329C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1757979979;
 bh=7luzChTMUszkb9nUQYYy7F6No80YdK2nCBJEz1e/6Zs=;
 h=From:To:Cc:Subject:Date:From;
 b=jtyIs3jTrdwZXnDw9vxxokbXUXOLvwgRveEkFIwYiy+pMrWiva5ENlTdDcwoZTzmu
 FBJ51hSc8k8vMU9Fiwr1q8p1aQUcRRLs2BkWEZHNAsahuKe/NddZwgTT7E21RFLNJR
 5fJJ1WTPMe2vBTDNUjFz+vcGC294CxqRnKvMTVqE=
From: Mukesh Rathor <mrathor@linux.microsoft.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jikos@kernel.org, bentiss@kernel.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, dmitry.torokhov@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, bhelgaas@google.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 gregkh@linuxfoundation.org, deller@gmx.de, arnd@arndb.de,
 sgarzare@redhat.com, horms@kernel.org
Subject: [PATCH v2 0/2] Fix CONFIG_HYPERV and vmbus related anamoly
Date: Mon, 15 Sep 2025 16:46:02 -0700
Message-Id: <20250915234604.3256611-1-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=1.7 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Tue, 16 Sep 2025 07:21:33 +0000
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

At present, drivers/Makefile will subst =m to =y for CONFIG_HYPERV
for hv subdir. Also, drivers/hv/Makefile replaces =m to =y to build in
hv_common.c that is needed for the drivers. Moreover, vmbus driver is
built if CONFIG_HYPER is set, either loadable or builtin.

This is not a good approach. CONFIG_HYPERV is really an umbrella
config that encompasses builtin code and various other things and not
a dedicated config option for VMBus. VMBus should really have a config
option just like CONFIG_HYPERV_BALLOON etc. This small series introduces
CONFIG_HYPERV_VMBUS to build VMBus driver and make that distinction
explicit. With that CONFIG_HYPERV could be changed to bool.

For now, hv_common.c is left as is to reduce conflicts for upcoming
patches, but once merges are mostly done, that and some others should
be moved to virt/hyperv directory.

V2:
 o rebased on hyper-next: commit 553d825fb2f0 
        ("x86/hyperv: Switch to msi_create_parent_irq_domain()")

V1:
 o Change subject from hyper-v to "Drivers: hv:"
 o Rewrite commit messages paying attention to VMBus and not vmbus
 o Change some wordings in Kconfig
 o Make new VMBUS config option default to HYPERV option for a smoother
   transition

Mukesh Rathor (2):
  Driver: hv: Add CONFIG_HYPERV_VMBUS option
  Drivers: hv: Make CONFIG_HYPERV bool

 drivers/Makefile               |  2 +-
 drivers/gpu/drm/Kconfig        |  2 +-
 drivers/hid/Kconfig            |  2 +-
 drivers/hv/Kconfig             | 13 ++++++++++---
 drivers/hv/Makefile            |  4 ++--
 drivers/input/serio/Kconfig    |  4 ++--
 drivers/net/hyperv/Kconfig     |  2 +-
 drivers/pci/Kconfig            |  2 +-
 drivers/scsi/Kconfig           |  2 +-
 drivers/uio/Kconfig            |  2 +-
 drivers/video/fbdev/Kconfig    |  2 +-
 include/asm-generic/mshyperv.h |  8 +++++---
 net/vmw_vsock/Kconfig          |  2 +-
 13 files changed, 28 insertions(+), 19 deletions(-)

-- 
2.36.1.vfs.0.0

