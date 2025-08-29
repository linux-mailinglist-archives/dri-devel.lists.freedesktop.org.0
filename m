Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E4AB3B4AE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89C810E125;
	Fri, 29 Aug 2025 07:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jh7eyiPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A6510E125
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:49:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1B2B343F96;
 Fri, 29 Aug 2025 07:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF26DC4CEF0;
 Fri, 29 Aug 2025 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756453758;
 bh=dF+v6pBPXAEvo6aOXOvywP1ufSrZor0h7MkaWLQK5dI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jh7eyiPa+eTuVCyVjfAOPherneBnYDfNTkkbV3vRkFZt+w3aJYb3ZgmwsHTGBeCV8
 9opq4JF0YiaNpyxxy4hJGoP0ArtNLmEfS3K2BNjPgFUWeJpngtBvF1sfX9P19pIC24
 q0Ji295VEt2zSosrb/wFyYW8l/S8w56yvuEsyiXH5Nvy6DgTYWEwvreqjwDTDotVaI
 +AJgHkhAiEKMcXw8F2FG2loRDBSqa5z8+sPBTJsKFkuOwQFMHyAMubkbs8lfyIqbEY
 m7lIpT/gqMkddw2gO5F2hbZLpSwVLCaLew3c61ViQFr3EVP2zo4r//rxrpYVVLQGwE
 p7tqkgo4TLyfA==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1urtr9-000000000Zj-07S0;
 Fri, 29 Aug 2025 09:49:07 +0200
Date: Fri, 29 Aug 2025 09:49:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: fix device leaks at bind
Message-ID: <aLFbcznLUutbMo6r@hovoldconsulting.com>
References: <20250722092722.425-1-johan@kernel.org>
 <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
 <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
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

On Fri, Aug 29, 2025 at 07:51:23AM +0800, Chun-Kuang Hu wrote:
> Johan Hovold <johan@kernel.org> 於 2025年8月27日 週三 下午5:51寫道：

> > On Tue, Jul 22, 2025 at 11:27:22AM +0200, Johan Hovold wrote:
> > > Make sure to drop the references to the sibling platform devices and
> > > their child drm devices taken by of_find_device_by_node() and
> > > device_find_child() when initialising the driver data during bind().
> > >
> > > Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> > > Cc: stable@vger.kernel.org    # 6.4
> > > Cc: Nancy.Lin <nancy.lin@mediatek.com>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> >
> > Can this one be picked up?
> 
> Ma Ke has sent a similar patch [1] before you. And that patch fix more things.
> I've already pick up the final version [2].
> 
> [1] https://patchwork.kernel.org/project/dri-devel/patch/20250718033226.3390054-1-make24@iscas.ac.cn/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-fixes-20250825&id=1f403699c40f0806a707a9a6eed3b8904224021a

I'm afraid that patch is completely broken and introduces a potential
use-after-free by adding a bogus decrement of the OF node refcount.

I suggest you drop that one and pick up mine instead which is correct
and cleaner.

Johan
