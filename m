Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5931C2A81
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 09:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF296E141;
	Sun,  3 May 2020 07:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19A86E141
 for <dri-devel@lists.freedesktop.org>; Sun,  3 May 2020 07:13:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4922320026;
 Sun,  3 May 2020 09:13:35 +0200 (CEST)
Date: Sun, 3 May 2020 09:13:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200503071328.GA11582@ravnborg.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429124830.27475-2-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=SJz97ENfAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=Glsn2Xz2PHKrFKEi74kA:9
 a=wPNLvfGTeEIA:10 a=cvBusfyB2V15izCimMoJ:22 a=vFet0B0WnEQeilDPIY6i:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf.

On Wed, Apr 29, 2020 at 02:48:21PM +0200, Noralf Tr=F8nnes wrote:
> Add a way to lookup a backlight device based on its name.
> Will be used by a USB display gadget getting the name from configfs.
> =

> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>

Simple and well-documented.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
>  include/linux/backlight.h           |  1 +
>  2 files changed, 22 insertions(+)
> =

> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backligh=
t/backlight.c
> index cac3e35d7630..92d80aa0c0ef 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -432,6 +432,27 @@ struct backlight_device *backlight_device_get_by_typ=
e(enum backlight_type type)
>  }
>  EXPORT_SYMBOL(backlight_device_get_by_type);
>  =

> +/**
> + * backlight_device_get_by_name - Get backlight device by name
> + * @name: Device name
> + *
> + * This function looks up a backlight device by its name. It obtains a r=
eference
> + * on the backlight device and it is the caller's responsibility to drop=
 the
> + * reference by calling backlight_put().
> + *
> + * Returns:
> + * A pointer to the backlight device if found, otherwise NULL.
> + */
> +struct backlight_device *backlight_device_get_by_name(const char *name)
> +{
> +	struct device *dev;
> +
> +	dev =3D class_find_device_by_name(backlight_class, name);
> +
> +	return dev ? to_backlight_device(dev) : NULL;
> +}
> +EXPORT_SYMBOL(backlight_device_get_by_name);
> +
>  /**
>   * backlight_device_unregister - unregisters a backlight device object.
>   * @bd: the backlight device object to be unregistered and freed.
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index c7d6b2e8c3b5..56e4580d4f55 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -190,6 +190,7 @@ extern void backlight_force_update(struct backlight_d=
evice *bd,
>  extern int backlight_register_notifier(struct notifier_block *nb);
>  extern int backlight_unregister_notifier(struct notifier_block *nb);
>  extern struct backlight_device *backlight_device_get_by_type(enum backli=
ght_type type);
> +struct backlight_device *backlight_device_get_by_name(const char *name);
>  extern int backlight_device_set_brightness(struct backlight_device *bd, =
unsigned long brightness);
>  =

>  #define to_backlight_device(obj) container_of(obj, struct backlight_devi=
ce, dev)
> -- =

> 2.23.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
