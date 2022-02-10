Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 964414B077D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 08:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EED10E72C;
	Thu, 10 Feb 2022 07:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7396C10E72C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 07:50:01 +0000 (UTC)
X-UUID: 6cdd44ab8bbd4f69b30eb8ff0670bc6a-20220210
X-UUID: 6cdd44ab8bbd4f69b30eb8ff0670bc6a-20220210
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 459675619; Thu, 10 Feb 2022 15:49:56 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 15:49:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 15:49:53 +0800
Message-ID: <face7ccf80520ecad1b75f01f74314ddb483b88b.camel@mediatek.com>
Subject: Re: [RFC PATCH] component: Add common helpers for compare/release
 functions
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>, <dri-devel@lists.freedesktop.org>
Date: Thu, 10 Feb 2022 15:49:53 +0800
In-Reply-To: <29deffd6-aac4-f085-bcd5-f5a2d02784a8@arm.com>
References: <20220128081101.27837-1-yong.wu@mediatek.com>
 <29deffd6-aac4-f085-bcd5-f5a2d02784a8@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sebastian Reichel <sre@kernel.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg
 Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, James
 Wang <james.qian.wang@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-01-28 at 13:04 +0000, Robin Murphy wrote:
> On 2022-01-28 08:11, Yong Wu wrote:
> [...]
> > diff --git a/include/linux/component.h b/include/linux/component.h
> > index 16de18f473d7..5a7468ea827c 100644
> > --- a/include/linux/component.h
> > +++ b/include/linux/component.h
> > @@ -2,6 +2,8 @@
> >   #ifndef COMPONENT_H
> >   #define COMPONENT_H
> >   
> > +#include <linux/device.h>
> > +#include <linux/of.h>
> >   #include <linux/stddef.h>
> >   
> >   
> > @@ -82,6 +84,22 @@ struct component_master_ops {
> >   	void (*unbind)(struct device *master);
> >   };
> >   
> > +/* A set common helpers for compare/release functions */
> > +static inline int compare_of(struct device *dev, void *data)
> > +{
> > +	return dev->of_node == data;
> > +}
> 
> Note that this is effectively just device_match_of_node(), although
> I 
> guess there is an argument that having a nice consistent set of 
> component_match API helpers might be worth more than a tiny code
> saving 
> by borrowing one from a different API.

Thanks for this tip. I could try use this, Let the maintainer decide.

> 
> Either way, however, I don't think there's any good argument for 
> instantiating separate copies of these functions in every driver
> that 
> uses them. If they're used as callbacks then they can't actually be 
> inlined anyway, so they may as well be exported from component.c as 

oh. The MTK iommu keeps this inline for long time... OK, I will try
to move into the component.c and export them.

(Sorry for the late reply due to New Year holidays.)

> normal so that the code really is shared (plus then there's nice 
> symmetry with the aforementioned device_match API helpers too).
> 
> Thanks,
> Robin.
  

