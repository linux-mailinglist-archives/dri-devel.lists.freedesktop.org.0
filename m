Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D960ECCC1F9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE1310E812;
	Thu, 18 Dec 2025 13:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QZeOSMqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D979310E812
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:55:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5942bac322dso784141e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766066101; x=1766670901; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HDnXzSjtYaHM4x40x58+Blau4mKWsjcizNbfaizYC4s=;
 b=QZeOSMqXhAdMjWM+F4k8d+Akap4Js5XKZo0j/Rg9GQxBlufPwcnwsxFtAaXmqoNpWj
 xiDc7nP/Fwy+63hejmVSdKORn88TkXIM5RL+F6ZSGx+NqCRv5idPsU6wBmmOl0vLMubK
 HyjyhWKYcUJop1n0309bDbYfEq43LbEoyofakevzKKWlfujrzMOSPuf/nMvQnwYQqBwS
 wHjrmZIePRlDJQ9OmleSB4Fa7VJr4w5fYJxcThVEZZevoWsu2g/ApPYyHC4lzvpdoqtQ
 NW60pkicA2nx2KwdsEiGLKz791bO8kaka1wUMwxbFNQ2KIhROPEDO497fWmjjJ5nD1yd
 6rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766066101; x=1766670901;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HDnXzSjtYaHM4x40x58+Blau4mKWsjcizNbfaizYC4s=;
 b=lu3g1yMT9UjMqnhIS57/e+DAc8Eac40/BR8Op5wfptQ5k57GRGOCfCLmoCBCRxr26I
 6jOOoquJEYdxBhm0AAqRT+CFv/reMofE3Fh2P2Z6BpbyDOHQzdZ+JHGyIFYRtG3bCFYa
 /n6vcg/NdlCt6wOxTRLa4u5gjIhMa7Rg0mmPGonGSJWG6YQ+jQbfiMfeT4Y/QGhMU0QA
 nQR7PNqcvzZLYHjuf0XaXimQq4+VJ9X29V4029CxcA2siQzXcaI4dfzfBQy4X/LTJc1S
 qDiLqfFqTSkWCkIwrzywuH9qYEKIHT5qneAIVL9HEV/KGzi08mJT5QpLF76pIRbbI8yr
 UKgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPQd2iyKAfg+kZ5uLftVZrGUiysN8lZx/k25SnYBYzhuUfa+pCmFwI+CknqJHbv5MqEqQF3g88CZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySGeV90BNKq+D1CGe1AA5pqycZ/O1Aiw3ZlyB8bgHEtkO/GVFB
 Eelr3kxO7ae/iJOytDrGr69ubpPNZMo5fDreI0m3Xv5qh0x4UKYMtopd
X-Gm-Gg: AY/fxX5P3eDpwWa7jSsPNHgocxgKBBezk9YM1qYegWELXKrPbjp4YHpUIG9Cy57A2sY
 sw+W4mwSdljkwZ4f9b5xk4BXNOJRdHRKcuI9tyYCt4XK6BnRAw+HTh7KVKwuqB9LgioHCRUFQpk
 lx2HH6csWzsCD1zt5qwz0N0oePa/1/NvyKfCf0vcSJYzjxcsOqeIz0TZNa3GCZoNKivsKShSPk7
 mZEQTq2TIH45l2fo+2Onxqkd3UM+EpfxjF13d3fUEGX1dfrt8F90+FeCdP5jrnoPnyg5JScmPq5
 eijPPwm/EfY9HwTWLz0p3DPfQnXKu9v2mM6SB6OIS2cRdbGCPi6sJvDUmx/iRw3V1hQ++sDSN1Y
 nAlpo/dXgq+gYiULgtcra9ZBaKKP98o6otY8MneqCFvEdPblEyHsr
X-Google-Smtp-Source: AGHT+IFEs/IPmhycLdgTpBPBgGa1eUvj3QCPpB/NO2gh7wKbNs6ilucY3zYK/1hGd6Pg8xIq9YxpJw==
X-Received: by 2002:a05:6512:6783:b0:596:51d0:9373 with SMTP id
 2adb3069b0e04-598faa4d58emr5189309e87.24.1766066100616; 
 Thu, 18 Dec 2025 05:55:00 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a13506b2dsm1116848e87.95.2025.12.18.05.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 05:55:00 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 18 Dec 2025 14:54:58 +0100
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Barry Song <21cnbao@gmail.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 jstultz@google.com, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>, Uladzislau Rezki <urezki@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Message-ID: <aUQHss6K8b_esvpw@milan>
References: <20251215053050.11599-1-21cnbao@gmail.com>
 <e7c8478b-1ce4-4a15-a185-de9d9121438c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7c8478b-1ce4-4a15-a185-de9d9121438c@kernel.org>
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

On Thu, Dec 18, 2025 at 02:01:56PM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/15/25 06:30, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> > 
> > In many cases, the pages passed to vmap() may include high-order
> > pages allocated with __GFP_COMP flags. For example, the systemheap
> > often allocates pages in descending order: order 8, then 4, then 0.
> > Currently, vmap() iterates over every page individually—even pages
> > inside a high-order block are handled one by one.
> > 
> > This patch detects high-order pages and maps them as a single
> > contiguous block whenever possible.
> > 
> > An alternative would be to implement a new API, vmap_sg(), but that
> > change seems to be large in scope.
> > 
> > When vmapping a 128MB dma-buf using the systemheap, this patch
> > makes system_heap_do_vmap() roughly 17× faster.
> > 
> > W/ patch:
> > [   10.404769] system_heap_do_vmap took 2494000 ns
> > [   12.525921] system_heap_do_vmap took 2467008 ns
> > [   14.517348] system_heap_do_vmap took 2471008 ns
> > [   16.593406] system_heap_do_vmap took 2444000 ns
> > [   19.501341] system_heap_do_vmap took 2489008 ns
> > 
> > W/o patch:
> > [    7.413756] system_heap_do_vmap took 42626000 ns
> > [    9.425610] system_heap_do_vmap took 42500992 ns
> > [   11.810898] system_heap_do_vmap took 42215008 ns
> > [   14.336790] system_heap_do_vmap took 42134992 ns
> > [   16.373890] system_heap_do_vmap took 42750000 ns
> > 
> 
> That's quite a speedup.
> 
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Uladzislau Rezki <urezki@gmail.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: John Stultz <jstultz@google.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >   * diff with rfc:
> >   Many code refinements based on David's suggestions, thanks!
> >   Refine comment and changelog according to Uladzislau, thanks!
> >   rfc link:
> >   https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> > 
> >   mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
> >   1 file changed, 39 insertions(+), 6 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 41dd01e8430c..8d577767a9e5 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >   	return err;
> >   }
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +		unsigned int stride, unsigned int max_steps, unsigned int idx)
> > +{
> > +	int nr_pages = 1;
> 
> unsigned int, maybe
> 
> Why are you initializing nr_pages when you overwrite it below?
> 
> > +
> > +	/*
> > +	 * Currently, batching is only supported in vmap_pages_range
> > +	 * when page_shift == PAGE_SHIFT.
> 
> I don't know the code so realizing how we go from page_shift to stride too
> me a second. Maybe only talk about stride here?
> 
> OTOH, is "stride" really the right terminology?
> 
> we calculate it as
> 
> 	stride = 1U << (page_shift - PAGE_SHIFT);
> 
> page_shift - PAGE_SHIFT should give us an "order". So is this a
> "granularity" in nr_pages?
> 
> Again, I don't know this code, so sorry for the question.
> 
To me "stride" also sounds unclear.

--
Uladzislau Rezki
