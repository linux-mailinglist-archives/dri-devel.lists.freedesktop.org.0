Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B92674A7265
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8DE10E338;
	Wed,  2 Feb 2022 13:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC3010E338
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643810132;
 bh=9kPU2SgWIl2EzJNwN4/tE9rBG4gYJqWzuyVOZfzz6uM=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=SlEb6IJoXKAm+U2H0YtzCnntK6PkYt6udTk8afaC8dGYr4S+gz2JZlvCEm0nTzv+3
 GQKXRLbN1ZXfGqMvXcsqxtupPgdRzohdV0XPGIGayqjHi2U9NHghTkR3MOqsAX2M+Z
 VHORuUKys5RbAOPyZVSh0TFccLV9ozjyvSEyt8Rw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.163.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6lpM-1n9DQY1VJG-008Jeb; Wed, 02
 Feb 2022 14:55:32 +0100
From: Helge Deller <deller@gmx.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/3] Fix regression introduced by disabling accelerated
 scrolling in fbcon
Date: Wed,  2 Feb 2022 14:55:28 +0100
Message-Id: <20220202135531.92183-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nnGqynUr7n1KN1v8NmrpEx2V/sKRynbcFTjY/ZnC29V/hPI9t+x
 6oltBpYzf3LNuSCM2EdUclQk362M4o5XtyKj506kKzq6fJ8r2sxjVlniG7VM0/9eSPhZFS8
 rsJa2yUI9ZmTPD0rLJx9XPpHplYvQfNHNXUZp/Tqk/tNeNNNRcyvMxuFuvZNlYsx8PgoUBF
 O2uQnm6Gmx6F2UwigiKWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t6QzmaGKEdg=:WadYA2o7BhHzHXXZ6B8vD+
 VzlL6EiDhAdUL3W9aCk9nby8kMVJkCyfaEj0fmOnxXUCkZReTXXE+xAK9tgCGfAI5wKMMWk/r
 qhwRTdXw/7nH/an/XtX2+rs3e2KyozSURFFMnx9ymeGWa/wTPH1jgVCclyR1rJpJQgC1zW3H0
 is4RIpgduTx5EeHqKP3tUGRIIeFTgheO1ZHXKYz7cguVHsPafsI9PRJpEIpvi0ktUPo+fX0mn
 9fACs/Nf3WZrnnRZHNaowUyXNytNNGXOu0pimw7N9S0pnfpFQUDyqFDpARnzM28a0RdIDCUfd
 +Zg4XnvPl2cRfiGH+DkndPst2CG/w/cZGhuzn2DIspannSZNHiO4aKuvbhpBVI7ZBoOYeeH8d
 pzzgRnhvwcEKItZgGBYv9KlXOy9fuwnK8vFQxznxjI+GocFbzPkeWLeVXi3CIjTiQ2egDJYnz
 cJ7Enh6pF6vP7ZzKdZVcHu2vfO4Dn/NXjBAsniC/lqPPMt8qJnaOrqzWVk+5a1v5cQ+I9dIXU
 ALUag0+TTk2UJGFaHRbPdFnqHUbqXz2iTWowvaX6Y2J81Eq9V2+zQGZCrTaMlRY58VcQ833r9
 VvVLG3PBiq/B/dsBX1TqX2yoB4mtmppkm3jNw6iyhitPq+Sl5uO+7b4NKrz7HXx4OFXeVcL3l
 2kPnie6N8r8/SbCt0Tok6++RGghcRaUhF4LkaRWY4e+N5VTR0gltc+PrQBqyb7eIbgUHr1QGe
 /ZtukWU/JNfQm9OfEohx6QV720cTPDJJKqY7cI8lg57zH/u1U6szbYp1Farj7ZkjRDWyGG/2x
 645N+2QUYLtf9hHhoITMoEBE6Ftc92scmedQDIBAvxlqy7NpH0gdrT5UsJRdXejV89GqKxVHP
 XzdNfC0DFT4OFS8GdBXI5r+NrO/yEugyV/z2/3/XR5oQUIShEGipYrpQrX0v1uS1m5tqjOosK
 bcR1MaxVx+/8ErhtxbyAAmHk3KRzLI3b/iTM9xSkRTwPCxge58Q7sN2BOIHJjNYMIMWnGs+zx
 +duZEALKgVGvuvgQlgowMURZoPQOwqmzvG+tD+h5JhXY+jxSQKZIjmqZ/++saq2G3+fcrbh5z
 s8hTdafn43XXUc=
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

This series reverts two patches which disabled scrolling acceleration in=0D
fbcon/fbdev. Those patches introduced a regression for fbdev-supported grap=
hic=0D
cards because of the performance penalty by doing screen scrolling by softw=
are=0D
instead of using existing 2D hardware acceleration.=0D
=0D
The third patch introduces a new config option=0D
CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION, which -if enabled- switches=
=0D
fbcon to utilize the bitblt and fillrect hardware acceleration in the=0D
framebuffer console. If disabled, such acceleration will not be used, even =
if=0D
it is supported by the graphics hardware driver.=0D
=0D
This series is being discussed on linux-fbdev and dri-devel mailing lists.=
=0D
=0D
Updates in v3:=0D
- respin with fixes to build rotation code=0D
=0D
Updates in v4:=0D
- changed the Kconfig option and Kconfig help text=0D
=0D
Helge Deller (3):=0D
  Revert "fbdev: Garbage collect fbdev scrolling acceleration, part 1=0D
    (from TODO list)"=0D
  Revert "fbcon: Disable accelerated scrolling"=0D
  fbcon: Add option to enable legacy hardware acceleration=0D
=0D
 Documentation/gpu/todo.rst              |  24 -=0D
 drivers/video/console/Kconfig           |  20 +=0D
 drivers/video/fbdev/core/bitblit.c      |  16 +=0D
 drivers/video/fbdev/core/fbcon.c        | 557 +++++++++++++++++++++++-=0D
 drivers/video/fbdev/core/fbcon.h        |  72 +++=0D
 drivers/video/fbdev/core/fbcon_ccw.c    |  28 +-=0D
 drivers/video/fbdev/core/fbcon_cw.c     |  28 +-=0D
 drivers/video/fbdev/core/fbcon_rotate.h |   9 +=0D
 drivers/video/fbdev/core/fbcon_ud.c     |  37 +-=0D
 drivers/video/fbdev/core/tileblit.c     |  16 +=0D
 drivers/video/fbdev/skeletonfb.c        |  12 +-=0D
 include/linux/fb.h                      |   2 +-=0D
 12 files changed, 753 insertions(+), 68 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D
