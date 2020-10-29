Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F429E726
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 10:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FD36E8AF;
	Thu, 29 Oct 2020 09:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DCB6E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:23:20 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id m128so2521167oig.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HErX54nBW85Mz/DisB4HfNyGdAeDZ0yXv+UudeIIMTI=;
 b=CBZ8FpLcj2jbgAT+Vmv1XK/GbFU0hZrgfjfdtoEzh/dEuH+e0mn43Y+dqqjduTTKhF
 J7T958sHQ5/KYkABUDOFL7LBDzCndG/FofSZCVsgEfa1haI/dp0rDYf3SCs2rGay/PWL
 uDxd+MKtvtWQZGFZGQv1Mt5IJ+VVaOuC4yqDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HErX54nBW85Mz/DisB4HfNyGdAeDZ0yXv+UudeIIMTI=;
 b=MOrMajnjC3I6XM/RdwEGIkT5yRTsUtaAjCDs6DFG64ZEcZkokH5r8ZYIKty0nUY3I+
 mZAnVTbI5z9HGFu//dTdJ2KDxIO+ne2KBMB/YOCY2lvKsj4eUWMMV6+JiHYO+XhNxdVg
 5SfB0cxyflXfAY5nWqKuBJBDX0WvAPxJgIi7RQP/k8PvpYdbOywntuwr31Vp09aOAlFm
 oaRZySF/SrnEpUztAESBor9HP3+/GNJ1IzeFw+9XhgmiA0M1+jSl0JdrO7d/kxxifxXt
 YHnPT69V5DqUP2X0lWhxi8GK4dHdy5UV6Pdh50OCLfMDuBYI9TtfyZ/Oz2Mt42gf97vh
 av3w==
X-Gm-Message-State: AOAM530YUNMEFz+ZrXy2XnKv9hMzff6WXsIFPSt2658D1KjQJIBrKj0G
 svd2gSAIRRXU7p1hmYFnyvdn/QrvE89lgy4sBs5Czg==
X-Google-Smtp-Source: ABdhPJwaJb96lRFRXk+hd1pHWMNo5GqlP779ZIojTGckKr1ysWVQINo4W6Rzy8Z9dUSTdKF2aKSvZQbQvjmujgECT7Y=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2268480oig.128.1603963399942; 
 Thu, 29 Oct 2020 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201026105818.2585306-9-daniel.vetter@ffwll.ch>
 <20201029085644.GA25658@infradead.org>
In-Reply-To: <20201029085644.GA25658@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 29 Oct 2020 10:23:09 +0100
Message-ID: <CAKMK7uGVUf9RfTHKa8fpTUgGQ5iy+5toK+tQYp0TokKU=iM8pQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] mm: Add unsafe_follow_pfn
To: Christoph Hellwig <hch@infradead.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, J??r??me Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 9:56 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> > +int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > +     unsigned long *pfn)
>
> The one tab indent here looks weird, normally tis would be two tabs
> or aligned aftetthe opening brace.
>
> > +{
> > +#ifdef CONFIG_STRICT_FOLLOW_PFN
> > +     pr_info("unsafe follow_pfn usage rejected, see CONFIG_STRICT_FOLLOW_PFN\n");
> > +     return -EINVAL;
> > +#else
> > +     WARN_ONCE(1, "unsafe follow_pfn usage\n");
> > +     add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> > +
> > +     return follow_pfn(vma, address, pfn);
> > +#endif
>
> Woudn't this be a pretty good use case of "if (IS_ENABLED(...)))"?
>
> Also I'd expect the inverse polarity of the config option, that is
> a USAFE_FOLLOW_PFN option to enable to unsafe behavior.

Was just about to send out v5, will apply your suggestions for that
using IS_ENABLED.

Wrt negative or positive Kconfig, I was following STRICT_DEVMEM symbol
as precedence. But easy to invert if there's strong feeling the other
way round, I'm not attached to either.

> > +/**
> > + * unsafe_follow_pfn - look up PFN at a user virtual address
> > + * @vma: memory mapping
> > + * @address: user virtual address
> > + * @pfn: location to store found PFN
> > + *
> > + * Only IO mappings and raw PFN mappings are allowed.
> > + *
> > + * Returns zero and the pfn at @pfn on success, -ve otherwise.
> > + */
> > +int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > +     unsigned long *pfn)
> > +{
> > +     return follow_pfn(vma, address, pfn);
> > +}
> > +EXPORT_SYMBOL(unsafe_follow_pfn);
>
> Any reason this doesn't use the warn and disable logic?

I figured without an mmu there's not much guarantees anyway. But I
guess I can put it in here too for consistency.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
