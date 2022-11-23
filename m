Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4D2635644
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6239010E533;
	Wed, 23 Nov 2022 09:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EFC10E534
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:30:50 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id vv4so32128889ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 01:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/P6HmngRm+KyT9/p0YBOvUT5RPDSJ3KZFWEC9yJwyg=;
 b=SEYF/QTgkO2KyNYiHEjRyucUFb+Ry9Ekx3DQApfopXV78YDBzf9VwXBQKgQJiCjU1x
 i9Ujwox9aEaL0s0ptkZ33/Eiv9tYtfXn/YlySaB4qMn6tMtPQ9g3j0KpDQKXZA10tmgT
 luHNcWnUrOP+rBqLFyPSotsOcnLRVK6vYN7CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/P6HmngRm+KyT9/p0YBOvUT5RPDSJ3KZFWEC9yJwyg=;
 b=yrUC0IKR2U0sDuueI6oqe+LSU3W/fUtml182N1jOyr+rDWua7mELmj0Oy39Me54pie
 TD+8SlgB7CmvtGsBeb7pfWiGuLHzC4Qjw6e8LWKAdfp9Z2qLYG3mliBpXDNoBvcAKqOR
 vVfQ+yZEFmnpilZZwdP2Y1rvc2VgOPp5HYw4BgJI1XBcWxe9rFcW/tB4j6tgF5oGPK5r
 SLYwmCkUHTSpPUhOAmEaBv+AeoULcBT/BfUIHKWJbgbMnAvnNVEpfHfHy0Fo1qIqC6So
 Xtt59AFJPAKZsBJbLbZafkhxiVhWsG68rR51hdNU/gMblqoGdL2lCp+gOtrA0bYIYLfN
 tmGg==
X-Gm-Message-State: ANoB5pn3Kfmu0VF3fbWf0WLC9ob93zvOpHLgyspZmiIxR+OaZPhySqnc
 kPPwqTtCCFT2A4rm3O9TAGKpcTah9rGfSUPGMw7q2A==
X-Google-Smtp-Source: AA0mqf568pBwzED/LXK5vNiD3i8xo4oBiTQDcMA8vk117sCWXiDHnVcKEywyfB4Esfm/JhlCEhfPrQ2dAt8gaFHsgEk=
X-Received: by 2002:a17:907:2a53:b0:7a1:6786:4566 with SMTP id
 fe19-20020a1709072a5300b007a167864566mr11215974ejc.433.1669195849127; Wed, 23
 Nov 2022 01:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
In-Reply-To: <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Nov 2022 10:30:37 +0100
Message-ID: <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Nov 2022 at 10:06, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 22.11.22 um 20:50 schrieb Daniel Vetter:
> > On Tue, 22 Nov 2022 at 20:34, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >> On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:
> >>> You nuke all the ptes. Drivers that move have slightly more than a
> >>> bare struct file, they also have a struct address_space so that
> >>> invalidate_mapping_range() works.
> >> Okay, this is one of the ways that this can be made to work correctly,
> >> as long as you never allow GUP/GUP_fast to succeed on the PTEs. (this
> >> was the DAX mistake)
> > Hence this patch, to enforce that no dma-buf exporter gets this wrong.
> > Which some did, and then blamed bug reporters for the resulting splats
> > :-) One of the things we've reverted was the ttm huge pte support,
> > since that doesn't have the pmd_special flag (yet) and so would let
> > gup_fast through.
>
> The problem is not only gup, a lot of people seem to assume that when
> you are able to grab a reference to a page that the ptes pointing to
> that page can't change any more. And that's obviously incorrect.
>
> I witnessed tons of discussions about that already. Some customers even
> modified our code assuming that and then wondered why the heck they ran
> into data corruption.
>
> It's gotten so bad that I've even proposed intentionally mangling the
> page reference count on TTM allocated pages:
> https://patchwork.kernel.org/project/dri-devel/patch/20220927143529.13568=
9-1-christian.koenig@amd.com/

Yeah maybe something like this could be applied after we land this
patch here. Well maybe should have the same check in gem mmap code to
make sure no driver

> I think it would be better that instead of having special flags in the
> ptes and vmas that you can't follow them to a page structure we would
> add something to the page indicating that you can't grab a reference to
> it. But this might break some use cases as well.

Afaik the problem with that is that there's no free page bits left for
these debug checks. Plus the pte+vma flags are the flags to make this
clear already.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
