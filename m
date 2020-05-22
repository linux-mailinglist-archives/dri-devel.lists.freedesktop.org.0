Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D811DF65A
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E9F6E42C;
	Sat, 23 May 2020 09:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509786E04B;
 Fri, 22 May 2020 11:40:45 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z206so2692950lfc.6;
 Fri, 22 May 2020 04:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hj2fTCjbxOKsyZP7M3oTIyRA9mJ2Bc+fUg1m8uH2yYk=;
 b=Fctbeo2rUCXQwGpTpFGVse8+WCb+g1DgkimSxd0aywjWQzd7bhxHHSHfy1FP+QqJ5E
 HQGcAIndvBPaVq+mvvXrYxa60iZ270cp/hL7v335T389bW5HYMkEi/Mut44zha6NDaG4
 UCrNm9pJDDi2UNXl+PlD6bv/w4smxNEG9g8AyCyft6tAOApW/apnSn16+WYKI0WwO/LX
 QygL+8MKePZCy7xTU8Q+o6DXxVRskTBMwRQQsFJ+VR7QHRA9Pic1hmOdE0dfFierlTBM
 XmumN0HJD7IHx+R0ZAzFlmPROpUU2YmKdDsZd/Q7eTLT58JceLPdRakROdwY5S4uTJxp
 Cehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hj2fTCjbxOKsyZP7M3oTIyRA9mJ2Bc+fUg1m8uH2yYk=;
 b=JqbN1yforlZRw2ykbuNW78en4n6UBzcDaXgimXHgVpqL17L8nSonQLgT9xDPfBDeM6
 ++7x6csNRI4thQZ87pcqjhn2xRmZ6WP2FHhvI9OSwCQUAGZQxPb4hc3OUyCyRX1FoZ+g
 DIniuDpLm5XI8z/1LYn1IjgCHPPYXIwGg5YI+OSp/22OAqCswS1NrIHRphTabFHzPkel
 2yHxhQMtPzdxyJTV/DrmeqMrdXBuZRjsuZNlk6Z73CeW3vbZ/jDFCWq7Z6K17KsckfX4
 WCld5OnF7qX3lf4CnImOnzGFpySiOy1MkI/LEw4/le82pwHaENpKC4kqt12++oBu9NnI
 192w==
X-Gm-Message-State: AOAM531xTm1tUjVdJnLobZRcZurv9aCPMkS2TJznfzQr5ZSTDnYbSPnE
 8kCynyi8NEMX0fvQz1VkjreEiJ9Xyr52qSCFihU=
X-Google-Smtp-Source: ABdhPJyCH6J7CaJtTe9PzunF+afSux/PTZRtv8MDXaAqacG2ZKbC4Y+MdKt3boWpmeIuz1KBImEFTAKzX+qejKOKM8k=
X-Received: by 2002:ac2:53a2:: with SMTP id j2mr7071822lfh.139.1590147643673; 
 Fri, 22 May 2020 04:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200519002124.2025955-1-jhubbard@nvidia.com>
In-Reply-To: <20200519002124.2025955-1-jhubbard@nvidia.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 22 May 2020 17:10:32 +0530
Message-ID: <CAFqt6zZTZrB=LiGQpcOtZfnr7-CL4tkLHz8eXFvxwCTcfKy4sQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] mm/gup, drm/i915: refactor gup_fast,
 convert to pin_user_pages()
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Linux-MM <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,


On Tue, May 19, 2020 at 5:51 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> This needs to go through Andrew's -mm tree, due to adding a new gup.c
> routine. However, I would really love to have some testing from the
> drm/i915 folks, because I haven't been able to run-time test that part
> of it.
>
> Otherwise, though, the series has passed my basic run time testing:
> some LTP tests, some xfs and etx4 non-destructive xfstests, and an
> assortment of other smaller ones: vm selftests, io_uring_register, a
> few more. But that's only on one particular machine. Also, cross-compile
> tests for half a dozen arches all pass.
>
> Details:
>
> In order to convert the drm/i915 driver from get_user_pages() to
> pin_user_pages(), a FOLL_PIN equivalent of __get_user_pages_fast() was
> required. That led to refactoring __get_user_pages_fast(), with the
> following goals:
>
> 1) As above: provide a pin_user_pages*() routine for drm/i915 to call,
>    in place of __get_user_pages_fast(),
>
> 2) Get rid of the gup.c duplicate code for walking page tables with
>    interrupts disabled. This duplicate code is a minor maintenance
>    problem anyway.
>
> 3) Make it easy for an upcoming patch from Souptick, which aims to
>    convert __get_user_pages_fast() to use a gup_flags argument, instead
>    of a bool writeable arg.  Also, if this series looks good, we can
>    ask Souptick to change the name as well, to whatever the consensus
>    is. My initial recommendation is: get_user_pages_fast_only(), to
>    match the new pin_user_pages_only().

Shall I hold my changes till 5.8-rc1 , when this series will appear upstream ?
>
> John Hubbard (4):
>   mm/gup: move __get_user_pages_fast() down a few lines in gup.c
>   mm/gup: refactor and de-duplicate gup_fast() code
>   mm/gup: introduce pin_user_pages_fast_only()
>   drm/i915: convert get_user_pages() --> pin_user_pages()
>
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  22 +--
>  include/linux/mm.h                          |   3 +
>  mm/gup.c                                    | 150 ++++++++++++--------
>  3 files changed, 107 insertions(+), 68 deletions(-)
>
>
> base-commit: 642b151f45dd54809ea00ecd3976a56c1ec9b53d
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
