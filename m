Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5AE2B51F4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0C86E0EC;
	Mon, 16 Nov 2020 20:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2226E0EC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:08:13 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2399220702;
 Mon, 16 Nov 2020 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605557293;
 bh=pQrf1dmX9ae8/r7MNwZ83pHLz0ABOqnY7bgAmg2B1N8=;
 h=From:To:Cc:Subject:Date:From;
 b=srUaf9bpvjb3VSX+Tc0K0/NGfw0kacxmvrA1+Ey1/YE9Z2g3sDbYxmQnGbGN6jkKv
 zVMNVB2bhp8dSmDlzfWkmwt7NsJNssID73obAULRALeCYdho1BcaL1h4LITjbUkhcQ
 12xsEh7+R2FGhnXwlLb1bq7sjYYvGLY5wWjby1mk=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1keknK-00B7cF-Th; Mon, 16 Nov 2020 20:08:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/4] drm/meson: Module removal fixes
Date: Mon, 16 Nov 2020 20:07:40 +0000
Message-Id: <20201116200744.495826-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel-team@android.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Having recently moved over to a top-of-the-tree u-boot on one of my
VIM3L systems in order to benefit from unrelated improvements
(automatic PCIe detection, EFI...), I faced the issue that my kernel
would hang like this:

[  OK  ] Finished Helper to synchronize boot up for ifupdown.
[  OK  ] Started Rule-based Manager for Device Events and Files.
[    7.114516] VDDCPU: supplied by regulator-dummy
[  OK  ] Found device /dev/ttyAML0.
[    7.146862] meson-drm ff900000.vpu: Queued 2 outputs on vpu
[    7.169630] fb0: switching to meson-drm-fb from simple
[    7.169944] Console: switching to colour dummy device 80x25
[    7.179250] meson-drm ff900000.vpu: CVBS Output connector not available

and that's it.

After some poking around, I figured out that it is in the
meson-dw-hdmi module that the CPU was hanging...

Reverting to the kernel DT instead of u-boot's papered over it
somehow, but it turned out that removing the module (modprobe -r)
resulted in a firework. And for every issue I was fixing, another
followed. Much fun for a rainy Monday in the basement!

I ended up with the following 4 patches, which solve all my problems:
I can now boot with the u-boot provided DT, and the hdmi and DRM
drivers can be removed and re-inserted at will.

The first patch is a straightforward use-after-free, causing a NULL
pointer dereference. Moving things around fixes it.

The second patch shows that I have no clue about the DRM subsystem
whatsoever. I mimicked what my Rockchip systems are doing, and the two
warnings disappeared. It can't completely be wrong (famous last
words...).

The third patch fixes a *very* common issue with regulators (I've
fixed at least 3 drivers with a similar issue). I guess the devm
subsystem needs to grow a new helper at some point.

The last patch finally fixes the issue I was seeing: the HDMI driver
hangs when accessing a register with clocks disabled, which they are
on module removal. It also fixes my u-boot booting for similar
reasons, I guess.

I went as far as reaching out for a HDMI cable and verifying that I
was getting a working display. Total dedication.

Feedback much appreciated.

	M.

Marc Zyngier (4):
  drm/meson: Free RDMA resources after tearing down DRM
  drm/meson: Unbind all connectors on module removal
  drm/meson: dw-hdmi: Register a callback to disable the regulator
  drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the
    TOP registers

 drivers/gpu/drm/meson/meson_drv.c     | 12 +++++++-----
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 13 +++++++++++--
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
