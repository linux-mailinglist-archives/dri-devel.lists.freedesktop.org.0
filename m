Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499CE129368
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B7789FCC;
	Mon, 23 Dec 2019 08:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1378389FCC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 08:59:42 +0000 (UTC)
X-UUID: fdbe423be5424ef0b7b0a6fa0cef7895-20191223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GIxkr6Z3J7HgwOFSpLaPB2mv26seiJrHqASnjdQ/WuM=; 
 b=c1jKL4cTWnGtOxIq36oOVI39ctbinDcNdvG/SnInr75JnU8Xvp9tSrrTEwttbrLIW36IXiT07fliI3/ncn99PJdV0Xva0MAe6szb/mHs1GC4NpxlN3WSmlZRIKirhNuuv3w//vtn23sem0lkDfj3FXFCF3Jr0RXfRdyTlx22ThE=;
X-UUID: fdbe423be5424ef0b7b0a6fa0cef7895-20191223
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 103425353; Mon, 23 Dec 2019 16:59:37 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Dec 2019 16:59:16 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 23 Dec 2019 16:59:48 +0800
Message-ID: <1577091576.20525.4.camel@mtksdaap41>
Subject: Re: [PATCH v5 6/7] drm/mediatek: support CMDQ interface in ddp
 component
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 23 Dec 2019 16:59:36 +0800
In-Reply-To: <CAJMQK-jdMwoC54XpWj-XYW_yZkM=TcGcJpy94DTdYBN2t1wqmw@mail.gmail.com>
References: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
 <20191210050526.4437-7-bibby.hsieh@mediatek.com>
 <CAJMQK-jdMwoC54XpWj-XYW_yZkM=TcGcJpy94DTdYBN2t1wqmw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz
 Figa <tfiga@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX /
 MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-yi:

On Fri, 2019-12-20 at 21:27 +0800, Hsin-Yi Wang wrote:
> On Tue, Dec 10, 2019 at 5:05 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
> 
> >
> > +void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
> > +                  struct mtk_ddp_comp *comp, unsigned int offset)
> > +{
> > +#if IS_ENABLED(CONFIG_MTK_CMDQ)
> Should we use #ifdef like in v4? https://patchwork.kernel.org/patch/11274439/
> 
> We got warnings while compiling kernels if CONFIG_MTK_CMDQ is not set,
> since cmdq_pkt_write() would still be compiled.
> Similar in other #if IS_ENABLED(CONFIG_MTK_CMDQ) (also in 7/7
> https://patchwork.kernel.org/patch/11281349/)
> 

I've changed IS_ENABLED() to IS_REACHABLE()in mediatek-drm-next-5.6 [1]
for the correct relationship between MTK_DRM and MTK_CMDQ.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
CK

> 
> > +       if (cmdq_pkt)
> > +               cmdq_pkt_write(cmdq_pkt, comp->subsys,
> > +                              comp->regs_pa + offset, value);
> > +       else
> > +#endif
> > +               writel(value, comp->regs + offset);
> > +}
> > +

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
