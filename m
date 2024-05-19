Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ABF8C93C9
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 09:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C61310E106;
	Sun, 19 May 2024 07:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2MiSyS1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C7910E106
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 07:59:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3104B60E03;
 Sun, 19 May 2024 07:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55ABBC32782;
 Sun, 19 May 2024 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1716105590;
 bh=Js533fXv07i00ZGY091MEl3ChJe/lib4LdV6Kq4wzIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2MiSyS1OlozoQwxwtUwkCDqKXeCND4CH0dDYQqbT7fJjK9ZxDKBMY48MPbW/6vxpn
 ygZInnvC/+G/4ZA+IgCXOjN7J2ygMwgEPCNmjB+XuAAcpwvRpTRiKebKSupn00Qf8H
 uExc4kDcBAuzTOxuMi94XAcCZ+E+w+nc3kdm+Q7c=
Date: Sun, 19 May 2024 09:59:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Val Packett <val@packett.cool>
Cc: stable@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: vop: clear DMA stop bit on flush on
 RK3066
Message-ID: <2024051936-cosmetics-seismic-9fea@gregkh>
References: <20240519074019.10424-1-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519074019.10424-1-val@packett.cool>
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

On Sun, May 19, 2024 at 04:31:31AM -0300, Val Packett wrote:
> On the RK3066, there is a bit that must be cleared on flush, otherwise
> we do not get display output (at least for RGB).
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Cc: stable@vger.kernel.org
> ---
> Hi! This was required to get display working on an old RK3066 tablet,
> along with the next tiny patch in the series enabling the RGB output.
> 
> I have spent quite a lot of time banging my head against the wall debugging
> that display (especially since at the same time a scaler chip is used for
> LVDS encoding), but finally adding debug prints showed that RK3066_SYS_CTRL0
> ended up being reset to all-zero after being written correctly upon init.
> Looking at the register definitions in the vendor driver revealed that the
> reason was pretty self-explanatory: "dma_stop".

What commit id does this fix?

thanks,

greg k-h
