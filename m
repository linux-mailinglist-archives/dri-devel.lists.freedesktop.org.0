Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6F161FE78
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A411E10E351;
	Mon,  7 Nov 2022 19:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF4110E351;
 Mon,  7 Nov 2022 19:19:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86D3FB810B3;
 Mon,  7 Nov 2022 19:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CA8C433C1;
 Mon,  7 Nov 2022 19:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667848746;
 bh=bGgthrUWF+3ZLq8n7+v7zjmqKldCWYKUlvW82mNHqpw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RIqYW1fPOkVK9o0W1XlCHfap+U7HIMgGLbShMh0v9M6IHqj5aYa3r1HLiGGlCzyK4
 B9R35r2GwoDsy/QtFaLdeXM8kP6iM7yY8kYyNvukMNvYdzSiRKiXXlu4WB4Q5dWVRN
 GVtA3vLrDaZbvlybvL118ZDKSxxmvy4k48YcmklL8DrCMMbcwrqjqzbzeEtO/DmeQl
 VNqbOK/vfR1DDK4jdqAqJp88Lh8X7TUnhm3+mmBPPfUDZQL1Y7oZ2saCuapMxCbtAg
 NkI3x4bqUdoCAAIgfbpkfkDvLApamXUfHNf3vicnF+YnZTPAX1yZ8q4sV5Mknfukwj
 V/phhb7F+vdDw==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-367b8adf788so114035167b3.2; 
 Mon, 07 Nov 2022 11:19:06 -0800 (PST)
X-Gm-Message-State: ACrzQf0jpKoVM0WulmB6rhcLjD7fo9VmKOxLxCx5bRrqs9c00skaFiUl
 Oa1Xt1ymPZ/0V6nW+j2C8Dm6/Pex8i166enU63o=
X-Google-Smtp-Source: AMsMyM74qyo6GskHKSKmxzqyHe1PRPhqePzsNKb20SI4ZJ7+bqONNOhTPtlZR7wUxgfVAFxXhJ0DyXHqzosMQxpYMHU=
X-Received: by 2002:a81:9214:0:b0:36c:7b94:aa57 with SMTP id
 j20-20020a819214000000b0036c7b94aa57mr48162445ywg.221.1667848745201; Mon, 07
 Nov 2022 11:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20220911211443.581481-1-michal.winiarski@intel.com>
 <20220911211443.581481-2-michal.winiarski@intel.com>
 <CAFCwf11=hKGm93oF1A5PLhdvdo2ujYJWyt4qAqK-KQQqe6ngDA@mail.gmail.com>
 <CAFCwf12+piEABvv=nxFJCzUU4XdZw5Pu=r=i3aKQGZrBeraFqw@mail.gmail.com>
 <Y2kwN5TRsAKTZmsN@casper.infradead.org>
In-Reply-To: <Y2kwN5TRsAKTZmsN@casper.infradead.org>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 7 Nov 2022 21:18:38 +0200
X-Gmail-Original-Message-ID: <CAFCwf112mZcB6h1QZyO9nKYnDuMB2ceD7v_myL7PycKQv6uLMA@mail.gmail.com>
Message-ID: <CAFCwf112mZcB6h1QZyO9nKYnDuMB2ceD7v_myL7PycKQv6uLMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] drm: Use XArray instead of IDR for minors
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 6:20 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sun, Nov 06, 2022 at 04:51:39PM +0200, Oded Gabbay wrote:
> > I tried executing the following code in a dummy driver I wrote:
>
> You don't need to write a dummy driver; you can write test-cases
> entirely in userspace.  Just add them to lib/test_xarray.c and then
> make -C tools/testing/radix-tree/
>
> > static DEFINE_XARRAY_ALLOC(xa_dummy);
> > void check_xa(void *pdev)
> > {
> >   void *entry;
> >   int ret, index;
> >
> >   ret = xa_alloc(&xa_dummy, &index, NULL, XA_LIMIT(0, 63), GFP_NOWAIT);
> >   if (ret < 0)
> >       return ret;
> >
> >   entry = xa_cmpxchg(&xa_dummy, index, NULL, pdev, GFP_KERNEL);
> >   if (xa_is_err(entry))
> >        return;
> >
> >   xa_lock(&xa_dummy);
> >   xa_dev = xa_load(&xa_dummy, index);
> >   xa_unlock(&xa_dummy);
> > }
> >
> > And to my surprise xa_dev is always NULL, when it should be pdev.
> > I believe that because we first allocate the entry with NULL, it is
> > considered a "zero" entry in the XA.
> > And when we replace it, this attribute doesn't change so when we do
> > xa_load, the xa code thinks the entry is a "zero" entry and returns
> > NULL.
>
> There's no "attribute" to mark a zero entry.  It's just a zero entry.
> The problem is that you're cmpxchg'ing against NULL, and it's not NULL,
> it's the ZERO entry.  This is even documented in the test code:
>
>         /* cmpxchg sees a reserved entry as ZERO */
>         XA_BUG_ON(xa, xa_reserve(xa, 12345678, GFP_KERNEL) != 0);
>         XA_BUG_ON(xa, xa_cmpxchg(xa, 12345678, XA_ZERO_ENTRY,
>                                 xa_mk_value(12345678), GFP_NOWAIT) != NULL);
>
> I'm not quite sure why you're using xa_cmpxchg() here anyway; if you
> allocated it, it's yours and you can just xa_store() to it.
>
Hi Matthew,
Thanks for the explanation. I believe Michal's will fix his original
patch and I'll take that code.

Oded
