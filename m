Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C96B3B4C4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA1810EB61;
	Fri, 29 Aug 2025 07:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KGOt9k6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0495410EB61
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:53:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E72060051;
 Fri, 29 Aug 2025 07:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C5FC4CEF0;
 Fri, 29 Aug 2025 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756454018;
 bh=lGnjYgv5elXMwfPyxfMjkMn1zViVKrlNZ159H/ar7Us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KGOt9k6JGUZm/s/BiB2row7YwILB1Wv9QyejLhNWD2L1ohpPgQtX52KGXrGK1Trd1
 C+WV3xgYVoOVvrGKjrDxxZ9DXMIkAu9wg5pc/QWoZImosfpFINNXIfEHNb6MV4XxsL
 i3Jyh6T+vdnEi26V2a1CQlNksFjbyCgzEybK7NydCv2Rx+TIIf/7jmqAUV0IsG9aX4
 DvejgTIDG3gV8I+89DKvFjUK4wZpQkcdhWOiNKs1H+riOkIzIUr47oY6TFWjYPvn2P
 jBzvaMohNV0D3/pWSGgdSgNpBScQbXwcZWfPMpzV/xrKX9/RXAPIkp6KoeZe6p29oR
 h1Ka89zJ+O5PA==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1urtvL-000000000g6-3mNQ;
 Fri, 29 Aug 2025 09:53:27 +0200
Date: Fri, 29 Aug 2025 09:53:27 +0200
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
Message-ID: <aLFcd1ZLr0HUm-CM@hovoldconsulting.com>
References: <20250722092722.425-1-johan@kernel.org>
 <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
 <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
 <aLFbcznLUutbMo6r@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLFbcznLUutbMo6r@hovoldconsulting.com>
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

On Fri, Aug 29, 2025 at 09:49:07AM +0200, Johan Hovold wrote:
> On Fri, Aug 29, 2025 at 07:51:23AM +0800, Chun-Kuang Hu wrote:
> > Johan Hovold <johan@kernel.org> 於 2025年8月27日 週三 下午5:51寫道：
> 
> > > On Tue, Jul 22, 2025 at 11:27:22AM +0200, Johan Hovold wrote:
> > > > Make sure to drop the references to the sibling platform devices and
> > > > their child drm devices taken by of_find_device_by_node() and
> > > > device_find_child() when initialising the driver data during bind().
> > > >
> > > > Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> > > > Cc: stable@vger.kernel.org    # 6.4
> > > > Cc: Nancy.Lin <nancy.lin@mediatek.com>
> > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > >
> > > Can this one be picked up?
> > 
> > Ma Ke has sent a similar patch [1] before you. And that patch fix more things.
> > I've already pick up the final version [2].
> > 
> > [1] https://patchwork.kernel.org/project/dri-devel/patch/20250718033226.3390054-1-make24@iscas.ac.cn/
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-fixes-20250825&id=1f403699c40f0806a707a9a6eed3b8904224021a
> 
> I'm afraid that patch is completely broken and introduces a potential
> use-after-free by adding a bogus decrement of the OF node refcount.
> 
> I suggest you drop that one and pick up mine instead which is correct
> and cleaner.

I see now that that patch was included in a drm pull request for rc4.
I'll send an incremental fix instead.

Johan
