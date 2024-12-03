Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146A59E234E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E2310E081;
	Tue,  3 Dec 2024 15:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="eZ4U4tRU";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="eZ4U4tRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bedivere.hansenpartnership.com (unknown [96.44.175.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC83810E081
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1733240096;
 bh=L/QXZvHG42gthQ6VgZcE1FVgbBCT68wm3yek2sYu4mw=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=eZ4U4tRU1qIWP3lhCG1NFGqdlkJwbCoeHoXmlbwbm0xojoL7yxF2OmBDrwRg5sJZD
 yUR1Ufh9cMTmWMSk/QfvKgX3lU1FOQtEkMYCzG5HJRGBhs9c6tkPAgFURJTLia4EJE
 fFgUsJsyCn7Ieybkh2Zt2C6KjPseMR4k9lZkDFPA=
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id AB50D1286ACE;
 Tue, 03 Dec 2024 10:34:56 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id voj3K1dfyxiH; Tue,  3 Dec 2024 10:34:56 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1733240096;
 bh=L/QXZvHG42gthQ6VgZcE1FVgbBCT68wm3yek2sYu4mw=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=eZ4U4tRU1qIWP3lhCG1NFGqdlkJwbCoeHoXmlbwbm0xojoL7yxF2OmBDrwRg5sJZD
 yUR1Ufh9cMTmWMSk/QfvKgX3lU1FOQtEkMYCzG5HJRGBhs9c6tkPAgFURJTLia4EJE
 fFgUsJsyCn7Ieybkh2Zt2C6KjPseMR4k9lZkDFPA=
Received: from lingrow.int.hansenpartnership.com (unknown
 [IPv6:2601:5c4:4302:c21::a774])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id F32C01286A7D;
 Tue, 03 Dec 2024 10:34:50 -0500 (EST)
Message-ID: <108c63c753f2f637a72c2e105ac138f80d4b0859.camel@HansenPartnership.com>
Subject: Re: [PATCH v2 00/32] driver core: Constify API device_find_child()
 and adapt for various existing usages
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Zijun Hu <zijun_hu@icloud.com>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
 <thomas@t-8ch.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jean
 Delvare <jdelvare@suse.com>,  Guenter Roeck <linux@roeck-us.net>, Martin
 Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Andreas Noever <andreas.noever@gmail.com>, Michael
 Jamet <michael.jamet@intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>,  Yehezkel Bernat
 <YehezkelShB@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean
 <olteanv@gmail.com>,  "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Dave
 Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, Takashi
 Sakamoto <o-takashi@sakamocchi.jp>, Jiri Slaby <jirislaby@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Lee Duncan <lduncan@suse.com>, Chris
 Leech <cleech@redhat.com>, Mike Christie <michael.christie@oracle.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali
 <njavali@marvell.com>, Manish Rangankar <mrangankar@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com, Davidlohr Bueso
 <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, Alison
 Schofield <alison.schofield@intel.com>, Andreas Larsson
 <andreas@gaisler.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>, Jens Axboe <axboe@kernel.dk>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Ard
 Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org,  linux-pwm@vger.kernel.org, nvdimm@lists.linux.dev,
 linux1394-devel@lists.sourceforge.net, linux-serial@vger.kernel.org, 
 linux-sound@vger.kernel.org, open-iscsi@googlegroups.com, 
 linux-scsi@vger.kernel.org, linux-cxl@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Date: Tue, 03 Dec 2024 10:34:49 -0500
In-Reply-To: <f5ea7e17-5550-4658-8f4c-1c51827c7627@icloud.com>
References: <20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com>
 <g32cigmktmj4egkq2tof27el2yss4liccfxgebkgqvkil32mlb@e3ta4ezv7y4m>
 <9d34bd6f-b120-428a-837b-5a5813e14618@icloud.com>
 <2024120320-manual-jockey-dfd1@gregkh>
 <b9885785-d4d4-4c72-b425-3dc552651d7e@icloud.com>
 <8eb7c0c54b280b8eb72f82032ede802c001ab087.camel@HansenPartnership.com>
 <8fb887a0-3634-4e07-9f0d-d8d7c72ca802@t-8ch.de>
 <f5ea7e17-5550-4658-8f4c-1c51827c7627@icloud.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2024-12-03 at 22:56 +0800, Zijun Hu wrote:
> On 2024/12/3 22:07, Thomas Weißschuh wrote:
> > On 2024-12-03 08:58:26-0500, James Bottomley wrote:
> > > On Tue, 2024-12-03 at 21:02 +0800, Zijun Hu wrote:
> > > > On 2024/12/3 20:41, Greg Kroah-Hartman wrote:
> > > > > On Tue, Dec 03, 2024 at 08:23:45PM +0800, Zijun Hu wrote:
> > > [...]
> > > > > > or squash such patch series into a single patch ?
> > > > > > 
> > > > > > various subsystem maintainers may not like squashing way.
> > > > > 
> > > > > Agreed, so look into either doing it in a bisectable way if
> > > > > at all possible.  As I don't see a full series here, I can't
> > > > > suggest how it needs to happen :(
> > > > > 
> > > > 
> > > > let me send you a full series later and discuss how to solve
> > > > this issue.
> > > 
> > > It's only slightly more complex than what we normally do: modify
> > > all instances and then change the API.  In this case you have an
> > > additional problem because the prototype "const void *" will
> > > cause a mismatch if a function has "void *".  The easiest way to
> > > solve this is probably to make device_find_child a macro that
> > > coerces its function argument to having a non const "void *" and
> > > then passes off to the real function.  If you do that in the
> > > first patch, then you can constify all the consumers and finally
> > > remove the macro coercion in the last patch.
> > 
> > Casting function pointers like that should be detected and trapped
> > by control flow integrity checking (KCFI).
> > 
> > Another possibility would be to use a macro and _Generic to
> > dispatch to two different backing functions. See __BIN_ATTR() in
> > include/linux/sysfs.h for an inspiration.

That's way over complicated for this conversion: done properly there
should be no need for _Generic() compile time type matching at all.

> this way may fix building error issue but does not achieve our
> purpose. our purpose is that there are only constified
> device_find_child().
> 
> 
> > This also enables an incremental migration.
> 
> change the API prototype from:
> device_find_child(..., void *data_0, int (*match)(struct device *dev,
> void *data));
> 
> to:
> device_find_child(..., const void *data_0, int (*match)(struct device
> *dev, const void *data));
> 
> For @data_0,  void * -> const void * is okay.
> but for @match, the problem is function pointer type incompatibility.
> 
> there are two solutions base on discussions.
> 
> 1) squashing likewise Greg mentioned.
>    Do all of the "prep work" first, and then
>    do the const change at the very end, all at once.
> 
> 2)  as changing platform_driver's remove() prototype.
> Commit: e70140ba0d2b ("Get rid of 'remove_new' relic from platform
> driver struct")
> 
>  introduce extra device_find_child_new() which is constified  -> use
> *_new() replace ALL device_find_child() instances one by one -> 
> remove device_find_child() -> rename *_new() to device_find_child()
> once.

Why bother with the last step, which churns the entire code base again?
Why not call the new function device_find_child_const() and simply keep
it (it's descriptive of its function).  That way you can have a patch
series without merging and at the end simply remove the old function.

Regards,

James

