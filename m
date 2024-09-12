Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28323976C6D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E035210EBB5;
	Thu, 12 Sep 2024 14:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="n4fvNnkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFEB10EBB2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:45:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25CC76000A;
 Thu, 12 Sep 2024 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726152315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sRc3VwtGYL0gsq0Xr7ftt5JyPAMGNSaSZ4rOKlqDh/8=;
 b=n4fvNnkZaSPQjOSL6JQvqAuusnML5ebXtNoYDB/lPWCBokq2sVXiHfEuItPS9Oen1Iyq/e
 V0uiYS1yTA6+8S1YSTvAHXxGlgAL+BStSeXE5I+TdRJraH1Ah83SXVlhMluL39NFSj7Zpk
 wiYJom7QmxtBLhza7Dlhx7pW9tu9uorNT/KzKIe+NcoelSpgj9PD3MUPy5D66VHftKYNR9
 gJX8ONxJLq7ZpIC/7HJ/Czmexe05SZ9QP6G7MSPxVA8MWssq7nP8rjQkdf5wHdiWJPhf+I
 lCrbFKu5u8hU6c91cLABCof7kTlPw/pgi9sRJos+/j6rh6weEaIJUf4XmDnMvA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 0/3] drm/vkms: Switch to allocated for drm objects
Date: Thu, 12 Sep 2024 16:44:55 +0200
Message-Id: <20240912-b4-vkms-allocated-v1-0-29abbaa14af9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGf+4mYC/33PwU7EIBAG4FdpODsKtNttG2N8D7MHygyVbIEVa
 m2y2XcXiyZelBM/k/lmuLJE0VJiQ3VlkVabbPA5iLuK6VflJwKLOTPJZcN73sPYwHp2CdQ8B60
 WQujN4cA70+SjWO67RDJ2282XU8mR3t4zvZRHNqpEoINzdhkqjA6cTfrh5wKetuULcpSS2jcYq
 sfvBVr4iNkZlT5DbnCwChDABSHVshOd1M9jCMts/X0e8PQ3s38ikgtrrnikrUi1NoTYaT1K869
 UICFhCmGaqXhO+VxHWGvgcDzyDluFspX4m2Kn2+0TrjTDrHgBAAA=
X-Change-ID: 20240909-b4-vkms-allocated-9f5508f4444a
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DJtide9Jzjo7xzLEbQ1hqll1mGNb32LeFEvvvPsaq/c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm4v55jd/8NFiAdt4fYy1mWFX88gqVwdIDb1zKQ
 Gd2/iD019WJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZuL+eQAKCRAgrS7GWxAs
 4hGnD/45Ar8UrUJmKvk+bpXsCxh8r1ONAfVSx3b5JLMPQ6NI65kg9/6OXaEIEt38dRx6db0lHx6
 in5DlajBjH7vhFcg6HFuGMikUgJnySYj+U0oIb8vv+BXcD19vVC88mZfaHylCxYWbL+r6blrp4W
 nEmg/3v3HyxBsaoEY4is9NXgLIz7WZCrdQR8uh4F3xO0TfgdRQVx2zCOGENjyC0DUJW13aWrRcF
 tKfw2LxxqqB6exeC5wfQ3U227AKaq5YqTZwArblDhFPOH2+g1CyFLlA5Eh5qbkCB35dy647Ob3v
 pXHefL2B0lVFRt22iYZp4fWwYiX4sB4AN+CPVuYIkK8B/21nzeTvstlilBbet1p++YftPC9B16V
 qIzAywP7qCbwkPO6+JG7PO2w0pr5jmL13CTHfZMIC5GK17mhWZmCfo/TI66Z46BHuiNS9Zr+Wqk
 EieX+6DdNqNfJ7QCPDiNrY9Bdohp9HWR+doTTSZiX9fbVGA9HqsF7ppo+TdAkcb0vmZkLtbM9Ki
 XdgWSXMl0Osn43bzlB3VhevEbnLAyqbQqlemB/zyHctuXfszgeTuSEIZuokiiUCvVSkDPU19JXB
 T9KuYR8qDQ8sRnWcWvhg3XkUmQCJnnNc/CCsgmiSf1he4ZNCS9uWqYzKmpbSkhx4syJDkTp3viL
 Ky7kU8tpvw/0TIw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Specific allocations for each DRM object is not strictly needed in VKMS 
right now, but in order to implement dynamic configuration of VKMS 
(configFS), it will be easier to have one allocation per DRM object.

There is no need for a dynamic allocation for the writeback connector as 
there can only be one per CRTC

No functionnal changes are intented in this series.

This series requires [1] to switch vkms objects to drm-managed objects.

[1]: https://lore.kernel.org/all/20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (3):
      drm/vkms: Switch to dynamic allocation for connector
      drm/vkms: Switch to dynamic allocation for encoder
      drm/vkms: Switch to dynamic allocation for CRTC

 drivers/gpu/drm/vkms/vkms_crtc.c      | 28 +++++++++++---------
 drivers/gpu/drm/vkms/vkms_drv.h       | 11 ++++----
 drivers/gpu/drm/vkms/vkms_output.c    | 48 ++++++++++++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_writeback.c | 17 +++++++------
 4 files changed, 61 insertions(+), 43 deletions(-)
---
base-commit: d2194256049910d286cd6c308c2689df521d8842
change-id: 20240909-b4-vkms-allocated-9f5508f4444a
prerequisite-message-id: <20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com>
prerequisite-patch-id: 93bfa5c36385932ea291789faa7356639d9e4bfc
prerequisite-message-id: <20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com>
prerequisite-patch-id: 130816a16434cafa13b7a2b629398a20782be3a6
prerequisite-message-id: 20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com
prerequisite-patch-id: ec4384a6e16b63691ccc54a71d304722e33443bc
prerequisite-patch-id: 4c4bbad8522d8184fb3e6695a98fdf34c2bf784c
prerequisite-patch-id: 05df4db485c1454c432e776421b056e3a9c51d7e
prerequisite-patch-id: 30a1e033fa43241ca6a43006fd4f29f8e9217224

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

