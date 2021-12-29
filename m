Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C87481E84
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DADB10E256;
	Thu, 30 Dec 2021 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CFC10E139
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 03:04:12 +0000 (UTC)
X-UUID: 56cfc70957c541ad88d21b43a29142f0-20211229
X-UUID: 56cfc70957c541ad88d21b43a29142f0-20211229
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 415292584; Wed, 29 Dec 2021 11:04:07 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 29 Dec 2021 11:04:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 29 Dec 2021 11:04:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 29 Dec 2021 11:04:06 +0800
From: <miles.chen@mediatek.com>
To: <matthias.bgg@gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix unused-but-set variable warning
Date: Wed, 29 Dec 2021 11:04:03 +0800
Message-ID: <20211229030405.4338-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
References: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, miles.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 28/12/2021 10:25, Miles Chen wrote:
> Fix unused-but-set variable warning:
>> drivers/gpu/drm/mediatek/mtk_cec.c:85:6: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
>> 
>
>Actually we ignore the value passed to mtk_cec_mask. In case of
>mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);
>
>
>We are not setting CEC_32K_PDN. I wonder which side effect will it have to set 
>that bit.

I am confused about "not setting CEC_32K_PDN" part,
in case mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);
CEC_32K_PDN (BIT(19)) is set.

for exmaple:
CEC_32K_PDN is BIT(19)
PDN is BIT(16)
say tmp = 0xffffffff;

mask = PDN | CEC_32K_PDN;
val = 0 | CEC_32K_PDN;

tmp = fff6ffff, mask = 90000
val = 80000, tmp = fffeffff

u32 tmp = readl(cec->regs + offset) & ~mask; // tmp = fff6ffff
tmp |= val & mask; // tmp = fffeffff
writel(val, cec->regs + offset); // val = 80000, tmp = fffeffff

in both val and tmp case, CEC_32K_PDN is set.

>Anyway, if it's the right thing to do, we should add:
>
>Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")

I will add the Fixes tag, thanks.
