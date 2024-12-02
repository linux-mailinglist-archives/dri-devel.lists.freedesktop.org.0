Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6479E014E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7CA10E04E;
	Mon,  2 Dec 2024 12:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="GKrlcZjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFA010E04E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1733141031; x=1733745831; i=wahrenst@gmx.net;
 bh=nWGDAmxiHyIBg8+U2A+dscE96ndlmhSiOSdyCCYeSDo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GKrlcZjFceQ7v4ieNhv0AwvOHZaLGi8yQxN8MRUiOij1q+tzEeYjuM/yyDu72oO3
 9GXyG/ObBNdRjKGVc2awYW0oAxG930SPoCbJLekAzJ1pcU49GaCOiVhDZ2X1OzlQf
 ddqNawt78CwyA6NlHG4ce6I93ZFiWLTVG2NuOeISR857E7mUOHYRrYaJQnIQxCQSV
 IOIn9z9ptOA//Hom8gDNoaKvGsZIi3tKnURbXKJ+FpwB3NZEN/GUFAKGS6SBhizNY
 +lC5jo5ZDmxfRhBwNE+8bAtUHrP1L+NcEEmGzziSzmpbm83C2+iaGeksXbbeGKUFo
 21vVM+H5Ux+gDRa+Og==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKyI-1t77s72iFc-00P08g; Mon, 02
 Dec 2024 13:03:51 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel-list@raspberrypi.com,
 dri-devel@lists.freedesktop.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] drm/vc4: plane: Remove WARN on state being set in plane_reset
Date: Mon,  2 Dec 2024 13:03:43 +0100
Message-Id: <20241202120343.33726-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:chj0iYZyJ/v9u10nwi5jhAacEexf49tbwWkSfPx/PpXOmXXpzgY
 y4G66L35hZJ9jTpVD490opw7wTASmR3emLU/AdVXvumTMYCysabcJBKxkvx7qSLJAvn8I/y
 oSQGW41KN2Kjbu4fAev3DnxquPDL0fzgZfo+4yX4eV5owQurgLqobCLW8teL+7ti/B2JbYw
 wO5jFmDlikFEzzNxYDpag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NXsHU+Nu4Nc=;I9rn0ai/qeE4V5ANw9s7bo2KFZK
 9Aaw4NutBpTt2gUwwDYB5u+T0um4/4AL+MGm5NTQIbsmwiSkW2HkW+UKeiuwEfBiX34oDx+Qu
 ReDJLpyqZ7oAZebwYH1TKbNvnwX+Tq4BJ6QDx1zyBlhafNnhDLZy21O2fVY4GFHdniPCfd46I
 C4e9tbKqH7Wg/o+PH1zVFUQqD5GFwgFrwwLWHgx7A9ex4bW+8ydhOHmbM43rrBLX3F3XrC0SD
 TnVg0PMhXRZUe8oiH2SapxQB4zUw/rZURdBhH3/RrHp0HoY8kj4z000Sw5mgCziGDb5kecFMr
 apOCJd1qLb8MnhUf5eyI7z1YAJI2L3fh8jRKrjYxw6esssQb5lOzGQrySxZqvY6CML0T4zv5m
 dy67xYhHcPaJe4TSEiNqikQFQslrxWuY9yM2q/7pwpHcZhiYvT7G0TTUy3AZFaAUQ1yyQmrKN
 xTsjGfIH91ZuHWPaf8s4hL4OhshWs/tpEOi2mDxFKLWNl/oWDZp/5DUlhwbes9v2pwjlySFD+
 GD/wGn9+eOyeV4lXIk6b0kp88b84QhZnp1IL9Fiax72HYMpjLjxm76FAWe0IpVqOXK+YhM6b4
 3c3ItLKrQg/kKJc0YPkUnd9YgX4kB+GbyoEWuvEpMu2ZRJGwh2Y3mhoZNidQNR3cHDrARv9m6
 ileS/eeLHtqfKFNfzlH9vm1F1hd1nbBoZv56TvUydm/J4iUJycyka2JJ2x2QFFym64D32IJeC
 W2nJ9/xVofDoLvYClXzGNTjzdJVKm5ohZrhTC4PVc91jswTqCPq/JFQrK5TVBms+PJkih5YiU
 VjQeRjJ7fG2zMJz+OFIyaGQN4cbkzzzWxWI6vSFK7o+qieW4m+TUPHT1b59od+opW4tkMWMid
 tEprO6Yn9tmp4DytWhUCyy4PY4SqnTkEhyPuHU8B8YcOkeIhOat/U44G7+A8KSlrTIrjykuGG
 uo29NEU2N9LAAYdRtoqEano0NcxR4WVYXmEHncwWzpe7nCvNf3CWj6AEuY3neDM5tyX4iUscU
 YQIV04rKm4/AzZy6K/Lg9NGGYh/C5GUgExVrragCJd2QQq8Bmn8AtPZUC/PDOZk0OOoXhOPwF
 0csUSPeZiJi0Y0wePZqf6K49o2lYW3
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

It is permitted on situations such as system resume for plane->state
to be non-NULL, and that should be handled by freeing it. Do so.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpu/drm/vc4/vc4_plane.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_pla=
ne.c
index ba6e86d62a77..1aaa4938824b 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -330,7 +330,10 @@ static void vc4_plane_reset(struct drm_plane *plane)
 {
 	struct vc4_plane_state *vc4_state;

-	WARN_ON(plane->state);
+	if (plane->state)
+		__drm_atomic_helper_plane_destroy_state(plane->state);
+
+	kfree(plane->state);

 	vc4_state =3D kzalloc(sizeof(*vc4_state), GFP_KERNEL);
 	if (!vc4_state)
=2D-
2.34.1

