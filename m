Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B87C17325
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 23:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D916D10E68E;
	Tue, 28 Oct 2025 22:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="XWYnfUvm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012FE10E68E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 22:31:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4270a3464bcso5027095f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761690673; x=1762295473;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:reply-to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ITM43CPLBwOuYd6o70DQuUBrw0NjrXbprfM503VifJI=;
 b=XWYnfUvmaModpNk6Fwc9qxIzXzpEbLCnUwVjT3GsZALRpk5FOa6RznlGGCovUIPJlT
 T7VkI6LoJxnam3fkihOG6r7mlwQWk5CGTUnprVgPD1Y6WYgu2C1CeC4IRdDvPg6hBg3l
 ZBnFjrH5oYTxx+7w3dSUWTiDqUXuoLq/f7fieyn25gMbrkmc5XlG5FrpzlER6YAjV38q
 qx307GgSH55f1rxsG4SHrCIkDOlFsHrV3lEgrpKfjLDIpHoTZv7kA4RjXPTwdNj/sCKv
 oPA7BY+tSEr1FgaVD8L/9/hTisE5/TbFh8lzw0opwYHKsUZjOFoqXnoKdtzOakzN7N3U
 qrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761690673; x=1762295473;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:reply-to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ITM43CPLBwOuYd6o70DQuUBrw0NjrXbprfM503VifJI=;
 b=FyozQ4+wpwGu46UTSsU4XQJv9EDTK9n0FI2PW1/ZXMfVzTQvqDV0fbTs6h+7V/9XzQ
 hXydqVYbOREG87yHxQC/FCvq6CeXiNT/btrz04H5ixf/BPF4nPbggZ+QUAiPMshsxPJ3
 aDm+Nk/f1Xl6nNCsoVuWH5fra1S8j1yWTMyJle1vdezSQVKYpOgdeWXIBfvqOS36a/6K
 uGgpGj+CvDkdi7f1pEn7PVd0ihrF78w9DXNGM8dCoxcbLcfHEfqSu5+WH1y3Mj54bQlN
 slTkTaFG8J5SlnfstL8aNSa7sz8a5DffjgAU99Yemvbc80zT8lOyALhdsoFeqpOozS4O
 RhIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxcYRk1mv2I8ea94UyvTbuFRiWOPOE+BhiO5wNEk33LEn5z5vrHUXM8B7SxbkSawnc06Mjvj4zsq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQZm+CzqzNkX7CUKaVbHYbXCedV06hZ0VbX0wQ6jl2JhwQPbi0
 hAWtjjaN7+ntrsXzbj3C23UKYRxT8ZdCq/PFch493HIuTAz04K6DvJpf
X-Gm-Gg: ASbGncuL9WypM53U7Upk4wWbjcob8/OPpivG+GQDJIfY8sqkJyefqLfGGNlJ/9jK5gC
 e+Z6rHaHkS81fXtWSjCc9oIIp/gGvaet14Jf7zrh5gDcySKiuCO6nEjnQ8o+a4I5iTEyMMt8SV0
 joeRj3+33DCrClfHC347bz8zPuLwh3D9L1zi6LiJm75t8q5lTIyWjfR4ATm+0i2imm7EiESVGTW
 LMztpjIjYV8nuAg8FE5/rekT0nkqG6llksZQLWDOhWRgZLo/SkLGa0CN4p0pI/wEnzuT6YMsxPs
 uLPfUcE/YOuHSD5/7+AaVxp6AmS/dM8Ok6rc1pAMYf4IBn2PXhYY64sCRM9wGlg09sVbi8MH150
 MbtTFDgd5RLnZWZrmFqJUkPBVaxmVe3IucyaCXgP8b+WyeD6L5co30T7P4RshSuHfHJPmhH84iz
 YqTMBwmIWYdYqCofNBiSOr/MbOLrBhN41plA/m/BB5GE82z1f7XcQUV3GK
X-Google-Smtp-Source: AGHT+IF39JXaNKoZtJy/RnakC95kMOdpqIZDZsaP2nRMKdtss4WP+ExeeGb//XMDyt0ZBLq/3VZ/Jg==
X-Received: by 2002:a5d:5f48:0:b0:425:86ca:98c with SMTP id
 ffacd0b85a97d-429aef86b59mr393337f8f.28.1761690673262; 
 Tue, 28 Oct 2025 15:31:13 -0700 (PDT)
Received: from ?IPv6:2a02:8071:7130:82c0:da34:bd1d:ae27:5be6?
 ([2a02:8071:7130:82c0:da34:bd1d:ae27:5be6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de5f9sm22707923f8f.38.2025.10.28.15.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 15:31:12 -0700 (PDT)
Message-ID: <aeee5f47ef2842fde66bc66fc598ee4f007fc1c2.camel@googlemail.com>
Subject: Re: [PATCH] drm/panel: kingdisplay-kd097d04: Disable EoTp
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Sebastian Fleer <dev@dwurp.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 28 Oct 2025 23:31:11 +0100
In-Reply-To: <20251028214045.1944956-1-dev@dwurp.de>
References: <20251028214045.1944956-1-dev@dwurp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Reply-To: chf.fritz@googlemail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian

On Tue, 2025-10-28 at 22:38 +0100, Sebastian Fleer wrote:
> Since commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoT=
p by
> default") panel output on an Acer Chromebook Tab 10 (google-dru) is corru=
pted.
> The tablet I use is equipped with a kingdisplay-kd097d04 panel, disabling=
 EoTp
> restores the correct functionality.
>=20
> Fixes: d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by d=
efault")

Just to clarify: This is not a fix for that commit, it is a fix for the
panel driver itself.

EoTp is the default in Linux, a panel driver cannot enable it, only
disable it.

Commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by
default") fixed a bug in the synopsys dw-mipi-dsi because EoTp was not
enabled there by default.

Enabling EoTp in dw-mipi-dsi revealed an underlying issue in panel-
kingdisplay-kd097d04.

That same issue appears if one would connect this panel to a different
mipi-dsi core (because there EoTp is also enabled by default).

> Signed-off-by: Sebastian Fleer <dev@dwurp.de>
> ---
>  drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers=
/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> index 2fc7b0779b37..893af9b16756 100644
> --- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> @@ -359,7 +359,7 @@ static int kingdisplay_panel_probe(struct mipi_dsi_de=
vice *dsi)
>  	dsi->lanes =3D 4;
>  	dsi->format =3D MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> =20
>  	kingdisplay =3D devm_drm_panel_alloc(&dsi->dev, __typeof(*kingdisplay),=
 base,
>  					   &kingdisplay_panel_funcs,
