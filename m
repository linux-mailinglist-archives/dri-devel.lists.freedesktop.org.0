Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3B6666D73
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541AA10E89F;
	Thu, 12 Jan 2023 09:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC06410E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673514471; x=1705050471;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=kdLSMzSB3KKxT8vh1YeYydGzI9zkSjRQUFZIT04cE/s=;
 b=SV1BBZ+JclmF4UUz4X6rJ4myUeXSVN2a2C2vAZ4/VbKLV45MHSiTl9JK
 cRWuXl07qbhsUgdKewgBxyT5FRlBixMoere5xNVHyd8KfmlmAzkNdzdxG
 DKkaIoZY8OZYwWZWcYWtwMunZDM+ZAPCV8jhDz4V9jPhl3XDyttQwPSpc
 Qw07+U9ZziCoP+9sZ+R56TlxuFzOltAwC6JDRTD4D9tsHERZpsbqtZI1r
 uQqs8uT/43pThQjqHo1sehr8PA4A5oTYLiR+mgJkzmDDIz3P5gbfwbOK8
 dMPwjb4kky7w01zfeiEBVCQjHZInzcuGLw23Qr6vrqwI64KDxUk+TNxBo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="388122119"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="388122119"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 01:07:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="657728726"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="657728726"
Received: from lhazellx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.27.83])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 01:07:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Maxime Ripard
 <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 03/13] drm/debugfs: Create a debugfs infrastructure for
 connectors
In-Reply-To: <20230111173748.752659-4-mcanal@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230111173748.752659-1-mcanal@igalia.com>
 <20230111173748.752659-4-mcanal@igalia.com>
Date: Thu, 12 Jan 2023 11:07:15 +0200
Message-ID: <87bkn4glz0.fsf@intel.com>
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
> connector and, during drm_connector_register(), all added files will be
> created at once.
>
> Moreover, introduce some typesafety as struct drm_debugfs_connector_entry
> holds a drm_connector instead of a drm_device. So, the drivers can get
> a connector object directly from the struct drm_debugfs_connector_entry
> in the show() callback.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  5 +++++
>  drivers/gpu/drm/drm_debugfs.c   | 35 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_internal.h  |  5 +++++
>  include/drm/drm_connector.h     | 15 ++++++++++++++
>  include/drm/drm_debugfs.h       | 26 ++++++++++++++++++++++++
>  5 files changed, 86 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 8d92777e57dd..c93655bb0edf 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -273,8 +273,10 @@ static int __drm_connector_init(struct drm_device *d=
ev,
>  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
>  	INIT_LIST_HEAD(&connector->probed_modes);
>  	INIT_LIST_HEAD(&connector->modes);
> +	INIT_LIST_HEAD(&connector->debugfs_list);
>  	mutex_init(&connector->mutex);
>  	mutex_init(&connector->edid_override_mutex);
> +	mutex_init(&connector->debugfs_mutex);

In another mail, I suggested adding a struct wrapper for debugfs_list
and debugfs_mutex. I think those should also be initialized by debugfs
code.

The initializer would not have to be connector/encoder/crtc specific, it
could be:

	drm_debugfs_something_init(&connector->debugfs_something);

>  	connector->edid_blob_ptr =3D NULL;
>  	connector->epoch_counter =3D 0;
>  	connector->tile_blob_ptr =3D NULL;
> @@ -581,6 +583,7 @@ void drm_connector_cleanup(struct drm_connector *conn=
ector)
>  						       connector->state);
>=20=20
>  	mutex_destroy(&connector->mutex);
> +	mutex_destroy(&connector->debugfs_mutex);

Ditto for cleanup.

>=20=20
>  	memset(connector, 0, sizeof(*connector));
>=20=20
> @@ -627,6 +630,8 @@ int drm_connector_register(struct drm_connector *conn=
ector)
>  			goto err_debugfs;
>  	}
>=20=20
> +	drm_debugfs_connector_init(connector);

Just perhaps this should be called _register()? The name gives a strong
feeling at which stage it is called, and the init here feels like it
should be moved earlier, to connector init, instead of connector
register.

