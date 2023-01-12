Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33965666CDC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 09:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B09810E149;
	Thu, 12 Jan 2023 08:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E04A10E149
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673513458; x=1705049458;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=CAzCYnFbGjX2OYOk7NsdnSn10xrdH1c+tpBDigdvA2E=;
 b=ZYGxNDvbQFw6qtst3xAi7ytv/fKrSQVKe25wIafW6OusZXih2ML/tMqU
 TieRGpo6BCGXKaSdFOIZrQD1zDTS37eSRtZXlEsk1PBgqGRj3scHweBcA
 N4DS/p7jfvYW6HleL93fBzdHwbdykwFPMp4AiKwn3FEamKElsjuezaATA
 YW9rWp5TlWIXA3HaPYbf1BbfvEwgaexixR1ftWe2NBV/CMYp2wFiCx9rz
 mO6hVcm2+TkECmLC10eRrrUrNJmR9Nlm40LB3RWXLqBqRON6jEtKfmwGy
 jBMFepB6SdwvbvIUff2W3AXe+JxRWD6mgVvrritXFCiX8LlZpz0jMgenB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303348760"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="303348760"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 00:50:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="651057275"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="651057275"
Received: from lhazellx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.27.83])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 00:50:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Maxime Ripard
 <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 01/13] drm/debugfs: Create helper to add debugfs files
 to device's list
In-Reply-To: <20230111173748.752659-2-mcanal@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230111173748.752659-1-mcanal@igalia.com>
 <20230111173748.752659-2-mcanal@igalia.com>
Date: Thu, 12 Jan 2023 10:50:40 +0200
Message-ID: <87k01sgmqn.fsf@intel.com>
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
> Create a helper to encapsulate the code that adds a new debugfs file to
> a linked list related to a object. Moreover, the helper also provides
> more flexibily on the type of the object, allowing to use the helper for
> other types of drm_debugfs_entry.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 4f643a490dc3..255d2068ac16 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -316,6 +316,17 @@ void drm_debugfs_cleanup(struct drm_minor *minor)
>  	minor->debugfs_root =3D NULL;
>  }
>=20=20
> +#define drm_debugfs_add_file_to_list(component) do {			\
> +		entry->file.name =3D name;				\
> +		entry->file.show =3D show;				\
> +		entry->file.data =3D data;				\
> +		entry->component =3D (component);				\
> +									\
> +		mutex_lock(&(component)->debugfs_mutex);		\
> +		list_add(&entry->list, &(component)->debugfs_list);	\
> +		mutex_unlock(&(component)->debugfs_mutex);		\
> +	} while (0)

In general, please don't add macros that implicitly depend on certain
local variable names. In this case, "entry".

But I'm also not convinced about the usefulness of adding this kind of
"generics". Sure, it'll save you a few lines here and there, but I think
overall it's just confusing more than it's useful.


BR,
Jani.

> +
>  /**
>   * drm_debugfs_add_file - Add a given file to the DRM device debugfs fil=
e list
>   * @dev: drm device for the ioctl
> @@ -334,14 +345,7 @@ void drm_debugfs_add_file(struct drm_device *dev, co=
nst char *name,
>  	if (!entry)
>  		return;
>=20=20
> -	entry->file.name =3D name;
> -	entry->file.show =3D show;
> -	entry->file.data =3D data;
> -	entry->dev =3D dev;
> -
> -	mutex_lock(&dev->debugfs_mutex);
> -	list_add(&entry->list, &dev->debugfs_list);
> -	mutex_unlock(&dev->debugfs_mutex);
> +	drm_debugfs_add_file_to_list(dev);
>  }
>  EXPORT_SYMBOL(drm_debugfs_add_file);

--=20
Jani Nikula, Intel Open Source Graphics Center
