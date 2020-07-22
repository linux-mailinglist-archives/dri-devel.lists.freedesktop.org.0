Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A842228FA5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 07:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6316E31C;
	Wed, 22 Jul 2020 05:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88196E31C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 05:26:00 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id x83so805130oif.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 22:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dz0PNWvUyA5bVwawo9dRFrBcMuGComXjKBNRW57uQgg=;
 b=gPtekxXwx5xoHX6xD+EB5QVJSdczVy9YPn9MQCfSKGHYw21MojiJ5s/CwN4esHCjaI
 sUCaRRd37tWCDsHp5NAM788cBt4cCLM6mISCsVmTepQ3OInoRXDVmX8b9U5fjQ+oMITR
 fwBFIOpWJ32fKnV4BAMojzUQn7DsFMGYuzPgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dz0PNWvUyA5bVwawo9dRFrBcMuGComXjKBNRW57uQgg=;
 b=CcuMAyAhooxHTQXqVFYtx0ZNyIiN7GKgsK8ov2ar/GeWmjW2D+HBEWk53vaQKsrFgE
 gvXAV61L0u3t1z8y9/INcxicRc68HES0Eca4L3WczdZIqyLdDgQMwycVfY9CyBvqqi7f
 fZvfDYAfUC9CSqti4N3e20S2Q4QUdVzsD3LRsy0PNHK4yg+A2VzUxXDEip951dczkZuG
 9r674PBtt+DvF7naGWLv0EHAfkInZtsvBgjc66qkHRAt7SG+47ikydIYLFF5VNtG3wF0
 5wcgYSlW9w16UA1rcLrNMFXiUKIyxZRoAOeUfPUWJyqZB+0IH1IRtaHDI3UnKso5OVPv
 DX/w==
X-Gm-Message-State: AOAM532GYwHoI6qdAyvdA5aElV4mlXqBH/Kz96w10fxN3VQ0TINT3lyZ
 NXTl8aKqVIrcAA0CwOrbswi2csGz4lyeYsQQkJl7aA==
X-Google-Smtp-Source: ABdhPJycaRmTBcGABti42e3PKUTAQ34pmYikeYm6E7HWLcfVGdGx9DrGPj1mAOjJhuy0kvoLmA482wjfjEe6I5mW5iE=
X-Received: by 2002:a05:6808:88:: with SMTP id
 s8mr5502429oic.101.1595395559971; 
 Tue, 21 Jul 2020 22:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200721171936.81563-1-michael.j.ruhl@intel.com>
 <20200721135648.9603d924377825a7e6c0023b@linux-foundation.org>
 <14063C7AD467DE4B82DEDB5C278E866301245E046C@FMSMSX108.amr.corp.intel.com>
 <20200721142424.b8846cddf1efd48e45278a42@linux-foundation.org>
In-Reply-To: <20200721142424.b8846cddf1efd48e45278a42@linux-foundation.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 Jul 2020 07:25:48 +0200
Message-ID: <CAKMK7uGNyEEZxsT8PB6X6-Ea-Z_oB498wuV4G8tO-b-ygNiwVQ@mail.gmail.com>
Subject: Re: [PATCH v2] io-mapping: Indicate mapping failure
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mike Rapoport <rppt@linux.ibm.com>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 11:24 PM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Tue, 21 Jul 2020 21:02:44 +0000 "Ruhl, Michael J" <michael.j.ruhl@intel.com> wrote:
>
> > >--- a/include/linux/io-mapping.h~io-mapping-indicate-mapping-failure-fix
> > >+++ a/include/linux/io-mapping.h
> > >@@ -107,9 +107,12 @@ io_mapping_init_wc(struct io_mapping *io
> > >                resource_size_t base,
> > >                unsigned long size)
> > > {
> > >+    iomap->iomem = ioremap_wc(base, size);
> > >+    if (!iomap->iomem)
> > >+            return NULL;
> > >+
> >
> > This does make more sense.
> >
> > I am confused by the two follow up emails I just got.
>
> One was your original patch, the other is my suggested alteration.
>
> > Shall I resubmit, or is this path (if !iomap->iomem) return NULL)
> > now in the tree.
>
> All is OK.  If my alteration is acceptable (and, preferably, tested!)
> then when the time comes, I'll fold it into the base patch, add a
> note indicating this change and shall then send it to Linus.

Your alternative also matches the other implementation of
io_mapping_init_wc, I was kinda tempted to do that suggestion too just
because of that. But then didn't send out that email.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
