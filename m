Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B67363C6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 08:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55310E263;
	Tue, 20 Jun 2023 06:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvwxzv.outbound-mail.sendgrid.net
 (s.wrqvwxzv.outbound-mail.sendgrid.net [149.72.154.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833CB10E260
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:mime-version:to:cc:content-transfer-encoding:
 content-type:cc:content-type:from:subject:to;
 s=s1; bh=/OiFg9zrUL7FLkxH5IitcBTJNO1C0qlvkkDfhUrYB7E=;
 b=OSZ64m+wuJFPFHqsz+9OOHnUMY4g9X4S6PuFLitLVqb3QIK47vi/CVlp/2/Ip6BRgW7S
 rfF4R+6I83EwBwvit78rji+e0k0wojC2PqiBNEASIcvT32oOdLlA75q0t43Wh6CF5FxycN
 s/jY6zDsS3q29oaNqqm4cQAxn2tnV2eNNSuWoPnBUUkm7jMiSo+5rPX17EwGFlDvHKrsOH
 Iwm+aA4z10w0VaBrb8mRPWTpmWiy2chcmI6oQ/nBUI0H/CAk+WzdXJIMwfd1ZaCd0Y9gf0
 Q07Q1ObxtXy+5zT7Szu5tsBTL04cvGOAIGqedaH5Go2antUvLrSHQP0I41jzpqAQ==
Received: by filterdrecv-8684c58db7-wf85l with SMTP id
 filterdrecv-8684c58db7-wf85l-1-64914B87-1
 2023-06-20 06:47:35.167912827 +0000 UTC m=+3481761.974497447
Received: from bionic.localdomain (unknown) by geopod-ismtpd-5 (SG) with ESMTP
 id PBMypHKAT3KFA1SgmOnoHA Tue, 20 Jun 2023 06:47:34.794 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/4] drm/rockchip: Fix crtc duplicate state and crtc reset
 funcs
Date: Tue, 20 Jun 2023 06:47:35 +0000 (UTC)
Message-ID: <20230620064732.1525594-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hyjMKERdf95KMPdLE?=
 =?us-ascii?Q?AIYz=2F9=2FCZufW1gBVLLc0p++89OiAC6+VYSCZLnn?=
 =?us-ascii?Q?0MwskFyyqsX3ZLfdoaTVik4Smb7c9wcOdd=2FsjdP?=
 =?us-ascii?Q?joro9n7jG+ozm3x1jY7nz0IX=2FIU6iJKV42Ci+QW?=
 =?us-ascii?Q?N60TQOircB+zT0UHWpvajq+pvPVp=2FM6TkD8NI=2F?=
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
Patch 3 adds a crash guard for empty crtc state.
Patch 4 adds a missing call to crtc reset helper.

This is the next part of an ongoing effort to upstream HDMI 2.0 support
used in LibreELEC for the past 3+ years.

This series is also available at [1].

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20230619-duplicate-state

Jonas Karlman (4):
  drm/rockchip: vop: Fix crtc duplicate state
  drm/rockchip: vop: User cleanup helpers directly as destroy ops
  drm/rockchip: vop2: Don't crash for invalid duplicate_state
  drm/rockchip: vop2: Add missing call to crtc reset helper

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 19 +++--------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 36 +++++++++-----------
 2 files changed, 21 insertions(+), 34 deletions(-)

-- 
2.41.0

