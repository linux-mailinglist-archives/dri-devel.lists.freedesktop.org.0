Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5204E9FB55D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 21:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A260C10E250;
	Mon, 23 Dec 2024 20:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 569 seconds by postgrey-1.36 at gabe;
 Mon, 23 Dec 2024 20:33:14 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C6710E250
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 20:33:14 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH8nr5fC3z6L774;
 Tue, 24 Dec 2024 04:32:00 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 11634140A70;
 Tue, 24 Dec 2024 04:33:13 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 21:33:11 +0100
Date: Mon, 23 Dec 2024 20:33:09 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Zijun Hu <zijun_hu@icloud.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, Thomas =?ISO-8859-1?Q?Wei=DFschu?=
 =?ISO-8859-1?Q?h?= <thomas@t-8ch.de>, <linux-kernel@vger.kernel.org>,
 <nvdimm@lists.linux.dev>, <linux-sound@vger.kernel.org>,
 <sparclinux@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-cxl@vger.kernel.org>, <linux1394-devel@lists.sourceforge.net>,
 <arm-scmi@vger.kernel.org>, <linux-efi@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-hwmon@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <netdev@vger.kernel.org>, Zijun Hu <quic_zijuhu@quicinc.com>, "Alison
 Schofield" <alison.schofield@intel.com>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
Message-ID: <20241223203309.00004d51@huawei.com>
In-Reply-To: <20241211-const_dfc_done-v4-4-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-4-583cc60329df@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
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

On Wed, 11 Dec 2024 08:08:06 +0800
Zijun Hu <zijun_hu@icloud.com> wrote:

> From: Zijun Hu <quic_zijuhu@quicinc.com>
>=20
> Constify the following API:
> struct device *device_find_child(struct device *dev, void *data,
> 		int (*match)(struct device *dev, void *data));
> To :
> struct device *device_find_child(struct device *dev, const void *data,
>                                  device_match_t match);
> typedef int (*device_match_t)(struct device *dev, const void *data);
> with the following reasons:
>=20
> - Protect caller's match data @*data which is for comparison and lookup
>   and the API does not actually need to modify @*data.
>=20
> - Make the API's parameters (@match)() and @data have the same type as
>   all of other device finding APIs (bus|class|driver)_find_device().
>=20
> - All kinds of existing device match functions can be directly taken
>   as the API's argument, they were exported by driver core.
>=20
> Constify the API and adapt for various existing usages by simply making
> various match functions take 'const void *' as type of match data @data.

There are a couple of places I noticed where you changed types
that aren't related to the specific change this is making.
They are almost certainly fine but I'd either like a specific note
on that in this patch description or just change the elements
that are directly affected by this change.

>=20
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>


> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index d778996507984a759bbe84e7acac3774e0c7af98..bfecd71040c2f4373645380b4=
c31327d8b42d095 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c

> @@ -1722,10 +1722,12 @@ static struct cxl_port *next_port(struct cxl_port=
 *port)
>  	return port->parent_dport->port;
>  }
> =20
> -static int match_switch_decoder_by_range(struct device *dev, void *data)
> +static int match_switch_decoder_by_range(struct device *dev,
> +					 const void *data)
>  {
>  	struct cxl_switch_decoder *cxlsd;
> -	struct range *r1, *r2 =3D data;
> +	const struct range *r1, *r2 =3D data;

As below. I'd not touch type of things you don't need to touch.

> +
> =20
>  	if (!is_switch_decoder(dev))
>  		return 0;
> @@ -3176,9 +3178,10 @@ static int devm_cxl_add_dax_region(struct cxl_regi=
on *cxlr)
>  	return rc;
>  }
> =20
> -static int match_root_decoder_by_range(struct device *dev, void *data)
> +static int match_root_decoder_by_range(struct device *dev,
> +				       const void *data)
>  {
> -	struct range *r1, *r2 =3D data;
> +	const struct range *r1, *r2 =3D data;

=46rom the point of view of keeping the patch to what it 'needs'
to touch, should leave type of r1 alone.
I've not looked at whether this causes any problems, just whether
it is relevant to this change.

>  	struct cxl_root_decoder *cxlrd;
> =20
>  	if (!is_root_decoder(dev))
> @@ -3189,11 +3192,11 @@ static int match_root_decoder_by_range(struct dev=
ice *dev, void *data)
>  	return range_contains(r1, r2);
>  }
> =20
> -static int match_region_by_range(struct device *dev, void *data)
> +static int match_region_by_range(struct device *dev, const void *data)
>  {
>  	struct cxl_region_params *p;
>  	struct cxl_region *cxlr;
> -	struct range *r =3D data;
> +	const struct range *r =3D data;
>  	int rc =3D 0;
> =20