> +
>  	drm_mode_object_register(connector->dev, &connector->base);
>=20=20
>  	connector->registration_state =3D DRM_CONNECTOR_REGISTERED;
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 23f6ed7b5d68..d9ec1ed5a7ec 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -260,6 +260,17 @@ int drm_debugfs_init(struct drm_minor *minor, int mi=
nor_id,
>  	return 0;
>  }
>=20=20
> +void drm_debugfs_connector_init(struct drm_connector *connector)
> +{
> +	struct drm_minor *minor =3D connector->dev->primary;
> +	struct drm_debugfs_connector_entry *entry, *tmp;
> +
> +	if (!minor)
> +		return;
> +
> +	drm_create_file_from_list(connector);
> +}
> +
>  void drm_debugfs_late_register(struct drm_device *dev)
>  {
>  	struct drm_minor *minor =3D dev->primary;
> @@ -369,6 +380,30 @@ void drm_debugfs_add_files(struct drm_device *dev, c=
onst struct drm_debugfs_info
>  }
>  EXPORT_SYMBOL(drm_debugfs_add_files);
>=20=20
> +/**
> + * drm_debugfs_connector_add_file - Add a given file to the DRM connecto=
r debugfs file list
> + * @connector: DRM connector object
> + * @name: debugfs file name
> + * @show: show callback
> + * @data: driver-private data, should not be device-specific
> + *
> + * Add a given file entry to the DRM connector debugfs file list to be c=
reated on
> + * drm_debugfs_connector_init().
> + */
> +void drm_debugfs_connector_add_file(struct drm_connector *connector, con=
st char *name,
> +				    int (*show)(struct seq_file*, void*), void *data)
> +{
> +	struct drm_debugfs_connector_entry *entry =3D drmm_kzalloc(connector->d=
ev,
> +								 sizeof(*entry),
> +								 GFP_KERNEL);
> +
> +	if (!entry)
> +		return;
> +
> +	drm_debugfs_add_file_to_list(connector);
> +}
> +EXPORT_SYMBOL(drm_debugfs_connector_add_file);
> +
>  static int connector_show(struct seq_file *m, void *data)
>  {
>  	struct drm_connector *connector =3D m->private;
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index ed2103ee272c..dd9d7b8b45bd 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -185,6 +185,7 @@ int drm_gem_dumb_destroy(struct drm_file *file, struc=
t drm_device *dev,
>  #if defined(CONFIG_DEBUG_FS)
>  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  		     struct dentry *root);
> +void drm_debugfs_connector_init(struct drm_connector *connector);
>  void drm_debugfs_cleanup(struct drm_minor *minor);
>  void drm_debugfs_late_register(struct drm_device *dev);
>  void drm_debugfs_connector_add(struct drm_connector *connector);
> @@ -199,6 +200,10 @@ static inline int drm_debugfs_init(struct drm_minor =
*minor, int minor_id,
>  	return 0;
>  }
>=20=20
> +static inline void drm_debugfs_connector_init(struct drm_connector *conn=
ector)
> +{
> +}
> +
>  static inline void drm_debugfs_cleanup(struct drm_minor *minor)
>  {
>  }
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 9037f1317aee..51340f3162ed 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1720,6 +1720,21 @@ struct drm_connector {
>  	/** @debugfs_entry: debugfs directory for this connector */
>  	struct dentry *debugfs_entry;
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
> +	 * List of debugfs files to be created by the DRM connector. The files
> +	 * must be added during drm_connector_register().
> +	 */
> +	struct list_head debugfs_list;
> +
>  	/**
>  	 * @state:
>  	 *
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index 7616f457ce70..c09c82274622 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -122,6 +122,23 @@ struct drm_debugfs_entry {
>  	struct list_head list;
>  };
>=20=20
> +/**
> + * struct drm_debugfs_connector_entry - Per-connector debugfs node struc=
ture
> + *
> + * This structure represents a debugfs file, as an instantiation of a &s=
truct
> + * drm_debugfs_info on a &struct drm_connector.
> + */
> +struct drm_debugfs_connector_entry {
> +	/** @connector: &struct drm_connector for this node. */
> +	struct drm_connector *connector;
> +
> +	/** @file: Template for this node. */
> +	struct drm_debugfs_info file;
> +
> +	/** @list: Linked list of all connector nodes. */
> +	struct list_head list;
> +};
> +
>  #if defined(CONFIG_DEBUG_FS)
>  void drm_debugfs_create_files(const struct drm_info_list *files,
>  			      int count, struct dentry *root,
> @@ -134,6 +151,9 @@ void drm_debugfs_add_file(struct drm_device *dev, con=
st char *name,
>=20=20
>  void drm_debugfs_add_files(struct drm_device *dev,
>  			   const struct drm_debugfs_info *files, int count);
> +
> +void drm_debugfs_connector_add_file(struct drm_connector *connector, con=
st char *name,
> +				    int (*show)(struct seq_file*, void*), void *data);
>  #else
>  static inline void drm_debugfs_create_files(const struct drm_info_list *=
files,
>  					    int count, struct dentry *root,
> @@ -155,6 +175,12 @@ static inline void drm_debugfs_add_files(struct drm_=
device *dev,
>  					 const struct drm_debugfs_info *files,
>  					 int count)
>  {}
> +
> +static inline void drm_debugfs_connector_add_file(struct drm_connector *=
connector,
> +						  const char *name,
> +						  int (*show)(struct seq_file*, void*),
> +						  void *data)
> +{}
>  #endif
>=20=20
>  #endif /* _DRM_DEBUGFS_H_ */

--=20
Jani Nikula, Intel Open Source Graphics Center
