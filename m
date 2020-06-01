Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846C1EA219
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 12:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C166E239;
	Mon,  1 Jun 2020 10:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461906E22E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 10:46:08 +0000 (UTC)
Date: Mon, 01 Jun 2020 10:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591008366;
 bh=PBCc2pZT0H9oKyY8I7pSPHNsIyXHa0cxWyiwTf8D8nA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=2Y0hE/BbgTaKv2hdStlxzeZv2b9zGfuQjNB7hU+0ZDmoQ/jwBm1Cpt/ppjx1QibEk
 EqMtpMSlBMIphNf7666xJuq8HlOnQ66v1wdG/4ypNPpa5d7kvu9OMEXvj7SMfBZP2m
 86cfgVYOFi4zYyPv1yo5FVYCLcsHFtcuiEnR9i1A=
To: Brian Starkey <brian.starkey@arm.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fourcc: document modifier uniqueness requirements
Message-ID: <azEdXTeJu5QQIJF0dXIuznwZbabQuntDRCvt_YhcF7zjCzSTDpjj6HBNUrFlaMaArHXEkfeOGaUQvMxmjpE1hRLToQyvZ81QhEfAF6Eqy_E=@emersion.fr>
In-Reply-To: <20200601103554.25geaqbevnn7256t@DESKTOP-E1NTVVP.localdomain>
References: <oiOTNO-CVtaRiMyv-cHHP3CGvE4-9eSZRMmmdzXMb56vWw6CppnmT95NRUStbuV_RJLF-G_7usijW0kXKm64IuTJK9g49DycnAuE80yGlyo=@emersion.fr>
 <20200527085534.GP206103@phenom.ffwll.local>
 <20200601103554.25geaqbevnn7256t@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nd@arm.com" <nd@arm.com>,
 =?UTF-8?Q?Marek_Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > + * Users see modifiers as opaque tokens they can check for equality and
> > > + * intersect. Users musn't need to know to reason about the modifier value
> > > + * (i.e. users are not expected to extract information out of the modifier).
> > > + *
>
> Doesn't this conflict with "implicit minimal requirements" above?

Ah, when I wrote "users", I meant "non-driver users": programs like
compositors and user-space applications. Of course kernel and user-space
drivers can extract information out of the modifiers. Is this why there's some
confusion here?

> Certainly for a bunch of different AFBC modifiers, the allocator would
> need to understand some fields in order to properly align-up the
> buffer size.

It's probably a little early to speculate on the future allocator design. For
instance, instead of having a monolithic allocator, the kernel driver (and
other buffer consumers) could advertise a list of constraints for each
format/modifier. That way no-one would need to extract information out of
modifiers to figure out alignment (but maybe drivers would still want to, to
reject bad imports for instance). But again, I'm just throwing ideas around at
this point.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
