Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F21A19A5E0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D4B6E8F2;
	Wed,  1 Apr 2020 07:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1BC9D6E8CA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 02:25:26 +0000 (UTC)
X-UUID: 88d619244fdd4ff5bc346702305f340f-20200401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EVfDkcSg67rWMGV0bZzmWDij5Lm1irRxXDFbaSycSd8=; 
 b=eO/MFYa00Q6WgesBbYWNB5OWpjs0CKgLw5n4bvRtbIpchNoyCqDPKhmqzQ0iDZTwGHWIZ9pdKozf4dB5tNHIzLYwbqtU05c6ZkNurOxGr+hT3A2ns9TFKebVss5l47u8EUgFHSE16YdNEKCemeh4SimYzVdh4wTDZRJBoFpTQH8=;
X-UUID: 88d619244fdd4ff5bc346702305f340f-20200401
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1947929388; Wed, 01 Apr 2020 10:20:21 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 1 Apr 2020 10:20:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 1 Apr 2020 10:20:17 +0800
Message-ID: <1585707625.28859.23.camel@mhfsdcap03>
Subject: Re: [PATCH v3 2/4] drm/mediatek: Separate mtk_hdmi_phy to an
 independent module
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 1 Apr 2020 10:20:25 +0800
In-Reply-To: <20200331155728.18032-3-chunkuang.hu@kernel.org>
References: <20200331155728.18032-1-chunkuang.hu@kernel.org>
 <20200331155728.18032-3-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 01 Apr 2020 07:03:42 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-03-31 at 23:57 +0800, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> mtk_hdmi_phy is a part of mtk_hdmi module, but phy driver should be an
> independent module rather than be part of drm module, so separate the phy
> driver to an independent module.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/Kconfig        |  9 ++++++++-
>  drivers/gpu/drm/mediatek/Makefile       | 11 +++++++----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c     |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.h     |  1 -
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.c |  1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.h |  1 -
>  6 files changed, 17 insertions(+), 8 deletions(-)
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
