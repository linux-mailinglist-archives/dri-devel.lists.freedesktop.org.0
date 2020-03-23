Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A018F114
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 09:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF6E89958;
	Mon, 23 Mar 2020 08:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9317689DF7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 01:12:07 +0000 (UTC)
X-UUID: 7f2ae8122d3640109396e18c7959ce7c-20200323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ej7b2xhDVPxexbXWATZXTqKZRMpmRwD04pT0SWLn2fk=; 
 b=efDLcvC31Zh1JIojnQSsS7mpqC2YLYF4zoBRgMDC6YcI2Wod5p2HWdtxHyvE3JW2GMVrn8inpdOI0X66bpqqfF8Xztq2WUJ7DsqlRoXQxbox9t1TxRJfDBCD4Rkcq3tUqELnIPbrU/k/FuytljHQHFZsr9vXJt0BIwjqp/x0eAI=;
X-UUID: 7f2ae8122d3640109396e18c7959ce7c-20200323
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1058497680; Mon, 23 Mar 2020 09:12:02 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 09:11:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 23 Mar 2020 09:09:43 +0800
Message-ID: <1584925915.16928.1.camel@mtkswgap22>
Subject: Re: [PATCH v5 02/13] mailbox: cmdq: variablize address shift in
 platform
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 23 Mar 2020 09:11:55 +0800
In-Reply-To: <CABb+yY04NbSvHkQ0sVHd+KjU3ZFZSZD=H99OSNjoeu+Qpk7R8g@mail.gmail.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-3-git-send-email-dennis-yc.hsieh@mediatek.com>
 <CABb+yY04NbSvHkQ0sVHd+KjU3ZFZSZD=H99OSNjoeu+Qpk7R8g@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 23 Mar 2020 08:45:09 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jassi,


On Thu, 2020-03-19 at 20:05 -0500, Jassi Brar wrote:
> On Sun, Mar 8, 2020 at 5:53 AM Dennis YC Hsieh
> <dennis-yc.hsieh@mediatek.com> wrote:
> >
> > Some gce hardware shift pc and end address in register to support
> > large dram addressing.
> > Implement gce address shift when write or read pc and end register.
> > And add shift bit in platform definition.
> >
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c       | 61 ++++++++++++++++++------
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   |  3 +-
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
> >
> Please segregate this patch, and any other if, into mailbox and
> platform specific patchsets. Ideally soc/client specific changes later
> on top of mailbox/provider changes.
> 
> Thanks

Thanks for your comment. I'll separate mailbox and soc code.


Regards,
Dennis

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
