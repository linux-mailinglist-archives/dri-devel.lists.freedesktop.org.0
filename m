Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C4C3AEAC
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 13:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692E010E077;
	Thu,  6 Nov 2025 12:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rong.moe header.i=i@rong.moe header.b="QfGAbc/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A50010E077
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 12:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762432901; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=la8Jv6VoCJ1t+wRpHzJAWump87dZv6lHs8UtjeEfRV4tk9alJMbGYqzVibLH1Q+8WOkP8pUIg+hhaDcS0+NmjGvLit2iqzSJ/sgjBH8aATqsL0JcibjQt4eYScnWXUCUsDbOVJ3AwrTMtnfCiF5NbYydx+an05WE5+1uBQZ2w3U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762432901;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=umAQldbHt4xCwgeTveAZyIjqcrTM7ksONTztY46bUSk=; 
 b=lCGXO/yaWIQSZlQ+88fyJaXzh9NwqCCkX9fgIwtJ7Ivrlov9E76OOWRQbow0FEC0wxpO5d6VFiEnbsD8IIqqR4/l66Iv1WBeqV8gmSR56NJc15SEb5OuaA9kGH/rGXbcCDrcXLsGpQUpVXB3Ga7GkQjGPkjN7BY3plBfhQ4RaS8=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=rong.moe;
 spf=pass  smtp.mailfrom=i@rong.moe;
 dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762432901; 
 s=zmail; d=rong.moe; i=i@rong.moe;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
 bh=umAQldbHt4xCwgeTveAZyIjqcrTM7ksONTztY46bUSk=;
 b=QfGAbc/q2WNjq172hUBI8GgX79zZZA1q+qXTM8YLGbqfRJtKVLLFqcmkeHVa2sEL
 RIyNdXgHZIzmmTojredNhX19eInmEOh6SsFELn7OnEG3g7/DPz7wtDP0g6qHaX6rw+i
 sfWX6PtGSwx6lCT8EkXNh+gn34corIFOzeQM/6uc=
Received: by mx.zohomail.com with SMTPS id 1762432898973577.5467817578633;
 Thu, 6 Nov 2025 04:41:38 -0800 (PST)
Message-ID: <dd93f38bc0129b4b75e2dbde676d402376bc301c.camel@rong.moe>
Subject: Re: [PATCH v3 3/6] platform/x86: lenovo-wmi-{capdata,other}:
 Support multiple Capability Data
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 dri-devel@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
In-Reply-To: <8c14706f-f3cc-45e9-bdef-db2c9171f46e@gmx.de>
References: <20251031155349.24693-1-i@rong.moe>
 <20251031155349.24693-4-i@rong.moe>
 <8c14706f-f3cc-45e9-bdef-db2c9171f46e@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Nov 2025 20:36:28 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-7 
X-ZohoMailClient: External
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

Hi Armin,

