Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AEAF9149
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 13:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A99B10E06A;
	Fri,  4 Jul 2025 11:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k52SsA5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90F110E06A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 11:17:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so492159f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751627836; x=1752232636; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ekVHu3sJF4aRYNnS6FmYHLDgTrou30wcwPFOJfO0GRc=;
 b=k52SsA5+dPt7MmQ/kVyTGiLWXhVZ6BvgLNfd7QHUkNa/kuGcuDi9xb9j4Y4JdMBE37
 MIOuqsg3+l2OULN5abvysdoUr1YGG0G2wbJem85V/JjD3SNdWT8eXWuL1aOdhfRT+R7X
 q18w/b/1ea/9lCiaaknvaJ4FkwRnQ3dTFZeL7b7nKtcpoSmCCTe+YVgJ15Qj9PKSWhAy
 9sh/OpIf2Po/NrTVZUGKrnOB6ZdM9/j5oBcj9MVI5v4hSraEg9kXmffbHbHs2ptw5twZ
 xViSPYtdC2zUG2VAwQtwkIn8p3V+acxO5N1NTcKXk2dzLVTKJQX5JR4JOIr0yslbjxUT
 UiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751627836; x=1752232636;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ekVHu3sJF4aRYNnS6FmYHLDgTrou30wcwPFOJfO0GRc=;
 b=Xm2nKsDltB2Rh4f/wiCP/hmmjg5N3Wvm+Q2YQ+0H2o8d/UR5mw07fiahYBHzBRiLh3
 WQQifpdsq3LKtRLKLuvn6HxYyTrgkTO/TLA9u3W3LvP3NcIRS3dF1Dx3Zq8QqpLeh4Eg
 IbqlXOoa6ZsKPd0QR+HF2l7Q0F/jfvZhqoBXJv6Q7LGNVv0b5ur67ObJIAonOjc+TdJo
 a8SPqFPV5lq75tVsey/Ervh+Cq2pbKHem4s/9azlai9N8WMrTCvCQVGjzVQ4nq/r2M2q
 oNjC/ukk40KEFJrEkNxnxDTOpWEBAx8FOl7XNFRpGvlVHs7BopgIIUbBCKUngc9tJXbR
 hEBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtk4bP0VLmyCCE9ZFtkArGSkb4bwdtnZSe5zvEXgkdmb4UpOIChN0UFJP7y1+ohlp5QS9V+7YyQ0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7CaXgm+kU7jWBNv9Ce1nDDJ0PsUBoV3XQiE07g/dlx+lms7W9
 CpVx+zh08GkR0uYdvwFhYuIw8FhB2d6MZafzKHaio+dyZBZXDKViGhAc
X-Gm-Gg: ASbGncvsNJmxBOFqPmZPuRD6hXZGTU/odVwtSKgiZTUD/ttAqHOL3VnWlaLcjkB2gUK
 HAdCDuUeLIRvT3U++lB3odIuqcNE68ug73m+pesgyV1F8hXTVHX++zg9ytM9MUAr6EEwbfvuZcK
 RmVHr76nFYg8Nxu1dGlDkSJJOnkK6X17L6bJV+hwKJasC/NoyUGsP8NhDaOj4G/IYQPlAwL7Wss
 QT2Bw2CMTflHlAx0p/mMVovw6E9QYdLSks/B6aYVXHJCjRFc4cTmrDKg1Z1v4siI6HRBeov0Hwj
 fIMUth2iDGm7OmjVfDpBPOdth1Tjjv3ZKDBKKkBnn7prXS/wQ3ggqVPCa0W7rxhRS4v4oD6Xo6S
 bTZHgBfIPMZqs5sOYi2XEVUVjUWp81H2jGBjoG27/vOe6BYiU99VaAA6GrMs=
X-Google-Smtp-Source: AGHT+IGGyh/Yt5Y3UHgIdm33BW/SbOT+O8qgc/PjC71c2UsAI+prdVZgL/wDHjNMSSsMO25CqGoTog==
X-Received: by 2002:a05:6000:25e7:b0:3a6:d403:6e75 with SMTP id
 ffacd0b85a97d-3b4964bc62amr1477843f8f.4.1751627836017; 
 Fri, 04 Jul 2025 04:17:16 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030bc5asm2218847f8f.20.2025.07.04.04.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 04:17:14 -0700 (PDT)
Date: Fri, 4 Jul 2025 13:17:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: mperttunen@nvidia.com, jonathanh@nvidia.com, sumit.semwal@linaro.org, 
 christian.koenig@amd.com, simona@ffwll.ch, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/tegra: Avoid using import_attach directly
Message-ID: <vdcsji5fol6aafs7igblfduo7ulyovutlkjujumrvjiab3xmbg@hqagmqfqgaim>
References: <20250619113100.70292-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zy7wo7q7wtarbeba"
Content-Disposition: inline
In-Reply-To: <20250619113100.70292-1-tzimmermann@suse.de>
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


--zy7wo7q7wtarbeba
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] drm/tegra: Avoid using import_attach directly
MIME-Version: 1.0

On Thu, Jun 19, 2025 at 01:26:59PM +0200, Thomas Zimmermann wrote:
> The field import_attach of struct drm_gem_object is often only
> required by PRIME code. In other places, replace its use with
> clearer alternatives.
>=20
> Thomas Zimmermann (2):
>   drm/tegra: Test for imported buffers with drm_gem_is_imported()
>   drm/tegra: Use dma_buf from GEM object instance
>=20
>  drivers/gpu/drm/tegra/gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--zy7wo7q7wtarbeba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnuDUACgkQ3SOs138+
s6FtVg//VNdil86QlTdjvZr9F+xMTcrzIaZOV477T9IyJHCEBiJwp6FFMgdg7wHa
tgmwaAaqqa7i8FVVH7wET0b2g/gZj+1o7+2CKfCB9OqBRDHNDBA6srY4AxdlDy+U
AhrH5N1+0qSCka4htZSA9BPrLNzuOXE8/ycL4GutHR5sm0JrMgZCDr1pohYGMgca
0iFqPI83tvBBDdZ04Ssqqo9P4/54rzML0Xk01VM1kCGBylpDLu9NlfgpMr12dhQK
TzxP1SjlyHMNxRNBmKRktu81HAOoVqGigd45FpUBmWJ4saiVV0On9Xqkf6EjzC6b
fjciEQZQb9nymf4H/ocfqoyGgkC7tecnc9FAWc06KNxdMuuCdh43+FW7PP3igHgT
tpsUGGU1NfMckdlBh3XgT2eeqvGabIF87pmDIkXmvOLdVfVNTSF1qZUMgSbntrC6
FDkCIzDNrOGciq4oSOJx0WWoHuAkLh2Bs6F8sXxpA22ky+6JMOvOuGypF68vkX19
qanbdcty7EjkRmjtuhwMGgZBJc72lpzNoln8y+U4bkDbZ05HQFGjTnkq2LSKdzxK
cymAaopV0hTC8pMDvcG8EnI6mTRDcdWH9N95CPsXwsZQt/MhwBGrmyFsE8Hg5OSS
GD7+cb84qNMD0JMVJx/8xqWqLfzadri/WjLnMhJSFNzfYdK8YHM=
=8rNN
-----END PGP SIGNATURE-----

--zy7wo7q7wtarbeba--
