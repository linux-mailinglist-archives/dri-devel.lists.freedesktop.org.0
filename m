Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F82C9BB3A
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 15:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC05E10E63E;
	Tue,  2 Dec 2025 14:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jZYIc7Kh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F0E10E63E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 14:03:16 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37a5bc6b491so47104931fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 06:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764684194; x=1765288994; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Qv1K7J2piWEBLYsmYS5El8b8US/OwNpgXHLpQ7GMrlY=;
 b=jZYIc7Khw/UUQbPa7vWMil5NTaeX0VL5b/XtSHMvpHtaXycpQcW9ja3DVue2ObBf5F
 LnL1Bl8+MZXafsxsGVLfA2tfMan4yLsFpd0/DdSXnLBgho9GUE39IB0oYpVsKyIPjI6k
 eYKMjFboVLg8VmzViiOnbJJageWWOMEO9P1lDOgGDaqXR+c/Bor55H2yTr0OQi1f2NTS
 x4xYqsd5sBErKNyhrG2nZjHV/6sbZ2zMWG+lvDFfl+CCZQOsp7sjsCTui2fKu3wr+1Bx
 MZwLkazOnJzT/4sx6QeEikgzcnFQee2ZpS/GXct0AO4GyXqsq7UGHuT7A815UtKoJqu8
 CrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764684194; x=1765288994;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qv1K7J2piWEBLYsmYS5El8b8US/OwNpgXHLpQ7GMrlY=;
 b=kKs13J78F0dAz0TuwxViQM+/dOu08bRHWq2E81+N7K3WpfgEq0fWybqqSBZJ1yye0o
 vf+MpExxkJYGrZ192UctqjPYIlKwRsbQEqLlMgbat9JYLTBqMeKX2QOSEtQ/dxVfi+WY
 egad1/nEi4AtZnCsIUT1gPY+zFw7Ac5UOzyig6yW6Oaq0OCLiM8jvEkgD0GFolRdReIx
 pLygJjVokQ39EHZABlEHsZsuDzhoaXkIrRu3W06s56fqMQDn6DWs+oAaCi87KIcnJCem
 BxytfCWpkTCSPNuctwgGOZFQDI/ASnBK1qVnTMv9yd/7+BxkoY3yxFph6LmQWSXxprjs
 E1Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqT+sad+dhzLxHDI/U+Q0AyzXaRfn27nW+tMNJlLKw1arpSfx/w9s2nx+4a3c8z6D5dH6BHfKcZwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0+PAv9LQddCv0O2yZL/kSZKWY0Qi+U+rtC2ytl51s02qQNQpY
 tuoz/4wBrL9uuAkDnuQ7oXagdTpkzgV1mdu2FbRyqfRZ0vnivxvvVW+A
X-Gm-Gg: ASbGncve/uk0YoLmZ2/L6szC9uTRI5VfZjLYpaEfN+MY5JaX5QV07LLpxtgZg6BHUTN
 kIWhXyEdWk0jqQBM0hs0kvlKZMGA5EaHpYYZJUJdkZWMi71Ev6y1j4mo3F81lOBKwkk0zWPVhPW
 oU921sDK+12yvgOKVq4vKYH5wS+qzRUq3NIcirnCTxXvKB4BjhRNt81ZdPBdHEk7QVQXGK0zeIz
 MihmfGVmRwKKHDw0v8xQdcF8T2mEoJNB1f7CZWqeAGm8mH5JjvJcpjALIfGH1on5FT+DsNm4SBz
 QvSFFkRDMD7gYGccc2wmuX+d6dtP2BkjgBBwqlf/AlnLMLSAHTZ9ggJSHWpVTupSMSAgojTJ/Qp
 a1simgELnykzsRGxXgsmmHvV1Qw+9bbyQ65FjdTNB8nFQF6VbY32PGfgF2NVDn7oR9RKeWC3u7X
 imqG2F1pLocdsgeB9abRIWnaO3BlL0mBKp
X-Google-Smtp-Source: AGHT+IFMPwW4Ci4ma2kd/bf6E5zfBDbaLqbg0ejouUGZkkjz6Fd31OThqfP5IxcvJU8zZMZi6pGF4A==
X-Received: by 2002:a05:6512:1149:b0:595:90f9:b9d2 with SMTP id
 2adb3069b0e04-596a3ea67c2mr17072594e87.3.1764684193847; 
 Tue, 02 Dec 2025 06:03:13 -0800 (PST)
