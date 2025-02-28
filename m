Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5535A4A723
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 01:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C179D10ED67;
	Sat,  1 Mar 2025 00:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=crpt.ru header.i=@crpt.ru header.b="h2jIfF7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 922 seconds by postgrey-1.36 at gabe;
 Fri, 28 Feb 2025 12:34:46 UTC
Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF0F10E2A6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:34:46 +0000 (UTC)
Received: from mail.crpt.ru ([192.168.60.3])
 by mail.crpt.ru  with ESMTP id 51SCIjYT028061-51SCIjYV028061
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
 Fri, 28 Feb 2025 15:18:45 +0300
Received: from EX1.crpt.local (192.168.60.3) by ex1.crpt.local (192.168.60.3)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Feb
 2025 15:18:45 +0300
Received: from EX1.crpt.local ([192.168.60.3]) by EX1.crpt.local
 ([192.168.60.3]) with mapi id 15.01.2507.044; Fri, 28 Feb 2025 15:18:45 +0300
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
Thread-Index: AQHbidrpG4n1T48VGUSXUbob/OuFoQ==
Date: Fri, 28 Feb 2025 12:18:44 +0000
Message-ID: <20250228121834.122728-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX1.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 2/17/2025 9:52:00 AM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-FEAS-Client-IP: 192.168.60.3
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru;
 c=relaxed/relaxed; 
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=w137Rzd7URkPuLrekq8fzju9U+OfooOPZ7PckW6E1AY=;
 b=h2jIfF7IUvSg7qQMoumlae3QRuAPHQfg1pMLmZWb21MMnQyBouxd9Q4qKciR3fOTY84sXs9YYA4t
 /7W4cuddFn6fm9XcrwTmae5QySe6W38cHOjLxLEjOG+lFjO7tvGDjPpmZY/X1Mm2Gx4jXsVwfbjO
 uNZ2H+KpR9OEBj8mzDnEVSEv79mzHZ40B7Tf9fKQz+vaX61o6M26lnBVOgKV/ldBgpalrATwaCIl
 lKCWqGzpW12zXFZ2rQZ1cbZJea62ghBh9UfjGPIMYfh6UaK7LOLwqT4+BqDfzKlA0ddYMGVlQaxm
 6vFeHObnkhYO9hx+Y05FC+eDabDOwou4ycohyg==
X-Mailman-Approved-At: Sat, 01 Mar 2025 00:40:26 +0000
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

The IOCTL handler drm_mode_create_dumb receives different parameters from
the user, specifically "height", "width" and others. Sanity checks are=20
performed on these parameters. However, these parameters are sent to the=20
->dumb_create() callback, and during the processing of the "pitch"=20
parameter, its value may change. The extent of this change depends on the
driver that exists at the lower level. The thing is that the value of=20
"height" is controlled by user as an ioctl parameter and it is not
directly associated with the "pitch" value so the initial sanity checks
can be insufficient.

For example, if at the moment of calling the=20
drm_gem_dma_dumb_create_internal() via ->dumb_create() callback the values
are as follows: height equals 2 ^ 27, pitch equals 2^6 then the following
statement:=20
	"args->pitch * args->height"
will evaluate to=20
	"2 ^ 6 * 2 ^ 27"
and an overflow occurs.

Since a value of type 'u64' is used to store the eventual size, it is
necessary to perform the 64-bit arithmetic to avoid overflow during the
multiplication.

The same thing was done in commit 0f8f8a643000=20
("drm/i915/gem: Detect overflow in calculating dumb buffer size")

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 6d1782919dc9 ("drm/cma: Introduce drm_gem_cma_dumb_create_internal()=
")
Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>=20
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem=
_dma_helper.c
index 870b90b78bc4..a8862f6f702a 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -272,8 +272,8 @@ int drm_gem_dma_dumb_create_internal(struct drm_file *f=
ile_priv,
 	if (args->pitch < min_pitch)
 		args->pitch =3D min_pitch;
=20
-	if (args->size < args->pitch * args->height)
-		args->size =3D args->pitch * args->height;
+	if (args->size < mul_u32_u32(args->pitch, args->height))
+		args->size =3D mul_u32_u32(args->pitch, args->height);
=20
 	dma_obj =3D drm_gem_dma_create_with_handle(file_priv, drm, args->size,
 						 &args->handle);
--=20
2.43.0
