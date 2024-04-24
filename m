Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD298B1075
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12E5113C81;
	Wed, 24 Apr 2024 17:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="ACibeKm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B69F113ABC;
 Wed, 24 Apr 2024 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978038; x=1714582838; i=friedrich.vock@gmx.de;
 bh=Z3bdehzsZZgfZDz/cFDr/Lcux0c33ONrf5gsVmSqteU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ACibeKm1K+52KcuFLOjNZdsdKCy25tsqjeTSPDfoIJ5wxDft3dd5bveq6LkFnLbh
 NLehqmoypqYXT7CYlwoAHzQZucl8sGagEFCZ0XSSjcNbXmPwZwTNUdBbUvWPEgk1e
 vq92SPSd4l8Nywbecz4IjSMVbTDBaVejLSqjQz5+2MuM7S3T4BUZFuL/u+iYn93PR
 QPKdJ13YG7qEoFi7DKCwegL7aGNQLUWS9hptIlFtkjFGzemOu20rPdkzRPtCHfxRi
 B2Ygfr8Hp7m/IHuDEMpIE3BKPLNNOA4e5RwiVoRvGgu+SVQjtHYFKDVOfunf+lehf
 zNBxVdFGDzOAp8+GkA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSt8W-1s7xBw06cY-00T3Wx; Wed, 24
 Apr 2024 19:00:38 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 05/18] drm/ttm: Add option to evict no BOs in operation
Date: Wed, 24 Apr 2024 18:56:55 +0200
Message-ID: <20240424165937.54759-6-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:szFxOvvpkj8qn75oReT4WS50CZIKWQhEQsbdmwucQspefqrNYrx
 TA8/CsBWFtZaIQvXdkoBbo9cxRC1dg/L0iQddXhdPr5XAJZPE4+/JAcn1U53/sEkpvMm/7p
 aXEJEHPTv2nlSbRdZ6ftsEDD0rahLKio2r3CO1OqyFpVd8nZkgn/fp6F/1ba/7DM6kmQYU+
 wZSxK0BFI+ukHJXwEydQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KKdoSho9HZ8=;sjG+9C26e/MIOfYwDkGlF1s8LaV
 RFBlFzeYQLQX1NBQvo62PgVKDpaQpzzC+eF03B78eJte/gSJN3Xd0OzIFJSizCJNNcy0Ql2dJ
 pYFTJTHwi0isD8GXeP/8YWl8fo/XNTIToWrQXvfJkRPmCZkDiq8boU+aMb6fT+vGsMWabzF10
 j13KC3OtX6SWS2/hxKlh9FrVEe97HegsN4tqkn2ZsLErJv+uD1gMub27LA3PhnFK1i2loXV9s
 ZX9DgrFBZvlG7zIaMFDchNMVAqXGEPX4qTbKxWQteqUe/y2xOp6u9IBFL0Sl7v4HhB72x72EC
 1h9RlYOiZpeFjb3snJNFgUFH6jS1oDvmzD6Yz7rVBSjrwJ9mAiHHC4ZRb72kOLsx/9OHrbyOQ
 gThLT5CmH4ZHRe2todHFoxCauXiQ4GO3MMtFhpacBHKSirE3oRf/TUH90dd9/1i/HXvyHOmsi
 CVthrFRcmghGB/wY6FPfJvf4syikbvxeMgMSAsVugTRQk8awJXvzOo3H5LCbHEY+70xZpRcb+
 dky1+l2oVvD2atYpk/YvFhpT7XTgxESovuTyJMuk+Tl7mOgKB5WqI7FWNPodYXSnSG+KXYD4k
 5L/uhMKSU9UN/apkSFbvdQ+pbLlO16ZF/sh/UVa/fwCaiLJKHitbXoQHjm4BnhhIKbJKAP3Mm
 /UTfAZ44dqSgDDC23SdngZfrbCZUUsdr8wpTuzvJKljVq7tiaMAYO+C00CyzoYr110eYST5c+
 pIl2GqMTGZoEYw6pEVpuYgLQwuJoy7rSXQCrvjTmkfat8UJCepk0mmAtOBBNghHIhBiRoZt3v
 D76RVW/iKF9y0w1OPe18YbL6bHdud95+hqIxZn5snphLU=
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

When undoing evictions because of decreased memory pressure, it makes no
sense to try evicting other buffers.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
 include/drm/ttm/ttm_bo.h     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 9a0efbf79316c..3b89fabc2f00a 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -764,6 +764,8 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_ob=
ject *bo,
 			break;
 		if (unlikely(ret !=3D -ENOSPC))
 			return ret;
+		if (ctx->no_evict)
+			return -ENOSPC;
 		ret =3D ttm_mem_evict_first(bdev, man, place, ctx,
 					  ticket);
 		if (unlikely(ret !=3D 0))
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8a1a29c6fbc50..a8f21092403d6 100644
=2D-- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -192,6 +192,7 @@ struct ttm_operation_ctx {
 	bool gfp_retry_mayfail;
 	bool allow_res_evict;
 	bool force_alloc;
+	bool no_evict;
 	struct dma_resv *resv;
 	uint64_t bytes_moved;
 };
@@ -358,6 +359,7 @@ static inline void *ttm_kmap_obj_virtual(struct ttm_bo=
_kmap_obj *map,
 	return map->virtual;
 }

+
 int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx);
 int ttm_bo_validate(struct ttm_buffer_object *bo,
=2D-
2.44.0

