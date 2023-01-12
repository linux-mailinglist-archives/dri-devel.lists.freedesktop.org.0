Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EC7666DF2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7A410E8AC;
	Thu, 12 Jan 2023 09:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8077310E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673515184; x=1705051184;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TrOuD4amWAPqNzeCZig3GrQfa+f14ko+GiVXcZ3KFxQ=;
 b=fzAMZGiHT9ozExl4kMsVde6RAIWxFZp1a3VtKIewG/S9VJZzffepb1yl
 0bTkvSJUuDHIWAXPA/bZdAXLEj3xbNt5UpPjBxgWw8QwIR1bc1t55c6dF
 ob2eMh4RePD8C6qUbNmYmTQNi3MHrsrUnIxx0i30b3SbBipW/D+UW3wg3
 OJ534EXcNN3H8yMVFTz0pnDWxIZYJZmtoez59UNOCevYv3SPp+OPXJX7I
 A4q5mMt5Wi6+Ve+FFrVUosJ5ra67ZUbTRi9+m9HBxH+AaGosL2/qbOFP3
 hKHKDkAGeQpsUmNwyNxdyJoqwl5Qb8253ZZ0YXQ4ZvVrDo4rtvLw9c40Z Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="388125192"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="388125192"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 01:19:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="657731657"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="657731657"
Received: from lhazellx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.27.83])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 01:19:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Maxime Ripard
 <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 07/13] drm/vc4: Use the encoders' debugfs infrastructure
In-Reply-To: <20230111173748.752659-8-mcanal@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230111173748.752659-1-mcanal@igalia.com>
 <20230111173748.752659-8-mcanal@igalia.com>
