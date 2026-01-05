Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49900CF4AE4
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB95C10E25F;
	Mon,  5 Jan 2026 16:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GAlKxgn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EE310E25F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:28:57 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-59b25acdffbso28241e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767630536; x=1768235336; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MhLaZEGztBaqdfRcf1ZLhhb1lILxqOMU/Yvm4+Hg7yU=;
 b=GAlKxgn1Asc3KDT3nWh8QZE4p+xmYRApYXZ3JbkJGoMp+EgrzQ+FZfVIq6HTnSRxqZ
 exTe5KWRPyHyeFsq7PWL+QBGw+L/gfG9u1zSRJ9Izsx/eOvOtXmCB5etzsGcnUcaW+Kx
 qGUA1QmYWtu/3AmjbAez87ysyDI8Sz8VcLMbA49/TOZu11rzXvzu/DMpqOE9aAjQuUJq
 lCOCrsaEt1PEBgpgX56SgPpRCvVG6t55r2V7UTXlyV4dIOGi3S8z/2e7BBRJFZqGPrSO
 Zp42JYMBBkiQ+aWPmCR49rWS+bS1x9T/cWQgdhqt8wYlEB/RZZqFZC4nImnYz/381vYz
 W7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767630536; x=1768235336;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MhLaZEGztBaqdfRcf1ZLhhb1lILxqOMU/Yvm4+Hg7yU=;
 b=jYrFAuJfd/8p2Ba3roQH6GDIXUzp9tDrBl2uVwfMaCTmP/dSzP3A8KUt0BXgoJXZ/+
 lOvUcvPnxHwTT8B5iGhrq6L6DvBXSrGtnESketzR5AMW4HdKVVQBc+YEO0IS55lQa4sn
 CIN+02t2CTTxFsT7JpWlx0Upx9ujis10U5O1BWycqon95x5mJS4P1ryFRGpI552lBTYv
 c54TAbKZ+uhFfKVd2JCPRM8ZB2nuMcFA150FdNSRj9mDlbOcy9/9D2xhaOp1ITo8nUJy
 w/uQPaYjU/l9zlav/1Kk5vqvrXs7Z25B0Jzt+x3n3I773rJKHQsVPe09a2eZWHCfssWH
 v3hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBVXOtUtxPjRHHPVB4dq6Tjj/82TOinS5wSZo81NBFkpZawI4c2l4mwRIoOPzqAZnQE4gnHMbRU+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsJbHDh1J05u5aBUgVA+unjSmxP7r2jBnOqv4sRG1dY86yZX7G
 o/huuGC8Bd6jmkXyUC+TPZRsUwtPI+Iz+zQAASYY58xq3f3H8CTK2kl3
X-Gm-Gg: AY/fxX4Bs3DbBfVxf3Wh+OcaqKr2lxDuc7HBfADLw/7Ew7avZbCYbYDaIeteALloicn
 L4MbvXWpWkR+qrmJ9G/Q2gOxnq7KD8fZGIs56cRLVRDu0zzGJdrzE9ScHosbFyw42MhFPzl5ejI
 QDxWzZXw77Earv5rCfgBwWKZV30flj/Ttn632baE+yH9cTtlgOKSrkE7R9lFO051pYNL/vjpiC9
 LnacWuBjlvoVll7hzB0EiKPB4aaMKsjet82PcBH3tKM6wX7luAj59XjFcT3ZNRC20Jl5QN1lEgS
 ajG25wCxYxltiMifnzxv1+Y+JYKkkMGRkMIGmInuy1qNhRuNnRy9Zr1Kyl8Oww2XDjYrlX00X67
 iywn7aqJWfNEsCDlELs7jMvxSL0Mo/sZqqEgnWF235nhFDMJ5OMoK
X-Google-Smtp-Source: AGHT+IEoZ87k72XOK4WRfNoEGxBoiDEdhg+qxrjQywDuv03+TjElLhMwviVR8rOvTsQRpLgtTWykmg==
X-Received: by 2002:ac2:4f0a:0:b0:59a:113a:f517 with SMTP id
 2adb3069b0e04-59b6527a2afmr98478e87.7.1767630535563; 
 Mon, 05 Jan 2026 08:28:55 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b655143b5sm5936e87.85.2026.01.05.08.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 08:28:54 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 5 Jan 2026 17:28:52 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: urezki@gmail.com, akpm@linux-foundation.org, david@kernel.org,
 dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, mripard@kernel.org,
 sumit.semwal@linaro.org, v-songbaohua@oppo.com, zhengtangquan@oppo.com
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Message-ID: <aVvmxGUp2l0Tavwb@milan>
References: <aUlC6N1jmDbMDPc5@milan> <20251223212336.36249-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223212336.36249-1-21cnbao@gmail.com>
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

On Wed, Dec 24, 2025 at 10:23:34AM +1300, Barry Song wrote:
> > >  /*
> > >   * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
> > >   * flush caches.
> > > @@ -658,20 +672,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > >
> > >       WARN_ON(page_shift < PAGE_SHIFT);
> > >
> > > +     /*
> > > +      * For vmap(), users may allocate pages from high orders down to
> > > +      * order 0, while always using PAGE_SHIFT as the page_shift.
> > > +      * We first check whether the initial page is a compound page. If so,
> > > +      * there may be an opportunity to batch multiple pages together.
> > > +      */
> > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > -                     page_shift == PAGE_SHIFT)
> > > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> > >               return vmap_small_pages_range_noflush(addr, end, prot, pages);
> > Hm.. If first few pages are order-0 and the rest are compound
> > then we do nothing.
> 
> Now the dma-buf is allocated in descending order. If page0
> is not huge, page1 will not be either. However, I agree that
> we may extend support for this case.
> 
> >
> > >
> > > -     for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > > +     for (i = 0; i < nr; ) {
> > > +             unsigned int shift = page_shift;
> > >               int err;
> > >
> > > -             err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> > > +             /*
> > > +              * For vmap() cases, page_shift is always PAGE_SHIFT, even
> > > +              * if the pages are physically contiguous, they may still
> > > +              * be mapped in a batch.
> > > +              */
> > > +             if (page_shift == PAGE_SHIFT)
> > > +                     shift += get_vmap_batch_order(pages, nr - i, i);
> > > +             err = vmap_range_noflush(addr, addr + (1UL << shift),
> > >                                       page_to_phys(pages[i]), prot,
> > > -                                     page_shift);
> > > +                                     shift);
> > >               if (err)
> > >                       return err;
> > >
> > > -             addr += 1UL << page_shift;
> > > +             addr += 1UL  << shift;
> > > +             i += 1U << shift;
> > >       }
> > >
> > >       return 0;
> > >
> > > Does this look clearer?
> > >
I think so, at least the place:

<snip>
[    2.959030] Oops: Oops: 0000 [#66] SMP NOPTI
[    2.960004] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0+ #220 PREEMPT(none)
[    2.961781] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    2.963870] BUG: unable to handle page fault for address: ffffffff3fd68118
[    2.965383] #PF: supervisor read access in kernel mode
[    2.966532] #PF: error_code(0x0000) - not-present page
[    2.967682] BAD
<snip>

but it is broken for sure:

i += 1U << shift - "i" is an index in the page array.
For example if order-0 you jump 4096 indices ahead.

Should be: i += 1U << (shift - PAGE_SHIFT)

vmap_page_range() does flushing and it has instrumented KMSAN inside.
We should follow same semantic. Also it uses ioremap_max_page_shift as
maximum page shift policy.

--
Uladzislau Rezki
