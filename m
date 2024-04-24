Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFB98B1074
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA95F113C84;
	Wed, 24 Apr 2024 17:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="TuK1rIXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF4C113C7B;
 Wed, 24 Apr 2024 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978037; x=1714582837; i=friedrich.vock@gmx.de;
 bh=9+1DaWtDrR/RnwYcJilum3wFaIOANmRNKTK8VURNZ3Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TuK1rIXEpzZWvjQ5wzhSmKYopOBtsMv+LLGMPU15PYHoDdilikkpUPSMWqvZw3MX
 s8qGRwVs6ZhHltyaDjI6GnNg1rsqSI+wUDDVC+aBM0SmL7RZZTKWpqHd1BU7M2MHq
 yFKBeEzdiR3SfZBCZh/Lm3DaTBKwbP6Qr09cDry7u2zex8QEFhHUx4TS8QujYEUVv
 pS7O1gVah1VElzvHWOLS4ufCRalMW+wzbOpDCZ9JAFpM/f49KoXRK4xAzVYjsmOBO
 g2d9VbsjtsLEYheIsLy8Teq+tZdnHbdyavfJdBPIg9K3Oms3Rp4eFBL48rycbySB/
 zP25/biJAO7rhggnzA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVNAr-1s9t8E2Gwh-00QZUM; Wed, 24
 Apr 2024 19:00:37 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 04/18] drm/ttm: Add driver funcs for uneviction control
Date: Wed, 24 Apr 2024 18:56:54 +0200
Message-ID: <20240424165937.54759-5-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kZHHoIXfXHyCK0yJlP8QmwUncr6R0eauEwn0//xaiui76aeeEiF
 BrDCUe6N5JbEhkuRTHgjx59zXKJ4OdyaEID7Wt+UpBNYRsnypCEVw+DthEI0M7bqFQrC8rR
 SyjSAONGY1gE9kW29fSf+RSqQRd9GdFNFl8tKFsVFObAvl0t3thCqkOZt+ZNfgFxxhWqrfr
 YuVQSd4cbZu6cNPqYuhKg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Ffcv+pEwbk=;N30PY4iIZAIMgn3mwgtZVODUZHc
 V6BbG+kO/80qwnfYJyntVy+iPriSm1rRfHc1cyeiwSpTAgmKR4zOkLHAX8qR31FLvh4H4kNcg
 JUPHk29mtlEZIvZwHTT4lb9MZPPdOuArKJ4odmb+YBasiVggU3i0zj6PZVvRFKssr7okXfOo6
 9CX4iEzi8qmFlxyr/cIWIACrQL0F1QSBgiBmuW6aXQHFCo5EkhPRIZqWIxFMwlKI/kfoFyxdm
 9QkZE+CuWLj1jPqx+7YcRkuttfwuczDz+bLxwAPYZSvdW1wJN0kWU+Ym9gQEFj+kEfFBtBtHz
 01qHboyNyUHL1/iaoZt+r/f+vmeywWWlJh7y9Sb7iFEOL2WwhYDSwyjLC9g3prxZ3ZQn2GmcK
 ZbygM/jZdurilca7peCRB9uucWQWtakhGfAcwFusmZjf5VXokxqCiFJyYqyYKv5NS8yxZ9r2j
 qIDQlgS3++FA5ZXWm2fMgHopVV8pX+5h22zI1OVpoe0r9MKo5I3XIzmayiGO42BDzJfuCNCNv
 TPGeEf7qhve2I6ZttsG9LUs3rgPgxc0ikTIzolaWM3KqiaKFjepb2ZdmWW7SzSvxhhUAsAbiH
 LZ7tgOYePQ204rfp182NPZTdDBL0hlPbD5W1YEx6HFYLIbu7+8R/E2YIZElFdvqlJWOkmdsCp
 1593psSNdsn0UDloBAx8oL82TAMeJYmNvdLbcaxhpSoA9BCXR7Dgrk9hlQc+glt86WcRocw2D
 MjOZZx9NRkCe9SPhNsOyAFvn3az8pYWEaJaKLN0Hvjq+z4/k1IogVTpBr6jLvY9FGgq9awiP5
 qGkxor1CpsFSBt40RzKeJJ+7V1LoENHGP9kGUKYMCdA+Y=
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

Provides fine-grained control for drivers over which buffers should be
considered when attempting to undo evictions.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 include/drm/ttm/ttm_device.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index baa264efe483d..283795d674189 100644
=2D-- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -133,6 +133,29 @@ struct ttm_device_funcs {
 	void (*evict_flags)(struct ttm_buffer_object *bo,
 			    struct ttm_placement *placement);

+	/**
+	 * struct ttm_bo_driver member uneviction_valuable
+	 *
+	 * @bo: the buffer object to be unevicted
+	 *
+	 * Check with the driver if it is valuable to unevict a BO,
+	 * that is to move it back to its placecment before it was
+	 * evicted.
+	 */
+	bool (*uneviction_valuable)(struct ttm_buffer_object *bo);
+	/**
+	 * struct ttm_bo_driver member evict_flags:
+	 *
+	 * @bo: the buffer object that can be unevicted
+	 * @dest: The placement for the unevicted buffer
+	 *
+	 * This should not cause multihop evictions, and the core will warn
+	 * if one is proposed.
+	 */
+
+	void (*unevict_flags)(struct ttm_buffer_object *bo,
+			      struct ttm_placement *dest);
+
 	/**
 	 * struct ttm_bo_driver member move:
 	 *
=2D-
2.44.0

