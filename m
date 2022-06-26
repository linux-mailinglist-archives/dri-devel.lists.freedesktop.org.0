Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC855B127
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 12:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015AF10F5E0;
	Sun, 26 Jun 2022 10:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA3A10F07D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656239334;
 bh=6FMz1q/r/DAih/u9OZLjWLsVgICw9dj2mpSsg+Z22LA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=YMSsux6rY3Y/F+aiAYw10E3BUWjmWgCa9LYgE8ssC2BttAbWv+kxh7HtgBcxj+7yH
 aNYjMn+q+vV+gPqnIcSv8VSekTjxrmCor/Pxz9YoVaJH91guPpb0LA+WGzqPmEP+bJ
 ddUgHT8nigv2PzArizHxMIb4GUooQkMm+F38yY70=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1nmvBi0mrs-00uGqh; Sun, 26
 Jun 2022 12:28:54 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 0/4] fbcon: Fixes for screen resolution changes
Date: Sun, 26 Jun 2022 12:28:49 +0200
Message-Id: <20220626102853.124108-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PDr0eTrJLxqcCdszeCVbYrZ2RZcX0CbB5azTL3ImCEC3Ki2QHQp
 aOhcXPx/ox/nzn5W7lsEPxOg22pZ8ZfiEr3wJvDXlF9chniwooj3ZoW07m3PI7szZRHxLJl
 N0dA619IpY+51ObWZN2elV01DB1ZBklfp7r/b4SuSpAM3RH+mdoZdB45Lt3nIqFsCgwlZOG
 JGluTnxBxXMYwOEAi3Prg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mPsWKYee2Ig=:/l1Kz8h8L6BmSTUbb1c0iX
 aU4uavCrhzios97qWC7q7ipEVRoTOKRsmH2xvrgICRsjF0nXEl0dlnDLTU3/27Vwf7P3ur36y
 mIeyT/qKQxAhTuBsMliYWR9/gIUyktvuwSsh4PA4pAdgHeGhtPKB23ONWR6PA5HrR6SxYAkbE
 Q8ci65aQVOPwRfAJJMw/abR2AJZ76V89ekWr90tK2weovfCNUODemiAGc5Rvz1g+VLSSDb2wM
 OPL/NkvIrJqazvBuvEnk3QZbK1QCLSlFSxWHZEMiQAcl0dKSiNbirYiYnmZenVpXKDBJFYcex
 7jayPDWccqfqbog/sqJj+uDHGBCeCHc7AABoiqsgoFDaJcLPFR4AnlczX4Mys+dQTNtMgC3/b
 adZdLumjavOwmox8PVyfIIKcWItInOizjSvEji+xPq26zcKZkOSnMsEMleOS433709Ni2nFFE
 rhi+xJ5j0wzg6gL3a60nvSs8a4mGpYKVBInpYGR9pYvBV+WESR3A6JjR/MaT82bqSm+7m6+Aq
 mYSIUaA93S0qWjdjpocX64GfRrIq2iLWpGRfPJpccTY3T5YEO7RmSRBlAu+qwaEjiuZoTuYXe
 yinzlX02VEwfd18AT1+K0eB8fD0wgkkqUJVeqVtxgdySc1UEnEcruJ/xE0M/eVnHrOxnXos/o
 v/rU08G2PA+ys/CyiH2l3OMZE865vw/WRnt+F87KlFAuMTr2HVZ+7NC31YPMDGvVVGOviDnjE
 ps6PwWmm+4UtnnWfp8GLDntCb2pzAc/T2/q6sxBMsdspXzRiSc6LRuza0FP/NU+nwpgczBfJ9
 Vh6SLFOBGD2Xb7HqiY07bPMvJBs9KB9cvt6vNwbC1cGVY8GoEkCKFBVt1cbXQiEotqVmRtqVc
 rfEaUkoCNIXUEu+tOnV94IQ2PJdnzZTlC43seB6KHbArsSToNp0jsh1hlI7WmY1MTzrDoDBie
 loKS5zem5JY2tZ3u2iBlCj9/+ix12eaKtvT+e2ZC5SYD34qTewyebbxx0NabRJp6YOG49ZVh/
 0e5MTDhJoy/JI4WLIzSx8KpUJuzigpQHyycSw5u4icjVbvCEajCKODKQxdfESUkKI32mShIoZ
 HCvAp3iSwMzTnuu0vmyL2XQuWMaP6A+Ok70aSc03wU/Y/sNyrpKhgB9Lw==
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

v6:
- final version
- added all missing: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

v5:
- swapped patch #2 and #3
- modified patch #3 to use registered_fb[con2fb_map[i]] instead of
  fbcon_info_from_console(). This is necessary that the patch can
  be cleanly pushed back to v5.4
- added cleanup patch #4 to fix up patch #3 again to use fbcon_info_from_c=
onsole()
  for v5.19+

v4:
- merged former patch #2 and #3
- added more Reviewed-by
- new patch #2 needs more testing. Note added to comit message that
  another patch needs to be backport as well.

Helge Deller (4):
  fbcon: Disallow setting font bigger than screen size
  fbmem: Prevent invalid virtual screen sizes
  fbcon: Prevent that screen size is smaller than font size
  fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()

 drivers/video/fbdev/core/fbcon.c | 32 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 10 +++++++++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 45 insertions(+), 1 deletion(-)

=2D-
2.35.3

