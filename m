Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBF51A9AF9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 12:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005186E95D;
	Wed, 15 Apr 2020 10:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FC36E95D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:40:49 +0000 (UTC)
Date: Wed, 15 Apr 2020 10:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1586947246;
 bh=Y5i578LpdIY3vH2AoZVH/yXdMbnKEdQ9328hzedvUnk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=c8U1whDEX7IynfzwRJfk42m8Bn9opxCtzEYmNl2jJe9hmP6BRHL7pCpt9RsXfBwFq
 mYDMTXhWSdgY934hrGsRJuM28oyPPiQE67Bq0i24NplQ6rnK4Lu6Rg73VhxUtM/Gk1
 misDrewrht2igxc1dpmEx5hlFuh+/ZJqki/t2/sw=
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: KMS enums and bitfields UAPI
Message-ID: <nsJj9jOaea1lsr2WyN7m7luf0Xbiu1RQCCSVq04M1NGy7Co9yO2mUvciYJjVC69xOUz5ceiRJBpY7NwkftIJorA-GfOf01r42bVIr9LX6B8=@emersion.fr>
In-Reply-To: <CAKMK7uH+xY4DroWyB6J4+M8rZrNACDde8sbFAO1dFFWvR146kA@mail.gmail.com>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <u5X6K68v0waX25yZHLng0H_WDIFjNU-MgmnbLCoBZN7bqys3ofRm203wrYKdMnR1f4CStz3q5a12Y0ou8lCZWNMuhRmCCZ1dkTCSuDZjdy4=@emersion.fr>
 <20200414122402.GS3456981@phenom.ffwll.local>
 <gpwDGBjR8hMLhneuVUgofPTRR5r79EHlaSULKoTmIvavvl52qCQS7bXfqihSRC_ABzsDO1xmG0GSbU1d6DPanLEfW0IcsCBqbN0SFvd7gv4=@emersion.fr>
 <20200414123945.GU3456981@phenom.ffwll.local>
 <sxighAwzjE_uFWBRdafDj7J1HgLR_yV0SwWQKMpqZGgD1p0yaeeRvmw9rOUCLEMXoARE99aAm5YSGENfTsA3PK9qADKweKPeE6uGguhxpLU=@emersion.fr>
 <CAKMK7uH+xY4DroWyB6J4+M8rZrNACDde8sbFAO1dFFWvR146kA@mail.gmail.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, April 14, 2020 3:33 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> > What I'm suggesting isn't to make all enum values UAPI. I'm suggesting
> > to add standard enum values as #defines in the UAPI headers to make
> > these values UAPI. Non-standard properties wouldn't be in the UAPI
> > headers, so user-space would need to query values from KMS just like
> > they do now.
>
> Hm that sounds like the half-way that wont work. Because then some
> compositors will only use the hard-coded versions, and if they don't
> have them, nag us to add them. And then be really disappointed if we
> don't (or we screw up and add them where we shouldn't). That's the
> status quo "let's have it both ways" that I think is the worst of all
> options we have. So I guess from that pov the "userspace needs to
> decode from symbolic values, always" as the only consistent one.

Fair enough. Let's just continue using symbolic names then.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
