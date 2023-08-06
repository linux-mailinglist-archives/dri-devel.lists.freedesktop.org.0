Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904DF771427
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 11:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B651710E04C;
	Sun,  6 Aug 2023 09:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 343 seconds by postgrey-1.36 at gabe;
 Sun, 06 Aug 2023 09:20:24 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F91B10E04C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 09:20:15 +0000 (UTC)
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
 by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4RJYg90PmSz8Yl2;
 Sun,  6 Aug 2023 09:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zint.sh; s=key2;
 t=1691313269; bh=CsAs6d5wqQbLSpSawfmFHNKPVraikzHX4fB4qld+jzo=;
 h=From:To:Cc:Subject:Date:From;
 b=foKChNOZYTjtG8Jq+Y5DA9ZJ3R+TCw+qrRm82PcIYpcsKiY3MIg8sEjua3aeBZ9tu
 yZPDs5IIG51bTOH8W8xE0DGeyVuBSIRluRFR+87pbXIpvRBIkHM6RQrqE2TeRlcobR
 +Y81UAeGCkzjDdNTV46q04idYh2sphCG3LjnJ3fhFvpLEErVjztSY/C6ytipYUUf8u
 ViSREZi7sx34NvF9UZJ7oMhehDP+eTeIOkNbwg76BECzL6LZ6CRJ6OvJXqGGeE4S6E
 FRGSRvwyPPVndyPruNPTtNlDBRtRy727CqGuG0X0+JienspQWkwQXTDVdg8CiXA6kr
 7Sw5cilH6BjJg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4RJYg86pR7z8YWK;
 Sun,  6 Aug 2023 09:14:28 +0000 (UTC)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4RJYg838ZJz8sb2;
 Sun,  6 Aug 2023 11:14:28 +0200 (CEST)
Received: from thinkpad.fritz.box (p508baab3.dip0.t-ipconnect.de
 [80.139.170.179])
 by mxe217.netcup.net (Postfix) with ESMTPSA id E07AA80A93;
 Sun,  6 Aug 2023 11:14:16 +0200 (CEST)
From: Julius Zint <julius@zint.sh>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v2 0/1] HID backlight driver
Date: Sun,  6 Aug 2023 11:14:02 +0200
Message-ID: <20230806091403.10002-1-julius@zint.sh>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E07AA80A93
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: YoaV/hJ3qfeZp9FORldPhNZL+/cOa7+7Fz+lH9pk
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
Cc: Julius Zint <julius@zint.sh>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Complete rewrite of [1]. Instead of a USB driver it`s now a HID driver
and will work without being part of the early boot environment.

The driver is no longer heavily tied to the Apple Studio Display, but
should work with all HID devices, that expose a report containing fields
with the Monitor - Brightness HID usage value.

[1] https://lore.kernel.org/dri-devel/20230701120806.11812-1-julius@zint.sh/

Julius Zint (1):
  backlight: hid_bl: Add VESA virtual control panel HID backlight driver

 drivers/video/backlight/Kconfig  |   8 +
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/hid_bl.c | 267 +++++++++++++++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 drivers/video/backlight/hid_bl.c


base-commit: a33677b9211b6c328ad359b072043af94f7c9592
-- 
2.41.0

