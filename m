Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEF8B39449
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 08:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4446810E1A7;
	Thu, 28 Aug 2025 06:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="EVUhRe0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 13C1A10E002
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 01:00:16 +0000 (UTC)
Received: from mrdev.corp.microsoft.com
 (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
 by linux.microsoft.com (Postfix) with ESMTPSA id 40DB3211082D;
 Wed, 27 Aug 2025 18:00:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 40DB3211082D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1756342815;
 bh=ZR3q/sqU11jc+D0wNTmcaAct75MXJv7BhHNEAQ7boIU=;
 h=From:To:Cc:Subject:Date:From;
 b=EVUhRe0ohRSnQF/YYNdCLVZptm6BIAk+Hq6DVhul1oAbqMlFRe0KvhyhxKPoM7efX
 rMQI8XEKVQhtmJoKGyGeHa0irYjiEI8GWCSnQeC796ekCftvH1sfujFiin5aYZn37O
 3/MMjWjjAmmF9NONI30kvVGYQdEhMti1myllwkL0=
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
Subject: [PATCH V0 0/2] Fix CONFIG_HYPERV and vmbus related anamoly
Date: Wed, 27 Aug 2025 17:59:50 -0700
Message-Id: <20250828005952.884343-1-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=2.1 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Thu, 28 Aug 2025 06:55:09 +0000
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

At present, drivers/Makefile will subst =m to =y for CONFIG_HYPERV for hv
subdir. Also, drivers/hv/Makefile replaces =m to =y to build in
hv_common.c that is needed for the drivers. Moreover, vmbus driver is
built if CONFIG_HYPER is set, either loadable or builtin.

This is not a good approach. CONFIG_HYPERV is really an umbrella config that
encompasses builtin code and various other things and not a dedicated config
option for VMBUS. Vmbus should really have a config option just like
CONFIG_HYPERV_BALLOON etc. This small series introduces CONFIG_HYPERV_VMBUS
to build VMBUS driver and make that distinction explicit. With that
CONFIG_HYPERV could be changed to bool.

For now, hv_common.c is left as is to reduce conflicts for upcoming patches,
but once merges are mostly done, that and some others should be moved to
virt/hyperv directory.

Mukesh Rathor (2):
  hyper-v: Add CONFIG_HYPERV_VMBUS option
  hyper-v: Make CONFIG_HYPERV bool

 drivers/Makefile               |  2 +-
 drivers/gpu/drm/Kconfig        |  2 +-
 drivers/hid/Kconfig            |  2 +-
 drivers/hv/Kconfig             | 14 ++++++++++----
 drivers/hv/Makefile            |  4 ++--
 drivers/input/serio/Kconfig    |  4 ++--
 drivers/net/hyperv/Kconfig     |  2 +-
 drivers/pci/Kconfig            |  2 +-
 drivers/scsi/Kconfig           |  2 +-
 drivers/uio/Kconfig            |  2 +-
 drivers/video/fbdev/Kconfig    |  2 +-
 include/asm-generic/mshyperv.h |  8 +++++---
 net/vmw_vsock/Kconfig          |  2 +-
 13 files changed, 28 insertions(+), 20 deletions(-)

-- 
2.36.1.vfs.0.0

