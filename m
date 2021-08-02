Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF53DDD8B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 18:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C788E6E0CB;
	Mon,  2 Aug 2021 16:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855D76E0CB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 16:23:26 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so32421600pja.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 09:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JaILGVZ5ZfAh5yd44e+vxSRLCop37r4sy9cxjRO/kVU=;
 b=aw1kgIMmRz0YMmD8jXYt7yhGZxHLHmcNQFLrG40MdDJ4dxtp5Dp6z04FghrmAgWxls
 ibbc21J6Lj1o0KA7GwJpBkMxWoCQKSfGPfoyBryQnP/vDd6QBrsp3tbdnfeGJcBe4xv4
 fS1shEaQqJCHHvIk5MIu8rA0hZEvPYJj50Zzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JaILGVZ5ZfAh5yd44e+vxSRLCop37r4sy9cxjRO/kVU=;
 b=IZc2zQYDNZ3P7K3KBDEJlXF5T9vXUr6ju5idNYdtulzwvBPHQ97hLFnoJPR/N1t+qw
 GLgNvj9XCR08kis8VMF2n3pW3fCwHGkMFT6H2elCplvL/0vRPm2jrFlqw8GXp7tD5OO8
 V+qgEVuwqzirxSRrXyDYCwBeSutPAtvbf9jr3Px/U3CahWxJMWRYdKVvircMyXEoSiEQ
 5U/9FN/WRnujJ4+b/Jja8Sh2csg28+LZdeNQ5Hc9+b74GlqlfsE02qfUyS9PTE/SAfoI
 T4Ou760+lc82ckB5a1HbuVRCjWOQFm5WmJUIYV412GEdADWe18MiqIO449MmJQ76dt3o
 63SQ==
X-Gm-Message-State: AOAM532ArUFi0+5Dsfw40elkj7kwL391cifoKLZbcbUzqGW6NaTW6XvB
 uhG780ieNlvcBVtjvi6PlOWwGg==
X-Google-Smtp-Source: ABdhPJyna/JEEPlWGNR2S+ZqJqCzOPLMMoqPYs8YB21x4PV9XLYXx00eTM9yttg27rSVI2z426vQLw==
X-Received: by 2002:a63:4a49:: with SMTP id j9mr2250552pgl.20.1627921406097;
 Mon, 02 Aug 2021 09:23:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s193sm13206950pfc.183.2021.08.02.09.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:23:25 -0700 (PDT)
Date: Mon, 2 Aug 2021 09:23:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Shai Malin <smalin@marvell.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 GR-everest-linux-l2 <GR-everest-linux-l2@marvell.com>,
 Ariel Elior <aelior@marvell.com>
Subject: Re: [PATCH 42/64] net: qede: Use memset_after() for counters
Message-ID: <202108020922.FE8A35C854@keescook>
References: <SJ0PR18MB3882DC88DB04C9DE68678CEDCCEF9@SJ0PR18MB3882.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR18MB3882DC88DB04C9DE68678CEDCCEF9@SJ0PR18MB3882.namprd18.prod.outlook.com>
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

On Mon, Aug 02, 2021 at 02:29:28PM +0000, Shai Malin wrote:
> 
> On Tue, Jul 31, 2021 at 07:07:00PM -0300, Kees Cook wrote:
> > On Tue, Jul 27, 2021 at 01:58:33PM -0700, Kees Cook wrote:
> > > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > > field bounds checking for memset(), avoid intentionally writing across
> > > neighboring fields.
> > >
> > > Use memset_after() so memset() doesn't get confused about writing
> > > beyond the destination member that is intended to be the starting point
> > > of zeroing through the end of the struct.
> > >
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > > The old code seems to be doing the wrong thing: starting from not the
> > > first member, but sized for the whole struct. Which is correct?
> > 
> > Quick ping on this question.
> > 
> > The old code seems to be doing the wrong thing: it starts from the second
> > member and writes beyond int_info, clobbering qede_lock:
> 
> Thanks for highlighting the problem, but actually, the memset is redundant.
> We will remove it so the change will not be needed.
> 
> > 
> > struct qede_dev {
> >         ...
> >         struct qed_int_info             int_info;
> > 
> >         /* Smaller private variant of the RTNL lock */
> >         struct mutex                    qede_lock;
> >         ...
> > 
> > 
> > struct qed_int_info {
> >         struct msix_entry       *msix;
> >         u8                      msix_cnt;
> > 
> >         /* This should be updated by the protocol driver */
> >         u8                      used_cnt;
> > };
> > 
> > Should this also clear the "msix" member, or should this not write
> > beyond int_info? This patch does the latter.
> 
> It should clear only the msix_cnt, no need to clear the entire 
> qed_int_info structure.

Should used_cnt be cleared too? It is currently. Better yet, what patch
do you suggest I replace this proposed one with? :)

Thanks for looking at this!

-Kees

-- 
Kees Cook
