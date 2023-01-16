Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136B166BC59
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B54110E3BF;
	Mon, 16 Jan 2023 10:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A2F10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673866796; x=1705402796;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dtgqr84vqPr59icu0mlZM/J8Ue6Bl6I+1/o9zQtF7JM=;
 b=JvKmwtLeerVzPMvumSOHJi4n/oALGTyPxE5Zq9UiJndy8LFzhYk+8Z0E
 uA+KiKCZks7Q3h36jvb0qbRCa9dLDc0xfSjyLFY6M/Kk37EhcHJcyCK8R
 FbVDXSlKzhTta+TnwMmRnOh8RxOSZ6SLJM7IfK/mfx+taw0LsVKMbb2XU
 u/jwtNImeGS+mmCf8+FDYjle0wDhqD2Tos1C6WjnHtHBvPXZx64c8O8g0
 u+0qq8dZzfhlJgllSvD02i4OtlMgHOgZDY8lrSS5f9GRz59NwuovI2gKF
 yVkM5fRcxljsTlkBqAArN0GPoD1qbGDstMc3qHYLig34TUW6hEqLmWXCf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="307994706"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="307994706"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 02:59:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="722276948"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="722276948"
Received: from amakarev-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.13.137])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 02:59:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau
 <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>, Noralf
 =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Emma Anholt
 <emma@anholt.net>, Melissa Wen
 <mwen@igalia.com>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH 3/6] drm/debugfs: Create wrapper to add files to debugfs
 list
In-Reply-To: <20230116102815.95063-4-mcanal@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230116102815.95063-1-mcanal@igalia.com>
 <20230116102815.95063-4-mcanal@igalia.com>
Date: Mon, 16 Jan 2023 12:59:48 +0200
Message-ID: <87r0vueod7.fsf@intel.com>
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
Cc: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Jan 2023, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> Create a helper to encapsulate the code that adds a new debugfs file to
> a linked list related to a object. Moreover, the helper also provides
> more flexibily, as the parameter is a struct drm_debugfs_list.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 176b0f8614e5..aca460fa5d23 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -229,6 +229,13 @@ void drm_debugfs_list_destroy(struct drm_debugfs_lis=
t *debugfs_list)
>  	mutex_destroy(&debugfs_list->mutex);
>  }
>=20=20
> +static void drm_debugfs_list_add(struct list_head *entry, struct drm_deb=
ugfs_list *debugfs_list)

Although list_add() has the arguments backwards, the type safety here
would let us have the destination parameter first without confusing
anyone.

BR,
Jani.


> +{
> +	mutex_lock(&debugfs_list->mutex);
> +	list_add(entry, &debugfs_list->list);
> +	mutex_unlock(&debugfs_list->mutex);
> +}
> +
>  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  		     struct dentry *root)
>  {
> @@ -350,9 +357,7 @@ void drm_debugfs_add_file(struct drm_device *dev, con=
st char *name,
>  	entry->file.data =3D data;
>  	entry->dev =3D dev;
>=20=20
> -	mutex_lock(&dev->debugfs_list.mutex);
> -	list_add(&entry->list, &dev->debugfs_list.list);
> -	mutex_unlock(&dev->debugfs_list.mutex);
> +	drm_debugfs_list_add(&entry->list, &dev->debugfs_list);
>  }
>  EXPORT_SYMBOL(drm_debugfs_add_file);

--=20
Jani Nikula, Intel Open Source Graphics Center
