Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D8563ADF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566F918B2A1;
	Fri,  1 Jul 2022 20:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7528318B29F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656706927;
 bh=Z1UEhgmidaXi4/WieoYcUBXq92uqjzRZY9cnT4LiicY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Kp1yHfQjNo7rBW23+htBFe83mh84igYKKK+i9N55ZfMYpMDtglqwPIJMwE9nf4gUv
 Mbylo+sONHxlPme0ghepHd2ko+q1Cps/G+SN6D2RjF+uL2koD+jq9U4jjsFcWBIrnz
 ex72uBaTMoqHzpPnOu+Cg8gLAbXIoCb4kAhGN+eQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.182.192]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBlxM-1nvJNz2HSm-00CCKr; Fri, 01
 Jul 2022 22:22:07 +0200
From: Helge Deller <deller@gmx.de>
To: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] fbcon: Fixes for screen resolution changes - round 2
Date: Fri,  1 Jul 2022 22:22:02 +0200
Message-Id: <20220701202206.559518-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OmQJBfMnsqefpv8E+TLa0o8TjaauF7fi7ryiFR2+7ot9gr03a/I
 WQ3Y2o3eduCJq1evGGu/314HNsNILW5BJTmEmTXrYq7GtLUrYnqF5xyMf1vN7FL6gZM7kZH
 evvjrrxUWASsG727GY9l7MTLhfA43toonCOXlUb1+PlEJsfSzHlJEmXrvtVxb+HX1ubBfR2
 1/Vz7vw0V5+VEfCxzQ1uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1fJKAjgRHek=:YndzbJHipozQBfOjg/wqpx
 pZP+vu87DERrHcO63/Ah49EcdlbxDICwiBb2PyHevmYYTvtbIzz5YeyH9tGTX7vrgsPWr/YH/
 JEQLvgz/2KvRue0LvpvlMFnvuYe9GS8Lnm/RfpBCeSdXiPkPsZOl0xUIJITafajvEQFSvTsSt
 II9RyFhXwV6Tjbu5O8X1sMfJfyX5xBxGI4CBw3LRQtFbwRSwaM/O3HYirjxBprx3YKzWKHj1J
 c308chraDcpSakKmM639QdT2SMooYQPx50hLT0uumazZeNe4oZGbzuV6xqQOKh1ApE0EFUeYp
 4aMX441kwNOHt0lFBpb4Me9HwkL/upTCGQNmMX519P6MOuoSOSOE6wX7A3J+EreXoSG0NBlWx
 BBqF8g5Un4kteozHkk6C3ikEypJlexTp72VQMRBI1Moz2jDTx5/UAVK+r2bMG49Fm3gVkap2+
 TUEIUuI2T+iJ0wUrhLnL8o5xgHBTbvmJQVuJ+UzQkv+OM82L7qmkEeA4mpy+0GsW1yln3jRuH
 DkmZu6e7JyMn9sKIAbQsziHp7LBoexCItwgVl8PsEMGmPsxdc3uueW45xxQL65i7BaI6do879
 B5Bs4BNe+OgbblDA3LkgdM2Itagxc9gVfbbEVeP0Sx+LgOhTP9Iwl9p11up8Xq50aqHud9oBn
 O6cRBIzWTK92kKRIemvK2ebiHI1CY/WjZ8v3I7JtMmtXxs5xlcGfnso4nfQyY35d6jE94+O83
 rnIXo3+d4exGzDaRJJk53j9Cb/JMKEzkqZlKnd30OyWYtLVDHgVlMo8cGQDxFLCDEOzmMIdAs
 4IG/Xa06UBp7/cIUVmMNmEMi9Z9GLF3JOkPsSaLr7S9NqWkTs6lkwc4mMIR6zZ0B6l9H7Fuqk
 259OfiQL7Lkam+IaLm9Ar52K4oaSWrHdgPqmnuoeRVDrIoHja5YlEIu9XzI4Y05nMFlh9ga4o
 q/xLe+BIdaDPcgL5NAbDGtfod+ZeqXnjy0EeBOEiUKI1xqLcBgg/5YQBjV02teErZB3sQ3j8W
 kwQtt2YXHZ6i+s/RbLspyNSPBnjVFuocdK62Whqte1sDhBmJWiNoJ5Qw94qdHO0FPgLtRKNpD
 VyPO6tQAFVxTHtWt56BgBvEBms7vonORXhps/01S6acBMZwgv5bkfzlkg==
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

Changes in v2:
- don't fixup wrong xy_vres values, but instead print warning.
- add Reviewed-by tags, minor variable name fixes

Helge Deller (4):
  fbcon: Disallow setting font bigger than screen size
  fbcon: Prevent that screen size is smaller than font size
  fbmem: Prevent invalid virtual screen sizes in fb_set_var()
  fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()

 drivers/video/fbdev/core/fbcon.c | 33 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 16 +++++++++++++++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 52 insertions(+), 1 deletion(-)

=2D-
2.35.3

