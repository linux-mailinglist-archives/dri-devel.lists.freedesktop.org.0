Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5462D4617
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453226EABC;
	Wed,  9 Dec 2020 15:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27256EABC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:58:29 +0000 (UTC)
Date: Wed, 09 Dec 2020 15:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607529507;
 bh=qLR9SkPpz73rL9EfKDZrXbG74Osd7N00sMLoXuph/T0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Aw9VbS0Ecr7OOavtJyaXF+pYXhaeL/9Zc7NgokV1gol+mzYx4adxTgBaP1x38Yr9C
 mYeJEifgeBIixyDiA6+OUpYtJSZMnJ35bTmOrALEnMPN/MFiv/EMlJjC6K21gJa9VA
 L5EIkkreqHjQvcdX/YUV1dJyApX7NjwjWfIQoMEbUasB+WdeMzas3Coy7qAUmOWtz7
 kDlNAl/j+gSE42oeOQ0IVLPeCvVPDHa7nBnM+GFXcICwfvHTTxqAoIV/iZCWQNU8ms
 D/fTuPd4Ho4qqMWOGUD/1F73aqzXNc0HQ8msHEQiPtQZGPnleENdu5lEAnAV7ZAxg3
 OzVoDQ4g7CvJg==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
In-Reply-To: <20201209004223.GL401619@phenom.ffwll.local>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the review!

On Wednesday, December 9th, 2020 at 1:42 AM, Daniel Vetter <daniel@ffwll.ch> wrote:

> I think maybe a follow up patch should document how userspace should
> figure out how to line up the primary planes with the right crtcs (if it
> wishes to know that information, it's not super useful aside from probably
> good choice for a fullscreen fallback plane). See my reply on the old
> thread.

Yeah, as I've already replied, I won't volunteer to document legacy bits,
documenting atomic is already enough. :P

> And that patch should also add the code to drm_mode_config_validate() to
> validate the possible_crtc masks for these. Something like
>
> 	num_primary = 0; num_cursor = 0;
>
> 	for_each_plane(plane) {
> 		if (plane->type == primary) {
> 			WARN_ON(!(plane->possible_crtcs & BIT(num_primary)));
> 			num_primary++;
> 		}
>
> 		/* same for cursor */
> 	}
>
> 	WARN_ON(num_primary != dev->mode_config.num_crtcs);
> }

Thanks for the suggestion. However I don't see why a driver should ensure
this. Isn't it perfectly fine for a driver to use primary plane 2 for CRTC 1,
and primary plane 1 for CRTC 2, for the purposes of legacy uAPI?

If we're trying here to invent a new uAPI to let user-space discover the
internal legacy primary/cursor pointers, I'm not signing up for this. The
requirement you're describing seems like something current drivers ensure
"by chance", not an established uAPI. In other words, writing a new driver
that doesn't do the same wouldn't break uAPI contracts.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
