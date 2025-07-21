Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA52B0C0A5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD0910E4C1;
	Mon, 21 Jul 2025 09:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="iTk7bZKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A19610E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:49:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1753091022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r80v8covK6AhEksxolDOt41b6/srvYj410fMrmanbjI=;
 b=iTk7bZKH1RqvRKEKjzLK44hT62aCqcRQkLoXllPVY74JazzsjOtexdLy6dbp+kyZ0UGr+B
 fp8zq8re2bM5lKeFxmUzfi5+SGlm9BJU+VMOMJzMiuLA+Wgero9u0zq5J6QlcElMK64NWk
 85ySkYsYL3wu4yDqq+sS8f7o/q+3dNA=
From: Henrik Grimler <henrik@grimler.se>
Subject: [PATCH 0/3] drm/bridge: sii9234: use extcon to detect cable attachment
Date: Mon, 21 Jul 2025 11:43:16 +0200
Message-Id: <20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQLfmgC/x3MQQqDQAxA0atI1g004wxar1JcqEltNqMkIBaZu
 3dw+Rb/X+BiKg5Dc4HJoa5brqBHA8t3yqugcjWEZ2gpUI9y/vLmEV31FdqIbHqIIffUcZwTESe
 o8W7y0fMev8dS/nKG4+ZoAAAA
X-Change-ID: 20231218-exynos4-sii9234-driver-d817d4b511d5
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maciej Purski <m.purski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; i=henrik@grimler.se;
 h=from:subject:message-id; bh=Y69S0QjDeCf4mUz6joj+vvgruIKvaIp7+afSLDu1cjM=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBofgvCGCSAYlLZncGWN4N0PuUhlO7sEX2dkJSTz
 tGeXf4KqoqJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaH4LwgAKCRCwB25JC3Fh
 a6IYB/9C50diuxKr+lHMuKv+h8Ixx/p46MBRIugrQLb4A9+6smjMOi7bbDGAzz5yO9mCXnqrxuJ
 w+wmlTgrq0sfOOOV0Y3b9E+1xWMVPS9AsWAB0LsJIcLFKWcyDS3dkXmrAaCD9V+fwqFyIgJJ8wB
 HZygmCMK3/WzfSnRxbpxStz3khP4DjbN7ICEmEIWYET+gG1bKNAKkC4lZOlaChJ5yTaoKaJUKdE
 Y9aOHkC+qdxrOr9WLhFUHUm3DjwgUQl2Nnlk+boKy0goqF8+da1sgUu4DfI2DsGit1c52d5cvz8
 eAnHG84RDKloiSxDLCv7vvpRTxoxGRTF2UnFI6fQIZRJwlk4
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
Henrik Grimler (3):
      drm/bridge: sii9234: fix some typos in comments and messages
      drm/bridge: sii9234: use dev_err_probe where applicable
      drm/bridge: sii9234: use extcon cable detection logic to detect MHL

 drivers/gpu/drm/bridge/sii9234.c | 121 ++++++++++++++++++++++++++++++++-------
 1 file changed, 100 insertions(+), 21 deletions(-)
---
base-commit: ca2a6abdaee43808034cdb218428d2ed85fd3db8
change-id: 20231218-exynos4-sii9234-driver-d817d4b511d5

Best regards,
-- 
Henrik Grimler <henrik@grimler.se>

