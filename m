Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70827C48685
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 18:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A483310E07E;
	Mon, 10 Nov 2025 17:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rong.moe header.i=i@rong.moe header.b="waZ4PecL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E2B10E07E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 17:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762796710; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NpFVoYb9c3U8sChcj9gI88JSvvWyuTghqqJqP32JYf/DF++/NALLQVh+1JvavShXcWnJfhEfWO9+bNPA4fbqwBa2b2Ni/WEZVXHNnSLk3nkdAz537ixYmTOYVuAPAgqmXQYRK80pVYSRCvUcHLR6grpicg/39/W3OvUSnN/ae0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762796710;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=UvfhpiAeqpNog4A83ofEjc5iUOY62L5RrM6rcxvAF2k=; 
 b=LcPju5uLJ6xUuQc1lU+UJU+VejudC0RCVjcf7zFmN8GfMo87ozby7sNgUsawdKtsKnqL1HhsPSpp5Jkkn82oc+X8Xv+z62zcwm2qyUkuuQ5gA37oPZ4QH+wizlbvF9mDWbINdBn3qBv+b6pcLDttiUtzfCshOFNVMW2xLsJrTD0=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=rong.moe;
 spf=pass  smtp.mailfrom=i@rong.moe;
 dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762796710; 
 s=zmail; d=rong.moe; i=i@rong.moe;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
 bh=UvfhpiAeqpNog4A83ofEjc5iUOY62L5RrM6rcxvAF2k=;
 b=waZ4PecLKhFk7X0dtsnlGlv8PKO3q7er/0rsl9OFqOPQ0cfTsW+9WAHvRKbNbVsa
 aQU35XqD5E5SGE/grOKbZnY1zFzG//mm0Urfjab3HbyBvRfoitJzuWDLoxq/xrtMVXA
 4zH7IehKsWTbOO95/XuVQkp8fcqL+9ZvlNcnRRaE=
Received: by mx.zohomail.com with SMTPS id 1762796708978257.2511265743642;
 Mon, 10 Nov 2025 09:45:08 -0800 (PST)
Message-ID: <4bcdd4a629b2d46bd4988eb347ce944af9943773.camel@rong.moe>
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
In-Reply-To: <1b41a90b-3583-4543-877a-0925a4e08853@gmx.de>
References: <20251031155349.24693-1-i@rong.moe>
 <20251031155349.24693-4-i@rong.moe>
 <8c14706f-f3cc-45e9-bdef-db2c9171f46e@gmx.de>
 <dd93f38bc0129b4b75e2dbde676d402376bc301c.camel@rong.moe>
 <1b41a90b-3583-4543-877a-0925a4e08853@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Nov 2025 01:40:00 +0800
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

