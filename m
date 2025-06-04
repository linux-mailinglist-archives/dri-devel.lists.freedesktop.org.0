Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D4BACE0C9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 16:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C938810E0E3;
	Wed,  4 Jun 2025 14:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="pwmdBUqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E712110E0D2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
 :From:subject:date:message-id:reply-to;
 bh=L5Uci1aNRqDvpavMZwVGQCSAcmTvjFdTlpswIPgwNFM=; b=pwmdBUqrSi/2JKlNzyeLA+or1f
 d5iYtvyEaGKbHR4oF9weAoUlLJTFx0XX023Gns/VQdo0aSAZ6SdmfDB6K+rWh7WX1Lx3+w4cTsvm5
 yShd1SYN2tGTlMBpt0FsldkDMFFAJhs8B6AtPhzOzKDQk/Pwbl22Oq2awsfI8/I2kk7g=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:60436
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uMpWG-0000LY-Ud; Wed, 04 Jun 2025 10:55:09 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: biju.das.jz@bp.renesas.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, hugo@hugovil.com, chris.brandt@renesas.com,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Wed,  4 Jun 2025 10:53:05 -0400
Message-Id: <20250604145306.1170676-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.2
Subject: [PATCH v4 0/1] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command
 support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series add support for sending MIPI DSI command packets to the
Renesas RZ/G2L MIPI DSI driver.

Tested on a custom board with a SolidRun RZ/G2L SOM, with two different LCD
panels using the jd9365da and st7703 drivers.

Tested short and long writes.

Tested read of 1 byte, 2 bytes and long reads. Note that to test long reads,
most LCD panels need to be sent a DCS configuration command to increase the
maximum packet size, which is set to 1 byte by default (at least on the two
panels that I tested).

Thank you.

Link: [v1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugovil.com
Link: [v3] https://lore.kernel.org/all/20250522143911.138077-1-hugo@hugovil.com
Link: [dep1] https://lore.kernel.org/all/20250521210335.3149065-1-chris.brandt@renesas.com/raw

Changes for V4:
- Rebased on drm-misc-next, since this series depends on [dep1]
- Move init of DCS maximum return packet size to rzg2l_mipi_dsi_startup()
- Reworded comment for DCS maximum return packet size
- Merged patches 1 and 2

Changes for V3:
- No code change, resending after fixing mail server config resulting in
  only cover letter being sent

Changes for V2:
- Change commit message prefix to "drm: renesas: rz-du: "
- Reorder variables in rzg2l_mipi_dsi_read_response()
- Remove unused macros
- Add missing bitfield include (kernel test robot)

Hugo Villeneuve (1):
  drm: renesas: rz-du: Implement MIPI DSI host transfers

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
 2 files changed, 240 insertions(+)


base-commit: 685c407f168cb49a12cc703230d1e2d62767bfd2
-- 
2.39.5

