Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D45636D378
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 09:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F7C89B3C;
	Wed, 28 Apr 2021 07:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFAE6EAB9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 07:52:09 +0000 (UTC)
Date: Wed, 28 Apr 2021 07:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619596327;
 bh=efd/2nn9ykE/rbPAWbcfex33rlDnAX44J757KgUg47M=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dko6gBZ2sgL3sZfOY3vbm8MCllPGoxrR5L2WYnyXeBrIRg0qPjcjlDEmUwCaUbmKO
 jc7LEsRfVz7ozRiWYf7j4WGhzTwscrQlSytvG1cMBw964jnHxnrKTpe+vdKlAPKE1n
 +xqQxG1FZx7IN0RFuQ+/EU+h24bpDP4VMCX8mSwMpi4FK/SyP3LzjSvyon4EENeVoE
 JsAsEQ1LEa0/8nGko6p5zHMls2wpH82PbmY9BkrLL9BUZy+Eo+uURmkjSZfU3OFzP0
 nyuGO/yMkUcy4gfsfY305afF0rdkVE6ztxma2J7iStkc4BNbP+7VaYoy4wV6luq+RG
 4g63+dO737g3w==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Display notch support
Message-ID: <4AcLdwoiXpy0XDf-LLiXa4Fp-hDWyOm_tWMyu1nXKkg_dbDkviKcCJ-FUPJkQkiGhTFBXFlD5TFbBUyXAt0N1l548JDrrYwYkMM3eN78tlM=@emersion.fr>
In-Reply-To: <20210428104403.1e49f270@eldfell>
References: <f8747f99-0695-5be0-841f-4f72ba5d5da3@connolly.tech>
 <ck2MR5NpcE5l0NZuJnX7O7DLXBGxiFr_1LCqlDlsC0GNC3PEtTEcx1-vfIp8ZLyMhfxmv4_MyGaYBjZBawdTaWzButF0qkbdc-9EYhVFZYk=@emersion.fr>
 <20210428104403.1e49f270@eldfell>
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
Cc: martijn@brixit.nl, Caleb Connolly <caleb@connolly.tech>,
 dri-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, April 28th, 2021 at 9:44 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> I'm kind of worried whether you can design a description structure that
> would be good for a long time. That list already looks quite
> complicated. Add also watch-like devices with circular displays.
>
> Would the kernel itself use this information at all?

fbcon might want to letter-box its output to make sure it's not
obscured behind a cut-out area.

> If not, is there not a policy that DT is not a userspace configuration
> store?
>
> You mentioned the panel orientation property, but that is used by the
> kernel for fbcon or something, is it not? Maybe as the default value
> for the CRTC rotation property which actually turns the image?

I wonder if fbcon uses it at all. In general CRTC rotation is not
well-supported by HW drivers, at least for linear buffers. CRTC
rotation is just an optimization.

> Assuming that you succeed in describing these non-usable, funny
> (waterfall edge), funny2 (e.g. behind a shade or filter so visible but
> not normal), funny3 (e.g. phone button area with maybe tactile
> markings), and normal areas, how would userspace handle this
> information?
>
> Funny2 and funny3 are hypothetical but maybe not too far-fetched.
>
> Is there any provision for generic userspace to handle this generically?

I think the main use-case here is make sure there's nothing important
being cut out on screen. I agree we still don't know how the hw will
evolve and might design an API which is too restricted. But building
something that ends up too complicated and too generic wouldn't be
great either.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
