Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E24482F10
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 09:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF1710E1C3;
	Mon,  3 Jan 2022 08:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F3189444
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jan 2022 23:46:41 +0000 (UTC)
X-UUID: e16f94d125c744a79ed82d7091faa024-20220103
X-UUID: e16f94d125c744a79ed82d7091faa024-20220103
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1794068794; Mon, 03 Jan 2022 07:46:36 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Jan 2022 07:46:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 3 Jan 2022 07:46:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Jan 2022 07:46:34 +0800
From: <miles.chen@mediatek.com>
To: <matthias.bgg@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Jie Qiu <jie.qiu@mediatek.com>,
 "Junzhi Zhao" <junzhi.zhao@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3] drm/mediatek: Fix unused-but-set variable warning
Date: Mon, 3 Jan 2022 07:46:32 +0800
Message-ID: <20220102234633.31709-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
References: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Mon, 03 Jan 2022 08:39:57 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 miles.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I'm still not happy with the commit subject, I think it is misleading. Clang 
> only helped to find the bug, but the we are fixing something else, that's not 
> just a clang warning. But I don't want to nit-pick too much so:
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

thanks. I think you are right.
I will change the subject to "drm/mediatek: Fix mtk_cec_mask()", remove the 
clang part and submit patch v4.

e.g,
"""
drm/mediatek: Fix mtk_cec_mask()

In current implementation, mtk_cec_mask() writes val into target register
and ignores the mask. After talking to our hdmi experts, mtk_cec_mask()
should read a register, clean only mask bits, and update (val | mask) bits
to the register.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
"""
