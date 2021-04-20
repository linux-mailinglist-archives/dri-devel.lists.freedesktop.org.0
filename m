Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE0366032
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 21:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610F66E8BC;
	Tue, 20 Apr 2021 19:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A316E8BE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 19:30:05 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso22764709otm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dUmx1MtqanjGb5JZs7A8JEeUx6YedY6rEEOuScuhaDY=;
 b=bdH8rCSSzC2pDUUfOhI1QF52vThtGIiSjIxzythPDUO/raZLQ8NPt/OlX6hrAYRjdO
 TYfKei+fdhqZ7AMDtnoCz/v98AktnixjsFA4khuEmqGHB161NgZ0aUjqhpbnmVWZwDVP
 SGK0Qt7b5t1F1VVXD29O+iXBiPBRy6P73rE40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dUmx1MtqanjGb5JZs7A8JEeUx6YedY6rEEOuScuhaDY=;
 b=G/x0G+Vu2BKBHo2jd+6xqlwc9tTx+GwbiuwYltKVAAMDB6EqbD7LT4NF4dD53Wv/cq
 YXlWuXFcF/b32Ov8bw8VTThjIgLb/71mSE7e8rSw9q11WtS+9/8vqIvRltSuT1EjP5y+
 kASBRZuWMlcwJTyU5ezxlfS0GRrQSUrzR6GTjgNrUZ5U6Z9fd/9s/HLewr7masG17qPZ
 c0j+pNl2TyWCxgqiYaP6j90kP4rvViFWQMSu+Ub9tPGF0pzjkZ76ncko+ksJZ7BJtzOB
 qO8AOueobf2bkIkjSDtXvY+YfYIFn/pegD5p5ZIac+zLIi4onwiWveiXEgHvLZXMBIat
 trsQ==
X-Gm-Message-State: AOAM531fEjCbPD/I93+XgbMnJy+L0UeAUX8tVTrBx1C+L8D8FyppQWPu
 fsc1GfeNQKClbM0p6zmIHc8P97D/nrQWeCjPk5C12Q==
X-Google-Smtp-Source: ABdhPJz8ifN9h9HnuUx4w7ee0muhJLu4WvA+v+3AC1tnSPcVv8Gwvi2B0XipEKoEqDJ9YRyxgCeV2SicB67a6RV/VhY=
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr1253876otc.303.1618947004908; 
 Tue, 20 Apr 2021 12:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
In-Reply-To: <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Apr 2021 21:29:53 +0200
Message-ID: <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 9:14 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Tue, 20 Apr 2021 at 19:54, Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> So I can mostly get behind this, except it's _not_ going to be
>> dma_fence. That thing has horrendous internal ordering constraints
>> within the kernel, and the one thing that doesn't allow you is to make
>> a dma_fence depend upon a userspace fence.
>>
>> But what we can do is use the same currently existing container
>> objects like drm_syncobj or sync_file (timeline syncobj would fit best
>> tbh), and stuff a userspace fence behind it. The only trouble is that
>> currently timeline syncobj implement vulkan's spec, which means if you
>> build a wait-before-signal deadlock, you'll wait forever. Well until
>> the user ragequits and kills your process.
>>
>> So for winsys we'd need to be able to specify the wait timeout
>> somewhere for waiting for that dma_fence to materialize (plus the
>> submit thread, but userspace needs that anyway to support timeline
>> syncobj) if you're importing an untrusted timeline syncobj. And I
>> think that's roughly it.
>
>
> Right. The only way you get to materialise a dma_fence from an execbuf is that you take a hard timeout, with a penalty for not meeting that timeout. When I say dma_fence I mean dma_fence, because there is no extant winsys support for drm_symcobj, so this is greenfield: the winsys gets to specify its terms of engagement, and again, we've been the orange/green-site enemies of users for quite some time already, so we're happy to continue doing so. If the actual underlying primitive is not a dma_fence, and compositors/protocol/clients need to eat a bunch of typing to deal with a different primitive which offers the same guarantees, then that's fine, as long as there is some tangible whole-of-system benefit.

So atm sync_file doesn't support future fences, but we could add the
support for those there. And since vulkan doesn't really say anything
about those, we could make the wait time out by default.

> How that timeout is actually realised is an implementation detail. Whether it's a property of the last GPU job itself that the CPU-side driver can observe, or that the kernel driver guarantees that there is a GPU job launched in parallel which monitors the memory-fence status and reports back through a mailbox/doorbell, or the CPU-side driver enqueues kqueue work for $n milliseconds' time to check the value in memory and kill the context if it doesn't meet expectations - whatever. I don't believe any of those choices meaningfully impact on kernel driver complexity relative to the initial proposal, but they do allow us to continue to provide the guarantees we do today when buffers cross security boundaries.

The thing is, you can't do this in drm/scheduler. At least not without
splitting up the dma_fence in the kernel into separate memory fences
and sync fences, and the work to get there is imo just not worth it.
We've bikeshedded this ad nauseaum for vk timeline syncobj, and the
solution was to have the submit thread in the userspace driver.

It won't really change anything wrt what applications can observe from
the egl/gl side of things though.

> There might well be an argument for significantly weakening those security boundaries and shifting the complexity from the DRM scheduler into userspace compositors. So far though, I have yet to see that argument made coherently.

Ah we've had that argument. We have moved that into userspace as part
of vk submit threads. It aint pretty, but it's better than the other
option :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