On Tue, 2025-11-04 at 21:20 +0100, Armin Wolf wrote:
> Am 31.10.25 um 16:51 schrieb Rong Zhang:
>=20
> > The current implementation are heavily bound to capdata01. Rewrite it s=
o
> > that it is suitable to utilize other Capability Data as well.
> >=20
> > No functional change intended.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > Changes in v2:
> > - Fix function parameter 'type' not described in 'lwmi_cd_match' (thank=
s
> >    kernel test bot)
> > ---
> >   drivers/platform/x86/lenovo/wmi-capdata.c | 208 +++++++++++++++++----=
-
> >   drivers/platform/x86/lenovo/wmi-capdata.h |   7 +-
> >   drivers/platform/x86/lenovo/wmi-other.c   |  27 ++-
> >   3 files changed, 190 insertions(+), 52 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> > index c5e74b2bfeb3..1f7fc09b7c3f 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > @@ -12,8 +12,13 @@
> >    *
> >    * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> >    *   - Initial implementation (formerly named lenovo-wmi-capdata01)
> > + *
> > + * Copyright (C) 2025 Rong Zhang <i@rong.moe>
> > + *   - Unified implementation
> >    */
> >  =20
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> >   #include <linux/acpi.h>
> >   #include <linux/cleanup.h>
> >   #include <linux/component.h>
> > @@ -36,6 +41,25 @@
> >   #define ACPI_AC_CLASS "ac_adapter"
> >   #define ACPI_AC_NOTIFY_STATUS 0x80
> >  =20
> > +enum lwmi_cd_type {
> > +	LENOVO_CAPABILITY_DATA_01,
> > +};
> > +
> > +#define LWMI_CD_TABLE_ITEM(_type)		\
> > +	[_type] =3D {				\
> > +		.guid_string =3D _type##_GUID,	\
> > +		.name =3D #_type,			\
> > +		.type =3D _type,			\
> > +	}
> > +
> > +static const struct lwmi_cd_info {
> > +	const char *guid_string;
> > +	const char *name;
> > +	enum lwmi_cd_type type;
> > +} lwmi_cd_table[] =3D {
> > +	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> > +};
> > +
> >   struct lwmi_cd_priv {
> >   	struct notifier_block acpi_nb; /* ACPI events */
> >   	struct wmi_device *wdev;
> > @@ -44,15 +68,19 @@ struct lwmi_cd_priv {
> >  =20
> >   struct cd_list {
> >   	struct mutex list_mutex; /* list R/W mutex */
> > +	enum lwmi_cd_type type;
> >   	u8 count;
> > -	struct capdata01 data[];
> > +
> > +	union {
> > +		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> > +	};
> >   };
> >  =20
> >   /**
> >    * lwmi_cd_component_bind() - Bind component to master device.
> >    * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
> >    * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> > - * @data: cd_list object pointer used to return the capability data.
> > + * @data: lwmi_cd_binder object pointer used to return the capability =
data.
> >    *
> >    * On lenovo-wmi-other's master bind, provide a pointer to the local =
capdata
> >    * list. This is used to call lwmi_cd*_get_data to look up attribute =
data
> > @@ -64,9 +92,15 @@ static int lwmi_cd_component_bind(struct device *cd_=
dev,
> >   				  struct device *om_dev, void *data)
> >   {
> >   	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
> > -	struct cd_list **cd_list =3D data;
> > +	struct lwmi_cd_binder *binder =3D data;
> >  =20
> > -	*cd_list =3D priv->list;
> > +	switch (priv->list->type) {
> > +	case LENOVO_CAPABILITY_DATA_01:
> > +		binder->cd01_list =3D priv->list;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> >  =20
> >   	return 0;
> >   }
> > @@ -76,30 +110,33 @@ static const struct component_ops lwmi_cd_componen=
t_ops =3D {
> >   };
> >  =20
> >   /**
> > - * lwmi_cd01_get_data - Get the data of the specified attribute
> > + * lwmi_cd*_get_data - Get the data of the specified attribute
> >    * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
> >    * @attribute_id: The capdata attribute ID to be found.
> > - * @output: Pointer to a capdata01 struct to return the data.
> > + * @output: Pointer to a capdata* struct to return the data.
> >    *
> > - * Retrieves the capability data 01 struct pointer for the given
> > - * attribute for its specified thermal mode.
> > + * Retrieves the capability data struct pointer for the given
> > + * attribute.
> >    *
> >    * Return: 0 on success, or -EINVAL.
> >    */
> > -int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata01 *output)
> > -{
> > -	u8 idx;
> > -
> > -	guard(mutex)(&list->list_mutex);
> > -	for (idx =3D 0; idx < list->count; idx++) {
> > -		if (list->data[idx].id !=3D attribute_id)
> > -			continue;
> > -		memcpy(output, &list->data[idx], sizeof(list->data[idx]));
> > -		return 0;
> > +#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _cd_type, _output_t)					\
> > +	int lwmi_##_cdxx##_get_data(struct cd_list *list, u32 attribute_id, _=
output_t *output)	\
> > +	{											\
> > +		u8 idx;										\
> > +		if (WARN_ON(list->type !=3D _cd_type))						\
> > +			return -EINVAL;								\
> > +		guard(mutex)(&list->list_mutex);						\
> > +		for (idx =3D 0; idx < list->count; idx++) {					\
> > +			if (list->_cdxx[idx].id !=3D attribute_id)				\
> > +				continue;							\
> > +			memcpy(output, &list->_cdxx[idx], sizeof(list->_cdxx[idx]));		\
> > +			return 0;								\
> > +		}										\
> > +		return -EINVAL;									\
> >   	}
> >  =20
> > -	return -EINVAL;
> > -}
> > +DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata=
01);
> >   EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
> >  =20
> >   /**
> > @@ -112,10 +149,21 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_=
WMI_CD");
> >    */
> >   static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
> >   {
> > +	size_t size;
> >   	int idx;
> > +	void *p;
> > +
> > +	switch (priv->list->type) {
> > +	case LENOVO_CAPABILITY_DATA_01:
> > +		p =3D &priv->list->cd01[0];
> > +		size =3D sizeof(priv->list->cd01[0]);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> >  =20
> >   	guard(mutex)(&priv->list->list_mutex);
> > -	for (idx =3D 0; idx < priv->list->count; idx++) {
> > +	for (idx =3D 0; idx < priv->list->count; idx++, p +=3D size) {
> >   		union acpi_object *ret_obj __free(kfree) =3D NULL;
> >  =20
> >   		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> > @@ -123,11 +171,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pri=
v)
> >   			return -ENODEV;
> >  =20
> >   		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
> > -		    ret_obj->buffer.length < sizeof(priv->list->data[idx]))
> > +		    ret_obj->buffer.length < size)
> >   			continue;
> >  =20
> > -		memcpy(&priv->list->data[idx], ret_obj->buffer.pointer,
> > -		       ret_obj->buffer.length);
> > +		memcpy(p, ret_obj->buffer.pointer, size);
> >   	}
> >  =20
> >   	return 0;
> > @@ -136,20 +183,28 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pri=
v)
> >   /**
> >    * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
> >    * @priv: lenovo-wmi-capdata driver data.
> > + * @type: The type of capability data.
> >    *
> >    * Allocate a cd_list struct large enough to contain data from all WM=
I data
> >    * blocks provided by the interface.
> >    *
> >    * Return: 0 on success, or an error.
> >    */
> > -static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
> > +static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type =
type)
> >   {
> >   	struct cd_list *list;
> >   	size_t list_size;
> >   	int count, ret;
> >  =20
> >   	count =3D wmidev_instance_count(priv->wdev);
> > -	list_size =3D struct_size(list, data, count);
> > +
> > +	switch (type) {
> > +	case LENOVO_CAPABILITY_DATA_01:
> > +		list_size =3D struct_size(list, cd01, count);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> >  =20
> >   	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
> >   	if (!list)
> > @@ -159,6 +214,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
> >   	if (ret)
> >   		return ret;
> >  =20
> > +	list->type =3D type;
> >   	list->count =3D count;
> >   	priv->list =3D list;
> >  =20
> > @@ -168,6 +224,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
> >   /**
> >    * lwmi_cd_setup() - Cache all WMI data block information
> >    * @priv: lenovo-wmi-capdata driver data.
> > + * @type: The type of capability data.
> >    *
> >    * Allocate a cd_list struct large enough to contain data from all WM=
I data
> >    * blocks provided by the interface. Then loop through each data bloc=
k and
> > @@ -175,11 +232,11 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *pri=
v)
> >    *
> >    * Return: 0 on success, or an error code.
> >    */
> > -static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
> > +static int lwmi_cd_setup(struct lwmi_cd_priv *priv, enum lwmi_cd_type =
type)
> >   {
> >   	int ret;
> >  =20
> > -	ret =3D lwmi_cd_alloc(priv);
> > +	ret =3D lwmi_cd_alloc(priv, type);
> >   	if (ret)
> >   		return ret;
> >  =20
> > @@ -235,9 +292,13 @@ static void lwmi_cd01_unregister(void *data)
> >  =20
> >   static int lwmi_cd_probe(struct wmi_device *wdev, const void *context=
)
> >   {
> > +	const struct lwmi_cd_info *info =3D context;
> >   	struct lwmi_cd_priv *priv;
> >   	int ret;
> >  =20
> > +	if (!info)
> > +		return -EINVAL;
> > +
> >   	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> >   	if (!priv)
> >   		return -ENOMEM;
> > @@ -245,21 +306,34 @@ static int lwmi_cd_probe(struct wmi_device *wdev,=
 const void *context)
> >   	priv->wdev =3D wdev;
> >   	dev_set_drvdata(&wdev->dev, priv);
> >  =20
> > -	ret =3D lwmi_cd_setup(priv);
> > +	ret =3D lwmi_cd_setup(priv, info->type);
> >   	if (ret)
> > -		return ret;
> > +		goto out;
> >  =20
> > -	priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> > +	if (info->type =3D=3D LENOVO_CAPABILITY_DATA_01) {
> > +		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> >  =20
> > -	ret =3D register_acpi_notifier(&priv->acpi_nb);
> > -	if (ret)
> > -		return ret;
> > +		ret =3D register_acpi_notifier(&priv->acpi_nb);
> > +		if (ret)
> > +			goto out;
> >  =20
> > -	ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister, &p=
riv->acpi_nb);
> > -	if (ret)
> > -		return ret;
> > +		ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
> > +					       &priv->acpi_nb);
> > +		if (ret)
> > +			goto out;
> > +	}
> > +
> > +	ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> >  =20
> > -	return component_add(&wdev->dev, &lwmi_cd_component_ops);
> > +out:
> > +	if (ret) {
> > +		dev_err(&wdev->dev, "failed to register %s: %d\n",
> > +			info->name, ret);
> > +	} else {
> > +		dev_info(&wdev->dev, "registered %s with %u items\n",
> > +			 info->name, priv->list->count);
> > +	}
> > +	return ret;
> >   }
> >  =20
> >   static void lwmi_cd_remove(struct wmi_device *wdev)
> > @@ -267,8 +341,12 @@ static void lwmi_cd_remove(struct wmi_device *wdev=
)
> >   	component_del(&wdev->dev, &lwmi_cd_component_ops);
> >   }
> >  =20
> > +#define LWMI_CD_WDEV_ID(_type)				\
> > +	.guid_string =3D _type##_GUID,			\
> > +	.context =3D &lwmi_cd_table[_type]
> > +
> >   static const struct wmi_device_id lwmi_cd_id_table[] =3D {
> > -	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> > +	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
> >   	{}
> >   };
> >  =20
> > @@ -284,21 +362,61 @@ static struct wmi_driver lwmi_cd_driver =3D {
> >   };
> >  =20
> >   /**
> > - * lwmi_cd01_match() - Match rule for the master driver.
> > - * @dev: Pointer to the capability data 01 parent device.
> > - * @data: Unused void pointer for passing match criteria.
> > + * lwmi_cd_match() - Match rule for the master driver.
> > + * @dev: Pointer to the capability data parent device.
> > + * @type: Pointer to capability data type (enum lwmi_cd_type *) to mat=
ch.
> >    *
> >    * Return: int.
> >    */
> > -int lwmi_cd01_match(struct device *dev, void *data)
> > +static int lwmi_cd_match(struct device *dev, void *type)
> > +{
> > +	struct lwmi_cd_priv *priv;
> > +
> > +	if (dev->driver !=3D &lwmi_cd_driver.driver)
> > +		return false;
> > +
> > +	priv =3D dev_get_drvdata(dev);
> > +	return priv->list->type =3D=3D *(enum lwmi_cd_type *)type;
> > +}
> > +
> > +/**
> > + * lwmi_cd_match_add_all() - Add all match rule for the master driver.
> > + * @master: Pointer to the master device.
> > + * @matchptr: Pointer to the returned component_match pointer.
> > + *
> > + * Adds all component matches to the list stored in @matchptr for the =
@master
> > + * device. @matchptr must be initialized to NULL. This matches all ava=
ilable
> > + * capdata types on the machine.
> > + */
> > +void lwmi_cd_match_add_all(struct device *master, struct component_mat=
ch **matchptr)
> >   {
> > -	return dev->driver =3D=3D &lwmi_cd_driver.driver;
> > +	int i;
> > +
> > +	if (WARN_ON(*matchptr))
> > +		return;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> > +		if (!lwmi_cd_table[i].guid_string ||
> > +		    !wmi_has_guid(lwmi_cd_table[i].guid_string))
> > +			continue;
>=20
> I am still not happy about this. AFAIK as soon as the ordinary capdata WM=
I devices are bound together,
> the firmware tells you whether or not the additional fan data WMI device =
is available. Maybe you can do
> something like this:
>=20
> 1. Bind both capdata WMI devices as usual.
> 2. Check if a fan data WMI device is available (you can use a DMI-based q=
uirk list for devices were
>     the firmware reports invalid data).
> 3. Register an additional component that binds to the fan data WMI device=
.
> 4. Bind both the additional component and the component registered by the=
 fan data WMI device.
> 5. Register the hwmon device with additional fan data.
>=20
> If the fan data WMI device is not available, you can simply skip steps 3 =
and 4 and simply
> register the hwmon device with any additional fan data.
>=20
> What do you think?

I tried your approach. I looks pretty well except for step 4:

   debugfs: 'DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-21' already exists in 'de=
vice_component'

Moreover, component_[un]bind_all() calls __aggregate_find() with ops =3D=3D
NULL, which implies that it can't really distinguish the two aggregate
devices we have. Thus, we are rely on the insertion sequence of
aggregate_devices (see component_master_add_with_match()) to make it
just work. Pseudo code:

   lwmi_other_probe()
   {
   	component_match_add(..., lwmi_cd00_match, ...);
   	component_match_add(..., lwmi_cd01_match, ...);
   	component_master_add_with_match(..., &ops1, ...);
   	component_match_add(..., lwmi_cd_fan_match, ...);
   	component_master_add_with_match(..., &ops2, ...);
   }
  =20
   lwmi_other_remove()
   {
   	/* This just works (TM). */
   	component_master_del(..., &ops2); /* unbinds cd_fan */
   	component_master_del(..., &ops1); /* unbinds cd00/01 */
  =20
   	/* WARNING: at drivers/base/component.c:589 */
   	/*
   	component_master_del(..., &ops1); /* unbinds cd_fan!!! */
   	component_master_del(..., &ops2); /* unbinds cd_fan!!! */
   	*/
   }

It seems that the component framework is not prepared to allow multi-
aggregation master device.

Since we are talking about the component framework: all efforts we made
here is to work around one of its limitations -- all components must be
found or else it won't bring up the aggregate device. Do you think
allowing partially bound aggregate device a good idea? E.g., adding a
flag, indicating the master device opts in to such behavior, to the
definition of struct component_master_ops. I can prepare a separate
patch for that.

CC'ing maintainers and lists of driver core and component framework.

> Thanks,
> Armin Wolf

Thanks,
Rong

> > +
> > +		component_match_add(master, matchptr, lwmi_cd_match,
> > +				    (void *)&lwmi_cd_table[i].type);
> > +		if (IS_ERR(matchptr))
> > +			return;
> > +	}
> > +
> > +	if (!*matchptr) {
> > +		pr_warn("a master driver requested capability data, but nothing is a=
vailable\n");
> > +		*matchptr =3D ERR_PTR(-ENODEV);
> > +	}
> >   }
> > -EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD");
> > +EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
> >  =20
> >   module_wmi_driver(lwmi_cd_driver);
> >  =20
> >   MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
> >   MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
> >   MODULE_DESCRIPTION("Lenovo Capability Data WMI Driver");
> >   MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.h
> > index 2a4746e38ad4..1e5fce7836cb 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -7,6 +7,7 @@
> >  =20
> >   #include <linux/types.h>
> >  =20
> > +struct component_match;
> >   struct device;
> >   struct cd_list;
> >  =20
> > @@ -19,7 +20,11 @@ struct capdata01 {
> >   	u32 max_value;
> >   };
> >  =20
> > +struct lwmi_cd_binder {
> > +	struct cd_list *cd01_list;
> > +};
> > +
> >   int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct=
 capdata01 *output);
