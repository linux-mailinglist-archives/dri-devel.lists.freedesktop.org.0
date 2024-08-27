Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A89605ED
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 11:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D15899B7;
	Tue, 27 Aug 2024 09:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AhgfUhk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA33899B7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:42:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AE1F7A416F3;
 Tue, 27 Aug 2024 09:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FA0C4DDF9;
 Tue, 27 Aug 2024 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724751266;
 bh=JfsZUqHIJR8oJ3r+VeQDCUSSVOAZfPnzoBFvAbbMRC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AhgfUhk7NVCQ+njvO9tT+dj6r/XI3aSwAh63ijhbpqsvRkUZFo4rwFg+t3q3RxVBg
 vgGkSmFE7dn5JpotjouGl8Ja4LhtzgOO1P2aUVbBFJsj79UGMnzN0eOCBibPJ7rVUT
 euYB81oCwfCGLRYj+vQUOVVDNqnSTwqKYfQ8EZaIvBJrm8S/r4mLK+QoBcZzXNSz7D
 ouK0tYYLgEkwmKnfOtga2W80eGG1rxUYdgEbqUZbag0ayB1mvI2ITAis4/r1DIBEGu
 ycBiMbDODwl3rg7bNRzv2ADqNfqkbPDo+oubYJmpiqK3+ERCHmNt2PBG7QDAIBFLzM
 RzdOwwO0n576w==
Date: Tue, 27 Aug 2024 11:34:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Derek Foreman <derek.foreman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, 
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v3] drm/connector: hdmi: Fix writing Dynamic Range
 Mastering infoframes
Message-ID: <20240827-bison-of-utter-resistance-be54df@houat>
References: <20240826121029.491976-1-derek.foreman@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="obrdurjl6mxrwchl"
Content-Disposition: inline
In-Reply-To: <20240826121029.491976-1-derek.foreman@collabora.com>
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


--obrdurjl6mxrwchl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 26, 2024 at 07:10:11AM GMT, Derek Foreman wrote:
> The largest infoframe we create is the DRM (Dynamic Range Mastering)
> infoframe which is 26 bytes + a 4 byte header, for a total of 30
> bytes.
>=20
> With HDMI_MAX_INFOFRAME_SIZE set to 29 bytes, as it is now, we
> allocate too little space to pack a DRM infoframe in
> write_device_infoframe(), leading to an ENOSPC return from
> hdmi_infoframe_pack(), and never calling the connector's
> write_infoframe() vfunc.
>=20
> Instead of having HDMI_MAX_INFOFRAME_SIZE defined in two places,
> replace HDMI_MAX_INFOFRAME_SIZE with HDMI_INFOFRAME_SIZE(MAX) and make
> MAX the same size as the DRM infoframe.
>=20
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 +---
>  drivers/gpu/drm/drm_debugfs.c                   | 4 +---
>  include/linux/hdmi.h                            | 3 +++
>  3 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 7854820089ec..feb7a3a75981 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -521,8 +521,6 @@ int drm_atomic_helper_connector_hdmi_check(struct drm=
_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
> =20
> -#define HDMI_MAX_INFOFRAME_SIZE		29
> -
>  static int clear_device_infoframe(struct drm_connector *connector,
>  				  enum hdmi_infoframe_type type)
>  {
> @@ -563,7 +561,7 @@ static int write_device_infoframe(struct drm_connecto=
r *connector,
>  {
>  	const struct drm_connector_hdmi_funcs *funcs =3D connector->hdmi.funcs;
>  	struct drm_device *dev =3D connector->dev;
> -	u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
> +	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
>  	int ret;
>  	int len;
> =20
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b239a24f1df..9d3e6dd68810 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -520,8 +520,6 @@ static const struct file_operations drm_connector_fop=
s =3D {
>  	.write =3D connector_write
>  };
> =20
> -#define HDMI_MAX_INFOFRAME_SIZE		29
> -
>  static ssize_t
>  audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count,=
 loff_t *ppos)
>  {
> @@ -579,7 +577,7 @@ static ssize_t _f##_read_infoframe(struct file *filp,=
 \
>  	struct drm_connector *connector; \
>  	union hdmi_infoframe *frame; \
>  	struct drm_device *dev; \
> -	u8 buf[HDMI_MAX_INFOFRAME_SIZE]; \
> +	u8 buf[HDMI_INFOFRAME_SIZE(MAX)]; \
>  	ssize_t len =3D 0; \
>  	\
>  	connector =3D filp->private_data; \
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index 3bb87bf6bc65..3a442a59919e 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -59,6 +59,9 @@ enum hdmi_infoframe_type {
>  #define HDMI_DRM_INFOFRAME_SIZE    26
>  #define HDMI_VENDOR_INFOFRAME_SIZE  4
> =20
> +/* The biggest infoframe size */
> +#define HDMI_MAX_INFOFRAME_SIZE		HDMI_DRM_INFOFRAME_SIZE

Thanks for that patch, it was definitely an oversight on my part. The
spec defines the max size of an infoframe to be 30 bytes, so we should
probably use that here?

Maxime

--obrdurjl6mxrwchl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs2dmgAKCRAnX84Zoj2+
dlupAX9wTW/saoEEEUWx/lXtkukA6NREZEv3e421SVgLE+1fuauwumCeFMqI7dcl
xFja/GoBgJ+d2LxjTXoAwny6jr+xLVeLp1e1ztNHIqy2aaqEZzCNFLXq6KVnzYrk
eji4OEMvBg==
=vmka
-----END PGP SIGNATURE-----

--obrdurjl6mxrwchl--
