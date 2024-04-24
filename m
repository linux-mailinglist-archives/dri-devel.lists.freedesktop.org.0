Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D93B8B1087
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9C2113C95;
	Wed, 24 Apr 2024 17:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="IxCPYjfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9A1113C87;
 Wed, 24 Apr 2024 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978042; x=1714582842; i=friedrich.vock@gmx.de;
 bh=b6EoFsH7sLs384Atuh1oGN0mYQhG/Es5DDbOcdb23qA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IxCPYjfgss1e42ng+/GsckyA9nCiETZO3bA2iaDOH/2Pb3yAB95EaPQmeOZrJpm7
 iXc105bJhShdPVcczrRVh/3NKCgtUDwPVPU1qqjElOD3Uh1Nz3AiByOaxfiEP3rJF
 hSb1lNbWHKzTkl/olPgXMcy13IgR7W1rPydZprQkAM0G4sYsiHwwZjZwaKFMdGggw
 GCF7k5+u3XWqa/19QrSPvK2fLpQs8ONSk/7v2IsQBnnoWXMurBla9JGz8y5AAchZ0
 NYZMexWKrRhYeVsGxq9YBJkANerMLb6uTHG45FUDnAe2wTyrM8sk456Q749Z2ga3k
 62HKws2AntpDR6POhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUUw-1sTSHW25Vs-00pYFx; Wed, 24
 Apr 2024 19:00:42 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 14/18] drm/ttm: Consider BOs placed in non-favorite
 locations evicted
Date: Wed, 24 Apr 2024 18:57:04 +0200
Message-ID: <20240424165937.54759-15-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yBLI2MoDBze2F6URJMuxofpt2DIPDheiA1tfa//NrDaUM1l3kFG
 bell4fhMj2OrNY86/heGliQ/WDTliXNq7AnjWaXsY320+DRQSteYS2kf+rWSsVZ6udRZ9v5
 vME2l7OHG6FiCVgT/Qoj7F1Bf3czFpK23ReGH++sJY2LIqMu8ZBtuPRWH++QVrNK2Auk56l
 EfUbsh7Zga85V9sxxdx+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9oZG70QMkm4=;9FeUcAOvVEf3ykPVWsnaxc7wsmP
 7emC8mKis9u8iIAdeRPHgj5gtU9n8mLIlNoJCXu+BnN6JNxdMXOV8y5QU5xyWMGnLQzQbelbD
 s03Y2Ne+XqSPeB2oLEbvCuRUyGWbUghdimbuaanS/34RuHqplYSx5XpzoxKakbc/YPIBTjooz
 HPGP11cmIW0NwOKZ3Ks886JC9cj/dKDdw5ehy5DPcGyyufPszmsoBXXLQAxtAN1Rr8iOCdh8l
 ZwYeZjt4XhxnVkFh5XifOVT4rgiDzP+FVPHgihsUUk0kWD1TmVRdQPKNofoMrfX6kDhL6knRH
 Vcow4fhmutbq/wd7V8fbFkhrv49e83khRLP9kkGJFGRWdB0eVom09zzuxRNKhpyVt7+V6vQ/e
 OJyOJZN3S3uGbZ9jW9yNRzh2RBHHYfh2OJeEk6Me6yOQJAODE7Pn54U4cvUfmxH1QjfHUBeFq
 czMH1MfMKm86gpgDlBV7tI3XFgY5RI8DzzVrK1tNxlB6fIOs5/DoD+Jj6E8ERxt4f8MVuk5dF
 nCJEzqnhhG9YySjFCphRHDhXJUYnvpFPSmeiwqYMOJ2AiFAt47k86EtGehoriwlNhJWZRst0H
 S+x2Er79Q77EiayZltGegyzOsg5dcdFRKme/Igdr90KNRmMtVf0euHYv5j6atc1PH5o9LpeD1
 hL0BpphcuA5VZE6PsyzijHCf3L10kKNXYnx2GL7w9t1A5Bd3JckDEXLvRZR16Bd2C0XmA0qn7
 aftqVzUNGG2tFvbGSGYkjQmOmAN7S1KscnNTIBBgeqZHjxN/poPnndZQOIfurqYi4gcN1VFs7
 l39Hvyyu7K5YjbIAGiKvhL4aQBN4FGu9mwwG+8oF5ghKg=
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

If we didn't get the favorite placement because it was full, we should
try moving it into the favorite placement once there is space.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6ac939c58a6b8..af8209f3bc894 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1111,7 +1111,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx)
 {
-	int ret;
+	struct ttm_resource_manager *man;
+	int favorite_mem_type;
+	int ret, i;

 	dma_resv_assert_held(bo->base.resv);

@@ -1133,6 +1135,30 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	if (ret)
 		return ret;

+	if (bo->resource) {
+		/*
+		 * Also mark the buffer as evicted if we ended up in a
+		 * non-favorite busy placement, so the buffer get
+		 * moved into the favorite spot if possible.
+		 */
+		for (i =3D 1; i < placement->num_busy_placement; ++i) {
+			if (bo->resource->mem_type !=3D
+			    placement->busy_placement[i].mem_type)
+				continue;
+
+			favorite_mem_type =3D
+				placement->busy_placement[0].mem_type;
+			man =3D ttm_manager_type(bo->bdev,
+					       favorite_mem_type);
+
+			spin_lock(&bo->bdev->unevict_lock);
+			list_add_tail(&bo->evicted, &man->evicted);
+			man->evicted_bytes +=3D bo->base.size;
+			spin_unlock(&bo->bdev->unevict_lock);
+			bo->evicted_type =3D favorite_mem_type;
+		}
+	}
+
 	/*
 	 * We might need to add a TTM.
 	 */
=2D-
2.44.0

