Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3472734905
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 00:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F2E10E040;
	Sun, 18 Jun 2023 22:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net
 (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020FA10E040
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 22:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:mime-version:to:cc:content-transfer-encoding:
 content-type:cc:content-type:from:subject:to;
 s=s1; bh=kE3ug1FphWK8w4bAu88BIK2LQbxYxA5TL1gVPHRLq0s=;
 b=I18/eC+ZDPL1HZg9AUC1xf4aOdnDKuDMJNZrPnUxF/B8A44OdIN6YX9Y/GzODreQRsBJ
 q5fe/G5y0H+GJ9SIBrsnX87Gg79I/absjKEwql8LswxWeSJjREH0MtNEOMD3Z1DDOpMhKg
 D7xc4Au6vFseMsLWGbQhARkSavbLUlqRgqq+Hs0b2l0NLaXl9HtnkX9IYcnDNgvzX/2Max
 zhTbxBxVMx8vNt/Cl/SVszvlOsSocZVNqN4G/5wTxhEqULNbKkplpXQ02snOXMlK+R1/Az
 DVUs6Yf2kD5JX2LmIop7PApmABEePgUZcyB6VaWRLmGrIH0ZPweV5Z66/jQ9V1Ww==
Received: by filterdrecv-65f68489c8-zmlx4 with SMTP id
 filterdrecv-65f68489c8-zmlx4-1-648F7EB4-7C
 2023-06-18 22:01:25.078475909 +0000 UTC m=+3363925.214276436
Received: from bionic.localdomain (unknown) by geopod-ismtpd-5 (SG) with ESMTP
 id o9F54kvgToCDS4l4o5-IEA Sun, 18 Jun 2023 22:01:24.617 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v4 0/2] drm/rockchip: vop: Add NV15, NV20 and NV30 support
Date: Sun, 18 Jun 2023 22:01:25 +0000 (UTC)
Message-Id: <20230618220122.3911297-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h2uRKfwUrnAuhEShj?=
 =?us-ascii?Q?yRo=2FdCt6XHj=2FoPJvO4UOauxEyTrAKiA2DU4+Gq+?=
 =?us-ascii?Q?lO9RCUbwfLMSCEL+PvsSkAWdCnDGx4l8fG3fx7n?=
 =?us-ascii?Q?J00d8Rcb3IuP5evfOQrYxmRkweuQCtHIweQL=2Fgt?=
 =?us-ascii?Q?cBRfdRJuGJdXslE4BfyWaHtFrwbk+aNHN2gcqRl?=
 =?us-ascii?Q?agDgKnOVBXdtNu2qZIQZw=3D=3D?=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sandy Huang
 <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
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
Cc: linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series add support for displaying 10-bit 4:2:0 and 4:2:2 formats produced
by the Rockchip Video Decoder on RK322X, RK3288, RK3328, RK3368 and RK3399.
Also include 10-bit 4:4:4 support since VOP can support that also.

First patch adds new fourcc 10-bit YUV formats with 4:2:2/4:4:4 sub-sampling.
Second patch adds support for displaying the new fourcc formats.

These patches has been in use by LibreELEC and other distros for the
past 3+ years, hoping they can be merged this time around :-)

Changes in v4:
- Rework RK3328/RK3399 win0/1 data to not affect RK3368

Changes in v3:
- No changes, rebased on next-20230616
- R-B tags was collected

Changes in v2:
- Add NV30 format
- R-B tags was not collected due to NV30 changes

This series is also available at [1].

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20230616-vop-nv15

Jonas Karlman (2):
  drm/fourcc: Add NV20 and NV30 YUV formats
  drm/rockchip: vop: Add NV15, NV20 and NV30 support

 drivers/gpu/drm/drm_fourcc.c                |  8 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 29 +++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 63 +++++++++++++++++----
 include/uapi/drm/drm_fourcc.h               |  2 +
 5 files changed, 91 insertions(+), 12 deletions(-)

-- 
2.40.1

