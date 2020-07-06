Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDBD216197
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 00:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D14B6E486;
	Mon,  6 Jul 2020 22:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310C06E47E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 22:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=63/HKH6wNc/07OqiA1yctULaLMPjNtHCXH6IBFgPuW0=;
 b=QxTdQHzDUhU1mmOdoXN3SZ6tjhuIK0j3xUl4JQQyHx3wTuwO6jUmEM3bYmWpB2o7qXTk
 p6VOMLRKVq9QfdM5i2XCy+xVHPRqgph7VVQi4R6psUIvOOvhPoMmAV3HjmXZfiAJNFMENP
 oBHEssnNPJe0/36h115eYkAdXYGKjcqV8=
Received: by filterdrecv-p3las1-7754f7d4cc-fqrzr with SMTP id
 filterdrecv-p3las1-7754f7d4cc-fqrzr-19-5F03A5F4-36
 2020-07-06 22:30:12.61868238 +0000 UTC m=+965799.783674456
Received: from bionic.localdomain (unknown)
 by ismtpd0004p1lon1.sendgrid.net (SG) with ESMTP
 id LcDdvt6lT9C7M20Z4UoZJQ Mon, 06 Jul 2020 22:30:12.191 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/2] drm: rockchip: add NV15, NV20 and NV30 support
Date: Mon, 06 Jul 2020 22:30:12 +0000 (UTC)
Message-Id: <20200706223009.1200-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607202521.18438-1-jonas@kwiboo.se>
References: <20200607202521.18438-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h2jx6rNUbibDfvcQb?=
 =?us-ascii?Q?HBJWIsxybDLeUWaOeuvzlwhpdnYWD4ydpio0RQT?=
 =?us-ascii?Q?RXe3+j4AsBZnn6ATSe4+TwWf+C0hx0KlOdVMd4p?=
 =?us-ascii?Q?n2nGqH6Kw4NyITuljClgAL5kcg8yfasLHMUNsZS?=
 =?us-ascii?Q?M4xXzP6xbbl8TJyNFij1x49LU6mg9mireaIMBqf?=
 =?us-ascii?Q?76IaIb6LIHob4UAzVAHeg=3D=3D?=
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Ben Davis <ben.davis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds support for displaying 10-bit 4:2:0 and 4:2:2 formats produced
by the Rockchip Video Decoder on RK322X, RK3288, RK3328, RK3368 and RK3399.
Also include 10-bit 4:4:4 support since VOP can support that also.

First patch adds new fourcc 10-bit YUV formats with 4:2:2/4:4:4 sub-sampling.
Second patch adds support for displaying the the new fourcc formats.

Changes in v2:
- Add NV30 format
- R-B tags was not collected due to NV30 changes

This series has been tested on RK3399 using a Rockchip Video Decoder series
at [1] together with ffmpeg at [2] and kodi-gbm or mpv. [3] contains all
patches needed on top of linux-media master for easy testing.

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=2859
[2] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.3-rkvdec-high-10
[3] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-10-v2

Regards,
Jonas

Jonas Karlman (2):
  drm: drm_fourcc: add NV20 and NV30 YUV formats
  drm: rockchip: add NV15, NV20 and NV30 support

 drivers/gpu/drm/drm_fourcc.c                |  8 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 29 +++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 32 +++++++++++++++++----
 include/uapi/drm/drm_fourcc.h               |  2 ++
 5 files changed, 64 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
