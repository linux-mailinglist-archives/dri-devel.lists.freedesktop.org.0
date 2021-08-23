Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7033F5072
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 20:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030DD89991;
	Mon, 23 Aug 2021 18:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C27F89991;
 Mon, 23 Aug 2021 18:36:29 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id 13so4762490vke.8;
 Mon, 23 Aug 2021 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oD+FfNvttTlhjkxgv46BkQdP0Q+7tbVwZBHtdENnPDs=;
 b=pgZbSzzqkGGiIpo4Gf6Xk8xnzSqmebfIAehocG0R9hnETl094QpzNQljT3BxuZjRTo
 u4oC3AZSt3Ps679D3bD4AQBNVwNPLV1ZtB3J988aFWWam6k4aAae4xk63JzNrMViBLVr
 9PFReSdv9CPouKzddX4B14cHs6mA4gEMzW5bIFGwFAiIbw2PKHJSTezVmNVkWb0gHwGt
 fbr4n+I9nFuwB2DB8dSRt2PPTAAAJXF6bG+Viam15tiofrL9NOUp/9sTo2h4GU791KVN
 MqNfxnMXap6nOtZxJ6k18nY5EViEOIriZ292kXpnxLj2b8Ub4HlFebW9sRvpYvB4oP/0
 q//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oD+FfNvttTlhjkxgv46BkQdP0Q+7tbVwZBHtdENnPDs=;
 b=PU7pQFEOTuCM+rqB+KhGGUG5OuOqEm1AX67v8o4mCvktfv30Oh1Yk6dYVNQzy+Y/2k
 ylAnCOEE04tJfsh88DF7PIgiClDq3jvCtk5kUrio+2+GjJDaXaLaa6Ki3Vl1SxykjMqO
 NjC6+fkebl1Tx/X9+gUXffgQhAG3LWLbWCEieAt1yFM3nkn/4nzMnOourdweCvz1QLQM
 b7HFm9E2mDTzYtKmTlMgNe0ZXHZUIYxLY33ZMDZJC17MuIKPykqWYIr6YCBzyCg/9U6g
 6nOZm+/j+InBklUYFG6RIqOtf/zCLzf0hr9UpAlPE0DnlhqvM0CokgT5U4KETDxaisAB
 SOxA==
X-Gm-Message-State: AOAM532cHdQ0FoYuLLQBwmBkNeGLWVLM4OTSB35hiClAdkNnvLQE1fro
 RYdMmP2xvmkziPTVlSjMZp9YC+YgFQqNNFwaJL0=
X-Google-Smtp-Source: ABdhPJxkBUE5Mb3AVj1rY8pemuvJ22/gztSRZps/lKhX3Bb0VUAxGBfiMN04gCVGgcanD3Bvuyb8NXhzHOhc7M04BeM=
X-Received: by 2002:a05:6122:189f:: with SMTP id
 bi31mr14411337vkb.8.1629743788056; 
 Mon, 23 Aug 2021 11:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
 <20210822222009.2035788-3-jim.cromie@gmail.com>
 <CAHp75VeGGRX-LWfDg_6+p2b27LMLSy+8gdH8ApqGchR=QDyEqA@mail.gmail.com>
In-Reply-To: <CAHp75VeGGRX-LWfDg_6+p2b27LMLSy+8gdH8ApqGchR=QDyEqA@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Mon, 23 Aug 2021 12:36:01 -0600
Message-ID: <CAJfuBxxqO=z0rVtj9_rKnxMWF5HyWzcBPJMu2oVd74opbiGdVA@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and
 callbacks
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jason Baron <jbaron@akamai.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sean Paul <seanpaul@chromium.org>, Jessica Yu <jeyu@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx <intel-gfx@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 23, 2021 at 12:41 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Aug 23, 2021 at 1:21 AM Jim Cromie <jim.cromie@gmail.com> wrote:
> >
> > DEFINE_DYNAMIC_DEBUG_CATEGORIES(name, var, bitmap_desc, @bit_descs)
> > allows users to define a drm.debug style (bitmap) sysfs interface, and
> > to specify the desired mapping from bits[0-N] to the format-prefix'd
> > pr_debug()s to be controlled.
> >

yes to everything, 1 question


> > +       if (!bitmap) {
> > +               pr_err("set_dyndbg: no bits=>queries map\n");
> > +               return -EINVAL;
> > +       }
> > +       rc = kstrtoul(instr, 0, &inbits);
> > +       if (rc) {
> > +               pr_err("set_dyndbg: failed\n");
> > +               return rc;
> > +       }
> > +       vpr_info("set_dyndbg: input 0x%lx\n", inbits);
> > +
> > +       for (i = 0; bitmap->prefix; i++, bitmap++) {
> > +               snprintf(query, FMT_QUERY_SIZE, "format '^%s' %cp", bitmap->prefix,
> > +                        test_bit(i, &inbits) ? '+' : '-');
> > +
> > +               matches = ddebug_exec_queries(query, KP_MOD_NAME);
> > +
> > +               v2pr_info("bit-%d: %d matches on '%s'\n", i, matches, query);
> > +               totct += matches;
> > +       }
>
> I'm wondering if there is a room to parse a bitmap as a bitmap.
>

I dont know what you mean here.
can you point to an example to crib from ?

thanks

> --
> With Best Regards,
> Andy Shevchenko
