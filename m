Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6BA9D1EA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F17810E9A7;
	Fri, 25 Apr 2025 19:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="zZm6wkp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213F710E9A7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:39:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54acc0cd458so3082513e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745609994; x=1746214794;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfSIX9jpfiWRSxgHFlpEDElrGRa3eqYVEWZZrqsW9bI=;
 b=zZm6wkp7MKK7dVWfhket0aLFIEF/7kIoveCSfo1nqlC4/ReCcdJOOtaAmCSWQRsNya
 aUMvKzfESvataeoPGh5GZYExOtBzEmzyxfTpWa2XRGAoQyIqla3A7hNwq59RFYWDyeBG
 FSytIO45U98y3GKGfcMtk4u3wUrQZiF258RPmCk2c/wL41CZErRGmbfHiJG12TDtnhPf
 fmBOryf0kJ8MkmL9o8BnOCw1fIaTOS/SFoMEb2cshX/LSyDXcTk+JGpdQnlIZ9phsjXg
 mOGwIzl9XcSG6HegZo5OE7PpZsSaGJd+dme2rSmPm5elLamnGBM2n1jb2REfSuq/yAjd
 AaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745609994; x=1746214794;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dfSIX9jpfiWRSxgHFlpEDElrGRa3eqYVEWZZrqsW9bI=;
 b=wiKmZuzRICw8jS421Z/1/DlHEcKLm98yce4Dm7Sytrdxiq9hM/F9mU6gGVgtXsLt4Y
 vuFXcDiIM++nw/wcj7kZyUGs5F3XoWCOwAdAbjZ1kC6M3M1dhZTJsXNErVo7oyTsgZk/
 qSE6Mz7KTXtMj9eM/tdZTVHRjsJyISsDFR20NWmIkSHeQ4Rk/+3lAeyZBwc/b2B5st7U
 o3+L5JtlxQjmQ3GbP4+oef56siJ2LGiZ0HTz//6Lijrt5P1W9eE7uJWLrBD0l1qMI00r
 Vd9o2EgfQioeuzQwa1O8iaiGGbUOun9tgGNlyGclu62dba1AAoigLOHPVfVM6QrS25Tr
 Rdow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo1TG86vFLaTF3uljbLRa/y12XslA52DxfxfaXyz7vqg1dVfWLXTEHOTSOk6obgT3W7vDYDVMszzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT7DZPa44LlLON/BpNq/4yz+/qEDhsFnzgOUchCd9aBOc/qZyY
 PRq6l1sE+omsa2DPOFxqqnzdkJ9E2ZTRtFzsTBSPzxgL5Oq2OB2fKDRInGivd1yssXRtQQxg+lH
 l/XNj7HU8PTsMTlTf4imxQRlQ38354j2SQQw=
X-Gm-Gg: ASbGncugG3y3DzmhdCiAhPu/Seq/HfHegylxLSHxFCNias1Y47NtmGkDPTb5630hmYq
 vBAMgmbwvJbtiA3bTKuDYrGWmipuIrFUYpilha6drR7kiJDq3Y/UvL/cne7s8xwNmLMjrJwjjpH
 qcQTOdpHPZTc3KyOOdzY1q5JoXD0aWz06I+489O3CUbmkxIUkckDU=
X-Google-Smtp-Source: AGHT+IHUbAh5N12vJaC4y50M7cNDxVxLCPYrcMSTN18M4pC1Y8L+yTG0UPsfIVPETtsJQssOgUaeDFzFHB1JvR/EmjM=
X-Received: by 2002:a05:6512:239f:b0:549:8db6:b2dd with SMTP id
 2adb3069b0e04-54e8cbe0789mr1187301e87.31.1745609994088; Fri, 25 Apr 2025
 12:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
 <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
 <20250425-savvy-chubby-alpaca-0196e3@houat>
