Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06FC2953C
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 19:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFA610E002;
	Sun,  2 Nov 2025 18:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IjTm98Xk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CFEvD5Fg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0284210E002
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 18:42:08 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d03V55SKvz9ssT;
 Sun,  2 Nov 2025 19:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762108925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VC6OAhbw5R0Rb/73bJH2yxED4SA5Gtdg5d8wYSMrsfk=;
 b=IjTm98Xk25mxdAxRG21k7sW9cgdGxgTxLwUf6xAK6G8JvNRvmQzlai4yxTq9au+3xxOCs+
 JH6GbcBN69NjCWqALrXSsmIRpiw2h/jPLfT6TGu/qlzx+9qRHiCYCTn0wk/mh3VhwgJR3n
 I/Dv2dJhHAdJq8Z0O2M44dDUBS+xyTTVztxKxyKyE5w8lXxzsl10EJB/IP2gs0oe64HYwg
 Y8kZcySKHLQUhyv0z+QygQYF3f6YOB3CZVLLr6TbtTuF4QUKlVpVPas6lIMUNSXuhzKqb4
 H1e4IrC3a2h6+HMhWPe4kUnSfPauuPzjSiaKM/nYnTJg4yyvqWtg5BFaemzk7Q==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CFEvD5Fg;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762108923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VC6OAhbw5R0Rb/73bJH2yxED4SA5Gtdg5d8wYSMrsfk=;
 b=CFEvD5FgdVrhsSvdFWrKncNKvlEuFvajbSK12W/De9Hd2/ClSnhkuY7WacZvSp1RgZxCx6
 kzTVRhMXdGJ7Ve3/H/O2n0yHXExhaSWZSghglXUo59L6j5Kwkp180TzHwRaV6leP+GELly
 AOr9ZCdH9D3rSSbjBuehI5CDGHu0Z2wPJes3dudiMsnsvgA1rQE2kFfaFwqRBrxDDJVnL4
 fvolwy7zcNdw3L3qRvaHCx8BvyI6R4hsLZVSexJx/4/qS23pYNLub8PXaq6cQ4CdYNXB6o
 nfKX0TkzzGrr22uX2y0KZbnX4zgvYkUKh5pgsLuHW4eFV5lhXk+j7xu0a1UCGQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/imagination: Depend on power sequencing
Date: Sun,  2 Nov 2025 19:41:21 +0100
Message-ID: <20251102184158.264378-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ufqse7z8zxsni96r637wh9u8nmx5rrjx
X-MBO-RS-ID: 7ebe7c74ed784183139
X-Rspamd-Queue-Id: 4d03V55SKvz9ssT
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

Since commit e38e8391f30b ("drm/imagination: Use pwrseq for TH1520 GPU
power management"), the driver calls power sequencing functions. Add
missing dependency on POWER_SEQUENCING, otherwise the kernel may fail
to build if the driver is built-in and POWER_SEQUENCING is a module
with these linker errors:

aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_off_sequence_pwrseq':
pvr_power.c:(.text+0x70): undefined reference to `pwrseq_power_off'
aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_on_sequence_pwrseq':
pvr_power.c:(.text+0x88): undefined reference to `pwrseq_power_on'
aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_init_pwrseq':
pvr_power.c:(.text+0xb4): undefined reference to `devm_pwrseq_get'

Fixes: e38e8391f30b ("drm/imagination: Use pwrseq for TH1520 GPU power management")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/imagination/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 682dd2633d0c..40ee08f72995 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -7,6 +7,7 @@ config DRM_POWERVR
 	depends on DRM
 	depends on MMU
 	depends on PM
+	depends on POWER_SEQUENCING
 	select DRM_EXEC
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_SCHED
-- 
2.51.0

