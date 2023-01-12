Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A39F666D07
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 09:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B1210E89C;
	Thu, 12 Jan 2023 08:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6435810E89C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673513621; x=1705049621;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=GUK7AG0+HQfe2XKEFyZGgtqCHbDE2XWbTu+LfXD5oMU=;
 b=fgBQODJimDsEdDjNopuztnu1wqZ+OTKNf5zaQgchD5YVZTm5JYNz8Hp1
 2QzK6wMuvK16CAyNhGJgvuB+omI7fcasXqqVJjQuYBXCzpH83POSBoiqF
 i4IShtEiNvNO39r6WVFNC2fCotv1LljIvQtZfH5mmvURbs/wgc/eeTJa8
 IT4B4ORGgJcGEroWP0gSOoUP2168ZM9SEprGSn0izjpNaao/5UiUZCGn7
 ScP56WXmimrg01WHVKYxflbH4ZlHZrq3KWGgrKD8gy6DtLdDZ/rfrwohn
 mZSkqJjOOzVpk3tJk7U6i5BenpwRb9P+wQCXL/biPJ/wzLA6qOzx5uq7d Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="321342501"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="321342501"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 00:53:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="800128545"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="800128545"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.27.83])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 00:53:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Maxime Ripard
 <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 02/13] drm/debugfs: Create helper to create debugfs
 files from list
In-Reply-To: <20230111173748.752659-3-mcanal@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230111173748.752659-1-mcanal@igalia.com>
 <20230111173748.752659-3-mcanal@igalia.com>
Date: Thu, 12 Jan 2023 10:53:33 +0200
Message-ID: <87h6wwgmlu.fsf@intel.com>
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
> Create a helper to encapsulate the code that creates a new debugfs file
> from a linked list related to an object. Moreover, the helper also provid=
es
> more flexibily on the type of the object.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 255d2068ac16..23f6ed7b5d68 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -218,6 +218,16 @@ void drm_debugfs_create_files(const struct drm_info_=
list *files, int count,
>  }
>  EXPORT_SYMBOL(drm_debugfs_create_files);
>=20=20
> +#define drm_create_file_from_list(component) do {					\
> +		list_for_each_entry_safe(entry, tmp, &(component)->debugfs_list,	\
> +					 list) {					\
> +			debugfs_create_file(entry->file.name, 0444,			\
> +					    minor->debugfs_root, entry,			\
> +					    &drm_debugfs_entry_fops);			\
> +			list_del(&entry->list);						\
> +		}									\
> +	} while (0)
> +

Same here as in the previous patch. I really think you should try to
figure out how to break this into useful functions, and avoid macros
like this.

BR,
Jani.

>  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  		     struct dentry *root)
>  {
> @@ -245,11 +255,7 @@ int drm_debugfs_init(struct drm_minor *minor, int mi=
nor_id,
>  	if (dev->driver->debugfs_init)
>  		dev->driver->debugfs_init(minor);
>=20=20
> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> -		debugfs_create_file(entry->file.name, 0444,
> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> -		list_del(&entry->list);
> -	}
> +	drm_create_file_from_list(dev);
>=20=20
>  	return 0;
>  }
> @@ -262,11 +268,7 @@ void drm_debugfs_late_register(struct drm_device *de=
v)
>  	if (!minor)
>  		return;
>=20=20
> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> -		debugfs_create_file(entry->file.name, 0444,
> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> -		list_del(&entry->list);
> -	}
> +	drm_create_file_from_list(dev);
>  }
>=20=20
>  int drm_debugfs_remove_files(const struct drm_info_list *files, int coun=
t,

--=20
Jani Nikula, Intel Open Source Graphics Center