Date: Thu, 12 Jan 2023 11:19:37 +0200
Message-ID: <878ri8glee.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Jan 2023, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> Replace the use of drm_debugfs_add_files() with the new
> drm_debugfs_encoder_add_files() function, which centers the debugfs files
> management on the drm_encoder instead of drm_device. Using this function
> on late register callbacks is more adequate as the callback passes a
> drm_encoder as parameter.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vc4/vc4_debugfs.c | 17 +++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_dpi.c     |  3 +--
>  drivers/gpu/drm/vc4/vc4_drv.h     |  8 ++++++++
>  drivers/gpu/drm/vc4/vc4_dsi.c     |  3 +--
>  drivers/gpu/drm/vc4/vc4_hdmi.c    |  5 ++---
>  drivers/gpu/drm/vc4/vc4_vec.c     |  3 +--
>  6 files changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_=
debugfs.c
> index 80afc69200f0..c71e4d6ec4c4 100644
> --- a/drivers/gpu/drm/vc4/vc4_debugfs.c
> +++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
> @@ -57,9 +57,26 @@ static int vc4_debugfs_dev_regset32(struct seq_file *m=
, void *unused)
>  	return vc4_debugfs_regset32(drm, regset, &p);
>  }
>=20=20
> +static int vc4_debugfs_encoder_regset32(struct seq_file *m, void *unused)
> +{
> +	struct drm_debugfs_encoder_entry *entry =3D m->private;
> +	struct drm_device *drm =3D entry->encoder->dev;

Feels like struct drm_debugfs_encoder_entry should be an implementation
detail. Maybe add helpers to get the encoder/connector/etc pointer, and
keep struct drm_debugfs_encoder_entry internal to the debugfs
implementation?

	struct drm_device *drm =3D drm_debugfs_something_encoder(m->private)->dev;

However, even cooler would be if we could have the debugfs code wrap the
calls, and you could have:

	static int vc4_debugfs_encoder_regset32(struct drm_encoder *encoder);

struct drm_debugfs_encoder_entry could have a function pointer for the
above, and there'd be a simple wrapper in debugfs code:

static int encoder_debugfs_show(struct seq_file *m, void *unused)
{
	struct drm_debugfs_encoder_entry *entry =3D m->private;
	struct drm_encoder *encoder =3D entry->encoder;

	return entry->show(encoder);
}

drm_debugfs_encoder_add_file() would fill in entry->show, and add that
as the show function for core debugfs code.

Ditto for connector/crtc/etc.

This would make all of the drm debugfs functions so much nicer.

BR,
Jani.


> +	struct debugfs_regset32 *regset =3D entry->file.data;
> +	struct drm_printer p =3D drm_seq_file_printer(m);
> +
> +	return vc4_debugfs_regset32(drm, regset, &p);
> +}
> +
>  void vc4_debugfs_add_regset32(struct drm_device *drm,
>  			      const char *name,
>  			      struct debugfs_regset32 *regset)
>  {
>  	drm_debugfs_add_file(drm, name, vc4_debugfs_dev_regset32, regset);
>  }
> +
> +void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
> +				      const char *name,
> +				      struct debugfs_regset32 *regset)
> +{
> +	drm_debugfs_encoder_add_file(encoder, name, vc4_debugfs_encoder_regset3=
2, regset);
> +}
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index f518d6e59ed6..084f7825dfa4 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -265,10 +265,9 @@ static const struct drm_encoder_helper_funcs vc4_dpi=
_encoder_helper_funcs =3D {
>=20=20
>  static int vc4_dpi_late_register(struct drm_encoder *encoder)
>  {
> -	struct drm_device *drm =3D encoder->dev;
>  	struct vc4_dpi *dpi =3D to_vc4_dpi(encoder);
>=20=20
> -	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
> +	vc4_debugfs_encoder_add_regset32(encoder, "dpi_regs", &dpi->regset);
>=20=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 95069bb16821..8aaa8d00bc45 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -969,12 +969,20 @@ void vc4_debugfs_init(struct drm_minor *minor);
>  void vc4_debugfs_add_regset32(struct drm_device *drm,
>  			      const char *filename,
>  			      struct debugfs_regset32 *regset);
> +void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
> +				      const char *name,
> +				      struct debugfs_regset32 *regset);
>  #else
>=20=20
>  static inline void vc4_debugfs_add_regset32(struct drm_device *drm,
>  					    const char *filename,
>  					    struct debugfs_regset32 *regset)
>  {}
> +
> +static inline void vc4_debugfs_encoder_add_regset32(struct drm_encoder *=
encoder,
> +						    const char *name,
> +						    struct debugfs_regset32 *regset)
> +{}
>  #endif
>=20=20
>  /* vc4_drv.c */
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 2a71321b9222..00751b76bfe0 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1424,10 +1424,9 @@ static const struct drm_bridge_funcs vc4_dsi_bridg=
e_funcs =3D {
>=20=20
>  static int vc4_dsi_late_register(struct drm_encoder *encoder)
>  {
> -	struct drm_device *drm =3D encoder->dev;
>  	struct vc4_dsi *dsi =3D to_vc4_dsi(encoder);
>=20=20
> -	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
> +	vc4_debugfs_encoder_add_regset32(encoder, dsi->variant->debugfs_name, &=
dsi->regset);
>=20=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 14628864487a..221cef11d4dd 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2002,12 +2002,11 @@ static const struct drm_encoder_helper_funcs vc4_=
hdmi_encoder_helper_funcs =3D {
>=20=20
>  static int vc4_hdmi_late_register(struct drm_encoder *encoder)
>  {
> -	struct drm_device *drm =3D encoder->dev;
>  	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>  	const struct vc4_hdmi_variant *variant =3D vc4_hdmi->variant;
>=20=20
> -	drm_debugfs_add_file(drm, variant->debugfs_name,
> -			     vc4_hdmi_debugfs_regs, vc4_hdmi);
> +	drm_debugfs_encoder_add_file(encoder, variant->debugfs_name,
> +				     vc4_hdmi_debugfs_regs, vc4_hdmi);
>=20=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index a3782d05cd66..4c5bd733d524 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -716,10 +716,9 @@ static const struct drm_encoder_helper_funcs vc4_vec=
_encoder_helper_funcs =3D {
>=20=20
>  static int vc4_vec_late_register(struct drm_encoder *encoder)
>  {
> -	struct drm_device *drm =3D encoder->dev;
>  	struct vc4_vec *vec =3D encoder_to_vc4_vec(encoder);
>=20=20
> -	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
> +	vc4_debugfs_encoder_add_regset32(encoder, "vec_regs", &vec->regset);
>=20=20
>  	return 0;
>  }

--=20
Jani Nikula, Intel Open Source Graphics Center
