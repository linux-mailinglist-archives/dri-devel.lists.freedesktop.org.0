Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80400A4ED93
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EEB10E287;
	Tue,  4 Mar 2025 19:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="TWmC9bxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B899B10E287
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1741117158; x=1741721958; i=wahrenst@gmx.net;
 bh=nttG8vmBl5S+Jbhyb1AzA5ak/FY/MEYHVfIHA12Ql1k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TWmC9bxdUBb1UQ7aRDiDhKOJw6NNdS3oUOKktVGaTpx2JKTCUeRzm3st0UkInpZF
 4uvscPTVoJNEOerf773XsofWDkbpba3uIclb7OEyeelnXeJTmWZ4YwaPFU4tUKi3p
 FQCE7jxeJ4uDtonDt1+n0lp8e/dWoNvplszFpDp15AEduWDMCwLRUNJBbkgTj99j9
 ny1LiW5HgEKRThIoNl0i9VJSLXWKNXf3ZIe1bX8geZXru0jpPgluH76//XR8TMF8T
 kyifaNKOs8LSdzVdxWP6udBWyngHcGpiPbzTUCYeD7b3KsXOgxSjhbIY36HR61Xis
 g5nqoZUViWEkycyxfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mq2j2-1tT9W824Zu-00bxGt; Tue, 04
 Mar 2025 20:39:18 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Turner <david.turner@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com,
 linux-sound@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 0/2] drm/vc4: hdmi: Add jack detection to HDMI audio driver
Date: Tue,  4 Mar 2025 20:39:10 +0100
Message-Id: <20250304193912.5696-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pgft3tmVLQxnaN4zBdoWzVaA9S2qlCn6ewUhl8PuTqP5foMOnBf
 jhtaCl/cXXfEEFv66MZkxzSsITzIBQbBMGHgcsFB4Y6N/q8TmTK15INU+rZVHePi+0rkOkI
 au4AuCUrhVb7ElhUpMLt/N1YchKlA7a+geEKtgSDQ52RPprZ6PZF2YUQoPTe2JZTxMPrmoN
 96isYefB9Y7NscV1N8Umg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t2XkcuyXQRQ=;2COnGbiAtbnjgH/Z4HKWr1kJjRz
 KxgHTtpgUvlyyJ5HLBxIkh1ejwWxloK5BNK44s9hLcNaKwXGZOYQQtbeeA029G3Yi841QZq/R
 SUblD/cpNEDBLQJIWNRSyvxunBRQ3Wf1Wqe7UfoasgKDRJ6zMGHCyrqUcpCyZBrIMF6r0cx3c
 u4YM6eHRkJFUNPGG6uPG2zE19KS29hfDHWKyfGep4BywzooJj/pkA3Rzs1zsc0gPNUmPM6S/V
 UO8y8mqQf/w0fmWjrRSvHvCpp7dT8022jyylrEpqGU8RjOVrMM+6knQEDMvas588xVLW3JJfY
 tj1QWMUkmeANnZiA6Ymxu+ujTqkV6zq08EcEG47bhvTPJhPI3MacucdAhDePDXBpkjWYzQ8lq
 TcT7cyyZ7nnlpsC9tTeo1nrHqhaGU0jVlbZdedjluZ3BIJvbDxf4MosMa6x8acRwo8CJEfksU
 /IN/bCYXuWPXQ2i+8cYheFU9QXVULpyfjTvhTRkO7ji3QeOE6XF/ltLMnR+H64/r7QuhPbLq0
 qcD8yXo6UTdJvD1qbrVSi2pwqIt60BUoTqGNRgmKikBL9+QnXRYfVFgG+xsQhu+4c5xLSkjVg
 b5la5VDvGplkDO/rwmm+DGCLArGM9Uerl2v3D3suh1P92ZLTr5VApypXQTJeczHvXEnbstbSU
 B5P9ZXTobUaYJvJNBnj+O5499Q0iycm2n9Uc0IlanbSTuXlJ75C1A7ZIsOFp27+kA/Gy0E9eq
 U+FBYvPg6/5CyAY/1X2XaFHHMroNjBUsvoB1mLJ1sfDDAyRyJp56TL0FmC7vHSl7V8irxtqbh
 HnFf0oTVteUMxdAAPCn6UhIGcZr8yGtTOpFCQo/MoyppMoD8diAcjkZQ5cp2st8VYSyKKgiy7
 HnXYZM3ouAy2FcWjvyeisn8dIbAfqhofGQ9Sba05e8ebfLPz5yX8z5VTndrJqt0HD9/9eVlK/
 cqfSY9MhRpSuFjUBCxh1kg+ZCd/vnwEG/3V7HqqfrrycKzzGD7qfELnwmMTUVOJO1f0mLCz8U
 Qopm5zPeJ8GGq2wQywklzJenvI45iDZRsYXApS79tLbocqMjMABMS9QnlHSEvJHkWNmYk6jd3
 MVAGhWcx+4Dor1RnrYbBRQ2yDMpV55enS+3juUUeYGsHQP1CcNbAkjRl04a74w5NrXq0zem4a
 iexaFzJgspJ7J9LGQoVrulh/0+CGNvptYvJ1YUZK8XpOfY1iRGAmXG3ka65zdCoeRrU7/pVsc
 XSTvW0gTTU5rrlCoLbc6Czlusp3+FE+BFRFFx3pVNtHn3UNghxRIenqAIkK3HJ8Jx99ww7/SP
 enEmlZQBSdOIrJBqMlmMqn61VRZe66UHed5J+VeNTMU1miYAq06pzRRGY1LdzvhRZI0R/z11L
 1METFCl4WP7U/l2kfx9GoayMlm/T8389IpHptiVGzft1FFGuHpENKfTVkU
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

This series ensure the proper jack detection of HDMI audio.

Changes in V2:
- split initial patch into fix and jack detection feature as
  suggested by Dmitry

David Turner (1):
  drm/vc4: hdmi: Add jack detection to HDMI audio driver

Stefan Wahren (1):
  drm/vc4: hdmi: Call HDMI hotplug helper on disconnect

 drivers/gpu/drm/vc4/vc4_hdmi.c | 22 ++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
 2 files changed, 27 insertions(+), 2 deletions(-)

=2D-
2.34.1

