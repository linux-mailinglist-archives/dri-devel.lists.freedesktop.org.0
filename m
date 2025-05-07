Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB36AAE532
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE84D10E82D;
	Wed,  7 May 2025 15:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ARn1kjGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE99A10E82D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:44:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so83645e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746632698; x=1747237498; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=byHNTAzoVmJ12jHVr8chWlceaJLIIt4EKT+rNT09G+c=;
 b=ARn1kjGTOhEjCWJHE1+O0UuOV+x5WmTpYmpXQbGWYUNgHSOAAbE0yq8gj6bCH0AEM9
 e10ff06MS8UVsjMeTSTdlwnQetuypjrHimZoJy/DnitsJorj1HR66WSEtQXyp1kxjE9O
 AcckFsK2bykMJf59vp8TX9IACV+CzJ/GnLO6V8pUkk6t1MVrdNqqxjF0uYccbh8KWDzT
 el6tRS9kG09ryeDWzDqjtwyCD6r+ZDDDBIhI/8zQoBLyXnW32UR1ALcieGNFVf6z7A1q
 g88mICUmK9iYdep1nXdx/QuYids9H7+RHoem3ouHnk2XRl81rIn++wizaebJpJMCsOxS
 tQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746632698; x=1747237498;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=byHNTAzoVmJ12jHVr8chWlceaJLIIt4EKT+rNT09G+c=;
 b=v79/aFYzVUIb6VxPNC2tDBwFNZWuJSDz3WEtUGk89PdShqvm19V9H9FiOgV10ELU44
 BS8vrVMG5UxzXpev0oCZVIiTFNNJSZYulzAVlz10VUGJAXS2uxm+O9xuawcaRG2weuTq
 8umsPdXzTgRDeLoXJi0jz+JyPWnG85RcN3OR5eIatsnykOoMXym2XZ5bJ/C8Hmkl7aJ1
 70r11NecfUjMwPW0TH46zVyRNYfHAByRZw4ojzYfuPq+y55mOSU3LdNCsKDLJYaDL4mC
 Wox4shAmAK9PQRmaFyaNEmtzFOPnPOWh731DtzsRUptyaHMxYWGz+IjANwqqGCTWGmsv
 mYSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV45f7bQ/duOgN8PlCFJFggoHNMztOgtlySidyxrQKx2ljmhlLZ7t/ZrtxZzbNEAzFFZmqq7f+rcSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo4FsdSsJxSzGle3h6tCahJwJeIoe3UGLgs1SbzqW22j7r8ksY
 g+MLqCz9UCOf9+l9biB2HGqJlZMUpYhdlf7J5ldMhlRRvI1vbREgWwdKYg==
X-Gm-Gg: ASbGncuOxognHiPHmTx0zDojSW8n9OlR42RDclY4fTbDBzzhqSdZ97gZ2Ndve/LoOwZ
 WpyVbsjQYNZVp0lhUN8FXENZd0UvBIpmW9LMNlfHy+EZgtXHnCm1WpO/o+Pgj7e6O5GWfSbskXx
 o3/SSvrvvOSMWV2pH28fymC1oo+V5M9XKQnYDNNbaeSRv1k+l+T7D9Ju/b9hWbO82FVQaQPGoJ3
 9MlMGtR3W1zh1tBJMn9QqIBsF1IZuYJgWOYmBCaqo0kwckrCCdaS2SjjKOJh89wXqzhmva/KK9U
 7bohmdFs9ltLuOx62tf1CB/5Kqwm4sBC80cDsgOBSyHipCHpQ3rBdcHDjoaPX17+HFG39xr+fL4
 ISNnV8ucozlsPzwCRklUpTG2d3Ng=
X-Google-Smtp-Source: AGHT+IHfJJG0cs4abjEiWvnxwVTISrHAZEF9OSHQcqWVHkiT4B5VkyD3vvSWb6GVCRi9QWsDxzrI4Q==
X-Received: by 2002:a05:6000:420a:b0:390:e8d4:6517 with SMTP id
 ffacd0b85a97d-3a0b49bee22mr2812986f8f.21.1746632698276; 
 Wed, 07 May 2025 08:44:58 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0ad54f105sm5672659f8f.85.2025.05.07.08.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:44:57 -0700 (PDT)
Date: Wed, 7 May 2025 17:44:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: laurent.pinchart@ideasonboard.com, mperttunen@nvidia.com, 
 airlied@gmail.com, simona@ffwll.ch, jonathanh@nvidia.com, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, 
 zhang.enpei@zte.com.cn
Subject: Re: [PATCH linux-next 1/2] gpu: drm: tegra: dpaux: Use dev_err_probe()
Message-ID: <lihaxdejm7rvuurpoj43hf5zcvrfqlztdwxqs6p443jt73noqt@iipbc2udbgo5>
References: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
 <20250402193758365XauggSF2EWBYY-e_jgNch@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rt7ige55tnphtzlx"
Content-Disposition: inline
In-Reply-To: <20250402193758365XauggSF2EWBYY-e_jgNch@zte.com.cn>
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


--rt7ige55tnphtzlx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH linux-next 1/2] gpu: drm: tegra: dpaux: Use
 dev_err_probe()
MIME-Version: 1.0

On Wed, Apr 02, 2025 at 07:37:58PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.
>=20
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--rt7ige55tnphtzlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbf/YACgkQ3SOs138+
s6H2ZBAArFAuCN0WTxbq9wpDNT3hPLUMpHA6Sdh2TFEGIklk5Hj+oHTcSPS5AV9q
uvfJynPiWqjRY4dTAs0J+6IH1R7eo/Qm71jvnoPS37oAteCO3hQqHeRVGgWN8PoH
vWwKaO4T/ipB8rcUfqv8TH/b74FIchpMB3/K5oaalRKjPlYEs7rahimhPq0utf7u
GELGnbPiXftDKLXxXkeQ+sXdVcvIINIikGobmY2khF9oxb43kN0JlRqxnnNF0lHh
0+j2q2TMEGQRr/V8+avobslZXYkqyuBOa/RaWNN7W3Y4kBOEXNxOn3GoN3hkaaol
WrXzjMX2k6OVU+MLYxR5+G+OWNRVXg/GK6KbzE4O1zJcJ5zhWssqThv61Nt3cqgz
nby8EIlFfV+/Yjus8iTVKE2HcntU2vbi0PCB2HHdzkVGwyha9nx9lprcq83N4HJ5
rKg3m+FP2tnrT5/JBg39FN5OftZgjN7q63WZwaly3P90pP9OhGKKDGE8+HGpzOea
mxVEb+8MwHag8/vNh8LHLxMLTTvNb4mn/pbmTmtFU4v/sDnsFtS0zcTAcDiY7tsL
0n/8gjh/ELimcnCQMWe4v4RGb2bCxSIFupwn2o01Shq3RgppcL+yEng2D9cJ+NVV
TdDxber+/HIqgTWDWoMkq0D2FUZG0pN3DPMF0FXUIQDGQAy17Qs=
=2Zbo
-----END PGP SIGNATURE-----

--rt7ige55tnphtzlx--
