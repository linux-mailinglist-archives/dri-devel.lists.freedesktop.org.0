Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC2739289
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A98510E063;
	Wed, 21 Jun 2023 22:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvwxzv.outbound-mail.sendgrid.net
 (s.wrqvwxzv.outbound-mail.sendgrid.net [149.72.154.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D415210E063
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 22:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:mime-version:to:cc:content-transfer-encoding:
 content-type:cc:content-type:from:subject:to;
 s=s1; bh=Pv1U1EEqpR4gm7kxbWZCerK7wt2q95EyqJhSl+womJE=;
 b=FkXsUOsXaFkwZrliDf9C2YwjNTIUEVvciEnSKJ9DTDBt+k27cbXeShchjqIG62qoBEXH
 b0W+UdYOsXPSNmZl5/Pa8sDZfJN5aeForP98D+/3H6KELBuaDRZL2xHCv6G3oK6M/dQmyK
 AMXMyqWZr86H/epaKAB4V5YO6jAJtDnPWYeG4EX3ygxWvztz3IhdGcfbov+QuCNbGM+LFl
 lFhpBrEdkWwITScZKCVx/GAr3/k1aFutWnpGJzunVRusb7gmRM6uuMYpj8CKxUYbLSu4oG
 i8u8jJfV7em/W//1XTI598X82qwaAx4/LdMfQCu/XA2/mKmYkdUdxX1yww99Iarw==
Received: by filterdrecv-65f68489c8-b6w8z with SMTP id
 filterdrecv-65f68489c8-b6w8z-1-64937AAA-5C
 2023-06-21 22:33:15.071715387 +0000 UTC m=+3625023.840218965
Received: from bionic.localdomain (unknown) by geopod-ismtpd-0 (SG) with ESMTP
 id Vsg4Okx2QpydLWx1dvgG5Q Wed, 21 Jun 2023 22:33:14.503 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/5] drm/rockchip: Fix crtc duplicate state and crtc reset
 funcs
Date: Wed, 21 Jun 2023 22:33:15 +0000 (UTC)
Message-ID: <20230621223311.2239547-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hwAj6JtqDVdUtl=2Fsv?=
 =?us-ascii?Q?EfHTEBPZGZPV0oT8N0cvVyWZgOlphJJAE1JguJu?=
 =?us-ascii?Q?Hu+WRw0387JHRl7AW9o30oWLdB+uU36mi70pbpQ?=
 =?us-ascii?Q?3JKqIuLWk=2FbtrxJ9a1kNFsa6MHZE6QlrmPy3RV4?=
 =?us-ascii?Q?LxuC+4dQun3E+XsnO7akfSQPg4YiOksDaJgvZbu?=
 =?us-ascii?Q?R3boykbwj7C82AVDe2aSA=3D=3D?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes a reset of state in duplicate state crtc funcs for VOP
driver, a possible crash and ensure crtc reset helper is called in VOP2
driver.

Patch 1 use kmemdup instead of kzalloc to duplicate the crtc state.
Patch 2 change to use crtc and plane cleanup helpers directly.
Patch 3 adds a null guard for allocation failure.
Patch 4 adds a crash guard for empty crtc state.
Patch 5 adds a missing call to crtc reset helper.

This is the next part of an ongoing effort to upstream HDMI 2.0 support
used in LibreELEC for the past 3+ years.

Changes in v2:
- Handle possible allocation failure in crtc reset funcs
- Collect r-b tags

This series is also available at [1].

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20230621-duplicate-state

Jonas Karlman (5):
  drm/rockchip: vop: Fix reset of state in duplicate state crtc funcs
  drm/rockchip: vop: Use cleanup helper directly as destroy funcs
  drm/rockchip: vop: Fix call to crtc reset helper
  drm/rockchip: vop2: Don't crash for invalid duplicate_state
  drm/rockchip: vop2: Add missing call to crtc reset helper

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 24 +++++-------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 39 ++++++++++----------
 2 files changed, 28 insertions(+), 35 deletions(-)

-- 
2.41.0

