Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF488DDEC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD2D10F36F;
	Wed, 27 Mar 2024 12:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAF810F196
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:12:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rpS8K-0004ds-Ci; Wed, 27 Mar 2024 13:11:56 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rpS8I-008nwn-4g; Wed, 27 Mar 2024 13:11:54 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1rpS8I-0007xg-0D;
 Wed, 27 Mar 2024 13:11:54 +0100
Message-ID: <5f6ab3804baa87f6e2299f668d2ab41be3a13f13.camel@pengutronix.de>
Subject: Re: [PATCH v5 11/16] drm/vkms: Add YUV support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Louis Chauvet <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>, 
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, arthurgrillo@riseup.net, Jonathan Corbet
 <corbet@lwn.net>,  pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com
Date: Wed, 27 Mar 2024 13:11:53 +0100
In-Reply-To: <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Louis,

On Mi, 2024-03-13 at 18:45 +0100, Louis Chauvet wrote:
> From: Arthur Grillo <arthurgrillo@riseup.net>
>=20
> Add support to the YUV formats bellow:
>=20
> - NV12/NV16/NV24
> - NV21/NV61/NV42
> - YUV420/YUV422/YUV444
> - YVU420/YVU422/YVU444
>=20
> The conversion from yuv to rgb is done with fixed-point arithmetic, using
> 32.32 floats and the drm_fixed helpers.

s/floats/fixed-point numbers/

Nothing floating here, the point is fixed.

[...]
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 23e1d247468d..f3116084de5a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -99,6 +99,27 @@ typedef void (*pixel_read_line_t)(const struct vkms_pl=
ane_state *plane, int x_st
>  				  int y_start, enum pixel_read_direction direction, int count,
>  				  struct pixel_argb_u16 out_pixel[]);
> =20
> +/**
> + * CONVERSION_MATRIX_FLOAT_DEPTH - Number of digits after the point for =
conversion matrix values

s/CONVERSION_MATRIX_FLOAT_DEPTH/CONVERSION_MATRIX_FRACTIONAL_BITS/

Just a suggestion, maybe there are better terms, but using "FLOAT" here
is confusing.

> + */
> +#define CONVERSION_MATRIX_FLOAT_DEPTH 32
> +
> +/**
> + * struct conversion_matrix - Matrix to use for a specific encoding and =
range
> + *
> + * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a=
 row-major manner and is
> + * used to compute rgb values from yuv values:
> + *     [[r],[g],[b]] =3D @matrix * [[y],[u],[v]]
> + *   OR for yvu formats:
> + *     [[r],[g],[b]] =3D @matrix * [[y],[v],[u]]
> + *  The values of the matrix are fixed floats, 32.CONVERSION_MATRIX_FLOA=
T_DEPTH

s/fixed floats/fixed-point numbers/

regards
Philipp
