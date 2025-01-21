Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D9A18818
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 00:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FC910E269;
	Tue, 21 Jan 2025 23:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="SmUx8706";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 387 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jan 2025 23:01:49 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7DE10E644
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 23:01:49 +0000 (UTC)
Received: from wse-pc.fritz.box (pd9e59556.dip0.t-ipconnect.de
 [217.229.149.86]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id 1F7BF2FC0050;
 Tue, 21 Jan 2025 23:55:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1737500121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=F/1eAlkVpsxUqtpQB5HD0pI7pNL1hL+20UQeVlx/hKY=;
 b=SmUx8706midt/mlP0vyB/8MigrXhZTVwOtXjhsPjLfQZS7p3hYMCuy9rZokxch4PDg8Vi0
 fRJpgY7ROkoor/pCOO+tG9oTU/3ZglD72S/d9aaxHhDcAyAMTIbDISSGoDnm4a8It/JPwW
 29675EPAAeIXCxR+vhb5t/rt6elUc1k=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 wse@tuxedocomputers.com, bentiss@kernel.org
Cc: dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de,
 platform-driver-x86@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH v5 0/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
Date: Tue, 21 Jan 2025 23:31:09 +0100
Message-ID: <20250121225510.751444-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
after some other work, picked this up again.
Only coding style changes vs v4.


I now got my feet a little wet with hid-bpf regarding something else, and
with that knowledge I would leave the long arrays in the beginning in the
kernel code for the time being:

sirius_16_ansii_kbl_mapping and sirius_16_iso_kbl_mapping are required
during initialization so they have to exist in the kernel code anyway.

report_descriptor will most likly not change even for future models and
afaik having report_descriptors in kernel drivers is not unheard of.

So the only things that could be meaningfully moved to a hid-bpf program
are the sirius_16_*_kbl_mapping_pos_* arrays. But for these is have to give
out some fallback value anyway for the case where a hid-bpf file is missing
or fails to load. So why not use real world values from my test device for
these values?

As soon as there is a future device that can use the same driver with just
these pos arrays different, then I would implement that change via a bpf
program instead of a change to the kernel driver.

Let me know if you too think this is a sensefull approach?


Another question: Would this patch need to wait for a userspace
implementation of lamp array before it can get accepted?


The folder structure and naming scheme with nb04 is im preparation for
other parts of tuxedo-drivers to be upstreamed. NB04 is one of the
board_vendor dmi strings on TUXEDO devices that aligns with which part of
tuxedo-drivers implements the features of that device. They are independent
of each other so I plan to put them in different subfolders to reflect
that.

Best regards,
Werner Sembach

Werner Sembach (1):
  platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices

 MAINTAINERS                                   |   6 +
 drivers/platform/x86/Kconfig                  |   2 +
 drivers/platform/x86/Makefile                 |   3 +
 drivers/platform/x86/tuxedo/Kbuild            |   6 +
 drivers/platform/x86/tuxedo/Kconfig           |   6 +
 drivers/platform/x86/tuxedo/nb04/Kbuild       |   9 +
 drivers/platform/x86/tuxedo/nb04/Kconfig      |  14 +
 .../platform/x86/tuxedo/nb04/wmi_ab_init.c    | 103 +++
 .../platform/x86/tuxedo/nb04/wmi_ab_init.h    |  18 +
 .../x86/tuxedo/nb04/wmi_ab_virt_lamparray.c   | 772 ++++++++++++++++++
 .../x86/tuxedo/nb04/wmi_ab_virt_lamparray.h   |  18 +
 .../platform/x86/tuxedo/nb04/wmi_xx_util.c    |  97 +++
 .../platform/x86/tuxedo/nb04/wmi_xx_util.h    | 112 +++
 13 files changed, 1166 insertions(+)
 create mode 100644 drivers/platform/x86/tuxedo/Kbuild
 create mode 100644 drivers/platform/x86/tuxedo/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Kbuild
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab_init.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab_init.h
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.h
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_xx_util.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_xx_util.h

-- 
2.43.0