On Mon, 2025-11-10 at 01:02 +0100, Armin Wolf wrote:
> Am 06.11.25 um 13:36 schrieb Rong Zhang:
>=20
> > Hi Armin,
> >=20
> > On Tue, 2025-11-04 at 21:20 +0100, Armin Wolf wrote:
> > > Am 31.10.25 um 16:51 schrieb Rong Zhang:
> > >=20
> > > > The current implementation are heavily bound to capdata01. Rewrite =
it so
> > > > that it is suitable to utilize other Capability Data as well.
> > > >=20
> > > > No functional change intended.
> > > >=20
> > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > > Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > > - Fix function parameter 'type' not described in 'lwmi_cd_match' (t=
hanks
> > > >     kernel test bot)
> > > > ---
> > > >    drivers/platform/x86/lenovo/wmi-capdata.c | 208 ++++++++++++++++=
+-----
> > > >    drivers/platform/x86/lenovo/wmi-capdata.h |   7 +-
> > > >    drivers/platform/x86/lenovo/wmi-other.c   |  27 ++-
> > > >    3 files changed, 190 insertions(+), 52 deletions(-)
> > > >=20
> > > > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/pl=
atform/x86/lenovo/wmi-capdata.c
> > > > index c5e74b2bfeb3..1f7fc09b7c3f 100644
> > > > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > > > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > > > @@ -12,8 +12,13 @@
> > > >     *
> > > >     * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > > >     *   - Initial implementation (formerly named lenovo-wmi-capdata=
01)
> > > > + *
> > > > + * Copyright (C) 2025 Rong Zhang <i@rong.moe>
> > > > + *   - Unified implementation
> > > >     */
> > > >   =20
> > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > +
> > > >    #include <linux/acpi.h>
> > > >    #include <linux/cleanup.h>
> > > >    #include <linux/component.h>
> > > > @@ -36,6 +41,25 @@
> > > >    #define ACPI_AC_CLASS "ac_adapter"
> > > >    #define ACPI_AC_NOTIFY_STATUS 0x80
> > > >   =20
> > > > +enum lwmi_cd_type {
> > > > +	LENOVO_CAPABILITY_DATA_01,
> > > > +};
> > > > +
> > > > +#define LWMI_CD_TABLE_ITEM(_type)		\
> > > > +	[_type] =3D {				\
> > > > +		.guid_string =3D _type##_GUID,	\
> > > > +		.name =3D #_type,			\
> > > > +		.type =3D _type,			\
> > > > +	}
> > > > +
> > > > +static const struct lwmi_cd_info {
> > > > +	const char *guid_string;
> > > > +	const char *name;
> > > > +	enum lwmi_cd_type type;
> > > > +} lwmi_cd_table[] =3D {
> > > > +	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> > > > +};
> > > > +
> > > >    struct lwmi_cd_priv {
> > > >    	struct notifier_block acpi_nb; /* ACPI events */
> > > >    	struct wmi_device *wdev;
> > > > @@ -44,15 +68,19 @@ struct lwmi_cd_priv {
> > > >   =20
> > > >    struct cd_list {
> > > >    	struct mutex list_mutex; /* list R/W mutex */
> > > > +	enum lwmi_cd_type type;
> > > >    	u8 count;
> > > > -	struct capdata01 data[];
> > > > +
> > > > +	union {
> > > > +		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> > > > +	};
> > > >    };
> > > >   =20
> > > >    /**
> > > >     * lwmi_cd_component_bind() - Bind component to master device.
> > > >     * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent devi=
ce.
> > > >     * @om_dev: Pointer to the lenovo-wmi-other driver parent device=
.
> > > > - * @data: cd_list object pointer used to return the capability dat=
a.
> > > > + * @data: lwmi_cd_binder object pointer used to return the capabil=
ity data.
> > > >     *
> > > >     * On lenovo-wmi-other's master bind, provide a pointer to the l=
ocal capdata
> > > >     * list. This is used to call lwmi_cd*_get_data to look up attri=
bute data
> > > > @@ -64,9 +92,15 @@ static int lwmi_cd_component_bind(struct device =
*cd_dev,
> > > >    				  struct device *om_dev, void *data)
> > > >    {
> > > >    	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
> > > > -	struct cd_list **cd_list =3D data;
> > > > +	struct lwmi_cd_binder *binder =3D data;
> > > >   =20
> > > > -	*cd_list =3D priv->list;
> > > > +	switch (priv->list->type) {
> > > > +	case LENOVO_CAPABILITY_DATA_01:
> > > > +		binder->cd01_list =3D priv->list;
> > > > +		break;
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > >   =20
> > > >    	return 0;
> > > >    }
> > > > @@ -76,30 +110,33 @@ static const struct component_ops lwmi_cd_comp=
onent_ops =3D {
> > > >    };
> > > >   =20
> > > >    /**
> > > > - * lwmi_cd01_get_data - Get the data of the specified attribute
> > > > + * lwmi_cd*_get_data - Get the data of the specified attribute
> > > >     * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
> > > >     * @attribute_id: The capdata attribute ID to be found.
> > > > - * @output: Pointer to a capdata01 struct to return the data.
> > > > + * @output: Pointer to a capdata* struct to return the data.
> > > >     *
> > > > - * Retrieves the capability data 01 struct pointer for the given
> > > > - * attribute for its specified thermal mode.
> > > > + * Retrieves the capability data struct pointer for the given
> > > > + * attribute.
> > > >     *
> > > >     * Return: 0 on success, or -EINVAL.
> > > >     */
> > > > -int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, str=
uct capdata01 *output)
> > > > -{
> > > > -	u8 idx;
> > > > -
> > > > -	guard(mutex)(&list->list_mutex);
> > > > -	for (idx =3D 0; idx < list->count; idx++) {
> > > > -		if (list->data[idx].id !=3D attribute_id)
> > > > -			continue;
> > > > -		memcpy(output, &list->data[idx], sizeof(list->data[idx]));
> > > > -		return 0;
> > > > +#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _cd_type, _output_t)					\
> > > > +	int lwmi_##_cdxx##_get_data(struct cd_list *list, u32 attribute_i=
d, _output_t *output)	\
> > > > +	{											\
> > > > +		u8 idx;										\
> > > > +		if (WARN_ON(list->type !=3D _cd_type))						\
> > > > +			return -EINVAL;								\
> > > > +		guard(mutex)(&list->list_mutex);						\
> > > > +		for (idx =3D 0; idx < list->count; idx++) {					\
> > > > +			if (list->_cdxx[idx].id !=3D attribute_id)				\
> > > > +				continue;							\
> > > > +			memcpy(output, &list->_cdxx[idx], sizeof(list->_cdxx[idx]));		\
> > > > +			return 0;								\
> > > > +		}										\
> > > > +		return -EINVAL;									\
> > > >    	}
> > > >   =20
> > > > -	return -EINVAL;
> > > > -}
> > > > +DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct cap=
data01);
> > > >    EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
> > > >   =20
> > > >    /**
> > > > @@ -112,10 +149,21 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LEN=
OVO_WMI_CD");
> > > >     */
> > > >    static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
> > > >    {
> > > > +	size_t size;
> > > >    	int idx;
> > > > +	void *p;
> > > > +
> > > > +	switch (priv->list->type) {
> > > > +	case LENOVO_CAPABILITY_DATA_01:
> > > > +		p =3D &priv->list->cd01[0];
> > > > +		size =3D sizeof(priv->list->cd01[0]);
> > > > +		break;
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > >   =20
> > > >    	guard(mutex)(&priv->list->list_mutex);
> > > > -	for (idx =3D 0; idx < priv->list->count; idx++) {
> > > > +	for (idx =3D 0; idx < priv->list->count; idx++, p +=3D size) {
> > > >    		union acpi_object *ret_obj __free(kfree) =3D NULL;
> > > >   =20
> > > >    		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> > > > @@ -123,11 +171,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv =
*priv)
> > > >    			return -ENODEV;
> > > >   =20
> > > >    		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
> > > > -		    ret_obj->buffer.length < sizeof(priv->list->data[idx]))
> > > > +		    ret_obj->buffer.length < size)
> > > >    			continue;
> > > >   =20
> > > > -		memcpy(&priv->list->data[idx], ret_obj->buffer.pointer,
> > > > -		       ret_obj->buffer.length);
> > > > +		memcpy(p, ret_obj->buffer.pointer, size);
> > > >    	}
> > > >   =20
> > > >    	return 0;
> > > > @@ -136,20 +183,28 @@ static int lwmi_cd_cache(struct lwmi_cd_priv =
*priv)
> > > >    /**
> > > >     * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
> > > >     * @priv: lenovo-wmi-capdata driver data.
> > > > + * @type: The type of capability data.
> > > >     *
> > > >     * Allocate a cd_list struct large enough to contain data from a=
ll WMI data
> > > >     * blocks provided by the interface.
> > > >     *
> > > >     * Return: 0 on success, or an error.
> > > >     */
> > > > -static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
> > > > +static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_t=
ype type)
> > > >    {
> > > >    	struct cd_list *list;
> > > >    	size_t list_size;
> > > >    	int count, ret;
> > > >   =20
> > > >    	count =3D wmidev_instance_count(priv->wdev);
> > > > -	list_size =3D struct_size(list, data, count);
> > > > +
> > > > +	switch (type) {
> > > > +	case LENOVO_CAPABILITY_DATA_01:
> > > > +		list_size =3D struct_size(list, cd01, count);
> > > > +		break;
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > >   =20
> > > >    	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
> > > >    	if (!list)
> > > > @@ -159,6 +214,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *p=
riv)
> > > >    	if (ret)
> > > >    		return ret;
> > > >   =20
> > > > +	list->type =3D type;
> > > >    	list->count =3D count;
> > > >    	priv->list =3D list;
> > > >   =20
> > > > @@ -168,6 +224,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *p=
riv)
> > > >    /**
> > > >     * lwmi_cd_setup() - Cache all WMI data block information
> > > >     * @priv: lenovo-wmi-capdata driver data.
> > > > + * @type: The type of capability data.
> > > >     *
> > > >     * Allocate a cd_list struct large enough to contain data from a=
ll WMI data
> > > >     * blocks provided by the interface. Then loop through each data=
 block and
> > > > @@ -175,11 +232,11 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv =
*priv)
> > > >     *
> > > >     * Return: 0 on success, or an error code.
> > > >     */
> > > > -static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
> > > > +static int lwmi_cd_setup(struct lwmi_cd_priv *priv, enum lwmi_cd_t=
ype type)
> > > >    {
> > > >    	int ret;
> > > >   =20
> > > > -	ret =3D lwmi_cd_alloc(priv);
> > > > +	ret =3D lwmi_cd_alloc(priv, type);
> > > >    	if (ret)
> > > >    		return ret;
> > > >   =20
> > > > @@ -235,9 +292,13 @@ static void lwmi_cd01_unregister(void *data)
> > > >   =20
> > > >    static int lwmi_cd_probe(struct wmi_device *wdev, const void *co=
ntext)
> > > >    {
> > > > +	const struct lwmi_cd_info *info =3D context;
> > > >    	struct lwmi_cd_priv *priv;
> > > >    	int ret;
> > > >   =20
> > > > +	if (!info)
> > > > +		return -EINVAL;
> > > > +
> > > >    	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > > >    	if (!priv)
> > > >    		return -ENOMEM;
> > > > @@ -245,21 +306,34 @@ static int lwmi_cd_probe(struct wmi_device *w=
dev, const void *context)
> > > >    	priv->wdev =3D wdev;
> > > >    	dev_set_drvdata(&wdev->dev, priv);
> > > >   =20
> > > > -	ret =3D lwmi_cd_setup(priv);
> > > > +	ret =3D lwmi_cd_setup(priv, info->type);
> > > >    	if (ret)
> > > > -		return ret;
> > > > +		goto out;
> > > >   =20
> > > > -	priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> > > > +	if (info->type =3D=3D LENOVO_CAPABILITY_DATA_01) {
> > > > +		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> > > >   =20
> > > > -	ret =3D register_acpi_notifier(&priv->acpi_nb);
> > > > -	if (ret)
> > > > -		return ret;
> > > > +		ret =3D register_acpi_notifier(&priv->acpi_nb);
> > > > +		if (ret)
> > > > +			goto out;
> > > >   =20
> > > > -	ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister=
, &priv->acpi_nb);
> > > > -	if (ret)
> > > > -		return ret;
> > > > +		ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregiste=
r,
> > > > +					       &priv->acpi_nb);
> > > > +		if (ret)
> > > > +			goto out;
> > > > +	}
> > > > +
> > > > +	ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> > > >   =20
> > > > -	return component_add(&wdev->dev, &lwmi_cd_component_ops);
> > > > +out:
> > > > +	if (ret) {
> > > > +		dev_err(&wdev->dev, "failed to register %s: %d\n",
> > > > +			info->name, ret);
> > > > +	} else {
> > > > +		dev_info(&wdev->dev, "registered %s with %u items\n",
> > > > +			 info->name, priv->list->count);
> > > > +	}
> > > > +	return ret;
> > > >    }
> > > >   =20
> > > >    static void lwmi_cd_remove(struct wmi_device *wdev)
> > > > @@ -267,8 +341,12 @@ static void lwmi_cd_remove(struct wmi_device *=
wdev)
> > > >    	component_del(&wdev->dev, &lwmi_cd_component_ops);
> > > >    }
> > > >   =20
> > > > +#define LWMI_CD_WDEV_ID(_type)				\
> > > > +	.guid_string =3D _type##_GUID,			\
> > > > +	.context =3D &lwmi_cd_table[_type]
> > > > +
> > > >    static const struct wmi_device_id lwmi_cd_id_table[] =3D {
> > > > -	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> > > > +	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
> > > >    	{}
> > > >    };
> > > >   =20
> > > > @@ -284,21 +362,61 @@ static struct wmi_driver lwmi_cd_driver =3D {
> > > >    };
> > > >   =20
> > > >    /**
> > > > - * lwmi_cd01_match() - Match rule for the master driver.
> > > > - * @dev: Pointer to the capability data 01 parent device.
> > > > - * @data: Unused void pointer for passing match criteria.
> > > > + * lwmi_cd_match() - Match rule for the master driver.
> > > > + * @dev: Pointer to the capability data parent device.
> > > > + * @type: Pointer to capability data type (enum lwmi_cd_type *) to=
 match.
> > > >     *
> > > >     * Return: int.
> > > >     */
> > > > -int lwmi_cd01_match(struct device *dev, void *data)
> > > > +static int lwmi_cd_match(struct device *dev, void *type)
> > > > +{
> > > > +	struct lwmi_cd_priv *priv;
> > > > +
> > > > +	if (dev->driver !=3D &lwmi_cd_driver.driver)
> > > > +		return false;
> > > > +
> > > > +	priv =3D dev_get_drvdata(dev);
> > > > +	return priv->list->type =3D=3D *(enum lwmi_cd_type *)type;
> > > > +}
> > > > +
> > > > +/**
> > > > + * lwmi_cd_match_add_all() - Add all match rule for the master dri=
ver.
> > > > + * @master: Pointer to the master device.
> > > > + * @matchptr: Pointer to the returned component_match pointer.
> > > > + *
> > > > + * Adds all component matches to the list stored in @matchptr for =
the @master
> > > > + * device. @matchptr must be initialized to NULL. This matches all=
 available
> > > > + * capdata types on the machine.
> > > > + */
> > > > +void lwmi_cd_match_add_all(struct device *master, struct component=
_match **matchptr)
> > > >    {
> > > > -	return dev->driver =3D=3D &lwmi_cd_driver.driver;
> > > > +	int i;
> > > > +
> > > > +	if (WARN_ON(*matchptr))
> > > > +		return;
> > > > +
> > > > +	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> > > > +		if (!lwmi_cd_table[i].guid_string ||
> > > > +		    !wmi_has_guid(lwmi_cd_table[i].guid_string))
> > > > +			continue;
> > > I am still not happy about this. AFAIK as soon as the ordinary capdat=
a WMI devices are bound together,
> > > the firmware tells you whether or not the additional fan data WMI dev=
ice is available. Maybe you can do
> > > something like this:
> > >=20
> > > 1. Bind both capdata WMI devices as usual.
> > > 2. Check if a fan data WMI device is available (you can use a DMI-bas=
ed quirk list for devices were
> > >      the firmware reports invalid data).
> > > 3. Register an additional component that binds to the fan data WMI de=
vice.
> > > 4. Bind both the additional component and the component registered by=
 the fan data WMI device.
> > > 5. Register the hwmon device with additional fan data.
> > >=20
> > > If the fan data WMI device is not available, you can simply skip step=
s 3 and 4 and simply
> > > register the hwmon device with any additional fan data.
> > >=20
> > > What do you think?
> > I tried your approach. I looks pretty well except for step 4:
> >=20
> >     debugfs: 'DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-21' already exists i=
n 'device_component'
> >=20
> > Moreover, component_[un]bind_all() calls __aggregate_find() with ops =
=3D=3D
> > NULL, which implies that it can't really distinguish the two aggregate
> > devices we have. Thus, we are rely on the insertion sequence of
> > aggregate_devices (see component_master_add_with_match()) to make it
> > just work. Pseudo code:
> >=20
> >     lwmi_other_probe()
> >     {
> >     	component_match_add(..., lwmi_cd00_match, ...);
> >     	component_match_add(..., lwmi_cd01_match, ...);
> >     	component_master_add_with_match(..., &ops1, ...);
> >     	component_match_add(..., lwmi_cd_fan_match, ...);
> >     	component_master_add_with_match(..., &ops2, ...);
> >     }
> >    =20
> >     lwmi_other_remove()
> >     {
> >     	/* This just works (TM). */
> >     	component_master_del(..., &ops2); /* unbinds cd_fan */
> >     	component_master_del(..., &ops1); /* unbinds cd00/01 */
> >    =20
> >     	/* WARNING: at drivers/base/component.c:589 */
> >     	/*
> >     	component_master_del(..., &ops1); /* unbinds cd_fan!!! */
> >     	component_master_del(..., &ops2); /* unbinds cd_fan!!! */
> >     	*/
> >     }
> >=20
> > It seems that the component framework is not prepared to allow multi-
> > aggregation master device.
> >=20
> > Since we are talking about the component framework: all efforts we made
> > here is to work around one of its limitations -- all components must be
> > found or else it won't bring up the aggregate device. Do you think
> > allowing partially bound aggregate device a good idea? E.g., adding a
> > flag, indicating the master device opts in to such behavior, to the
> > definition of struct component_master_ops. I can prepare a separate
> > patch for that.
> >=20
> > CC'ing maintainers and lists of driver core and component framework.
>=20
> Oh my, i did not know about this limitation. I think adding support for
> optional components will be quite complicated to get right,

Ahh, yes. This seemed too complicated once I thought it over, as one of
the most important purposes of the component framework is to eliminate
any assumption of the probe sequence of master and its components --
optional components bring the assumption back.

> inside i propose
> the following:
>=20
> The current component master is lenovo-wmi-other, with capdata01 and capd=
ata00
> being its components (correct me if i am wrong). Instead of registering a=
n additional
> component master on lenovo-wmi-other, how about registering it on capdata=
00?
>=20
> Basically when probing, capdata00 will register the component for lenovo-=
wmi-other
> and then check whether attribute 0x04050000 indicates support for LENOVO_=
FAN_TEST_DATA
> (or a DMI check overrides this). Is yes then capdata00 registers an addit=
ional component
> master, otherwise the hwmon device is created right away.
> The driver for LENOVO_FAN_TEST_DATA registers a component for capdata00. =
As soon as the
> component master from capdata00 is bound to the component from LENOVO_FAN=
_TEST_DATA, a
> hwmon device is created.

"register the component for lenovo-wmi-other ... and *then* check ...
0x04050000 ...=C2=A0Is yes *then* capdata00 registers an additional
component master ..."

Did you mean capdata00 should check 0x04050000 *right after*
registering itself as a component of lenovo-wmi-other on probe?

Considering both lenovo-wmi-capdata and lenovo-wmi-other declare
probe_type =3D PROBE_PREFER_ASYNCHRONOUS, the timing of binding
establishment between lenovo-wmi-other and capdata{00,01} is
unpredictable, depending on which function call happens last:
1. component_master_add_with_match(other_dev, ...)
2. component_add(capdata00_dev, ...)
3. component_add(capdata01_dev, ...)

IIUC, there could be a race condition that it's too late to check
0x04050000 and register capdata00 as a master that the binding between
lenovo-wmi-other and capdata{00,01} has been established before. For
example, if 2 happens last, the binding must have been established
right before its return, making all operations afterward (check ... and
regsiter ...) meaningless. Even in other cases, the situation still
heavily depends on how fast the binding between capdata00 and
capdata_fan is established.

Or did you mean:

- lenovo-wmi-other on probe:
  - Registers itself as the master of capdata00/01
- capdata00/capdata01/capdata_fan on probe:
  - Register themselves as components

In the master bind callback of lenovo-wmi-other:
1. Calls component_bind_all()
2. In the component bind callback of capdata00:
   a. Checks 0x04050000 to see if LENOVO_FAN_TEST_DATA is supported
   b. If no, passes cd00_list to lenovo-wmi-other; return
   c. If yes, registers capdata00 as the master of capdata_fan
   d. "As soon as" the master is bound, passes cd00_list and
      cd_fan_list to lenovo-wmi-other
3. In the component bind callback of capdata01:
   a. Passes cd01_list to lenovo-wmi-other
4. Registers fw_attributes and HWMON device accordingly

This causes deadlock IIUC. This is because the component framework
calls 2 (the bind callback) with component_mutex held. Hence, 2.c
(registering capdata00 as a master) acquires component_mutex
recursively.

Or did I misunderstand your proposal or miss anything?

> Do you thing this would be more feasible than extending the component fra=
mework itself?

Thanks for you suggestion. I agree that binding capdata_fan to
capdata00 is the right direction to get rid of wmi_has_guid() in the
series.

I think the fundamental idea of your proposal is how to enforce the
following dependency chain while binding all these components/masters:

lenovo-wmi-other <- capdata00 <- capdata_fan
|- master           |- component
                    |- sub-master
                                 |- sub-component

While your proposal is in a top-down (left-to-right) manner, how about
a bottom-up (right-to-left) one? Illustration:

- lenovo-wmi-other on probe:
  - Registers itself as the master of capdata{00,01}
- capdata01/capdata_fan on probe:
  - Register themselves as components
- capdata00 on probe:
  - Checks 0x04050000 to see if LENOVO_FAN_TEST_DATA is supported
  - If no, registers itself as a component
  - If yes, registers itself as the master of capdata_fan

If yes, in the master bind callback of capdata00:
1. Calls component_bind_all()
2. In the component bind callback of capdata_fan:
   a. Passes cd_fan_list to capdata00
3. Schedules a work[1] to register capdata00 as a component

In such an approach, it is guaranteed that the binding between
capdata00 and capdata_fan must have been established before the binding
between lenovo-wmi-other and capdata{00,01} can start establishing,
which enforces the mentioned dependency chain.

Then, in the master bind callback of lenovo-wmi-other:
1. Calls component_bind_all()
2. In the component bind callback of capdata00:
   a. Passes cd00_list and cd_fan_list (if any) to lenovo-wmi-other
3. In the component bind callback of capdata01:
   a. Passes cd01_list to lenovo-wmi-other
4. Registers fw_attributes and HWMON device accordingly

Does my analysis and proposal make sense to you? If so, I will send out
a [PATCH v4] implementing this.

[1]: To break the component_mutex dilemma.

> Thanks,
> Armin Wolf

Thanks,
Rong

> > > Thanks,
> > > Armin Wolf
> > Thanks,
> > Rong
> >=20
> > > > +
> > > > +		component_match_add(master, matchptr, lwmi_cd_match,
> > > > +				    (void *)&lwmi_cd_table[i].type);
> > > > +		if (IS_ERR(matchptr))
> > > > +			return;
> > > > +	}
> > > > +
> > > > +	if (!*matchptr) {
> > > > +		pr_warn("a master driver requested capability data, but nothing =
is available\n");
> > > > +		*matchptr =3D ERR_PTR(-ENODEV);
> > > > +	}
> > > >    }
> > > > -EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD");
> > > > +EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
> > > >   =20
> > > >    module_wmi_driver(lwmi_cd_driver);
> > > >   =20
> > > >    MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
> > > >    MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > > > +MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
> > > >    MODULE_DESCRIPTION("Lenovo Capability Data WMI Driver");
> > > >    MODULE_LICENSE("GPL");
> > > > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/pl=
atform/x86/lenovo/wmi-capdata.h
> > > > index 2a4746e38ad4..1e5fce7836cb 100644
> > > > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > > > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > > > @@ -7,6 +7,7 @@
> > > >   =20
> > > >    #include <linux/types.h>
> > > >   =20
> > > > +struct component_match;
> > > >    struct device;
> > > >    struct cd_list;
> > > >   =20
> > > > @@ -19,7 +20,11 @@ struct capdata01 {
> > > >    	u32 max_value;
> > > >    };
> > > >   =20
> > > > +struct lwmi_cd_binder {
> > > > +	struct cd_list *cd01_list;
> > > > +};
> > > > +
> > > >    int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, s=
truct capdata01 *output);
> > > > -int lwmi_cd01_match(struct device *dev, void *data);
> > > > +void lwmi_cd_match_add_all(struct device *master, struct component=
_match **matchptr);
> > > >   =20
> > > >    #endif /* !_LENOVO_WMI_CAPDATA_H_ */
> > > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/plat=
form/x86/lenovo/wmi-other.c
> > > > index c6dc1b4cff84..20c6ff0be37a 100644
> > > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > > @@ -579,14 +579,14 @@ static void lwmi_om_fw_attr_remove(struct lwm=
i_om_priv *priv)
> > > >    static int lwmi_om_master_bind(struct device *dev)
> > > >    {
> > > >    	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > > > -	struct cd_list *tmp_list;
> > > > +	struct lwmi_cd_binder binder =3D { 0 };
> > > >    	int ret;
> > > >   =20
> > > > -	ret =3D component_bind_all(dev, &tmp_list);
> > > > +	ret =3D component_bind_all(dev, &binder);
> > > >    	if (ret)
> > > >    		return ret;
> > > >   =20
> > > > -	priv->cd01_list =3D tmp_list;
> > > > +	priv->cd01_list =3D binder.cd01_list;
> > > >    	if (!priv->cd01_list)
> > > >    		return -ENODEV;
> > > >   =20
> > > > @@ -618,6 +618,7 @@ static int lwmi_other_probe(struct wmi_device *=
wdev, const void *context)
> > > >    {
> > > >    	struct component_match *master_match =3D NULL;
> > > >    	struct lwmi_om_priv *priv;
> > > > +	int ret;
> > > >   =20
> > > >    	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > > >    	if (!priv)
> > > > @@ -626,12 +627,26 @@ static int lwmi_other_probe(struct wmi_device=
 *wdev, const void *context)
> > > >    	priv->wdev =3D wdev;
> > > >    	dev_set_drvdata(&wdev->dev, priv);
> > > >   =20
> > > > -	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, N=
ULL);
> > > > +	lwmi_cd_match_add_all(&wdev->dev, &master_match);
> > > >    	if (IS_ERR(master_match))
> > > >    		return PTR_ERR(master_match);
> > > >   =20
> > > > -	return component_master_add_with_match(&wdev->dev, &lwmi_om_maste=
r_ops,
> > > > -					       master_match);
> > > > +	ret =3D component_master_add_with_match(&wdev->dev, &lwmi_om_mast=
er_ops,
> > > > +					      master_match);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	if (likely(component_master_is_bound(&wdev->dev, &lwmi_om_master_=
ops)))
> > > > +		return 0;
> > > > +
> > > > +	/*
> > > > +	 * The bind callbacks of both master and components were never ca=
lled in
> > > > +	 * this case - this driver won't work at all. Failing...
> > > > +	 */
> > > > +	dev_err(&wdev->dev, "unbound master; is any component failing to =
be probed?");
> > > > +
> > > > +	component_master_del(&wdev->dev, &lwmi_om_master_ops);
> > > > +	return -EXDEV;
> > > >    }
> > > >   =20
> > > >    static void lwmi_other_remove(struct wmi_device *wdev)
