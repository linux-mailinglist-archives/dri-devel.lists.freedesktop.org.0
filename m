Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4D82DFA30
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 09:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B936E461;
	Mon, 21 Dec 2020 08:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3E16E461
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 08:54:05 +0000 (UTC)
Date: Mon, 21 Dec 2020 08:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1608540842;
 bh=VVBq5kEMeWXSfE2fNOxez/ovFm1GKzPzNKtAMGYpYn0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=WdyCTV/95g6te02oIf8Uq6IP0olpfGsj78DsjpCpOh+NZ0yulqoAFBiikwfckDFwP
 kpt9OfvJ7KA9ru5mMKl85EudU4R9NSrWxXCAMZKrMfEnSW3//WFxf1iBH9qMxk/Jgl
 AWpLs34AKTppCHJYaJjhxxmRuDuF33gotAhjXHy6cMscknvu9e4oRNR03HiJ/Sqttm
 6SAZgbSSXYpFssnlA6yzeOqsdx8067j7OqelVJAyuDaX6xq5OWWg1EhMG4phPnRlgD
 a0KuUmPVEgKoFAk1DKLjeNKVrOKBkhmByGOCyboUnFfFVd6Wk7Mn1g0hIe/1/bKmQ0
 8czccoVVrotqQ==
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/4] drm: rcar-du: Add cubic LUT support
Message-ID: <jcjTLLVHB6YkIMnDrAcghTdaSTrg30wbACbWLZXS50UBUzb5_X0o7dAlR-KzGhVkxfPyW4AuRm05z8miKa6V6gzToI9BYxWpDp1RKb7ZXnk=@emersion.fr>
In-Reply-To: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Monday, December 21st, 2020 at 2:57 AM, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:

> I started having a look at userspace to see how this could be handled,
> searching for color management support in weston, kwin and wlroots/sway.
> All three support setting the gamma table when using the DRM/KMS
> backend, weston and kwin through the legacy API, and wlroots through the
> atomic API. Weston reads an ICC profile using Little CMS and applies the
> gamma table. kwin is a bit more elaborate, it also uses Little CMS to
> read an ICC profile, but additionally supports setting the brightness
> and color temperature. It however only sets a gamma table in the end.
> Wlroots seems to have an API to set the gamma table, but I haven't seen
> where sway uses it (I may have missed that though)

wlroots delegates setting the gamma table to a privileged client, to allow
users to set it to whatever they want. Use-cases include setting the color
temperature and setting the brightness. wlroots doesn't support ICC profiles
(and I don't know of a client setting the gamma LUT from an ICC profile).

> In any case, there's limited support there for color management.

That's correct.

> Inputs would be appreciated on this, for instance with feedback on how
> X.org and Android handle color management, on how 3D LUTs are
> implemented on other platforms, or in general on how we would like to
> use them. I don't mind doing some work in userspace to prototype this,
> but I won't have the bandwidth to design a completely new framework.

Weston is working on improving color management support [1] [2]. I think it's
still a little early, but maybe see with Pekka if something can be worked out?

Other than that, maybe some media players have support for some color
management and would need to blend in multiple buffers and standardize
protocols. Maybe look into Kodi or mpv?

Simon

[1]: https://www.collabora.com/news-and-blog/blog/2020/11/19/developing-wayland-color-management-and-high-dynamic-range/
[2]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/14
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
