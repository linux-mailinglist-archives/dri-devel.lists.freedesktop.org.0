Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A09392C22
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486726EE76;
	Thu, 27 May 2021 10:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBA46EE72
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:49:01 +0000 (UTC)
Date: Thu, 27 May 2021 10:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1622112539;
 bh=5OzA3IKwQBhMiFfPZ5xOr25zCcrDR+bk3NBhnmg8yY8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=jv8EYBDYI54GtdQW4+LQtOmy1CHqvvC2PPxNAGe/UKS9H16FDw1tpha38xaaM6kPO
 q4vM8q6nJmFy6+dLsWAkmLUSYA7xikFjyVQoRDLt2k6VGFXPQsvyh9hq+flaQ9u1yi
 ohVde07iN0BclUzfzaxa8nuURRfnSIdaBRdi0L61pjqh/3Y2uU3QOV+gN6sYzWRhDh
 gjJYEV2BTFdyf0vN9exmX2JLCMCTmo6ZXhnSq+c1GqYaGhE2qQxrFMuEuWk1lBQiTg
 eFWf7TJdu2pQtPDH91fdtAsizMRKOXRUeefwN2Z3LPX7y942Kv7P/6RJS+LVZAboy2
 Xk70dRqr5jt7Q==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [Intel-gfx] [PATCH 5/7] dma-buf: Add an API for exporting sync
 files (v11)
Message-ID: <UhXviIJwnJG8qWOGYpAwgqll4W4TPSjVIFdG72MzhY4T2u7xS_Ql7OY-xlkfTR1HIoZ7-U8UhfqDsj62JIu98ESf_CfncvWougxT8JKm0ik=@emersion.fr>
In-Reply-To: <YK91kB0ikqxurHN1@phenom.ffwll.local>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-6-jason@jlekstrand.net>
 <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
 <CAPj87rN_7vmmWcL1vqhvM=etaTjwts_L0vYbsgvYF0_qZw83gw@mail.gmail.com>
 <770eb698-1dde-9e46-da83-44911d96abec@amd.com>
 <CAPj87rPdMthO2Wv7QxMGnO__BiZVauMa9HaRk+35Sgvm69QSjw@mail.gmail.com>
 <a9de44fc-aa7c-60d7-d7ed-2229d41fb306@amd.com>
 <YK91kB0ikqxurHN1@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, May 27th, 2021 at 12:33 PM, Daniel Vetter <daniel@ffwll.ch> wr=
ote:

> > The sync_file is also import/exportable to a certain drm_syncobj timeli=
ne
> > point (or as binary signal). So no big deal, we are all compatible here=
 :)
> > I just thought that it might be more appropriate to return a drm_syncob=
j
> > directly instead of a sync_file.
>
> I think another big potential user for this is a vk-based compositor whic=
h
> needs to interact/support implicit synced clients. And compositor world I
> think is right now still more sync_file (because that's where we started
> with atomic kms ioctl).

Yeah, right now compositors can only deal with sync_file. I have a
Vulkan pull request for wlroots [1] that would benefit from this, I
think.

Also it seems like drm_syncobj isn't necessarily going to be the the
sync primitive that ends them all with all that user-space fence
discussion, so long-term I guess we'll need a conversion anyways.

[1]: https://github.com/swaywm/wlroots/pull/2771

> Plus you can convert them to the other form anyway, so really doesn't
> matter much. But for the above reasons I'm leaning slightly towards
> sync_file. Except if compositor folks tell me I'm a fool and why :-)

sync_file is fine from my PoV.
