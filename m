Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E618A8B108B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD788113C9D;
	Wed, 24 Apr 2024 17:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="VXxzV25o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A011113C87;
 Wed, 24 Apr 2024 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978040; x=1714582840; i=friedrich.vock@gmx.de;
 bh=a/KOIUJNEvZE7XYrz5Fp2pC4GRWaSm1HIzkguOCSfBo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=VXxzV25oCTQV4EIrh8DfU287FV0esWJ8e5faeT4lGSiDGPQySjknrP17oexyKh0I
 O8nW4owy5HWaZpqUkCBbkJSFZxe7cEs0IFcrV7DbT2z8pbARtxd/WKkTUXyo9xtgR
 +PFy1McrWYvEKgrz5CFvdSC1blmlEIgsdgSddXSY0EKMADkEKSR9PuELE0DhQnm8q
 aFAmUNhHvY6hjVhq3H/ARGk3/iRwH1+JhhxpWqyGDtDsQWAheqN2z56jSneHMMk3C
 j7lBCsIgqnkYkdyAkYFuRrK7tpIHNSPbuv8wVFfwheUKW1uvOTajtB47SqqDxQbjB
 SyW7cNaf3mRn1CGs/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1sjDt124rH-00zdG2; Wed, 24
 Apr 2024 19:00:40 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 10/18] drm/amdgpu: Don't add GTT to initial domains after
 failing to allocate VRAM
Date: Wed, 24 Apr 2024 18:57:00 +0200
Message-ID: <20240424165937.54759-11-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RqOYfDkRbCkpZHTVmdARozlpT5Tna7PwJpauhc3w93E/7PTOksr
 04G5+bGrrUr2vmHd6A8hlduY4IwY2W9CM6QJdhDEKXP/bHtERR+iLhuapWk1M4Q414s9evW
 wm0/YJ1TNywIO1ZVYmnT3Mp18QBSwSqUe8Q1PHT3LpwYdhnJdPvTBL4CvkfKZWFtfqbYPVF
 lVkO/HO9vsGOymSeUkqpQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C0OuSatXSF4=;ww9d6YWIXILDSZ0O6bepq4oC5VR
 H5JGgRMhvPUJX9SMSL1akVizG7NQm6b60d5lcFUqt4HJw3re/e1ZAPMwY0Cy4O1F4jjf/VPiO
 bmG7IEuMbqQEII+sAlse0tU9Xi5QJLtE69BMG6ai+Vh7sCY52JINIcWSnN3DNrBYAVFeOCvZP
 06/LTEk7m4Bgosp/I1t0MBx29u96jSCLmt6X6UEFVzlJvTtHTGhgyv4TNPQmnOIB03OfFnx5v
 /8p8xgNZRe0mQgrGOgrC/64177qjAJAJyTPlqukv2HFAgx7JriDgjPO2tsm/K0HGuVWN+CQHE
 4bIguROWA8be9GlBHc6DdnAplMXoj4KGzJ0qJy1SnVY2AipNLP9X7ZfpxSp2C3xFwTFemgR4k
 jwAkJObUo66y4lVvOrjbENctG/3XictWDNfkZUogQph+Yj7fITARZQxgMYq2xGplBkzsz93U0
 dAgmJzR2lDTSCMXcBT56gnTycgtsj6gRGMlxrE61VSwshstzHn0mWd3w1I5sbb1eI/IH8OYB+
 CX/XshtGdhQpf+1Uc9wtpU7NhcT6bumg2jAwD/G/9RZXEBhV18BOfsYHEQhurzoztzq1aLwr/
 wq4ZKbP+QrauoWLPUEkoa9//GDUEiixtRRmdwJC6nETu4eY1L+FH7p0ymXfXpIE47kP4ZgzjA
 Kws3LuJWdRYi5YEieW+9htrNfRsp903RWSBS/1OHMa0saQsXONXhwg5aHxp2TDRyVMLG/sysK
 ipE+X0hlrDZJD5a9UinH++hr78LuKtugvM1kNsIplH7v2pxLqcxb5nrIsuCytssmRx+oeqac5
 R98UTeLptluzr3euixe93XZYUCvrX/2u0UIJqJK+MpuUw=
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

This adds GTT to the "preferred domains" of this buffer object, which
will also prevent any attempts at moving the buffer back to VRAM if
there is space. If VRAM is full, GTT will already be chosen as a
fallback.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 4 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_gem.c
index 6bbab141eaaeb..aea3770d3ea2e 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -378,10 +378,6 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, v=
oid *data,
 			goto retry;
 		}

-		if (initial_domain =3D=3D AMDGPU_GEM_DOMAIN_VRAM) {
-			initial_domain |=3D AMDGPU_GEM_DOMAIN_GTT;
-			goto retry;
-		}
 		DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
 				size, initial_domain, args->in.alignment, r);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_object.c
index 85c10d8086188..9978b85ed6f40 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -619,7 +619,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 			  AMDGPU_GEM_DOMAIN_GDS))
 		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
 	else
-		amdgpu_bo_placement_from_domain(bo, bp->domain);
+		amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
 	if (bp->type =3D=3D ttm_bo_type_kernel)
 		bo->tbo.priority =3D 2;
 	else if (!(bp->flags & AMDGPU_GEM_CREATE_DISCARDABLE))
=2D-
2.44.0

