Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6974B0B4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4122210E082;
	Fri,  7 Jul 2023 12:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA65410E082
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:27:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbc244d384so20023075e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688732824; x=1691324824;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nciTqFzq3m83C37bVuS25/vbGoA9jD+37yyxJfMtABw=;
 b=ZNIHElwkb0VEXSHoF0tGuHcp1TVifo58gxj5pt5t6hd0iqJUb6JD2ugaZdUNiEKeHP
 Putj1KHdjJFh9rxJLYktjlUirzCROnaJNFs93GCLVYv1+qerITfgn2VkTwnp0ID2gmmC
 zzvD3TiQ9GqUfgL9o8TAlB9SPIeVEu6ph+aQ3lY61FlRVDDxLQVuJOJlCTIhDcL0tJ6+
 kaMiCxDFGphUaqkYlWQufcA/+v711O7RHzcIVoxe5mCpFJvQDOwsp2qUh6Ys+1hQUMJU
 St3j/5j9fPEmDSPdC2tnSRFE999WBcD0c9afnKBT9koaKtVfVrpG1uh7mw5q/HJbhL4d
 QEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688732824; x=1691324824;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nciTqFzq3m83C37bVuS25/vbGoA9jD+37yyxJfMtABw=;
 b=Zn2ixERvYgxMcxW7IEzsga6sF3vOygSx0X+PA8lziC2O36rXDbYolZzU2PRvB66cs2
 c/bPwZUq+8sT1h3tZj8V/fCrmr18wJCNr7qA05ISYL3IgQDs++Hh/esTTRg9oipZmrZg
 vTfEFCdu5EJRmvcOxi++4tVRkgqRheCfJP/M7RiIw72liLeJM7nYxa7AFQOR+lSrNHTu
 KvKjWWSY0yHqZPqLJH/oXdUuV+9pHDWOBGYLhSAlYzPlp/iZVS328xBS27CtP2cdtD6c
 SFW6A+0P3hk640FWdLBer8ktmSr68hJdQt5GOaMy6h9+mczENYDtqeT5ytHh8FbPBJIA
 DZJA==
X-Gm-Message-State: ABy/qLZ0zO4LzflVrfOibM8IWvyyi+gpkZ84t+GYPKvFBW7ph//9LmSo
 42TB7V6cxqr442s0pimOuJY=
X-Google-Smtp-Source: APBJJlG4wejAtuzFwuAno7AbNiD6c/xCroAdDwnXIE0jz7PtmMPhUKO4Rc5+t/vC7H7oMYbYpfu0iw==
X-Received: by 2002:a7b:cc9a:0:b0:3f9:c0f2:e1a4 with SMTP id
 p26-20020a7bcc9a000000b003f9c0f2e1a4mr3680341wma.34.1688732823578; 
 Fri, 07 Jul 2023 05:27:03 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a05600c21c400b003fa74bff02asm2328318wmj.26.2023.07.07.05.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 05:27:03 -0700 (PDT)
Date: Fri, 7 Jul 2023 14:27:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 03/12] drm/tegra: Use fbdev DMA helpers
Message-ID: <ZKgElQ7E3jN4gZv2@orome>
References: <20230707083422.18691-1-tzimmermann@suse.de>
 <20230707083422.18691-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b6kExiNv+/vFdEiT"
Content-Disposition: inline
In-Reply-To: <20230707083422.18691-4-tzimmermann@suse.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, mripard@kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--b6kExiNv+/vFdEiT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 10:31:54AM +0200, Thomas Zimmermann wrote:
> Use fbdev's DMA helpers for fbdev emulation. They are equivalent to the
> previously used system-memory helpers, so no functional changes here.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Kconfig | 2 +-
>  drivers/gpu/drm/tegra/fbdev.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--b6kExiNv+/vFdEiT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSoBJUACgkQ3SOs138+
s6GxAg/9FUZU5bvbmvYmw09JA2QTqFtvZ7EfyPB2eYDw9cyXBHv3+N+JxLHYyUUM
PVsoWw/szCPU9rvFRcm+MmakHkpxuoBlrB29uB8TSdKDzyYdSUFkRMdugKAcz78L
zjXIXooqgZbObY/kVQzMHcp9411++fwAv2jcB/DtlzrZii/0aNug6TduPIxxltm0
OPe4kESRnb+pR+ikU5+OQ2WHdDDxINoYzrJbHf5zfHWclseshrWG9ERttjgL9usE
7pthMg02TSpbQOI34O3z7DUZvA2/HgrqQFY0RvMuJ2MqmBpjY32b2R/WAf6FZ8Rv
5yFsb/3fo5UbHZiYTuY2lWo3zJ8AFYT5cgHviyBXqFbAqYwmLM6L5jUrNO0j69OW
d2KUNHiCPkUpx/vqHWUB6Aw1BHkUnNy4r4jamCwR4gcvsJKkdV8+dRA1B7Eh9jac
Obb9gVb0JL9ukBrGOGTTh0tGI1WvkwEeVmEkNEhCvLMfK1S8PJoBcLIdvdWcZznU
JQxHJ3u0R0IZmzo2VhhHs1h7EbGNmHStvKFWlEIDNqh9xAv+zMiADzr/D8bX4db6
wuqbLsRAkedumpk1TjN55hgz88Mhc5LVyqMjSxJXzvH7+LeBvX3KOauwi1GYoTO4
e6UWuA8iMN5+WpskFdl96BjlRYjfpCLEYnhMalMJFUKOFdzIqrE=
=CXji
-----END PGP SIGNATURE-----

--b6kExiNv+/vFdEiT--
