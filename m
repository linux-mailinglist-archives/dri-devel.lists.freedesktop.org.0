Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAB31FA9B2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F9E6E82F;
	Tue, 16 Jun 2020 07:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19289C14
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=RMjlCTPUvJW1xCnOoDBBA4mwVvV
 x7bFOG969Q15EZOU=; b=SYydaonKX5A7C0B1a+4qFM1lKE7T4hIZFdE9R+5ioBU
 dOOeaOjQ69pzbcX6BA1gYstAhfc1gEvpILpV03n5BL9khDjYRlxzJz7PnJDduXzy
 TtJoCxH8ev12glMVgaCN8go3X4rAVq2RX7GLodVdpYjE3qrBwpILRdwcJxD9VSbA
 =
Received: (qmail 989091 invoked from network); 15 Jun 2020 09:58:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 15 Jun 2020 09:58:27 +0200
X-UD-Smtp-Session: l3s3148p1@h+KzyhqoBrYgAwDPXwRdAFnN6pRlEuNX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 0/6] remove deprecated i2c_new_device API
Date: Mon, 15 Jun 2020 09:58:09 +0200
Message-Id: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I want to remove the above API this cycle, and just a few patches have
not made it into 5.8-rc1. They have been reviewed and most had been
promised to get into linux-next, but well, things happen. So, I hope it
is okay for everyone to collect them like this and push them via I2C for
5.8-rc2.

One minor exception is the media documentation patch which I simply have
missed so far, but it is trivial.

And then, finally, there is the removal of the old API as the final
patch. Phew, that's been a long ride.

I am open for comments, of course.

Happy hacking,

   Wolfram


Wolfram Sang (6):
  drm: encoder_slave: fix refcouting error for modules
  drm: encoder_slave: use new I2C API
  x86/platform/intel-mid: convert to use i2c_new_client_device()
  video: backlight: tosa_lcd: convert to use i2c_new_client_device()
  Documentation: media: convert to use i2c_new_client_device()
  i2c: remove deprecated i2c_new_device API

 .../driver-api/media/v4l2-subdev.rst          |  2 +-
 .../userspace-api/media/conf_nitpick.py       |  2 +-
 arch/x86/platform/intel-mid/sfi.c             |  4 +--
 drivers/gpu/drm/drm_encoder_slave.c           | 15 ++++-------
 drivers/i2c/i2c-core-base.c                   | 25 -------------------
 drivers/video/backlight/tosa_lcd.c            |  4 +--
 include/linux/i2c.h                           |  8 +++---
 7 files changed, 14 insertions(+), 46 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
