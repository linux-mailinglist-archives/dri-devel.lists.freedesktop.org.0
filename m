Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F69966215B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848A110E387;
	Mon,  9 Jan 2023 09:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF3210E387
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673256163; x=1704792163;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ztTKJLAYLdsnjwu13/hosydJOMVcTGPsqlQq4Xtfc3o=;
 b=EBGE/eh8G2yLwaaYEHPuqosGRb1aF8SfTT+JfbetSoIWFhSrCDAam8YK
 /NigVNSNWT+YiZcy5I8TUoMZTgv+L/cZiPT7+9IcYNeGzHuUmZRxUeYgL
 tCan48vn2W7knoIop2y5W1+N4WATPgJsHRWsI4H6k6Y3gqhFx7EsbbmBS
 2QtBtv2khGZTuil39mlKKnw4/uDk4qRE+WwcyKMEh4F6GVb6EoKQ+TeIs
 eWI9qQYQpdN+adPwGv+JHVQeFkNnSQnDIywTHMRJwJvBc+lEG7aQoDn16
 3o+Wl1GUtJ11Hmm6hXmsS0yuFUOVhnlLADskupITnoUzVMQ2tB9lq+XQn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="322906468"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="322906468"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:22:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="985337425"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="985337425"
Received: from gtmcgeac-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.11.217])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:22:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/debugfs: use octal permissions instead of
 symbolic permissions
In-Reply-To: <20230105193039.287677-1-mcanal@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230105193039.287677-1-mcanal@igalia.com>
Date: Mon, 09 Jan 2023 11:22:37 +0200
Message-ID: <877cxw2hb6.fsf@intel.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Jan 2023, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> Currently, debugfs functions are using symbolic macros as permission
> bits, but checkpatch reinforces permission bits in the octal form, as
> they are more readable and easier to understand [1].
>
> Therefore, use octal permission bits in all debugfs functions.
>
> [1] https://docs.kernel.org/dev-tools/checkpatch.html#permissions
>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

The commit message should also mention S_IFREG is redundant. Can be
fixed while applying.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_debugfs.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 5ea237839439..4f643a490dc3 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -207,7 +207,7 @@ void drm_debugfs_create_files(const struct drm_info_l=
ist *files, int count,
>=20=20
>  		tmp->minor =3D minor;
>  		tmp->dent =3D debugfs_create_file(files[i].name,
> -						S_IFREG | S_IRUGO, root, tmp,
> +						0444, root, tmp,
>  						&drm_debugfs_fops);
>  		tmp->info_ent =3D &files[i];
>=20=20
> @@ -246,7 +246,7 @@ int drm_debugfs_init(struct drm_minor *minor, int min=
or_id,
>  		dev->driver->debugfs_init(minor);
>=20=20
>  	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> -		debugfs_create_file(entry->file.name, S_IFREG | S_IRUGO,
> +		debugfs_create_file(entry->file.name, 0444,
>  				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>  		list_del(&entry->list);
>  	}
> @@ -263,7 +263,7 @@ void drm_debugfs_late_register(struct drm_device *dev)
>  		return;
>=20=20
>  	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> -		debugfs_create_file(entry->file.name, S_IFREG | S_IRUGO,
> +		debugfs_create_file(entry->file.name, 0444,
>  				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>  		list_del(&entry->list);
>  	}
> @@ -508,15 +508,15 @@ void drm_debugfs_connector_add(struct drm_connector=
 *connector)
>  	connector->debugfs_entry =3D root;
>=20=20
>  	/* force */
> -	debugfs_create_file("force", S_IRUGO | S_IWUSR, root, connector,
> +	debugfs_create_file("force", 0644, root, connector,
>  			    &drm_connector_fops);
>=20=20
>  	/* edid */
> -	debugfs_create_file("edid_override", S_IRUGO | S_IWUSR, root, connector,
> +	debugfs_create_file("edid_override", 0644, root, connector,
>  			    &drm_edid_fops);
>=20=20
>  	/* vrr range */
> -	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
> +	debugfs_create_file("vrr_range", 0444, root, connector,
>  			    &vrr_range_fops);
>=20=20
>  	/* max bpc */

--=20
Jani Nikula, Intel Open Source Graphics Center
