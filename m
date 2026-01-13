Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484FD18F51
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 13:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424DD10E293;
	Tue, 13 Jan 2026 12:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="Ki1HAdCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581D010E4C1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 12:55:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1768308598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ifzs265vUAPV6IFIZqod6woQ6e3KxesGPyzpRuY/iQY=;
 b=Ki1HAdCqqKBaK15MOgTWKFwgvoe4O1HRO6+Mj3xlA5tV4Hx2joKK1RolVMOxqwkWzlOAE0
 s/ImAGc8EaMUlaZp3Ov0OL3HhBf/duX9ugvAEqWXnI5d9U7TC+sn+1b4TiK5gdmQEHbQS3
 /L98D5ouUf0M9yEHyoOHRfSJFmFSXPo=
From: Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v4 0/3] drm/bridge: sii9234: use extcon to detect cable
 attachment
Date: Tue, 13 Jan 2026 13:49:28 +0100
Message-Id: <20260113-exynos4-sii9234-driver-v4-0-6e8c0ac14f84@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OwQrCMAyA4VeRnq00aWarJ99DPEybaUA3aaUoY
 +9ut4uK6PEP5Et6lTgKJ7We9SpyliRdW4LmM3U41e2RtYTSCg1aQPCa74+2S6STyAot6RAlc9T
 Bgwu0rwBCpcryNXIj9wne7kqfJN26+JjuZBinI1kZh/CLzKCNRibHwWCzdG5zjHI5c1wkVqOZ8
 d2hnw4Wp6mZkaiBQObLsS/H/3FscbzxtGIHy9p+/jMMwxMQonxoTQEAAA==
X-Change-ID: 20231218-exynos4-sii9234-driver-d817d4b511d5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=henrik@grimler.se;
 h=from:subject:message-id; bh=+9icRJM878guDktkvKRdV7M11E818HdtxnWGnfxrGmU=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBpZj9mvaR4IAPwmtcAYazzSD8ToTudKzzOhAXmU
 lhUfGm8+FeJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaWY/ZgAKCRCwB25JC3Fh
 a74AB/9GAGkrx/DO009mUlBXkmbzwe9ybgsLcjgJzBdtu7e/ZevZBiZI4afBlqfi6dehvtL5BuY
 z/oy0HhLgUlGFx4RvXNpWrGGQ4L7aCRmZgV4G+9xkTY4uEY1bkXCdyTO226C8cPgSd8CleAZAzM
 8c6zBfSDFBbkQGUJ6dJtjkoRE6o2NXwgh9Ed7Zzadtg4wvs4tJzT06Y3VHOPY0H/805G2QQB3r1
 cPmMAc6pi0aZUUAZwZFnNCGcXiGhkCuw5Mc63rIpyMNONnaIOCATlxT3m7uLG77n7I13Qoz2tO1
 gTmw8ZvokF+7nXB5mWsgaE9c99hi/GRiPZ8ce3JFTlBUQaNr
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
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

This series fixes so HDMI through the sii9234 MHL chip works when
cable is hotplugged, by making the MHL chip use extcon cable detection
functions. Patch 3, that actually implements the extcon parts, is heavily
inspired by commit 688838442147 ("drm/bridge/sii8620: use micro-USB
cable detection logic to detect MHL") by Maciej Purski.

Before these changes, HDMI only worked if cable was plugged in before
booting. If no cable was connected, then wlr-randr still showed HDMI
as connected, with 0x0 px, which confused at least some UIs (phosh)
and caused problems:
https://gitlab.gnome.org/World/Phosh/phosh/-/issues/828

Tested on exynos4412-i9305.

Best regards,
Henrik Grimler

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
Changes in v4:
- Collect tags
- Link to v3: https://lore.kernel.org/r/20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se

Changes in v3:
- Fix return of dev_err_probe in patch 2 and patch 3, spotted by
  Dmitry and Marek respectively.
- Change to depends on EXTCON || !EXTCON instead of select
- Collect tags for patch 1 (not 3 since there were (minor) changes)
- Link to v2: https://lore.kernel.org/r/20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se

Changes in v2:
- Add dependency on extcon in patch 3. Issue reported by kernel test robot <lkp@intel.com>
- Link to v1: https://lore.kernel.org/r/20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se

---
Henrik Grimler (3):
      drm/bridge: sii9234: fix some typos in comments and messages
      drm/bridge: sii9234: use dev_err_probe where applicable
      drm/bridge: sii9234: use extcon cable detection logic to detect MHL

 drivers/gpu/drm/bridge/Kconfig   |   1 +
 drivers/gpu/drm/bridge/sii9234.c | 124 +++++++++++++++++++++++++++++++--------
 2 files changed, 102 insertions(+), 23 deletions(-)
---
base-commit: a87fef0880c4f52769b5a3c2fc1b2d73aaa04eb3
change-id: 20231218-exynos4-sii9234-driver-d817d4b511d5

Best regards,
-- 
Henrik Grimler <henrik@grimler.se>

