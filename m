Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5922E25479C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 16:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389A86E1B9;
	Thu, 27 Aug 2020 14:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC166E1B9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 14:52:20 +0000 (UTC)
Date: Thu, 27 Aug 2020 14:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1598539937;
 bh=yE3GsZ9y/3e4AfJhkux+xTs/8FeXnCPJxbneuzKe2ss=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=SxZqeJxI8EU0Yvda+Tk1Iy7j1b4cDNLCzY6tNk5UrElCIry8+0vNTfFqej5zyXR1S
 tm4O+7uOCQeYweD2KzDhqQculZDXGkgqREJDSzI9buvDy7jDFoWVfvaRR3knMJA0H5
 SnXa/DxgLg3Ie6NQybMJCzTKBMEAhUS5rkqaUdqBPtanvuzff1w/FpG7WPbAT5lkBj
 M0zhYsYIjqTLKcvGzxmNPwwf0IUNzt5d1Aag4Znl2yb2T8A2QoJOU4z0i6eqDetMT9
 lNXf1nfGM4rj6d7NhktMGt6WPrOdksmjSn1wXF8tU/HByBBTskirvZMhJCDpZxaGYQ
 KBVdFAykbJPUg==
To: Ezequiel Garcia <ezequiel@collabora.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
Message-ID: <RYac-UwqFncGmZCWk713lK86adAOfMQbeT6CF15dhr1H3o-P-_tXJcwNYxM5LYqddtYe7Y7VEmbSrDe5ixtIqtHmxMkH1FfulkO4VppXGKA=@emersion.fr>
In-Reply-To: <746a0bb75bd8388a30b53a5ddc56fb24aea308a8.camel@collabora.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
 <c2450755-91fd-da72-bf1e-c015ad9d6b25@nvidia.com>
 <746a0bb75bd8388a30b53a5ddc56fb24aea308a8.camel@collabora.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Robert Beckett <bob.beckett@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 James Jones <jajones@nvidia.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Andrew F . Davis" <afd@ti.com>, Daniel Stone <daniels@collabora.com>,
 "nd@arm.com" <nd@arm.com>, Laura Abbott <labbott@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, August 20, 2020 10:15 AM, Ezequiel Garcia <ezequiel@collabora.com> wrote:

> > I'm rather interested on where this goes, as I was toying with using
> > some sort of heap ID as a basis for a "device-local" constraint in the
> > memory constraints proposals Simon and I will be discussing at XDC this
> > year. It would be rather elegant if there was one type of heap ID used
> > universally throughout the kernel that could provide a unique handle for
> > the shared system memory heap(s), as well as accelerator-local heaps on
> > fancy NICs, GPUs, NN accelerators, capture devices, etc. so apps could
> > negotiate a location among themselves. This patch seems to be a step
> > towards that in a way, but I agree it would be counterproductive if a
> > bunch of devices that were using the same underlying system memory ended
> > up each getting their own heap ID just because they used some SW
> > framework that worked that way.
> > Would appreciate it if you could send along a pointer to your BoF if it
> > happens!
>
> Here is it:
>
> https://linuxplumbersconf.org/event/7/contributions/818/
>
> It would be great to see you there and discuss this,
> given I was hoping we could talk about how to meet a
> userspace allocator library expectations as well.

Unfortunately there's no livestream for BoFs. Would be very interested
in having a summary of the discussions once the BoF is over!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