Received: from pc636 (host-95-203-3-14.mobileonline.telia.com. [95.203.3.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bfa48c5dsm4644152e87.77.2025.12.02.06.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 06:03:12 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 2 Dec 2025 15:03:10 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever
 possible
Message-ID: <aS7xnhxNhJ71cJRb@pc636>
References: <20251122090343.81243-1-21cnbao@gmail.com> <aSiB-UsunuE7u295@milan>
 <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com>
 <aS13J6U-QMOrwwbs@milan>
 <CAGsJ_4yGLdhk84Ent8VRcE4_2Am_U=bXTVdV2LHDBtD2OZs8xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yGLdhk84Ent8VRcE4_2Am_U=bXTVdV2LHDBtD2OZs8xg@mail.gmail.com>
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

On Tue, Dec 02, 2025 at 06:05:56AM +0800, Barry Song wrote:
> On Mon, Dec 1, 2025 at 7:08 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Fri, Nov 28, 2025 at 04:43:54AM +0800, Barry Song wrote:
> > > > >
> > > > > +     /*
> > > > > +      * Some users may allocate pages from high-order down to order 0.
> > > > > +      * We roughly check if the first page is a compound page. If so,
> > > > > +      * there is a chance to batch multiple pages together.
> > > > > +      */
> > > > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > > > -                     page_shift == PAGE_SHIFT)
> > > > > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> > > > >
> > > > Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:
> > >
> > > This is not the case for vmalloc, but applies to dma-bufs that are allocated
> > > using alloc_pages() with GFP_COMP.
> > >
> > > #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
> > > #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> > >                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> > >                                 | __GFP_COMP)
> > >
> > > >
> > > > /*
> > > >  * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
> > > >  * This gfp lists all flags currently passed through vmalloc. Currently,
> > > >  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
> > > >  * and BPF also use GFP_USER. Additionally, various users pass
> > > >  * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
> > > >  */
> > > > #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
> > > >                                __GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
> > > >                                GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOUNT |\
> > > >                                GFP_USER | __GFP_NOLOCKDEP)
> > > >
> > > > Could you please clarify when PageCompound(pages[0]) returns true?
> > > >
> > >
> > > In this case, dma-buf attempts to allocate as many compound high-order pages
> > > as possible, falling back to 0-order allocations if necessary.
> > >
> > OK, it is folio who uses it.
> >
> > > Then, dma_buf_vmap() is called by the GPU drivers:
> > >
> > >  1    404  drivers/accel/amdxdna/amdxdna_gem.c <<amdxdna_gem_obj_vmap>>
> > >              dma_buf_vmap(abo->dma_buf, map);
> > >    2   1568  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
> > >              ret = dma_buf_vmap(dmabuf, map);
> > >    3    354  drivers/gpu/drm/drm_gem_shmem_helper.c
> > > <<drm_gem_shmem_vmap_locked>>
> > >              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> > >    4     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> > > <<etnaviv_gem_prime_vmap_impl>>
> > >              ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
> > >    5    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
> > >              ret = dma_buf_vmap(bo->tbo.base.dma_buf, map);
> > >    6     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
> > >              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> > >
> > Thank you for clarification. That would be good to reflect it in the
> > commit message. Also, please note that:
> 
> Sure.
> 
> >
> > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > -                     page_shift == PAGE_SHIFT)
> > > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> > >
> > we rely on page_shift == PAGE_SHIFT condition for the non-sleep vmalloc()
> > allocations(GFP_ATOMIC, GFP_NOWAIT), so we go via vmap_small_pages_range_noflush()
> > path. Your patch adds !PageCompound(pages[0]) also. It is not a problem
> > since it is vmap() path but we need to comment that.
> 
> Sure. Would the following work?
> 
>         /*
>          * For vmap(), users may allocate pages from high orders down
> to order 0,
>          * while always using PAGE_SHIFT as the page_shift.
>          * We first check whether the initial page is a compound page. If so,
>          * there may be an opportunity to batch multiple pages together.
>          */
>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
>                         (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
>                 return vmap_small_pages_range_noflush(addr, end, prot, pages);
> 
Sounds good!

Thank you.

--
Uladzislau Rezki
