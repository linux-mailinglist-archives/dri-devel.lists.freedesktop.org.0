Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB674B0B6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4B10E569;
	Fri,  7 Jul 2023 12:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F00D10E569
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:27:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc1218262so19935855e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688732853; x=1691324853;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dypW8BsEWWZsovJctMw3yW536uGbhaVcw8r4jC5Ja+E=;
 b=hG7sxEFM5aGgj1CH/1QZbRPnJwjDdUIXhoYag5HgrLh3j1ZpzsyvXyaP4SI/aTJOoj
 RQjkA79gbUSoNWMBE5QdrD9kPSQrJXJeVkjzdA86U8M2+P44vp+oDGWxEG5XH4sVNzqG
 TLCGSWMPQfEfdHZtHwmprpAWJ4qzKW7DteGO/nKmhHF3Iy8GsBtvxlIKgI097quNc5SJ
 j/HOE1D67LFkrV1wdpfxoRqCdBleq0VoP91qel92RmRCIZbKTWCkgakgN7ZNfifcGZDl
 Q+94GoezlVnMR1ABibH2FLf1vNCwtgrbmAHoFfoARdhnY/H7BR7Hf4oKE0q7jQl4zMMb
 aC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688732853; x=1691324853;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dypW8BsEWWZsovJctMw3yW536uGbhaVcw8r4jC5Ja+E=;
 b=IGs8cDA7gX+QEfccX70RDKUybasS5edbQZdNbmF/bw8IOVqvCNUmhmGZH42kSxcGx1
 fVJqQPfUWhJpO0jfqJjS5J7Ch5BRMOVNDVYhAdN8VK+9nH/hW6wSUrz/rohpLCSK1qIk
 4OukPKgHfnBCHMSIqiJJ6jKh9r83+kBkCZNF37XnBOinJ1zQNejP8oUPzFGmLRG9yLpK
 VNdHT74YIapaqd89/xKcZEjJXLPHJX97RnzGJQ0HxUmzwmGH4zFozUcpzhshKOL/htk+
 BGRrV1MbEyAqsvDMbpDsRUYNDjDLAqxfVSNM0p9LXgrdVA6Vg+0yQUjg4dYZqE/7H12t
 ekhw==
X-Gm-Message-State: ABy/qLZeGMkzUec9lUcIGq0V3Si/rVMNBxeWWnz4q1UF+gKuSoZVP/f3
 dP/49auQuzhgYjOoXxsjTws=
X-Google-Smtp-Source: APBJJlFQxcxvQFF3XXJedcUh3eRvg2XJlHCEQBMUj41c6vzHYI9PX35dbCTZRBFEm9k0oq3muhCStw==
X-Received: by 2002:a7b:cd15:0:b0:3fc:8e:4287 with SMTP id
 f21-20020a7bcd15000000b003fc008e4287mr971782wmj.12.1688732853027; 
 Fri, 07 Jul 2023 05:27:33 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a1ce905000000b003fbc9d178a8sm2383772wmc.4.2023.07.07.05.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 05:27:32 -0700 (PDT)
Date: Fri, 7 Jul 2023 14:27:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 05/12] drm/tegra: Store pointer to vmap'ed framebuffer
 in screen_buffer
Message-ID: <ZKgEswjWsLVu85L5@orome>
References: <20230707083422.18691-1-tzimmermann@suse.de>
 <20230707083422.18691-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dPbMojJjJjFKYDud"
Content-Disposition: inline
In-Reply-To: <20230707083422.18691-6-tzimmermann@suse.de>
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


--dPbMojJjJjFKYDud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 10:31:56AM +0200, Thomas Zimmermann wrote:
> Tegra uses DMA-able memory, which has to be acessed with CPU ops
> for system-memory. Store the framebuffer's vmap address in struct
> fb_info.screen_buffer. The currently used field 'screen_base' is
> for I/O memory.
>=20
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/fbdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--dPbMojJjJjFKYDud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSoBLIACgkQ3SOs138+
s6FBKA/6AxW6TZPBIu9pzagIb0wUw+TTwCv63Z4skn1VdYDW/dghAfMVoXfT0vOZ
Xk4H2fMnrfegbSn2w9XMtD47FnnjLVx0ZLqz9ve87xqEm1MY/vNBQs+wi3XpUGpq
jFdYMB591WBZSSCMpU37Uemt3ltwIhXCWL1gsiM/S3VRQhMXBds4VSFnr5Gmi9lK
tSolrVlLvfaTAvSRAkkGaN72/PI09OCNg0ZS8y4dsL1J3UwAVudw9kK+V1zji0RV
xdXNvfcgF1spfFdIYpD+J3YOHhfoglZxPuGpLIiqVjHB8r4+98sJ7tKb6L90WNSm
ZuHUHnZr0S/EaxAKO1NFuMzdT75WtqaYjaxaCraOroXVDzlY6hpvC78YhHjKJuKc
Ak6VrjobRuTZS0guyhsw5O/a99r5LVtYksuzWQDU71DCF0kmscWqQ0Gf+pnRkuJ3
M+yTGO9pKaOogAads3bighTN0UFYemq7tRY+eY5kh16OtR5Zihe+e6eXVTyKobc6
WD3Hairolc20tPyMmX2kn1sCf++b/GZBaPk+azSHjKLGwjPjx3l/ba0hGuaDPZlp
xyS8lB9Aj9LhqulMoamVK9LiLL4WnlQyOWl4R7vOh32FuUBLnJh+eh+oJpJu8RN6
Q/tDvmisSKyNirVLOiTFdSk7jG1A8Hq+UEnEv+PNcG8fcl69rT8=
=JRtn
-----END PGP SIGNATURE-----

--dPbMojJjJjFKYDud--
