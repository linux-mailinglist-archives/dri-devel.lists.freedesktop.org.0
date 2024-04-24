Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FE48B107A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1600B113C93;
	Wed, 24 Apr 2024 17:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="bc/e41Io";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9119113C80;
 Wed, 24 Apr 2024 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978036; x=1714582836; i=friedrich.vock@gmx.de;
 bh=1irgTkPzRfDZc/Yfs8Ct/kCThBEK1jh/ZXOzS93mNOs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bc/e41IoF9ZWQK3KqSE87bXfZktD/hwe4c8W4WJ/3Ro8s0+qv1amhmwGwZuH5LYQ
 q5M//OuWChR/X9ZTFUVP/E3bA8Dasi7VfbyO/njLAiNUKBhvsqHYxogMTNha+mrwy
 tAW57N4WWFRGYki0sP+IXnsY8gESmTrV2G+H1tIXt3uCVZSmyU0M57hUbJC0c8fC9
 sooosRsINGw7uvn5Q5/tT51gjyIE+52IGDZyCqeqVGON5kIDdhESxmvMOU5v34c1G
 FeACUbyeWmzhZKjNr2R4ktu9vNGmP76+1OqTTzb4cijHQD+DqA2tv3TeniktnNJuI
 nPoJQZ+mlqecnmHeAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95iH-1snbb126at-01436M; Wed, 24
 Apr 2024 19:00:36 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 02/18] drm/ttm: Add per-BO eviction tracking
Date: Wed, 24 Apr 2024 18:56:52 +0200
Message-ID: <20240424165937.54759-3-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+pC47Vkn5FPpJP75PfW4PX1NoQHGavCKYv17CmWYggCujygafbS
 TYrOCNDZIssskc8hfjHmHEQaHaUHvx/jxuNFoirwqbAeL5AinpVNZSEaQFD3btzy0CJmdkt
 u31e6yJNeYLWWvK34T0nJ8OwKEZEQqN0F8VHXeXGT9R1cHa2C2yeOxAgFYXR3cLN5H4LEaT
 U5+lhNaqLNKhgRwvM54pg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7EhwgSRhO/4=;7m5aJD2q1nwk6Xq83dlhRGw8VCy
 SXT+ivUM6oWUgSUMe+IR6ohgSNblvFrOHQVixpEyexEwH7NwtlHOBJbnWUM5AaoEc/RUHS4xq
 X8QYeDqXPy5VoMcusEE3sH6EXzYONwxlFltrHeLI7lUaZ5DM4GZZ+jWznUzv4wqUm/tOVAyx0
 6ZZ43WbT7Z306PlaleE961F/LImEvx+cvuYDdfhi/4LPT0ZpUOVzOQmQQR+n/XaSBIR1JxVP0
 GvBeCqVsHK7rIP4zjFvKgQL1hOCKeWh/ZUPa3c6cxWIWVQdZYy6NrZXj0QGQROW9LiSNFzKVA
 CGve0YwD1ohtfLRkPZuh5ttGrgeXao0/aPB/zg8qo45FbzyhXT+aqQ68NHZZ6K/9Ebd32Ywvd
 t0LoKG7vXEoq2+OWXqSbDwZlgkO8BegLBjLguLgGysgNt711Hqqc3ctjhZ4KthAuWoRS/tY7C
 NOdMcCXrut/IN6/00e0rro22mnrgxV903NjuZ/ojEJ1NAPRYaE9KoH0fNS6Bbkfu955MklvCy
 N+DflA8WbR2xYoWIVNprtCSL1GwLJJ7Uu1jQUZdoTNuxwxirsrP1vDH9rkmsOcrnuJ4nSFYmW
 j/RzkuORMOE44JwFsOKsOiHPcawT8Y2eQNL24PlSDMJDQ+1Owv63SxCp+05nsj8i6cmlv0VHX
 qBA0xh+afelfY1Em7Lel8Jdy+g+PfydKE/wf/yBVII8//OLtAN5PYsdMhlkaMRZedlROoQ81e
 ZiXm9EVVIgS7t+F6JaygLtolF3iKL0QFN/GFVJwXLGrVihXlqhhv1Gcgs+qeD7QgMTQKSWECc
 zH/grcACKg8p6I2G57usemg9WkjSeWrXsnYsWN92lPSP0=
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

Make each buffer object aware of whether it has been evicted or not.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c |  1 +
 include/drm/ttm/ttm_bo.h     | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index edf10618fe2b2..3968b17453569 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -980,6 +980,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, stru=
ct ttm_buffer_object *bo,
 	bo->pin_count =3D 0;
 	bo->sg =3D sg;
 	bo->bulk_move =3D NULL;
+	bo->evicted_type =3D TTM_NUM_MEM_TYPES;
 	if (resv)
 		bo->base.resv =3D resv;
 	else
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 0223a41a64b24..8a1a29c6fbc50 100644
=2D-- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -121,6 +121,17 @@ struct ttm_buffer_object {
 	unsigned priority;
 	unsigned pin_count;

+	/**
+	 * @evicted_type: Memory type this BO was evicted from, if any.
+	 * TTM_NUM_MEM_TYPES if this BO was not evicted.
+	 */
+	int evicted_type;
+	/**
+	 * @evicted: Entry in the evicted list for the resource manager
+	 * this BO was evicted from.
+	 */
+	struct list_head evicted;
+
 	/**
 	 * @delayed_delete: Work item used when we can't delete the BO
 	 * immediately
=2D-
2.44.0

