Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D8560AC1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 22:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FE010E570;
	Wed, 29 Jun 2022 20:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD81610ED97
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 20:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656532825;
 bh=+PhE9gEb0wg52MazwR2KFiYIHZksA16xFvrhrwFiyUo=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=SvhoyemmIjtmO4igUqb5PX6RVybnQ391V9C+asZNG4CV+ZfwqtywzzJ+NAj4ofMkD
 ik8+jI/Ldhbe6rUzNeEwlgB51A6GP3zRXVxK4nrMNB5GKm1SRDb4Ym9XPoj9H9r5xt
 12rkB0XD6ohVfQQH7SdfuHuT5ignhPOZZQcL8wJY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.51]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE2D-1oMvFy0vYh-00Kfcr; Wed, 29
 Jun 2022 22:00:25 +0200
From: Helge Deller <deller@gmx.de>
To: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Subject: [PATCH 0/5] fbcon: Fixes for screen resolution changes - round 2
Date: Wed, 29 Jun 2022 22:00:19 +0200
Message-Id: <20220629200024.187187-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pvJPcA1LYSqt06HvIFX9cBbCycAVwyAe7HfD5+o0Z+mAdnqNMtM
 YYhl7x45j2i5u89w501lC5jUJDxEP1LIxh/4XI3HCumUo+7FvLwVIRINGpbMKICbKn0CjPq
 AxUZKKSIyaZI/lpGRyGJkfBwhQcWaOkEWB0yY767JnJ4LD24TbF5dUxVaI2upAEBiD3QN0o
 FtP1sHxYRKZloF3KX0Q/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sgzMoBZ5sIY=:avfGKEQiMPMbqdaGZa91BA
 qqEsm9Bstp5jwmyPVldQ/wN/vOSEIUiqIeDp8QMZt5aJRbif8KJYufdeTMFo80+jbfqfHrECc
 XtwvJlKYp4CDUD0f6YQg/aXVAlyyoe2ChoG48q7Qn1vkEVJqGGnxeh9L17dU99uBtR1ITZdxU
 67WZ2ZOqckzOXiyo8QpNN9t/6VEx4KCOS2dwCKdIjYZm3hShYHahAgTjQ1gaBDJ3meqF6j/TK
 E5lioz6M5/gLcr2StjzsZaJk3ClMx/9wZ0i73tjPPXAEnrPiMj94g6o+VKGucEXEdXWZxMni9
 yNrXh447/a7cL4gQHxf9w9MNQI7qhtQ+/jsapewfjkaXpAiDb0K5eZ9C+o9jcXj+w4yx1lNNO
 gCs5qXn5GR/LH0vFBON30iypNzTle9szKdZHl+qjhbisMDJcyfcLHelq9nZ0E/h4h3krJ99oW
 319S/ySld4rOQEzFL/1HWO83txPyIVY/Ur3c1kELEXpG4c1tVL7pAx0bpURITgOGXX1jBrI97
 rDKv+zEF+wdhWHQGfpVcQ9sa4JoXiPu/FjfUfjvMvsUmeaUgWzfwUb8F1gG1sik0NdAmPBFbH
 VkgHwYC2rXTXH1qDyXkDWuR30dZa29LdkQDgKfXNhUw09+QgwbSsrRxI6Z/ywkhejdRAYATa7
 qTYlMQXVrE44jeaF4Hii/vWrS6rwbpXGHpL+lCqDM3Zn7pzCfjDHBb0hZ1IIhUcc6x+ph+Uxd
 Svxe6Ps66sXCEp+QlgjuF0WjdIm9/8qqlvnjG/LuK9SpSQsibHkyeyc79DFYCK/9nicCNdenP
 Nj1tOfXzWWdjHSQ02IC7jUzazAQw4n0MJrCiCO8c1DKA2h5ZGqsZ2oO9+aCn25yuBBNn9O079
 PoTnubrmn7nV/yyqrUl8giNSwQfozpoT70vorILbLJNotg4atb0fYxtB9cX6WVn0wn1KGAZTv
 IrEyDBfcrNwlAGpY/t9mGDYtlvFt6p747XR03Q6iVjE/oQumVE/4iIvuYRV4TWSwb3isBPPQV
 15qzIQhJKsDIQI56CTEyM45T6rUnLnLMrpO1JW3Vw65Xxus8LR3WKjlxTT951HZPUnnoOAAKg
 McIaLI4wmlC0C4flBvlXT1eS40qdufjbzSt6j0JrRJHU1Jp1tLOrHs0xQ==
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

This series fixes possible out-of-bound memory accesses when users trigger
screen resolutions changes with invalid input parameters, e.g. reconfigure=
s
screen which is smaller than the current font size, or if the virtual scre=
en
size is smaller than the physical screen size.

Helge Deller (5):
  fbcon: Disallow setting font bigger than screen size
  fbcon: Fix up user-provided virtual screen size
  fbcon: Prevent that screen size is smaller than font size
  fbmem: Prevent invalid virtual screen sizes in fb_set_var()
  fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()

 drivers/video/fbdev/core/fbcon.c | 33 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 15 ++++++++++++++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 51 insertions(+), 1 deletion(-)

=2D-
2.35.3

