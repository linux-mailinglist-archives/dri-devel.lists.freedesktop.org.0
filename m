Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585942DB7D0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 01:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA40A89864;
	Wed, 16 Dec 2020 00:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D171589864
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 00:34:00 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id o13so20867225lfr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 16:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zj2YPVQKRFQs32LNLuK0mWD4evn16vjxArTvNU8xCYE=;
 b=zmi7gRMEKq3pV/lgDugpVABkbjYGunfv3IE8jzEnAbsXbf+Ejg0wFe38PkWiNxIzat
 UcNrSUrSe1p2sIBdGyWDONBu3AH8Kbk0NiodFDicgrBdvK70sr0gakQF29ML95jAragV
 8N13doCOA/pfONzJVu9hq8B426nbEKWVwEaZb7OphLLkthsF5Ta4dsKZ5Ek4hjMnrraY
 DGHF1s2bdcFGIUxhc8PsQ4bFHAmzraOeLADbxbYfaGcYzobyIX+X8coA5ijWWy005Ds+
 wAdnfLQ7eT6rJMO+AIq+vVrl6HWY5W3uz0vRd5Gt6zRcBSNLXP04+FjmrPL01+CWxnu5
 qKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zj2YPVQKRFQs32LNLuK0mWD4evn16vjxArTvNU8xCYE=;
 b=J7M9QkQgU1wsJs91MocF2CwNytcEDGJezZJThp21R/hhnCyaiSu8CMn8zywrEV7jSN
 U70tExz7K7vkaGXm4jZ7ofDadsjVwNoUGW2VEMrrsxFp73BSJo++MFLtG4sD2ESNjdDH
 f2d3fMFk+W9RSHbFT5/rNOvftvOPKT/F6/ORrk90IR7DN+9XcN6oRbeI1sqnlb5kdgtA
 om8/jqEGtvW6F15NgYqgwAWrvMA+ZJJoCoGauWo4hiLQIjG7EfDHc8AtXzhoK/mdgAAR
 GDTfwb4+gnCPlI44JQ1Ue6JPY72+BQ7ndbntrmfkBqhUS3KZNHWWS2WIogihEoW35iN3
 0QcA==
X-Gm-Message-State: AOAM531WgnJofEo3xmgUgdXLzUm9qwRCq/5Z4wTL3iF2RUeUYl7nipOX
 a7/n+CwjhxA09s6fNFPNGq5+K6ogJCL0bLFrg56Dfg==
X-Google-Smtp-Source: ABdhPJyOHjNYEs+MlipEezrk74D7gW0AbcHrqq8ll/2YJyrpydKCzWHi1oI7l8bwkRbDoPAAlJpvejRCo7btrJ0F78U=
X-Received: by 2002:a2e:8e38:: with SMTP id r24mr7092267ljk.333.1608078838907; 
 Tue, 15 Dec 2020 16:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20201121235002.69945-1-john.stultz@linaro.org>
 <20201121235002.69945-3-john.stultz@linaro.org>
 <20201215235334.GA227480@roeck-us.net>
In-Reply-To: <20201215235334.GA227480@roeck-us.net>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 15 Dec 2020 16:33:45 -0800
Message-ID: <CALAqxLXOnJPU5O5nZRnww6qNeA465syOmCPr9FY5cD_aijjzQA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dma-buf: heaps: Move heap-helper logic into the
 cma_heap implementation
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 3:53 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, Nov 21, 2020 at 11:49:59PM +0000, John Stultz wrote:
> > Since the heap-helpers logic ended up not being as generic as
> > hoped, move the heap-helpers dma_buf_ops implementations into
> > the cma_heap directly.
> >
> > This will allow us to remove the heap_helpers code in a following
> > patch.
> >
>
> mips:allmodconfig:
>
> drivers/dma-buf/heaps/cma_heap.c: In function 'cma_heap_do_vmap':
> drivers/dma-buf/heaps/cma_heap.c:195:10: error: implicit declaration of function 'vmap'
>

Ah. Looks like we need to explicitly include linux/vmalloc.h.

Thanks for the report! I'll spin up a patch, validate it and send it
out here shortly.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
