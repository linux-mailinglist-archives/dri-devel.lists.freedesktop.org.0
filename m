Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8DA9564A1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 09:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2037910E1D7;
	Mon, 19 Aug 2024 07:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="AgP1jYSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F8610E1CF;
 Mon, 19 Aug 2024 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1724052399; x=1724657199; i=friedrich.vock@gmx.de;
 bh=1DhphzNqV6wMv2axJ+1PU63TTfBWO6v2t1W8Hyqh31E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AgP1jYSj6Zo6nfKMKOsXMwWzeckHQn3tfkmiXg8cE5931FqxjVb40ACkQDreBznj
 UDALC0IUoDflu6fLXx/qhj1T8ypl46TRQM3ZLRj1JjwYel9nFgYw/wf7qkHzp/iPo
 ustn0wYN3EghLfDG6dgXQMp2AokAPoleHSaluG9XlhOjdUoL48onRI4y4sc3Z8Fvg
 3iVvGRkuunJFSay/yCbUN35vMIg6fhfSjHLhbHVp04oaiC8tVGDEy77WqjlZxsE/A
 Ib9S2nN5LtNslsMB0QGfpwTR8eFQAe/CZRoznJElkQsDtrzpXk/Y5cGQVUA8iSxfr
 /YPHI0NndChBNmokKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from rizzler.fritz.box ([213.152.114.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1rsX2q1i4j-00ymwx; Mon, 19
 Aug 2024 09:21:29 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Subject: [PATCH v3 1/3] drm/amdgpu: Don't implicit sync PRT maps.
Date: Mon, 19 Aug 2024 09:21:08 +0200
Message-ID: <20240819072110.108715-2-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819072110.108715-1-friedrich.vock@gmx.de>
References: <20240819072110.108715-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hgw1L8jFTr8Efz+v8XeHmhlmGUCyOI064W263gygom4ciJBHthX
 Ug3UmqCqRR7bLOnmn3xz5d8V4dmlTBQ5NbN1OPpyg9u4uPmfSxV/XUKyb3GrQfsfscERdE7
 /DNDuPFIuy7W0c4BQsdWmUZy95Eyvp2ol4aOKYwk+Js66bkwpZ1BLwmfy/uTEtJIMSrZNMv
 HkexbIndHL4k3aEMu4yVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M3YstHfxqVk=;BLNggrLLHzUTsh7k4geg2heCsnI
 EH9suu9onYEnnXCFAqD1rL4ffmFlP7IAgFtmVcQqGwQ73FL6q54tkCeC5pUXxdYy90OOSPYp0
 WYoijgxApPssQOUUWE+NjtrT3PxfvI6Ye1O7hv3MyOh0PAlitkZvS66NRhSd/61EdRDZ34p2C
 DIKEWmnCwPrGEaRijjIGOAqmw+w0gYS2zX/p5w5Z03ump4gA/XhldDEz5U5bfmkvykeadH287
 8xMCn4ATwddGARqQRKTBMBMvvroKnUqxIj6aLc7F7G538eb56qAYyxrUR6XjW3P7d/EEWiAEn
 rP2xFFzw8OQb39IpuTGb8fIzWjveYJqGr4yICnuWtLezeWYotV3LQWTglMKWmOuJ5BGpm5CEZ
 eVumeXxQ4TKcWdvK/BiV4ifNltIXeRKX9L+eO3Oz7C+4QkC5tUdFy9qWyAzDzylI2RPDFC5dJ
 uwuCWZ7aXxcC/RMM0G5zGm2DjXWrlGziodiksApZF+Syi0uJFdgZk4PXKd1C+DdwkSf689tYx
 AdJ8DZyeRkZN3NnWqgaYQB3/LvAP3stMXRIBsWQ40XiPDvfqiqGXcgyzqUJElSqPA1dG0QNQu
 F8km2TV9f0d2nrfBg/9gt6C99K0XgKNsNcBA8HcXN7UUC7eSn14WwDrWkxzHSdHcJ/zCKXFQ0
 YJ0AIznoe0v1n6TFB481+lLvVEFpO1Vec7/78RAnnc6OFphqppBtyh2KB+6thSw+MgLH8NlVD
 vr+/W6dG0e5cZ3FoUgVQJi4SrEKZ74lIzfkpVpoYiGqagP9Z1Jl0IZRZUN39b+hqoEftwU6BS
 FB+pWT99H49UAaTg/9Rde3Btro0mHWUwDh79vVElJTFAY=
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

From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

These are considered map operations rather than unmap, and there is no
point of doing implicit synchronization here.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_vm.c
index bcb729094521..a4fc24dff04d 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -994,7 +994,7 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev,=
 struct amdgpu_vm *vm,
 	/* Implicitly sync to command submissions in the same VM before
 	 * unmapping. Sync to moving fences before mapping.
 	 */
-	if (!(flags & AMDGPU_PTE_VALID))
+	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))
 		sync_mode =3D AMDGPU_SYNC_EQ_OWNER;
 	else
 		sync_mode =3D AMDGPU_SYNC_EXPLICIT;
=2D-
2.46.0

