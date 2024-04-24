Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B68B10A1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810CF113CA5;
	Wed, 24 Apr 2024 17:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="VGftg4OP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6073113C9C;
 Wed, 24 Apr 2024 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978364; x=1714583164; i=friedrich.vock@gmx.de;
 bh=F7lHcI6ytAxOptifXGV2LrH3pzT2g/pB/L5CHP1gZyY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=VGftg4OP3obyxwJd76/LeBf5Bm3o1LTqBzQ/oICPIl31ip9y9XgeQpVYxXKMC9Sa
 odZfOYl5f8i3UPfWVC2vq6k9ci5j0TvsiuYuUe7IlZSWmlP0Q/AdpWt2BHEvFxgrI
 THtrYILejpVa7QEyQ+8pO9xz6zmlHkggE1yVV6iFJLNNaYZ9FsZulphsoUqhW2e7q
 kYvYthQUwGs+uxun6qw7GI1enAwcXS/s+Cj49lniQiV9ZqeOjyCg8Lpvt845CkVZb
 zfPURqMwEr8JePhbhVf33dK9Qo9SZ6VGaLbC+5w1B/69dfEvgwFxxVLFhWBsASwyC
 unAupyuEyB+FQwFUdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmULr-1sPu3744i9-00jkpc; Wed, 24
 Apr 2024 19:00:41 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 11/18] drm/ttm: Bump BO priority count
Date: Wed, 24 Apr 2024 18:57:01 +0200
Message-ID: <20240424165937.54759-12-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cJ9kEEaK/mTj0xTVPmwCLOMniFXw4SoCHSCS4Bb7Bx34TvSPLdr
 FrfIDKKi2cxt6yJOza46WDAivXuAHGPiDPxgmDLKFgWEwF3AVC5yeNlBvH17VrT7Yxm+MWr
 Xw43sl8fjOkVrXNFA5EOFN/CMWd2tPciWu58bjnmNFO0FIhvVudieIfZIKIoP5frx/8ePij
 I14dq9CbBPSOZkWfM3e9w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IO+EGkx9vBg=;yULf8o7R9IYMVYn0Kach1q27lNR
 zlOSv1ujHzH0IP09OnSmr9I9LavJKQzlNXhN9AukBucpEw5snJU5e8PVzf9zjTn5T+Sxa/+2V
 YS1s96hSeRCLzwxfC8tf+pG5Q8ihgQfuy2H+7t8H5jAoajGZE3WG/AfV3h0mAu8jqAgKaQMZ6
 pHu484Wk0ze4vFxgAE2C46HcjawLo++TCxOQwHK2wa7V2im6hu84RC8FOUxxvCxzZcmOmRNzZ
 nw2htkhGvy8lP5YF4LQ33NV/ajnu+6AP5spqqDQfEYd1xRoG/VWFafhg3dUvZE/01uU2ptqzx
 +Ad9LiN1IcW99oqGVtA+cQKxONekxFqP/cF9GES2Pu007Ob9rD5IaL9r1IVDMKqiC4GCrR45u
 BxpOcIwfexh063J3/6/MGXg7YIoFUjTYOTZjMFjpsopd5tLtc4/Berc/DG4EXiSHikU48rhVa
 wHCk5NbVH+EQfJPjKHZrVty9gIdSWMMLC6MZZfSVLhILcMG2FZjLFpNwn0+hQ07foPbz7nJxL
 xCW7K1FNorr74zpMnSlndJRvMfDwhuM6nZ7P6OY0zJ9Eg3BIz4f1WUFhb7Lyo5v/3poeSiLPB
 eNhDNFa7CDWkQ2a7cUDaQ+oohS80gPR5kd6N5OWnHPr9/XnMiiQuzFEUiDAtV25c4g1RFyIuf
 bDQ+1A4rVq+ofRDV2ef53/TL54fOVwK8ze0k3yDYdufNi5ogy2WBcFGPMwkZgIqueE5PGx/wG
 wnlZv9/P6lyr5xWeeypUj/2lcYzOZ5E0FuH6wOhBU6gyerEggfLwDeGpB6CavfVsotIQMtBNq
 QpcZpR9fI3pUJkK2tOztfYgY9wq3OledbfGEpsJ5gNzRI=
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

For adjustable priorities by userspace, it is nice to have a bit more
granularity.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 include/drm/ttm/ttm_resource.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource=
.h
index 7d1ce059c8805..241643447488a 100644
=2D-- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -35,7 +35,7 @@
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>

-#define TTM_MAX_BO_PRIORITY	4U
+#define TTM_MAX_BO_PRIORITY	8U
 #define TTM_NUM_MEM_TYPES 8

 struct ttm_device;
=2D-
2.44.0

