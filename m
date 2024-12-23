Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C819FB5E1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 21:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CDB10E459;
	Mon, 23 Dec 2024 20:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20EC10E459
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 20:52:57 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH99X3N2zz6K5Zf;
 Tue, 24 Dec 2024 04:49:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 78F9C14039E;
 Tue, 24 Dec 2024 04:52:55 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 21:52:54 +0100
Date: Mon, 23 Dec 2024 20:52:52 +0000
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
 <netdev@vger.kernel.org>, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v4 11/11] usb: typec: class: Remove both cable_match()
 and partner_match()
Message-ID: <20241223205252.00003d6b@huawei.com>
In-Reply-To: <20241211-const_dfc_done-v4-11-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-11-583cc60329df@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
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

On Wed, 11 Dec 2024 08:08:13 +0800
Zijun Hu <zijun_hu@icloud.com> wrote:

> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> cable_match(), as matching function of device_find_child(), matches
> a device with device type @typec_cable_dev_type, and its task can be
> simplified by the recently introduced API device_match_type().
> 
> partner_match() is similar with cable_match() but with a different
> device type @typec_partner_dev_type.
> 
> Remove both functions and use the API plus respective device type instead.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
Looks good, but there is the same trade off here between internal
detail of type identification and reducing the use of helpers
where the generic ones are fine.  Here is less obvious even than
the CXL one as the helper macros do have other uses in these
files.

So, it's on for USB folk to decide on and I won't be giving a tag
as a result.

Jonathan

> ---
>  drivers/usb/typec/class.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 601a81aa1e1024265f2359393dee531a7779c6ea..3a4e0bd0131774afd0d746d2f0a306190219feec 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1282,11 +1282,6 @@ const struct device_type typec_cable_dev_type = {
>  	.release = typec_cable_release,
>  };
>  
> -static int cable_match(struct device *dev, const void *data)
> -{
> -	return is_typec_cable(dev);
> -}
> -
>  /**
>   * typec_cable_get - Get a reference to the USB Type-C cable
>   * @port: The USB Type-C Port the cable is connected to
> @@ -1298,7 +1293,8 @@ struct typec_cable *typec_cable_get(struct typec_port *port)
>  {
>  	struct device *dev;
>  
> -	dev = device_find_child(&port->dev, NULL, cable_match);
> +	dev = device_find_child(&port->dev, &typec_cable_dev_type,
> +				device_match_type);
>  	if (!dev)
>  		return NULL;
>  
> @@ -2028,16 +2024,12 @@ const struct device_type typec_port_dev_type = {
>  /* --------------------------------------- */
>  /* Driver callbacks to report role updates */
>  
> -static int partner_match(struct device *dev, const void *data)
> -{
> -	return is_typec_partner(dev);
> -}
> -
>  static struct typec_partner *typec_get_partner(struct typec_port *port)
>  {
>  	struct device *dev;
>  
> -	dev = device_find_child(&port->dev, NULL, partner_match);
> +	dev = device_find_child(&port->dev, &typec_partner_dev_type,
> +				device_match_type);
>  	if (!dev)
>  		return NULL;
>  
> @@ -2170,7 +2162,9 @@ void typec_set_pwr_opmode(struct typec_port *port,
>  	sysfs_notify(&port->dev.kobj, NULL, "power_operation_mode");
>  	kobject_uevent(&port->dev.kobj, KOBJ_CHANGE);
>  
> -	partner_dev = device_find_child(&port->dev, NULL, partner_match);
> +	partner_dev = device_find_child(&port->dev,
> +					&typec_partner_dev_type,
> +					device_match_type);
>  	if (partner_dev) {
>  		struct typec_partner *partner = to_typec_partner(partner_dev);
>  
> @@ -2334,7 +2328,9 @@ int typec_get_negotiated_svdm_version(struct typec_port *port)
>  	enum usb_pd_svdm_ver svdm_version;
>  	struct device *partner_dev;
>  
> -	partner_dev = device_find_child(&port->dev, NULL, partner_match);
> +	partner_dev = device_find_child(&port->dev,
> +					&typec_partner_dev_type,
> +					device_match_type);
>  	if (!partner_dev)
>  		return -ENODEV;
>  
> @@ -2361,7 +2357,8 @@ int typec_get_cable_svdm_version(struct typec_port *port)
>  	enum usb_pd_svdm_ver svdm_version;
>  	struct device *cable_dev;
>  
> -	cable_dev = device_find_child(&port->dev, NULL, cable_match);
> +	cable_dev = device_find_child(&port->dev, &typec_cable_dev_type,
> +				      device_match_type);
>  	if (!cable_dev)
>  		return -ENODEV;
>  
> 

