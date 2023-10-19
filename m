Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A7D7CF21B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 10:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F0710E49B;
	Thu, 19 Oct 2023 08:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE1110E49B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 08:11:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 05F81CE0F7F;
 Thu, 19 Oct 2023 08:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D7CC433C8;
 Thu, 19 Oct 2023 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697703105;
 bh=ISQsf0Hn5tal6+77OQ0DmTsebpQ1g3nMnle8JLPADPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oqO8lOm74cmnzq+OWrD9AMGREsPV+8MBVKSTfr1B2ccFnxaCmZ5wXZdC11EFXcvhO
 DkEiQDADKHYXCi/xXYYwFiXsmTCnJT7kE+3iSwSk6hnelMY26G7SKDtvdnOPtsZr/M
 fwVxJCkykP6Pt93qUvm6bbV5pd7IkeeCFYukdfnUmYyRghPrBdP9Oi5oiXBfyWQVEJ
 Ey80Zi61usSxAAOq8PtCuS/o5Fr5D/AqYJd3JESRBB1PQzXW7l7e9lQSfrG5C9zueb
 WrmgWyZqi2lc39IFelf4UwzIlGu5fzF+55HeCI1Sl4yL73AfiFAQ24Av32Ep9xvmIg
 5+8K7yo3cYBUQ==
Date: Thu, 19 Oct 2023 10:11:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] drm/loongson: Add support for the DC in LS2K1000 SoC
Message-ID: <76nxdwa6m7qyqvala4akc2rptuylhrqyoz2x5rjua4hppoxk7x@wwn37gwuvrms>
References: <20231011162638.819080-1-suijingfeng@loongson.cn>
 <26565c5e13e72c64214a7f67ab6f2d9d876fa4bd.camel@icenowy.me>
 <037ec619-c170-4ca6-897e-04fccd58c62a@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <037ec619-c170-4ca6-897e-04fccd58c62a@loongson.cn>
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
Cc: Icenowy Zheng <uwu@icenowy.me>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 06:28:01PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> 
> On 2023/10/13 16:22, Icenowy Zheng wrote:
> > 在 2023-10-12星期四的 00:26 +0800，Sui Jingfeng写道：
> > > LS2K1000 is a low end SoC (two core 1.0gHz), it don't has dedicated
> > > VRAM.
> > > It requires the framebuffer to be phisically continguous to scanout.
> > > The
> > > display controller in LS2K1000 don't has built-in GPIO hardware, the
> > > structure (register bit field) of its pixel, DC, GPU, DDR PLL are
> > > also
> > > defferent from other model. But for the display controller itself,
> > > Most of
> > > hardware features of it are same with ls7a1000.
> > > 
> > > Below is a simple dts for it.
> > Why don't you write a proper, YAML-formatted binding?
> > 
> This patch use only one DT property, that is the "memory-region = <&display_reserved>;".
> But the memory-region property is a common property, I means that everyone know how to
> use this property. I'm not sure the if YAML documentation is strictly required now.

AFAIK it is, and even if it's not, please do it.

Maxime
