Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50430781D33
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 11:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AC010E0C6;
	Sun, 20 Aug 2023 09:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBCF10E065
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 09:42:48 +0000 (UTC)
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4RT9dK4zvjz61sl;
 Sun, 20 Aug 2023 11:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zint.sh; s=key2;
 t=1692524565; bh=Y1lfCYJSajJUwTdBl3a/8wqulGBpXhVxDAJSoFV9FuA=;
 h=From:To:Cc:Subject:Date:From;
 b=bB3IY0A5amjWO+5WW2j54b5tuEJVrcWkq7qLVXoviI1mzJdzK0O1iZzrc9eSr7Br2
 Xsmp/ZgeOvgpsGL6EwZQ5yktaNwm01IirT+sj0lLCSZXx4/3yCzMW+jDZi/n2ZECSA
 MoXNS9fVIwiGTSn+agEGA/gdC1muaoY4ErQb9CEZjBTtc57Dt2245I7fNYrOGoN/nA
 CVhZcPK1sX08Jy4BaDNbGQuvI9INLGmrEpXyPFVPCAubxgiO+LdUtzAuYJ9IRpyc/f
 zPA9WzehDjAag8JXktdYK6iomvsxeetSpv5bqJJK+H2wb9KeeYnIVrshNOv5K3nYyf
 2fdvkVTJyw7IQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4RT9dK4G8hz4wYs;
 Sun, 20 Aug 2023 11:42:45 +0200 (CEST)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4RT9dJ3KWmz8sWg;
 Sun, 20 Aug 2023 11:42:44 +0200 (CEST)
Received: from thinkpad.fritz.box (p5dcce04c.dip0.t-ipconnect.de
 [93.204.224.76])
 by mxe217.netcup.net (Postfix) with ESMTPSA id C3E6481728;
 Sun, 20 Aug 2023 11:42:28 +0200 (CEST)
From: Julius Zint <julius@zint.sh>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v3 0/1] HID backlight driver
Date: Sun, 20 Aug 2023 11:41:17 +0200
Message-ID: <20230820094118.20521-1-julius@zint.sh>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C3E6481728
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: o99rhNWMntfG8PvlZYqJr2wkw11yMiRwqBscVEe9
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julius Zint <julius@zint.sh>, linux-input@vger.kernel.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for HID backlight devices, found in the Apple
Studio Display.

Changes in v1 [1]:
  - Add USB backlight driver for Studio Display

Changes in v2 [2]:
  - Rewrite from a USB driver to a HID driver

Changes in v3:
  - Added missing hid_bl prefix for some functions
  - Early exit in probe when HID parsing fails
  - Add return code to error logs
  - Adding HID Maintainers for review

[1] https://lore.kernel.org/dri-devel/20230701120806.11812-1-julius@zint.sh/
[2] https://lore.kernel.org/dri-devel/20230806091403.10002-1-julius@zint.sh/

Julius Zint (1):
  backlight: hid_bl: Add VESA VCP HID backlight driver

 drivers/video/backlight/Kconfig  |   8 +
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/hid_bl.c | 269 +++++++++++++++++++++++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 drivers/video/backlight/hid_bl.c


base-commit: dfd122fe8591d513b5e51313601217b67ae98d13
-- 
2.41.0

