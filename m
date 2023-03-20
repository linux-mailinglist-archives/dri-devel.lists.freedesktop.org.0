Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE2C6C0C17
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 09:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7A810E25C;
	Mon, 20 Mar 2023 08:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CD610E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 08:22:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43482B80D7D;
 Mon, 20 Mar 2023 08:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B6EC433D2;
 Mon, 20 Mar 2023 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679300543;
 bh=Doe1j/uXAracamn2Mysv5svXt7LOcVO7jSrIu0ukLWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WmMbgKxhrvLdrQUMb3RD/I0nM4GvhQVW1byr/VWg0euMi9rxIqLW3Qycuvn6IZ3UV
 JY52pcJkVJATODOjATOqsFAT20TpQOrsWDw9B/nnRUJkSRTJ0Ce96DZjF3rwTJ9cRY
 tcfYSBRQVR6GMsW5oym8He1ypbx7l0MKYPtvutvATIcmjyRdxZIeOXdVS2sfmP4y9h
 9eX5P22Ti3vmMUEDfHvpHFoPznkdmNZfIrUr7ue1clJfZjNcFsdNCQVxuq7W5PNbA9
 UYjoY/Jzb8k3my7QeCfJG4nZa2LH5IlO32zxH3RsaRKpJ47YXULfXV2LtrjRStQUk4
 rWJhVEGfnk8kw==
Date: Mon, 20 Mar 2023 08:22:17 +0000
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 07/37] drm/mediatek/mtk_disp_aal: Remove half completed
 incorrect struct header
Message-ID: <20230320082217.GK9667@google.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-8-lee@kernel.org>
 <5dbee8ef-a5eb-b73d-5336-8b5c879a0d2a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dbee8ef-a5eb-b73d-5336-8b5c879a0d2a@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Mar 2023, AngeloGioacchino Del Regno wrote:

> Il 17/03/23 09:16, Lee Jones ha scritto:
> > Fixes the following W=1 kernel build warning(s):
> >
> >   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'clk' not described in 'mtk_disp_aal'
> >   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'regs' not described in 'mtk_disp_aal'
> >   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_aal'
> >   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'data' not described in 'mtk_disp_aal'
> >
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-mediatek@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Lee Jones <lee@kernel.org>
>
> I'd add the missing documentation instead.
>
> Please give some time, either me or someone else will do that ASAP.

Even better.  Thank you.

--
Lee Jones [李琼斯]
