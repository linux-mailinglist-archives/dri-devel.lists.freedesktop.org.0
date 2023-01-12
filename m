Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA6666D49
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AE510E8A1;
	Thu, 12 Jan 2023 09:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3630110E8A1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673514104; x=1705050104;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qVY1e9M0eEXiOmhEMTojVLWddTwpbxUusI4Ju4O7Fj8=;
 b=AFFmq9Cm7RIOPIEkfg2jf1AJyu75chwoKzDj1F2u86CxaI5jUdwhMyCk
 S6ZeR+lnD4c2CxBpj26Lrt8zfzLjlqBE7/GhgEjivQfSpcWPVJnnB/p/K
 BUgvNLo4c/VPEbSvZIj+TXxqVl6izdSEZsGc1pFb8JvYZXtgKGwFUk0+d
 ofMREAAINAefOBmqC4h6O7WL4e0W+WypDETRjRx2NSOn34bWijEe8IoDh
 Wb7fNNcONZ4rw+TnecZBYJPAAq6E/h98bI5cEydZZEm32jbP/x9kONKMW
 wEp/TjfYSpE0jT30r0nSh+XIcR95+BskAQxT4Xgg7M1EnR1MXubFx1c5s Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303351655"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="303351655"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 01:01:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607718986"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="607718986"
Received: from lhazellx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.27.83])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 01:01:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Maxime Ripard
 <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 04/13] drm/debugfs: Create a debugfs infrastructure for
 encoders
In-Reply-To: <20230111173748.752659-5-mcanal@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230111173748.752659-1-mcanal@igalia.com>
 <20230111173748.752659-5-mcanal@igalia.com>
Date: Thu, 12 Jan 2023 11:01:04 +0200
Message-ID: <87eds0gm9b.fsf@intel.com>
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
> Introduce the ability to add DRM debugfs files to a list managed by the
> encoder and, during drm_encoder_register_all(), all added files will be
> created at once.
>
> Moreover, introduce some typesafety as struct drm_debugfs_encoder_entry
> holds a drm_encoder instead of a drm_device. So, the drivers can get
> a encoder object directly from the struct drm_debugfs_encoder_entry
> in the show() callback.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c  | 36 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_encoder.c  |  6 ++++++
>  drivers/gpu/drm/drm_internal.h |  5 +++++
>  include/drm/drm_debugfs.h      | 26 ++++++++++++++++++++++++
>  include/drm/drm_encoder.h      | 15 ++++++++++++++
>  5 files changed, 88 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index d9ec1ed5a7ec..6a763fe1b031 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -36,6 +36,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_managed.h>
> @@ -271,6 +272,17 @@ void drm_debugfs_connector_init(struct drm_connector=
 *connector)
>  	drm_create_file_from_list(connector);
>  }
>=20=20
> +void drm_debugfs_encoder_init(struct drm_encoder *encoder)
> +{
> +	struct drm_minor *minor =3D encoder->dev->primary;
> +	struct drm_debugfs_encoder_entry *entry, *tmp;
> +
> +	if (!minor)
> +		return;
> +
> +	drm_create_file_from_list(encoder);
> +}

Because of the macro, this just looks like entry and tmp are unused
local variables.

> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 3a09682af685..38b73f2a4e38 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -182,6 +182,21 @@ struct drm_encoder {
>  	 */
>  	struct list_head bridge_chain;
>=20=20
> +	/**
> +	 * @debugfs_mutex:
> +	 *
> +	 * Protects &debugfs_list access.
> +	 */
> +	struct mutex debugfs_mutex;
> +
> +	/**
> +	 * @debugfs_list:
> +	 *
> +	 * List of debugfs files to be created by the DRM encoder. The files
> +	 * must be added during drm_encoder_register_all().
> +	 */
> +	struct list_head debugfs_list;
> +

If you added an additional struct wrapper for the above debugfs stuff
(and actually defined it in a drm debugfs header where it belongs), and
added that to encoder, connector, etc., you could pass a pointer to
*that* to the drm_debugfs_add_file_to_list() and
drm_create_file_from_list() proper functions.

Less boilerplate, nicer functions, debugfs stuff grouped together and
defined in the .[ch] they're used in.

I think that would be much nicer.


BR,
Jani.



>  	const struct drm_encoder_funcs *funcs;
>  	const struct drm_encoder_helper_funcs *helper_private;
>  };

--=20
Jani Nikula, Intel Open Source Graphics Center
