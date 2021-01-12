Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4BA2F2D24
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 11:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357FE6E1B5;
	Tue, 12 Jan 2021 10:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DD06E1B5;
 Tue, 12 Jan 2021 10:48:24 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id d14so1395936qkc.13;
 Tue, 12 Jan 2021 02:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pnGgNOsYg1W3ckB8bdY3DO0hb9CTu20hhiM71u9A7CE=;
 b=JbMw2faKF1q3FcWbF2FJduwD2EmsFAA5g7ICOeTF2SiY+QtxOCxEMvUFeOwinPPba9
 KatstrtUHIbV6d56Ljz/c3Eo8uJO7gFeJIwXOQLFvzfrOM3oHdnr0MBJZF0pldpue+nA
 kszz+yqzM+V+3pJFqF90lgw9jdHtyiStUMQdZGReMp+Jn5i6Q8CAXTb57P172x/gQEy7
 ULFR+Ta5Htcnm4uFmvWTRegT4pmK4h5ZT8iG8TyeANZ6oQpSc2MbEGitKVLGUl0mCvbm
 QYOrtXQQbwwriQW8GoyHWbWgPYJPx4gnY0wL+SZfvhvOBw2OQJrQSF2spPj7UexsEy+4
 g+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pnGgNOsYg1W3ckB8bdY3DO0hb9CTu20hhiM71u9A7CE=;
 b=HKRlpLamkJjLSvisBtoLGocw6koJOaeZAg7v07tcaYjJM2prQtL4QZbnjQkr5frGqb
 1YfsdKmQkg4djYjmHUIuERseaLlLM1PgCMlixuWP+QacE8QG4gHUQ1NMxLqZWzsSMQML
 mSxPARQ4qOUkZXhs/EIoB4uZ4M6H3mCoU4ib8Ttiudl2/mWJB0jAf7PFN0DCrfZCO5lL
 fmx7UAQihmk2e9B9NbpuVp8UyzBtkozqH6UKE/OkN6Jai+UrDqvgDQFp+9KzTkt+YueS
 o3e0cgssljPCOc6Hk6a87yWgFWEibbYqRWUeH+sOOFWBQ0vC3OtHOP6gZIsApsPddahK
 TFXA==
X-Gm-Message-State: AOAM533rjc5Up+OjmdMlq/wzZfzPNQxpG1gSEGohJ51+tMm61EjbYq9P
 tnfKJOObMJXXq3jRYyLQLInj+4ZHxHZnGkl07ABYhIy1Jgs=
X-Google-Smtp-Source: ABdhPJxCaR8U/OI87ZA9x2/hfM9BH1WLhfmQpyp0l4DGF0zGNVLuJxTuSLsJKYg+6gDS24maA0oslsC0YA4OVMKaY7E=
X-Received: by 2002:a37:a8a:: with SMTP id 132mr3827469qkk.327.1610448503745; 
 Tue, 12 Jan 2021 02:48:23 -0800 (PST)
MIME-Version: 1.0
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-99-matthew.auld@intel.com>
 <160648391794.2925.9163508633021117030@build.alporthouse.com>
In-Reply-To: <160648391794.2925.9163508633021117030@build.alporthouse.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 12 Jan 2021 10:47:57 +0000
Message-ID: <CAM0jSHPeEhguXs9hAagG5hhR9hxicR7CPyA4zEX=LCMxWMKwfA@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 098/162] drm/i915/gtt: map the PD up front
To: Chris Wilson <chris@chris-wilson.co.uk>
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Nov 2020 at 13:32, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Matthew Auld (2020-11-27 12:06:14)
> > We need to general our accessor for the page directories and tables from
> > using the simple kmap_atomic to support local memory, and this setup
> > must be done on acquisition of the backing storage prior to entering
> > fence execution contexts. Here we replace the kmap with the object
> > maping code that for simple single page shmemfs object will return a
> > plain kmap, that is then kept for the lifetime of the page directory.
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>
> We are going to really struggle with this on 32b :(

Just go back to mapping everything on demand like we did previously,
and unmap as soon as we are done with the current directory across
alloc/insert/clear?

> -Chris
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