In-Reply-To: <20250425-savvy-chubby-alpaca-0196e3@houat>
From: John Stultz <jstultz@google.com>
Date: Fri, 25 Apr 2025 12:39:40 -0700
X-Gm-Features: ATxdqUERSINXjgZozjhH6OJicqqRpLdRfV1ZPdW61MN5MO_O8cl1SzEcLT4val0
Message-ID: <CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Maxime Ripard <mripard@kernel.org>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
 christian.koenig@amd.com, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 24, 2025 at 11:58=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Thu, Apr 24, 2025 at 05:13:47PM -0700, John Stultz wrote:
> > On Thu, Apr 24, 2025 at 1:34=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > I appreciate this is kind of bikeshed-color territory, but I think "c=
ma"
> > > would be a better option here. There's nothing "default" about it.
> >
> > I disagree.  It very much is "default" as it's returning the
> > dma_contiguous_default_area.
>
> My main concern here is that it's "default" as opposed to what, exactly?
> We have a single CMA allocator. We could have multiple buffer
> attributes, but then "cached_cma" would make more sense to me if we
> expect to have uncached CMA allocations at some point.

Well, there may be one CMA allocator, but there can be multiple CMA regions=
.

So in the kernel, cma_alloc() always takes the cma area as an
argument.  And dma_alloc_contiguous() lets you do allocations against
a device, which may reference a specific cma area. Or if the device
doesn't specify a region it will utilize the default region.

> > There can be multiple CMA areas, and out of tree, vendors do reserve
> > separate areas for specific purposes, exposing multiple CMA dmabuf
> > heaps.
>
> By "CMA areas", I guess you mean carved-out memory regions? If so, how
> is it relevant to userspace if we use CMA or any other implementation to
> expose a carved-out region, and thus that we carry that implemenattion
> detail in the name?

So, no, I don't mean carve-out regions.  It's more about dealing with
competition between multiple CMA users. In some cases, where there are
known fixed buffer sizes, say camera buffers, it's much easier to
reserve a separate specific sized region to allocate from so that you
know it will always succeed and you don't need to waste much on safety
margins. Having this added as a separate CMA region makes it a lot
easier to account or reason about, and the kernel can still make
(limited) use of the CMA space when it's idle. Then you don't have to
worry about some other device having a short term cma allocation that
pushes back the alignment for your large allocation, possibly
impacting some other devices larger allocations.

And unlike with just using a carveout, you don't end up just wasting
all that space when it is unused.

So userland may want to allocate contiguous memory, but it may also be
relevant to userland to be able to allocate contiguous memory from a
purpose specific pool.

And while not used in Android, you could imagine having separate
purpose reserved cma heaps with different permissions on the heap
devnodes, allowing less trusted applications to allocate cma from a
small pool without having the potential to DoS the system.

> > There have been patches to expose multiple CMA heaps, but with no
> > upstream drivers using those purpose specific regions, we haven't
> > taken them yet.
> > I do hope as the drivers that utilize these purpose focused heaps go
> > upstream, we can add that logic, so I think being specific that this
> > is default CMA is a good idea.
>
> If heaps names are supposed to carry the region it exposes, then it
> should be default_cma_region/area. If heap names are supposed to expose
> the allocator (but I don't think it's a good idea), it should be cma. If
> they are meant to carry all that plus some policy,
> cached_default_cma_region should be used.
>
> Either way, default_cma seems to me either too specific or not specific
> enough. And we should really document what the policy for those heaps
> are supposed to be.

I don't see it as such a problem. It is clear it is cma, it also is
clear conceptually that it is the "default" region that the kernel
uses when devices aren't specific.
But I wouldn't object to cma_default_region/area as a name either, but
I don't see it as particularly improved over cma_default.

To your larger point about policy, I do get the tension that you want
to be able to programmatically derive or evaluate heap names, so that
applications can consistently derive a pathname to get what they want.
But I also think that there is so much variety in both the devices and
uses that there is no way that all use cases and all devices can be
satisfied with such a static or even programmatic mapping. From my
perspective, there just is going to have to be some device specific
glue logic that maps use->heap name. Same reason we have fstab and the
passwd file.  That said, I think advocating for naming conventions is
definitely useful, but I'm wary of trying to enforce too specific a
schema on the names as the incompleteness theorem will bite us.

thanks
-john
