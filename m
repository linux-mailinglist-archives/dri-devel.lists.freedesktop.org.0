Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68263826B70
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 11:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E9110E215;
	Mon,  8 Jan 2024 10:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CAB10E1CE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:15:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7FE13B80D1B;
 Mon,  8 Jan 2024 10:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB47C433C7;
 Mon,  8 Jan 2024 10:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704708932;
 bh=Kf/qCr4Qci8o35dgE+0WQtM/PNggO9XZmnL3OFyD1p4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h7OS9Q6vfGOss9TTQ24Jm6unqxb6WgKnOVxwjxO0z2C6gOAuuahgC7asS+zh5KDPs
 ZYJXs9J1SHAawdLcyUGmByrnTy/yuCUTxRVC9k29jGF98a1UA/s2g1YJythdBgDo5i
 ezF920k4/H4fxAJtmlGMIo7xCB3mYOz9T298h4NKCYdN7Be25DmPSwHI0ccjxiz5YI
 +cAtKLbRsYBqB2OeRh/crdACtO/cOBikxUCmhhfTKmqp6THM0PHuhkGd6mg8AFycGq
 Giwi/GhkL0z/6kJTawsWmk33vcFh4/hhx+t6j6mK/8I28LMffcgAru1wU3YbRy+fr+
 4YghGB4Y0PLrw==
Date: Mon, 8 Jan 2024 11:15:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 7/7] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <5z66ivuhfrzrnuzt6lwjfm5fuozxlgqsco3qb5rfzyf6mil5ms@2svqtlcncyjj>
References: <20240105-vkms-yuv-v1-0-34c4cd3455e0@riseup.net>
 <20240105-vkms-yuv-v1-7-34c4cd3455e0@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6dpvlnf5scujd26i"
Content-Disposition: inline
In-Reply-To: <20240105-vkms-yuv-v1-7-34c4cd3455e0@riseup.net>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6dpvlnf5scujd26i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arthur,

On Fri, Jan 05, 2024 at 01:35:08PM -0300, Arthur Grillo wrote:
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index b654b6661a20..11df990a0fa9 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -440,3 +440,7 @@ void *get_pixel_write_function(u32 format)
>  		return NULL;
>  	}
>  }
> +
> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
> +#include "tests/vkms_format_test.c"
> +#endif

I assume this is due to testing a static function?

If so, the preferred way nowadays is to use EXPORT_SYMBOL_IF_KUNIT or
EXPORT_SYMBOL_FOR_TESTS_ONLY if it's DRM/KMS only.

Maxime

--6dpvlnf5scujd26i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZvLQQAKCRDj7w1vZxhR
xbrTAP40M9aPjegihpQi0Im0Y+t3vvZIDGnzyfpW1jnSv6xx1wD+Ky1UTLcjzx9S
p6LaI6fOs9AqPeduZ4J+cWOl3mJ2PgI=
=ZL3g
-----END PGP SIGNATURE-----

--6dpvlnf5scujd26i--
