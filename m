Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC506214B96
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jul 2020 11:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E496EBFE;
	Sun,  5 Jul 2020 09:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 010C86EBFE
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 09:44:19 +0000 (UTC)
X-UUID: 33ba9c41c393484594545a3bc23d7c7f-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bVAN/Pr8hp2riddPU0Ip98uCQV+TayeMJMDOKh3eCMI=; 
 b=G1t2XbohuX5vrSHUSv00rfOOvnOD7dzzgBrqvUOjVP2NR+ys05ynEDkgxkFzIMiDZYxpCGwEt8iRA34aK4RUqjWzULJbiC80tDdzl0hda9Rw1psiKq/Xj+NPfMNO3p0gnXBABb+adNrlKWn9RvRn4NvepK/pRXgtSDPr/b/2cGg=;
X-UUID: 33ba9c41c393484594545a3bc23d7c7f-20200705
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1955651590; Sun, 05 Jul 2020 17:44:13 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 5 Jul 2020 17:44:12 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 5 Jul 2020 17:44:11 +0800
Message-ID: <1593942260.24547.0.camel@mszsdaap41>
Subject: Re: [PATCH] drm/panel: auo,b116xw03: fix flash backlight when power on
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Sun, 5 Jul 2020 17:44:20 +0800
In-Reply-To: <20200705080637.GA1745670@ravnborg.org>
References: <20200703095113.55712-1-jitao.shi@mediatek.com>
 <20200705080637.GA1745670@ravnborg.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A3D6659F2DC4FFFA11B5C6F5A8FFA03230239A4D2ADD46D9DBF384DD810AE9CF2000:8
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
Cc: David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-07-05 at 10:06 +0200, Sam Ravnborg wrote:
> Hi Jitao.
> 
> On Fri, Jul 03, 2020 at 05:51:13PM +0800, Jitao Shi wrote:
> > Delay the backlight on to make sure the video stable.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 3ad828eaefe1..18f34f286d3d 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -734,6 +734,9 @@ static const struct panel_desc auo_b116xw03 = {
> >  		.width = 256,
> >  		.height = 144,
> >  	},
> > +	.delay = {
> > +		.enable = 400,
> > +	},
> >  };
> >  
> >  static const struct drm_display_mode auo_b133xtn01_mode = {
> 
> Patch did not apply to drm-misc-next.
> Please update - and when you do so also add:
> .bus_flags
> .bus_format
> .connector_type
> 
> So we have this panel properly defined.
> 
> 	Sam

Thanks for your review.
I'll add those next version.

Jitao
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
