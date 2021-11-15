Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A88450101
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138346E8DE;
	Mon, 15 Nov 2021 09:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C48C6E8DA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 09:18:45 +0000 (UTC)
Date: Mon, 15 Nov 2021 09:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636967923;
 bh=EoE7RHFJBMlvl0n4GXcfZkyRQUOmMQWvotMn+wOm3xg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=kidM8xE1ir913MXraYBZF18s8ha6S+WdACpJ8NVdkpHedBIb5u9PU7n2QBJkdeyDN
 5gQy0PevNP/hieWAHgUPQXLV/O3s9Wklll2e43sIBw7xAlWvYZ+nCnv5AtJl8mTp25
 9B1sd1MqMeN9cJc+SV8Hf9so40Vpy9q2O3Gso86cbBakjzQlQZo4ITa/UAx4lKhYa8
 rAb6FijZ0blqsyy9+B5+obveX81dq+fYQamE3jTV8LImB7L2GoXFyDmhA4nTtADZhJ
 zBC5cqZBVRvdxg3RpE9vwr43SG0C83fu4BZGMamZbEV9D7eQPT5CNm/3vedZVXqVQR
 og0gTsZTKaF+w==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: pre-fill getfb2 modifier array with INVALID
Message-ID: <D-6FSEcdyTRAZxrnW6mcb0iOVY3NfKMbT8WS7-f9Wn4i9jQ0YbmInyMwZRwb_aLzPvUSWz_KPs34RQ1tkCb3xuISVkTyjkmV5aMfGcdkQl8=@emersion.fr>
In-Reply-To: <YY0RjSE7mI4kkKNJ@intel.com>
References: <20211111101049.269349-1-contact@emersion.fr>
 <YY0RjSE7mI4kkKNJ@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 11th, 2021 at 13:50, Ville Syrj=C3=A4l=C3=A4 <ville.s=
yrjala@linux.intel.com> wrote:

> On Thu, Nov 11, 2021 at 10:10:54AM +0000, Simon Ser wrote:
> > User-space shouldn't look up the modifier array when the modifier
> > flag is missing, but at the moment no docs make this clear (working
> > on it). Right now the modifier array is pre-filled with zeroes, aka.
> > LINEAR. Instead, pre-fill with INVALID to avoid footguns.
> >
> > This is a uAPI change, but OTOH any user-space which looks up the
> > modifier array without checking the flag is broken already, so
> > should be fine.
> >
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Daniel Stone <daniels@collabora.com>
>
> Isn't this going to break the test where we pass the get
> getfb2 result back into addfb2?

Shouldn't be the case, since the kernel will ignore modifiers if the
flag isn't set.
