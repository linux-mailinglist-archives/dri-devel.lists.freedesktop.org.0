Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295882936EF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 10:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9406EC33;
	Tue, 20 Oct 2020 08:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F015A6EC33
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 08:43:00 +0000 (UTC)
Date: Tue, 20 Oct 2020 08:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603183378;
 bh=9BYpRkf+vwmyb1yZKY32Si3JHd3E4WWxP27TCGenO1s=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ceCuwUVlyb++f6gifYgEvjf+Cuxfr0AovUUWcsrovFXyMSSyi9mDTr0Dg9GtZDRbu
 axQ+/o1CRFICcTmni/wp94PtgfX8vmqdX+iji23dkiHASljD0HNbjsPnKaAy0m3V7P
 XwLTJd70PWGRA2pJqygXkg+JYrYwFRovXQCvvHeQEq6OKzdwGKYexHbsGQHZTl5Au9
 tJsrQkGDwiyPSZFg/7uuR9XfgjIaQfTzi+Iakm6xvrAV5ntCD7lNUJbCC5DXW2NqZu
 SMubtCT8AemaqTeLetezEFataohHWAMbXPhLc036fb29y4aqs+NzqAcyxsR3k64mTW
 SaEL7K8MCX+Uw==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: Unset preferred_depth
Message-ID: <5_L8l-WaP_G-dKhj-3faf3hfwf4NKYHFhWtINHAgEOO4MnUXgYyCb5NBZy8UXuaOdfneiMbyOhKO83bgBb2YZw2IwRgg5qy6-lffHJunRuw=@emersion.fr>
In-Reply-To: <20201020083515.941832-1-daniel.vetter@ffwll.ch>
References: <20201020083515.941832-1-daniel.vetter@ffwll.ch>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 20, 2020 10:35 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> There's a confusion between the preferred_depth uapi and the generic
> fbdev helpers. Former wants depth, latter wants bpp, and for XRGB8888
> they don't match. Which hit me with vkms, which wants that.
>
> All other drivers setting this and using the generic fbdev helpers use
> 16, where both numbers match, for RGB565.

Not quite: grepping reveals a majority of 24 (as shown in drmdb). A few
drivers set 16 (udl, cirrus), and hisilicon sets 32.

> Since fixing this is a bit involved (I think for atomic drivers we
> should just compute this all internally from the format list of the
> first primary plane) paper over the issue in vkms by using defaults
> everywhere. Then userspace will pick XRGB8888, and fbdev helpers will
> do the same, and we have what we want.
>
> Reported-by: Simon Ser contact@emersion.fr
> Cc: Simon Ser contact@emersion.fr
> Signed-off-by: Daniel Vetter daniel.vetter@intel.com
> Cc: Rodrigo Siqueira rodrigosiqueiramelo@gmail.com
> Cc: Melissa Wen melissa.srw@gmail.com
> Cc: Haneen Mohammed hamohammed.sa@gmail.com
> Cc: Daniel Vetter daniel@ffwll.ch

With the commit message clarified:

Reviewed-by: Simon Ser <contact@emersion.fr>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
