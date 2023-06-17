Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292CD73445C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 00:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5368710E06F;
	Sat, 17 Jun 2023 22:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sat, 17 Jun 2023 22:28:17 UTC
Received: from s.wrqvwxzv.outbound-mail.sendgrid.net
 (s.wrqvwxzv.outbound-mail.sendgrid.net [149.72.154.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288B510E06F
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 22:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:mime-version:to:cc:content-transfer-encoding:
 content-type:cc:content-type:from:subject:to;
 s=s1; bh=3au+Er0OutWjHdL5XNw2ghh/+x9dzcZ5yBxaNAzWCcs=;
 b=Zx6HGT9dW2hdc3fiEyLevza+BIk+osm+szaxPTPjwaWqUEyqNYsWOvAadD3ZpW5es6OT
 G7B/SXlLVa7hlWcFT9I75ei1/2IbjjncwgGk3t5hemCw9fkqb1fHaNn2zKvWd/ZdgxUaGe
 c02AUi72UYORPq0c4KjntfXHM0Xa2bMDadN936xTUWj0ayFzFcEQrOKZPVUDUeu281XLpn
 kEVOXfP2JiZnqiCkFIU8ToJ2bbL6LqbKw5Je7nj6iL5C4zTbpiF/WfRTygUTbqAfhvNLWZ
 gz9OC3Smbr5lV9YDXAfqiNSBQxrNvdddwc0qJUzN+eNGopZaTeOj9M/yJOxEgTUw==
Received: by filterdrecv-66949dbc98-4lpsw with SMTP id
 filterdrecv-66949dbc98-4lpsw-1-648E324E-8
 2023-06-17 22:23:10.893674033 +0000 UTC m=+3278604.170816701
Received: from bionic.localdomain (unknown) by geopod-ismtpd-1 (SG) with ESMTP
 id UU_EZyFMTgSb0INFqVrbVQ Sat, 17 Jun 2023 22:23:10.470 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 0/2] drm/rockchip: vop: Add NV15, NV20 and NV30 support
Date: Sat, 17 Jun 2023 22:23:11 +0000 (UTC)
Message-Id: <20230617222307.3145714-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hwz2osmywJU4M0tj7?=
 =?us-ascii?Q?uo2KBjgsske2Ia2ljLgAD00R1w8G2DQk=2FmiOEYJ?=
 =?us-ascii?Q?caybrQsIV3sbFEXe69l57US9Vi5TwOj28ACZkQf?=
 =?us-ascii?Q?Z83=2FZ33v0+XLn=2Ff=2F3KLXEiqzjiSbg7HY6i4QSvC?=
 =?us-ascii?Q?Jsxs0UFg0TfnLISAe6yGU+hHzN=2FxdtXaZstwPu?=
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

This is a revival of a 3 year old series that never got picked up, see [1].

This series add support for displaying 10-bit 4:2:0 and 4:2:2 formats produced
by the Rockchip Video Decoder on RK322X, RK3288, RK3328, RK3368 and RK3399.
Also include 10-bit 4:4:4 support since VOP can support that also.

First patch adds new fourcc 10-bit YUV formats with 4:2:2/4:4:4 sub-sampling.
Second patch adds support for displaying the new fourcc formats.

These patches has been in use by LibreELEC and other distros for the
past 3+ years, hoping they can be merged this time around :-)

Changes in v3:
- No changes, rebased on next-20230616
- R-B tags was collected

Changes in v2:
- Add NV30 format
- R-B tags was not collected due to NV30 changes

This series is also available at [2].

[1] https://lore.kernel.org/all/20200706223009.1200-1-jonas@kwiboo.se/
[2] https://github.com/Kwiboo/linux-rockchip/commits/next-20230616-vop-nv15

Jonas Karlman (2):
  drm/fourcc: Add NV20 and NV30 YUV formats
  drm/rockchip: vop: Add NV15, NV20 and NV30 support

 drivers/gpu/drm/drm_fourcc.c                |  8 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 29 +++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 32 +++++++++++++++++----
 include/uapi/drm/drm_fourcc.h               |  2 ++
 5 files changed, 64 insertions(+), 8 deletions(-)

-- 
2.40.1

