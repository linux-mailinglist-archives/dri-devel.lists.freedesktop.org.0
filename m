Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C035FAC6B9B
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3350C10E6D4;
	Wed, 28 May 2025 14:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZoPl5l4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DB310E6D2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 14:20:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5049043B39;
 Wed, 28 May 2025 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748442029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMf/Hnpv8Kkgl2xtdJEs4s67UUfmu0Eb4EkJAcuiJ54=;
 b=ZoPl5l4Bc9sqvQi2thDwCWwhk5PjKwCCN3n/aQ5kZ4NplF+u0r3r+1MEIONI2Ui9oaeiqe
 WZs5Fge+nMbp4fz/eG2+8veOdhCml9z3FBDTn4sgpSpu5HyuxTbV4Bp6d8+g5MNkSs8s26
 7bGo8GfafcJlkDqv9W+uLSKc7tHj8Kl2nShiODJPxSWrXr+3g7E7SKKIe9E1QotQqz3Lxt
 OCOoMGWxKHcasdtt3Cs3627y5E5w9717QCWPRhBFFeDL3ECLBLfjGsu/RHvEpVQ9iw4zLD
 DyqdgFsC/yWqONV/ev72/pjqxlcdGtgkaE1QDjfAwMkS1pL0DxUX7A/1fCdMYQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
In-Reply-To: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
Subject: Re: [PATCH v18 0/8] drm/vkms: Add support for YUV and
 DRM_FORMAT_R*
Message-Id: <174844202720.20871.17817031129231550592.b4-ty@bootlin.com>
Date: Wed, 28 May 2025 16:20:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeegleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeehieelvdekieegledutdeljedvhfelfeelffffiedttedvledttddttdfgleetnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemfeduudekmeguieehvdemjedvtdejmeelfhehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegudegtdemtgekiedtmeefuddukeemugeihedvmeejvddtjeemlehfhedphhgvlhhopegluddvjedrtddrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghls
 egsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvkhhkrgdrphgrrghlrghnvghnsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehpvghkkhgrrdhprggrlhgrnhgvnheshhgrlhhonhhiihhtthihrdhfihdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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


On Tue, 15 Apr 2025 15:55:31 +0200, Louis Chauvet wrote:
> This patchset is extracted from [1]. The goal is to introduce the YUV
> support, thanks to Arthur's work.
> 
> - PATCH 2: Document pixel_arbg_u16
> - PATCH 3: Add the support of YUV formats
> - PATCH 4: Add some drm properties to expose more YUV features
> - PATCH 5: Cleanup the todo
> - PATCH 6..7: Add some kunit tests
> - PATCH 8: Add the support of DRM_FORMAT_R1/2/4/8
> 
> [...]

Applied, thanks!

[1/8] drm/vkms: Document pixel_argb_u16
      commit: c76e2c78bc2a35ca04eead275f14b6d23ae9a89f
[2/8] drm/vkms: Add YUV support
      commit: fe22d21e93426294eb0ebdb0bf5f6d6b77481ecc
[3/8] drm/vkms: Add range and encoding properties to the plane
      commit: 81dbec07197678fc2d86f1494dfaf44023864842
[4/8] drm/vkms: Drop YUV formats TODO
      commit: f776e5cef757927b038a9c07c0c68f34d35f7787
[5/8] drm: Export symbols to use in tests
      commit: 11d435b81e5dd2cc48daa2d3d71a19bcbc46e807
[6/8] drm/vkms: Create KUnit tests for YUV conversions
      commit: 3e897853debde269ab01f0d3d28c3e7b37bf2c39
[7/8] drm/vkms: Add how to run the Kunit tests
      commit: c59176cbca1188b906a36f06004a98a6264a8008
[8/8] drm/vkms: Add support for DRM_FORMAT_R*
      commit: ef818481d9fbaf3483dde0d1faa565a016810de3

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

