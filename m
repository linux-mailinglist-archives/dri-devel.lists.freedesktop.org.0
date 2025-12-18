Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72181CCD773
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 21:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F9510E40F;
	Thu, 18 Dec 2025 20:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RsWpWBbJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA9010E40F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 20:05:17 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-88860551e39so7934266d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766088316; x=1766693116; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K2w2+c+YKiYKr2r9Xowor6oYCm9+yfeKolfOeIUsbJQ=;
 b=RsWpWBbJYRgO+/XwEYNgwVsGFeWU1EceMr1g3apelaKB3t87+qj9qgyN0ooZuYbGp2
 VGfHPJkWJjJK/K7n6mTH/0MKAb47ffyL+1Lr9QezOQ4D/IhqG5fv6d7NWCbUld47Wc+r
 DfKE/Ymxsd8gpO2zfBjiQf4ZucJNeOrE8eptaIiYkgjg7/ycEyAJ20hh+uB92eLbU2Wr
 bhXx8gvEynEF/SrXcgtsEi+lfEYIvJeyI1ml0L7fNcyOJb7zfRh/rBfWRPo9HyvTiolV
 O8zDG2QxqJ7A2sBdULvwf4nc8Btmf5TR/tDcCbq2ZXQkZ7m19Jev1xpvwqMV/A6qgWli
 JX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766088316; x=1766693116;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2w2+c+YKiYKr2r9Xowor6oYCm9+yfeKolfOeIUsbJQ=;
 b=kt+lTO7nXVR57r07c5ZnrWOOQ+ZtGdDyybSU3i5ueIlnB6FtaJ5SX1qi9ki2h2lK+b
 00HaOikPx2NKzLUA1tL7tk09Tp3t/4WhaqOTgAahsHtl5Jg/94VNNiB/ChQT2L/E4BpD
 2Ds0GAsI3R+d/eaWlMw5dOwSaVQNk6EbYdOJCkwdaqjBRXOEQnqlTJqUZhBXL+pOsZ48
 MQ8m1TFpDkBh5+UgIBF4LjWvrQ/X1pTtJR891GDBoSdSTm/j4kZ0uoAEwuPJsTsZxr5x
 iJQtAodHbG73MWbB1xPsx9Khc5MZkIbrs2yIxzCUa+hiFB2tsBgOVfHGX44crWTLuEeR
 LQXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl5ZYqy6xlwEGZWRtGGM80FcArce/lC1l4VseNddqGfaZtqhDYpIZj+biy0ozCVPT/dCJfl2viQ84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweyPBLhb7CvHTZ/iJpPYFeWKlFeNncmIDUgYssp42fNP3HeUy/
 +1rOOtcZ2b+uebMo0P3YOsdne4zTS0keFhQOkBLvn8lhNLoaQJK0/SJ837UuviqxeWTmdYXu0yL
 /p4m+Ufe5PP4mmjRmgpMU1E2ffS+0n4k=
X-Gm-Gg: AY/fxX7VnQfKqRbV0K2xK5r6Agh2dKEo8nq5GtTrKyCFbamZLkocVHXtgNC9NWf1sPt
 IxxKsuAQx1esd9q+rJU5TqAjSAu3oV2FL7WV5Y6E1fPsU41AjEdhOFWCGNs7YuQQh57zjQC1aqs
 UPvBhecZqJ536sAiHprdR+lDjJlypXMdg4dWztjAr+zOiyXUIfeMbAnzVaH0yBp3GnbyNjqsZC8
 0kjl8xym1UroT535V5++X60BhdxUm+oZtvcUq1q0cajNe1shJLw48BzOzFC25nxszFJFQ==
X-Google-Smtp-Source: AGHT+IGfIU5RGxtASwu3bgpX3b92cFmnR8DyddSN6GsrTR4BnDx7NubHp+pRDhWWPTmxwurkx7B44lRP57rfNIwWyMU=
X-Received: by 2002:a05:6214:4e07:b0:882:4488:482 with SMTP id
 6a1803df08f44-88d84434111mr12774246d6.62.1766088316168; Thu, 18 Dec 2025
 12:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20251215053050.11599-1-21cnbao@gmail.com> <aUQJEa643lQAGK6s@milan>
In-Reply-To: <aUQJEa643lQAGK6s@milan>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 19 Dec 2025 04:05:05 +0800
X-Gm-Features: AQt7F2raxnY_WBDzIdYwiT21G3LhQyvH-Z-k4m21oQXjYaLgAcLMtZPi1-shSsA
Message-ID: <CAGsJ_4zwqbg889+CTtO8XLQZu+rFs-m6+kANKO78-TAf4zjjaA@mail.gmail.com>
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
 dri-devel@lists.freedesktop.org, jstultz@google.com, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
 David Hildenbrand <david@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>
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

[...]
> >
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             unsigned int stride, unsigned int max_steps, unsigned int idx)
> > +{
> > +     int nr_pages = 1;
> > +
> > +     /*
> > +      * Currently, batching is only supported in vmap_pages_range
> > +      * when page_shift == PAGE_SHIFT.
> > +      */
> > +     if (stride != 1)
> > +             return 0;
> > +
> > +     nr_pages = compound_nr(pages[idx]);
> > +     if (nr_pages == 1)
> > +             return 0;
> > +     if (max_steps < nr_pages)
> > +             return 0;
> > +
> > +     if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
> > +             return compound_order(pages[idx]);
> > +     return 0;
> > +}
> > +
> Can we instead look at this as: it can be that we have continues
> set of pages let's find out. I mean if we do not stick just to
> compound pages.

We use PageCompound(pages[0]) and compound_nr() as quick
filters to skip checking the contiguous count, and this is
now the intended use case. Always checking contiguity might
cause a slight regression, I guess.

BTW, do we have a strong use case where GFP_COMP or folio is
not used, yet the pages are physically contiguous?

Thanks
Barry
