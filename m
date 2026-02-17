Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id w4SHLKA0lGlVAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:28:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061814A5EE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F323A10E10A;
	Tue, 17 Feb 2026 09:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SfWPPIb4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0B110E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:27:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 24FF660128;
 Tue, 17 Feb 2026 09:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE95BC19423;
 Tue, 17 Feb 2026 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771320471;
 bh=UOrhMiqO/vmRsPaQIImuSNAWuHNiFVe04FA8sTvQPpo=;
 h=From:To:Cc:Subject:Date:From;
 b=SfWPPIb41J40NkOvjjQ45GCsOCkw82WipvgutyIfk3jdXl+GjPjykZLF0ZiUa2GU2
 SGGok8BXc5yN2Ycjfx5TEoLFr1lvEDPiSthgNCf1N7Lgp/g4PDXrtceSTIr45BQ7ix
 H+89LqIgIZ7oaw0vWj2q37WC3ZJzhdaVDgJgOqOSmUJ/mI39xgeWrmdDhy25iCtKYd
 wrIzJdg/ZzWC0kYRjqcjqO7TF3xqrRPQ5Me/GzriYnZ+y+DiEKiRFWnefmCNDFbZZy
 VocUI4wOUpKqk1JXzlUGy7lzz4fmb1h4QU6h7HoZUzQJPZ3omLFLtjgyWrSh4q4s/A
 txow6Fv3aZlUw==
Received: by wens.tw (Postfix, from userid 1000)
 id 84E745FDFB; Tue, 17 Feb 2026 17:27:49 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Michael Riesch <michael.riesch@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Archit Anant <architanant5@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 0/2] drm/panel: sitronix-st7789v: Convert to mipi_dbi
Date: Tue, 17 Feb 2026 17:27:35 +0800
Message-ID: <20260217092738.3238016-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,wolfvision.net,bootlin.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sebastian.reichel@collabora.com,m:gerald.loacker@wolfvision.net,m:michael.riesch@collabora.com,m:miquel.raynal@bootlin.com,m:wens@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:architanant5@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0061814A5EE
X-Rspamd-Action: no action

Hi folks,

This small series converts the st7789v panel to use the mipi-dbi helpers
for register access.

Originally I intended to also add tinydrm support. My purpose was just
to test a TFT module that is on the Avaota A1 board. Archit is interested
in working on this driver, and I already used his/her previous patch to
check that my TFT was sort of working, albeit probably with the wrong
internal parameters. So this series will serve as a base for that work.

Patch 1 adds an option to invert the reset GPIO logic in the mipi-dbi
helpers. The reset logic originally assumes "high" is out of reset,
so an "enable" GPIO rather than a "reset" GPIO. However the st7789v
drivers assumes the proper "reset" GPIO logic.

Patch 2 converts all SPI register accesses in the st7789v to use the
mipi_dbi helpers. This actually reduces the number of function calls,
as the command and data portions of each message are combined. This
conversion also lets the driver support 8-bit plus D/C GPIO transfers.


This series is unfortunately only compile tested, as I do not have an
st7789v panel that is wired up for RGB input. So please help test the
changes.


Thanks
ChenYu

Changes since v1:
- Fix compile error from half changed reset GPIO handling 

Chen-Yu Tsai (2):
  drm/mipi-dbi: Provide option to invert reset GPIO logic
  drm/panel: sitronix-st7789v: Convert to mipi_dbi

 drivers/gpu/drm/drm_mipi_dbi.c                |   4 +-
 drivers/gpu/drm/panel/Kconfig                 |   1 +
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 306 +++++++-----------
 include/drm/drm_mipi_dbi.h                    |   9 +
 4 files changed, 121 insertions(+), 199 deletions(-)

-- 
2.47.3

