Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558D98EF6C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD7189DD8;
	Thu,  3 Oct 2024 12:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="TQFFd0Hh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3DD10E830
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1727959273; x=1728564073; i=wahrenst@gmx.net;
 bh=ZPFFWbuNVupi8sMTsNAN+BnTNBB8RjH71KlW3x1l+1E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TQFFd0HhEGrovyCC+NiGb1kek0b4QJJbkxomtrYBnEAhxzg4czag5kKvZP/BSZD0
 anEHp+/6xuGLv9QHyVyzaG7mDKJ26IXZTXKyZzkjS2esbOKTn/Z9KBprzDW0X/EvQ
 Gb2kGG7LigKFXy9KXZPVTJts8KY19K4SS8jxDl68Gw4jPt/p4fmp0ek4Q0gJ4kQ2O
 o2aMP1dbWrCZI4tjrd/ygelEmUVijdXViV3Lu7PfXXH2tThxwqXNnXrjeuKY1mwp6
 ZfhwOeGS0UMrfRNuWs820TMsKucAKWMw0RAssFIxRMbT45CZmN01sQwtTqDWwfmj+
 XsfeAjeRuxwSsaA3gw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKDU-1rxlo515WG-00v3Gp; Thu, 03
 Oct 2024 14:41:13 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V4 0/2] drm/vc4: add PM suspend/resume support
Date: Thu,  3 Oct 2024 14:41:05 +0200
Message-Id: <20241003124107.39153-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mQSWsyZRXoAoP/ppRruepaJwWNQWpfrerlXaJS9R504ofj2/866
 FcDvyH6ocEzWGpJCQXlpVRfIqcwuKIRLjc2/Clqly/A5KZVwiRoTJzfbbmgxqmmw9HSJlmj
 5UrLtyKwGFO3Ziwk2wvGcx75obFobZQvx68OOmZoC6C8imy5hvj+MRTWhERL10EjgWiafwc
 G9xS9nE+sqpV1IycpBesQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VU/R7y/ydKo=;3OLy1JNhR2+CW74S+STVT1m1zhJ
 7jVkcZEEyAaCKfnIZ5SK+XMO92vRO7Q1KLkOJ1ASp8fBnywNERO4oU4G/zr3+yG5d9yYy8s2f
 IH0sykK0JtRuAIigRgW4uvRJl/FwHcZjho3VhvspcGf1Q73ov9Y/aSeNaKAbpjO7ODbaBpIpD
 lEiApfrpr6D93BOtnX+6uMDZaNB2KtUd0hSqzNeoscmGMssHNY7inkDSmD1B5s6U0otARNay1
 M29WRcyrXuEYcJyMfpErx1/+RwH1c0u5mmd+j0rwdDRJGvgAS+wkYODzkL0ZBuIDAik9Kor2i
 HTS4Y8/umolo5uydvpi1F4N6obn/bJmE6QPoO2uRryPEqL6J0KDGe+V9G5WV26vUyev76sWGN
 2FMbQZZjuFp46RYWPw+CwABsGqsZ4kepRmtJnKivQTCdn6Qg+kjhvuRQfA1t+gpx22V0JAveS
 tNqPWEuIzUKEP1uidzpQ75VV5LZuv/QJR+xs52wroMRBGsEkiefLHThU1FmRNvMbT783YRXmu
 mLA5OMEOttlzrxiDJFZGzR6PLvVn/YirFqgdMgko+/jpMHwfX6oBe4O7N2oyDUpomSrWWa3nJ
 FPT+LziLuZDGCE44mY13QsMiTUkivkfL5+xvs4XsiiHMFns+1SeSQgSPeessO4xPrud5iHAev
 zPGo6+Pt2HoZVRDMsHXP+H55PTUSDNakWcZCJTxm+K9qmi8PTYTG8K9gvWPJkGEuZCmHa0VJD
 Jb1RgOhl9QXMYaJ6fIz8EqUnHNlynmySdTYGZkcbGqIGf+/Le9Wy26ayITprpPZfRcGko3HRH
 1C0c/UsPokH9t4XJws2bd6Yg==
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

This series implement the initial S2Idle support for VC4,
which was a long time on my TODO list [1]. These patches were
part of a bigger series [2], but after discovering a critical USB
issue [3], i decided to split these changes out. There are no
dependencies to the rest of the patches.

Changes in V4:
- fix compile warnings for VC4 & V3D patches

[1] - https://github.com/lategoodbye/rpi-zero/issues/9
[2] - https://lore.kernel.org/linux-arm-kernel/20240821214052.6800-1-wahre=
nst@gmx.net/
[3] - https://lore.kernel.org/linux-usb/2c9b6e0c-cb7d-4ab2-9d7a-e2f90e642b=
d1@gmx.net/T/

Stefan Wahren (2):
  drm/vc4: hdmi: add PM suspend/resume support
  drm/vc4: v3d: add PM suspend/resume support

 drivers/gpu/drm/vc4/vc4_hdmi.c | 32 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/vc4/vc4_v3d.c  |  7 +++----
 2 files changed, 31 insertions(+), 8 deletions(-)

=2D-
2.34.1

