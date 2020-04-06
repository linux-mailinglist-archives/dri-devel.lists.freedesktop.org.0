Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BFC19F759
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 15:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127F56E3D2;
	Mon,  6 Apr 2020 13:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168056E3D2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 13:56:09 +0000 (UTC)
Date: Mon, 06 Apr 2020 13:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1586181366;
 bh=15b9i7Eg35lOJtBnob1oN9rG3SdykN7WVVb7WoVfk/I=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=vSB+gjwpjlVp8xflREAFWiI+1jRsbwIdb7P5QG3lIjXYtqe583XjCg6RONZAumuEu
 jKGNn2A9y7z7AsTJK9vhoPjciZG+37TILsZLBUCdhxfQhpbNLmAhfu8sP8PQ2fruh7
 9/VM0iaMiA/GqqlXEx/1jf2ykYGmhKMxgCLGKLu8=
To: Adam Jackson <ajax@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: KMS enums and bitfields UAPI
Message-ID: <G41nsxuBP_ORKAlUmI_yhKgy2gkpAcSCkgFxkKJHZHw_kNriTr_GyW_BdyOTQilSzqnOKzHmExJQ0kwOVdV0JxEP_BJjWlfkXsNywlXqPnM=@emersion.fr>
In-Reply-To: <2697346934286018187cda5c2f3d9b359c381aab.camel@redhat.com>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <20200403152400.55fe5eac@eldfell.localdomain>
 <2697346934286018187cda5c2f3d9b359c381aab.camel@redhat.com>
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

On Friday, April 3, 2020 4:23 PM, Adam Jackson <ajax@redhat.com> wrote:

> On Fri, 2020-04-03 at 15:24 +0300, Pekka Paalanen wrote:
>
> > On Fri, 03 Apr 2020 10:15:21 +0000 Simon Ser contact@emersion.fr wrote:
> >
> > > Additionally, I've heard Pekka saying that it would be nice to have constants
> > > for property names in the UAPI headers. Indeed, this would prevent
> > > hard-to-debug typo issues. I have a very good example of such a typo issue that
> > > took literally hours to debug, with X11 atoms which also use free-form strings
> > > like KMS properties [3].
> > > If we have constants for property names in UAPI headers, it wouldn't be a big
> > > hurdle to also have constants for enum values alongside.
> >
> > To clarify, the property names would be of the form
> > #define DRM_KMS_PROPERTY_KERBLAH "KerBlah"
> > while enum values would be integers, i.e. the raw values.
> > Daniel Stone did have a good counter-argument to defining property
> > names: userspace would be full of
> > #ifndef DRM_KMS_PROPERTY_KERBLAH
> > #define DRM_KMS_PROPERTY_KERBLAH "KerBleh"
> > #endif
> > anyway as long as they cannot rely on the headers to be recent enough.
> > (The typo is intentional.)
>
> Why not put this in some external registry and regularly sync it into
> drm-next? This seems like an xorgproto kind of problem to me.

How would that fix the issue of KMS clients which don't want to depend
on too recent dependencies?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
