Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1A32235C5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBDB6ED38;
	Fri, 17 Jul 2020 07:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6954B89B29
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1594903092; bh=qYblAUDIZRO1zNd6viLmd487utSDKXeq71xAotYuRG8=;
 h=From:To:Cc:Subject:Date:From;
 b=twsJ8dEYPvij0y+AoCQWI6o/pVtQvDIcj3LZsx/fOE5i4Z04daXViaOC8tLUCcaiM
 5hsXrmtHlJ1vhTOfwZ4apIEonmeA5qbNcz/hHec+VEJ7h4Y7GPpat90ApH78CYsxuE
 uBk1Rl0P/nqZIO7Fs0HJx0O9g+jIYUE8crInr9Zs=
From: Ondrej Jirman <megous@megous.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 0/2] Fix st7703 panel initialization failures
Date: Thu, 16 Jul 2020 14:37:51 +0200
Message-Id: <20200716123753.3552425-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When extending the driver for xbd599 panel support I tried to do minimal
changes and keep the existing initialization timing.

It turned out that it's not good enough and the existing init sequence
is too aggressive and doesn't follow the specification. On PinePhone
panel is being powered down/up during suspend/resume and with current
timings this frequently leads to corrupted display.

This patch series fixes the problems.

The issue was reported by Samuel Holland.

Relevant screenshots from the datasheet:

  Power on timing: https://megous.com/dl/tmp/35b72e674ce0ca27.png
  Power off timing: https://megous.com/dl/tmp/dea195517106ff17.png
  More optimal reset on poweron: https://megous.com/dl/tmp/a9e5caf14e1b0dc6.png
  Less optimal reset on poweron: https://megous.com/dl/tmp/246761039283c4cf.png
  Datasheet: https://megous.com/dl/tmp/ST7703_DS_v01_20160128.pdf

Please take a look.

thank you and regards,
  Ondrej Jirman

Ondrej Jirman (2):
  drm/panel: st7703: Make the sleep exit timing match the spec
  drm/panel: st7703: Fix the power up sequence of the panel

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
