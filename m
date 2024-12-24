Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2E9FC020
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 17:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5855D10E105;
	Tue, 24 Dec 2024 16:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8B710E105
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 16:23:42 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YHgCQ4C2Wz6LDFf;
 Wed, 25 Dec 2024 00:22:26 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 20E24140391;
 Wed, 25 Dec 2024 00:23:40 +0800 (CST)
Received: from localhost (10.48.156.150) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 24 Dec
 2024 17:23:38 +0100
Date: Tue, 24 Dec 2024 16:23:36 +0000
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
Subject: Re: [PATCH v5 04/12] driver core: Constify API device_find_child()
 and adapt for various usages
Message-ID: <20241224162336.00002486@huawei.com>
In-Reply-To: <20241224-const_dfc_done-v5-4-6623037414d4@quicinc.com>
References: <20241224-const_dfc_done-v5-0-6623037414d4@quicinc.com>
 <20241224-const_dfc_done-v5-4-6623037414d4@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.48.156.150]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
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

On Tue, 24 Dec 2024 21:05:03 +0800
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
> Constify the API and adapt for various existing usages.
>=20
> BTW, various subsystem changes are squashed into this commit to meet
> 'git bisect' requirement, and this commit has the minimal and simplest
> changes to complement squashing shortcoming, and that may bring extra
> code improvement.
>=20
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org> # for drivers/pwm
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
