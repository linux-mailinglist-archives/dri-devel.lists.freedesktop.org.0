Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F581F0F94
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 22:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FBE6E1E2;
	Sun,  7 Jun 2020 20:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262406E1D5
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:to:cc:content-type:content-transfer-encoding;
 s=001; bh=9+UFvR2HLQ1OtsQEFQDlYZvMrwIZ+EbLi39KqEqSC5c=;
 b=PT5/SPwDAKr7hCt/j9ChohbEuXIFE9HVYER3FGySHJCRHG8yfhB5E5ill2UxtU5r+Oll
 ahdPcZND/NfLoiG/dgAGsTGi8C8EG6vGNDhFFZ7UhkZ2jnl1J6j1Tc9hwk5pKPAzJeNt+3
 YJfqoUmq/C7tUiJfY2lPmGR0UToA2v3Ng=
Received: by filterdrecv-p3mdw1-6f5df8956d-x2qpw with SMTP id
 filterdrecv-p3mdw1-6f5df8956d-x2qpw-20-5EDD4D35-1
 2020-06-07 20:25:25.100926506 +0000 UTC m=+346300.487522929
Received: from bionic.localdomain (unknown)
 by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
 id zJEc6mt4Tsa6oQIoDupI0g Sun, 07 Jun 2020 20:25:24.908 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/2] drm: rockchip: add NV15 and NV20 support
Date: Sun, 07 Jun 2020 20:25:25 +0000 (UTC)
Message-Id: <20200607202521.18438-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h6O1z6Pg2iWyq5iV4?=
 =?us-ascii?Q?A+F4I6TvUqYcjYtDAgN2Hadv6t1FKJVFTvJ+DT8?=
 =?us-ascii?Q?LaIMpqOITdDIRmvVNs35SgjYXThyqH2g7v9tdXF?=
 =?us-ascii?Q?U8nkovYzdWjDwswGFPg=2FAIySMrgbZXwbK1yoauW?=
 =?us-ascii?Q?NKUFMkoh0CCGVnHjHF+EwtRz2tnOXDITKQpl0Qp?=
 =?us-ascii?Q?CvhXyUvjdWvyl9oN+F2rQ=3D=3D?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko =?iso-8859-1?q?St=FCbner?=
 <heiko@sntech.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Ben Davis <ben.davis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds support for displaying 10-bit 4:2:0 and 4:2:2 formats produced
by the Rockchip Video Decoder on RK322X, RK3288, RK3328, RK3368 and RK3399.

First patch adds a new fourcc 10-bit YUV format with 4:2:2 sub-sampling.
Second patch adds support for using the the two new fourcc formats.
Both depend on "drm: drm_fourcc: add NV15, Q410, Q401 YUV formats" at [1].

This series can also be found at [2], and can be tested on RK3399 using an
upcoming rkvdec series at [3] together with ffmpeg at [4] and kodi-gbm or mpv.

[1] https://patchwork.freedesktop.org/series/76326/
[2] https://github.com/Kwiboo/linux-rockchip/commits/next-20200605-fmt_10
[3] https://github.com/Kwiboo/linux-rockchip/commits/next-20200605-rkvdec
[4] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.2.2-rkvdec

Regards,
Jonas

Jonas Karlman (2):
  drm: drm_fourcc: add NV20 YUV format
  drm: rockchip: add NV15 and NV20 support

 drivers/gpu/drm/drm_fourcc.c                |  4 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 27 ++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 31 +++++++++++++++++----
 include/uapi/drm/drm_fourcc.h               |  1 +
 5 files changed, 56 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
