Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D9B5481F4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246D810E07F;
	Mon, 13 Jun 2022 08:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F380E10E031;
 Mon, 13 Jun 2022 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655109471; x=1686645471;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tc/QgwySnPCwvut+iCjaHkCRfv5cNtNMs74qWV3IgTs=;
 b=VLvpOzQqOF7rhApTUOj0vbP6rIp4eRcf8KqGoLcgsVvvU+j/EVQ3kpBT
 K1FJWT+R7gxTb4A7cXGpQcFWQRHAcnAPGSbz7CKnlIPrPmhf5zbsMrVx+
 5s3NX64dsfPp3wMgOZ81ZH3u5BIP9vgr3aNB139kTaKtaZhDYppF21fvp
 jcvz6gDvBfflaY6nIqsLOmFqo6Jy426IhariQhiKzS3lbXsKAW8RzaNlh
 0N9aQB1QxkWPYCO1iCl02Rb9RTaMMaTPiiCVWECBuBjh4tWh9aiBoYytf
 HFPgtgODCh3Fsk0/2yqNF4eARiRl/V+M86ttSjhSZI7jQCQpebFoennYr Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275746482"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275746482"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 01:37:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639613667"
Received: from njascanu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 01:37:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 05/15] drm/edid: add new interfaces around struct
 drm_edid
In-Reply-To: <YqOe0IJIIn7bxO4C@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1654674560.git.jani.nikula@intel.com>
 <5a6532a94cad6a79424f6d1918dbe7b7d607ac03.1654674560.git.jani.nikula@intel.com>
 <YqOe0IJIIn7bxO4C@intel.com>