> > -int lwmi_cd01_match(struct device *dev, void *data);
> > +void lwmi_cd_match_add_all(struct device *master, struct component_mat=
ch **matchptr);
> >  =20
> >   #endif /* !_LENOVO_WMI_CAPDATA_H_ */
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index c6dc1b4cff84..20c6ff0be37a 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -579,14 +579,14 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om=
_priv *priv)
> >   static int lwmi_om_master_bind(struct device *dev)
> >   {
> >   	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > -	struct cd_list *tmp_list;
> > +	struct lwmi_cd_binder binder =3D { 0 };
> >   	int ret;
> >  =20
> > -	ret =3D component_bind_all(dev, &tmp_list);
> > +	ret =3D component_bind_all(dev, &binder);
> >   	if (ret)
> >   		return ret;
> >  =20
> > -	priv->cd01_list =3D tmp_list;
> > +	priv->cd01_list =3D binder.cd01_list;
> >   	if (!priv->cd01_list)
> >   		return -ENODEV;
> >  =20
> > @@ -618,6 +618,7 @@ static int lwmi_other_probe(struct wmi_device *wdev=
, const void *context)
> >   {
> >   	struct component_match *master_match =3D NULL;
> >   	struct lwmi_om_priv *priv;
> > +	int ret;
> >  =20
> >   	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> >   	if (!priv)
> > @@ -626,12 +627,26 @@ static int lwmi_other_probe(struct wmi_device *wd=
ev, const void *context)
> >   	priv->wdev =3D wdev;
> >   	dev_set_drvdata(&wdev->dev, priv);
> >  =20
> > -	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, NULL)=
;
> > +	lwmi_cd_match_add_all(&wdev->dev, &master_match);
> >   	if (IS_ERR(master_match))
> >   		return PTR_ERR(master_match);
> >  =20
> > -	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_op=
s,
> > -					       master_match);
> > +	ret =3D component_master_add_with_match(&wdev->dev, &lwmi_om_master_o=
ps,
> > +					      master_match);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (likely(component_master_is_bound(&wdev->dev, &lwmi_om_master_ops)=
))
> > +		return 0;
> > +
> > +	/*
> > +	 * The bind callbacks of both master and components were never called=
 in
> > +	 * this case - this driver won't work at all. Failing...
> > +	 */
> > +	dev_err(&wdev->dev, "unbound master; is any component failing to be p=
robed?");
> > +
> > +	component_master_del(&wdev->dev, &lwmi_om_master_ops);
> > +	return -EXDEV;
> >   }
> >  =20
> >   static void lwmi_other_remove(struct wmi_device *wdev)
