Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91357A6EBE7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 09:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E951B10E025;
	Tue, 25 Mar 2025 08:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=crpt.ru header.i=@crpt.ru header.b="WB7KVkCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.crpt.ru (unknown [91.236.205.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6DE10E025
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:47:24 +0000 (UTC)
Received: from mail.crpt.ru ([192.168.60.4])
 by mail.crpt.ru  with ESMTP id 52P8kpIT026018-52P8kpIV026018
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
 Tue, 25 Mar 2025 11:46:51 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 25 Mar
 2025 11:46:51 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Tue, 25 Mar 2025 11:46:51 +0300
From: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Thierry Reding
 <treding@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
 <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/gem: fix overflow in calculating DMA GEM size
Thread-Topic: [PATCH] drm/gem: fix overflow in calculating DMA GEM size
Thread-Index: AQHbnWJ0hAOaMBX100G4nwmUrv+9yA==
Date: Tue, 25 Mar 2025 08:46:51 +0000
Message-ID: <20250325084645.37258-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX2.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 3/24/2025 10:00:00 PM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-FEAS-Client-IP: 192.168.60.4
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru;
 c=relaxed/relaxed; 
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=KqREC5FZose4y5KY8VpmWDONAuHhKTdDrg4djn91UJ0=;
 b=WB7KVkCPsqSa1lj9GBVgLiwXmfMpnzhx38S+PnbNdMCIr9vuU/uhv8qOd0cjlD4w8/qA3n8v1Oxb
 b6fVMNUug5JTzhlvDseZOJwQE+4Fytsy/D630OaT6iJB+wFsY5pAh3RLrYU63urY59/6h3px+5eL
 1QRZGUjbmoI4yN42wD0TYYcV8timTUsEFXfBrcIzWqhFJwc7pyavdPZOYy6V54ssraNySwATuiy3
 bcMgJiOKlFdFUB30I1HaKn/JKOAMbRSmG+KaPHdKG+ASZ5A4YtoHsEooIbuT8MSQbQ3P1efxMDDa
 3IWErzaoO7v+2m6kLAACCeCAtJ7+iDh/QonBBA==
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

From: Andrey Vatoropin <a.vatoropin@crpt.ru>

The IOCTL handler drm_gem_dma_dumb_create() calculates "size" by
multiplying "pitch" and "height." This expression is currently being=20
evaluated using 32-bit arithmetic, which can lead to an overflow during=20
multiplication.

Since a value of type 'u64' is used to store the eventual size, it is=20
necessary to perform 64-bit arithmetic to avoid overflow during the
multiplication.

The same thing was done in commit 0f8f8a643000=20
("drm/i915/gem: Detect overflow in calculating dumb buffer size")

Found by Linux Verification Center (linuxtesting.org) with SVACE.
      =20
Fixes: 6d1782919dc9 ("drm/cma: Introduce drm_gem_cma_dumb_create_internal()=
")
Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>=20
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem=
_dma_helper.c
index 16988d316a6d..ac300777c79e 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -306,7 +306,7 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 	struct drm_gem_dma_object *dma_obj;
=20
 	args->pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size =3D args->pitch * args->height;
+	args->size =3D mul_u32_u32(args->pitch, args->height);
=20
 	dma_obj =3D drm_gem_dma_create_with_handle(file_priv, drm, args->size,
 						 &args->handle);
--=20
2.43.0