Date: Mon, 13 Jun 2022 11:37:46 +0300
Message-ID: <87k09lyn51.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Jun 08, 2022 at 10:50:35AM +0300, Jani Nikula wrote:
>> Add new functions drm_edid_read(), drm_edid_read_ddc(), and
>> drm_edid_read_custom() to replace drm_get_edid() and drm_do_get_edid()
>> for reading the EDID. The transition is expected to happen over a fairly
>> long time.
>>=20
>> Note that the new drm_edid_read*() functions do not do any of the
>> connector updates anymore. The reading and parsing will be completely
>> separated from each other.
>>=20
>> Add new functions drm_edid_alloc(), drm_edid_dup(), and drm_edid_free()
>> for allocating and freeing drm_edid containers.
>>=20
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 245 +++++++++++++++++++++++++++++++++----
>>  include/drm/drm_edid.h     |   9 ++
>>  2 files changed, 230 insertions(+), 24 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 2beaa48301c1..2bdaf1e34a9d 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -2226,29 +2226,9 @@ static enum edid_block_status edid_block_read(voi=
d *block, unsigned int block_nu
>>  	return status;
>>  }
>>=20=20
>> -/**
>> - * drm_do_get_edid - get EDID data using a custom EDID block read funct=
ion
>> - * @connector: connector we're probing
>> - * @read_block: EDID block read function
>> - * @context: private data passed to the block read function
>> - *
>> - * When the I2C adapter connected to the DDC bus is hidden behind a dev=
ice that
>> - * exposes a different interface to read EDID blocks this function can =
be used
>> - * to get EDID data using a custom block read function.
>> - *
>> - * As in the general case the DDC bus is accessible by the kernel at th=
e I2C
>> - * level, drivers must make all reasonable efforts to expose it as an I=
2C
>> - * adapter and use drm_get_edid() instead of abusing this function.
>> - *
>> - * The EDID may be overridden using debugfs override_edid or firmware E=
DID
>> - * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this =
priority
>> - * order. Having either of them bypasses actual EDID reads.
>> - *
>> - * Return: Pointer to valid EDID or NULL if we couldn't find any.
>> - */
>> -struct edid *drm_do_get_edid(struct drm_connector *connector,
>> -			     read_block_fn read_block,
>> -			     void *context)
>> +static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>> +				     read_block_fn read_block, void *context,
>> +				     size_t *size)
>>  {
>>  	enum edid_block_status status;
>>  	int i, invalid_blocks =3D 0;
>> @@ -2315,14 +2295,125 @@ struct edid *drm_do_get_edid(struct drm_connect=
or *connector,
>>  	}
>>=20=20
>>  ok:
>> +	if (size)
>> +		*size =3D alloc_size;
>> +
>>  	return edid;
>>=20=20
>>  fail:
>>  	kfree(edid);
>>  	return NULL;
>>  }
>> +
>> +/**
>> + * drm_do_get_edid - get EDID data using a custom EDID block read funct=
ion
>> + * @connector: connector we're probing
>> + * @read_block: EDID block read function
>> + * @context: private data passed to the block read function
>> + *
>> + * When the I2C adapter connected to the DDC bus is hidden behind a dev=
ice that
>> + * exposes a different interface to read EDID blocks this function can =
be used
>> + * to get EDID data using a custom block read function.
>> + *
>> + * As in the general case the DDC bus is accessible by the kernel at th=
e I2C
>> + * level, drivers must make all reasonable efforts to expose it as an I=
2C
>> + * adapter and use drm_get_edid() instead of abusing this function.
>> + *
>> + * The EDID may be overridden using debugfs override_edid or firmware E=
DID
>> + * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this =
priority
>> + * order. Having either of them bypasses actual EDID reads.
>> + *
>> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
>> + */
>> +struct edid *drm_do_get_edid(struct drm_connector *connector,
>> +			     read_block_fn read_block,
>> +			     void *context)
>> +{
>> +	return _drm_do_get_edid(connector, read_block, context, NULL);
>> +}
>>  EXPORT_SYMBOL_GPL(drm_do_get_edid);
>>=20=20
>> +/* Allocate struct drm_edid container *without* duplicating the edid da=
ta */
>> +static const struct drm_edid *_drm_edid_alloc(const void *edid, size_t =
size)
>> +{
>> +	struct drm_edid *drm_edid;
>> +
>> +	if (!edid || !size || size < EDID_LENGTH)
>> +		return NULL;
>> +
>> +	drm_edid =3D kzalloc(sizeof(*drm_edid), GFP_KERNEL);
>> +	if (drm_edid) {
>> +		drm_edid->edid =3D edid;
>> +		drm_edid->size =3D size;
>> +	}
>> +
>> +	return drm_edid;
>> +}
>> +
>> +/**
>> + * drm_edid_alloc - Allocate a new drm_edid container
>> + * @edid: Pointer to raw EDID data
>> + * @size: Size of memory allocated for EDID
>> + *
>> + * Allocate a new drm_edid container. Do not calculate edid size from e=
did, pass
>> + * the actual size that has been allocated for the data. There is no va=
lidation
>> + * of the raw EDID data against the size, but at least the EDID base bl=
ock must
>> + * fit in the buffer.
>> + *
>> + * The returned pointer must be freed using drm_edid_free().
>> + *
>> + * Return: drm_edid container, or NULL on errors
>> + */
>> +const struct drm_edid *drm_edid_alloc(const void *edid, size_t size)
>> +{
>> +	const struct drm_edid *drm_edid;
>> +
>> +	if (!edid || !size || size < EDID_LENGTH)
>> +		return NULL;
>> +
>> +	edid =3D kmemdup(edid, size, GFP_KERNEL);
>> +	if (!edid)
>> +		return NULL;
>> +
>> +	drm_edid =3D _drm_edid_alloc(edid, size);
>> +	if (!drm_edid)
>> +		kfree(edid);
>> +
>> +	return drm_edid;
>> +}
>> +EXPORT_SYMBOL(drm_edid_alloc);
>> +
>> +/**
>> + * drm_edid_dup - Duplicate a drm_edid container
>> + * @drm_edid: EDID to duplicate
>> + *
>> + * The returned pointer must be freed using drm_edid_free().
>> + *
>> + * Returns: drm_edid container copy, or NULL on errors
>> + */
>> +const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid)
>> +{
>> +	if (!drm_edid)
>> +		return NULL;
>> +
>> +	return drm_edid_alloc(drm_edid->edid, drm_edid->size);
>> +}
>> +EXPORT_SYMBOL(drm_edid_dup);
>> +
>> +/**
>> + * drm_edid_free - Free the drm_edid container
>> + * @drm_edid: EDID to free
>> + */
>> +void drm_edid_free(const struct drm_edid *drm_edid)
>> +{
>> +	if (!drm_edid)
>> +		return;
>> +
>> +	kfree(drm_edid->edid);
>> +	kfree(drm_edid);
>> +}
>> +EXPORT_SYMBOL(drm_edid_free);
>> +
>>  /**
>>   * drm_probe_ddc() - probe DDC presence
>>   * @adapter: I2C adapter to probe
>> @@ -2359,12 +2450,118 @@ struct edid *drm_get_edid(struct drm_connector =
*connector,
>>  	if (connector->force =3D=3D DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(ad=
apter))
>>  		return NULL;
>>=20=20
>> -	edid =3D drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
>> +	edid =3D _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, N=
ULL);
>>  	drm_connector_update_edid_property(connector, edid);
>>  	return edid;
>>  }
>>  EXPORT_SYMBOL(drm_get_edid);
>>=20=20
>> +/**
>> + * drm_edid_read_custom - Read EDID data using given EDID block read fu=
nction
>> + * @connector: Connector to use
>> + * @read_block: EDID block read function
>> + * @context: Private data passed to the block read function
>> + *
>> + * When the I2C adapter connected to the DDC bus is hidden behind a dev=
ice that
>> + * exposes a different interface to read EDID blocks this function can =
be used
>> + * to get EDID data using a custom block read function.
>> + *
>> + * As in the general case the DDC bus is accessible by the kernel at th=
e I2C
>> + * level, drivers must make all reasonable efforts to expose it as an I=
2C
>> + * adapter and use drm_edid_read() or drm_edid_read_ddc() instead of ab=
using
>> + * this function.
>> + *
>> + * The EDID may be overridden using debugfs override_edid or firmware E=
DID
>> + * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this =
priority
>> + * order. Having either of them bypasses actual EDID reads.
>> + *
>> + * The returned pointer must be freed using drm_edid_free().
>> + *
>> + * Return: Pointer to EDID, or NULL if probe/read failed.
>> + */
>> +const struct drm_edid *drm_edid_read_custom(struct drm_connector *conne=
ctor,
>> +					    read_block_fn read_block,
>> +					    void *context)
>> +{
>> +	const struct drm_edid *drm_edid;
>> +	struct edid *edid;
>> +	size_t size =3D 0;
>> +
>> +	edid =3D _drm_do_get_edid(connector, read_block, context, &size);
>> +	if (!edid)
>> +		return NULL;
>> +
>> +	/* Sanity check for now */
>> +	drm_WARN_ON(connector->dev, !size);
>> +
>> +	drm_edid =3D _drm_edid_alloc(edid, size);
>> +	if (!drm_edid)
>> +		kfree(edid);
>> +
>> +	return drm_edid;
>> +}
>> +EXPORT_SYMBOL(drm_edid_read_custom);
>> +
>> +/**
>> + * drm_edid_read_ddc - Read EDID data using given I2C adapter
>> + * @connector: Connector to use
>> + * @adapter: I2C adapter to use for DDC
>> + *
>> + * Read EDID using the given I2C adapter.
>> + *
>> + * The EDID may be overridden using debugfs override_edid or firmware E=
DID
>> + * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this =
priority
>> + * order. Having either of them bypasses actual EDID reads.
>> + *
>> + * Prefer initializing connector->ddc with drm_connector_init_with_ddc(=
) and
>> + * using drm_edid_read() instead of this function.
>> + *
>> + * The returned pointer must be freed using drm_edid_free().
>> + *
>> + * Return: Pointer to EDID, or NULL if probe/read failed.
>> + */
>> +const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connecto=
r,
>> +					 struct i2c_adapter *adapter)
>> +{
>> +	const struct drm_edid *drm_edid;
>> +
>> +	if (connector->force =3D=3D DRM_FORCE_OFF)
>> +		return NULL;
>> +
>> +	if (connector->force =3D=3D DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(ad=
apter))
>> +		return NULL;
>> +
>> +	drm_edid =3D drm_edid_read_custom(connector, drm_do_probe_ddc_edid, ad=
apter);
>> +
>> +	/* Note: Do *not* call connector updates here. */
>> +
>> +	return drm_edid;
>> +}
>> +EXPORT_SYMBOL(drm_edid_read_ddc);
>> +
>> +/**
>> + * drm_edid_read - Read EDID data using connector's I2C adapter
>> + * @connector: Connector to use
>> + *
>> + * Read EDID using the connector's I2C adapter.
>> + *
>> + * The EDID may be overridden using debugfs override_edid or firmware E=
DID
>> + * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this =
priority
>> + * order. Having either of them bypasses actual EDID reads.
>> + *
>> + * The returned pointer must be freed using drm_edid_free().
>> + *
>> + * Return: Pointer to EDID, or NULL if probe/read failed.
>> + */
>> +const struct drm_edid *drm_edid_read(struct drm_connector *connector)
>> +{
>> +	if (drm_WARN_ON(connector->dev, !connector->ddc))
>> +		return NULL;
>> +
>> +	return drm_edid_read_ddc(connector, connector->ddc);
>> +}
>> +EXPORT_SYMBOL(drm_edid_read);
>
> I'm wondering if we need this drm_edid_read() vs. drm_edid_read_ddc()
> split? Ie. are there cases where connector->ddc wouldn't be populated
> for some reason but we still want to use drm_edid_read_ddc()?

I want to promote initializing connector->ddc and using drm_edid_read()
with that. However, for e.g. i915, HDMI is the only connector where we
have connector->ddc initialized. I just didn't want to take on
converting that part too, not yet, not as part of this series.

BR,
Jani.


>
>> +
>>  static u32 edid_extract_panel_id(const struct edid *edid)
>>  {
>>  	/*
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 95ac09ef41b2..9d2d78135dee 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -594,6 +594,15 @@ drm_display_mode_from_cea_vic(struct drm_device *de=
v,
>>  			      u8 video_code);
>>=20=20
>>  /* Interface based on struct drm_edid */
>> +const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
>> +const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
>> +void drm_edid_free(const struct drm_edid *drm_edid);
>> +const struct drm_edid *drm_edid_read(struct drm_connector *connector);
>> +const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connecto=
r,
>> +					 struct i2c_adapter *adapter);
>> +const struct drm_edid *drm_edid_read_custom(struct drm_connector *conne=
ctor,
>> +					    int (*read_block)(void *context, u8 *buf, unsigned int block, =
size_t len),
>> +					    void *context);
>>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>  				  int ext_id, int *ext_index);
>>=20=20
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
