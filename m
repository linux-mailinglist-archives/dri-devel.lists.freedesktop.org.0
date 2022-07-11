Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C145706E5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF2711B810;
	Mon, 11 Jul 2022 15:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9A410EE4B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:23:00 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4LhSLn0wMSz9sRL;
 Mon, 11 Jul 2022 17:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1657552977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9hE3HnYhAeCIgj3jLBbqvqbhLR0TkB/Owq0iN72XDA=;
 b=ct7gyZRio9taxrgSLPGBH+A6BcG8r6RQvKbzFxjvK8ksp2xTH4Q2GcfBzFAUWOwS7LXS2U
 ivhkO9UoMcfxE2piw6CRrLLq7u/eRyY84GWV/35CEqpV5yQA1o9G0sUIoA9Iogx9AiHr+0
 11v/ALkHU8/Ln77AuZAJIrZT18KoJQuQi+QxSghVoyvawY0P+0H+09pROxFHlyWe3+2GIR
 kZDEoX2mlN8Khixbcn9P0GoMTLpbm3Apont7BUVKI/Uj//uPFfxX4oI+BJQR4RALsFS0Bd
 K5YkJyxyf6fs9oVtFF4vuSboj6dUxUiJwiwHq++FflHtZcWcsv2EjRTohwVr2g==
Message-ID: <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
Date: Mon, 11 Jul 2022 17:22:54 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
Content-Language: en-CA
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1657300532.git.geert@linux-m68k.org>
 <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ux7rkbi3t3o5yq3q4t1npq168ctqzdf5
X-MBO-RS-ID: 86e332ecdac076a1b65
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-08 20:21, Geert Uytterhoeven wrote:
> As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
> bigendian drivers"), drivers must set the
> quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
> compat code work correctly on big-endian machines.
> 
> While that works fine for big-endian XRGB8888 and ARGB8888, which are
> mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
> does not work for big-endian XRGB1555 and RGB565, as the latter are not
> listed in the format database.
> 
> Fix this by adding the missing formats.  Limit this to big-endian
> platforms, as there is currently no need to support these formats on
> little-endian platforms.
> 
> Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machines.")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Cirrus is the only driver setting quirk_addfb_prefer_host_byte_order
> and supporting RGB565 or XRGB1555, but no one tried that on big-endian?
> Cirrus does not support DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN
> in cirrus_fb_create, so you cannot get a graphical text console.
> 
> Do we need these definitions on little-endian platforms, too?
> Would it be better to use "DRM_FORMAT_{XRGB1555,RGB565} |
> DRM_FORMAT_BIG_ENDIAN" instead of "DRM_FORMAT_HOST_{XRGB1555,RGB565}" in
> formats[]?

The intention of DRM_FORMAT_HOST_* is that they are macros in include/drm/drm_fourcc.h which just map to little endian formats defined in drivers/gpu/drm/drm_fourcc.c. Since this is not possible for big endian hosts for XRGB1555 or RGB565 (or any other format with non-8-bit components), this isn't applicable here.

It's also doubtful that Cirrus hardware would access these formats as big endian (drivers/gpu/drm/tiny/cirrus.c has no endianness references at all, and the hardware was surely designed for x86 first and foremost).

Instead, fbcon (and user space) needs to convert to little endian when using DRM_FORMAT_HOST_{XRGB1555,RGB565} with the cirrus driver on big endian hosts.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
