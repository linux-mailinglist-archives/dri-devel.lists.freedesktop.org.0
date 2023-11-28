Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3100A7FB0AC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 04:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA7B10E41D;
	Tue, 28 Nov 2023 03:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0674210E41D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 03:47:29 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3b85c88710eso1709484b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 19:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701143248; x=1701748048;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GVpyKgOAQAjrhknJpFAGo50iMbjyJYlCx/CCVK+Isf8=;
 b=G2w87gRxe6cAv3IcYclbW9R4aP3qBlq8Ppu8ceCUq845HVOKe1v/4NPInMW4E3kL6m
 EiwEASuapy7RPXEypX3AzeFDZsVtCgPQn/fL3NWtw4V8NhqhTmDs9uUyV4C7NduWtZKh
 C1SdLYlWN0cqLVxPmD4orUz9qLkpd7aeP60M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701143248; x=1701748048;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GVpyKgOAQAjrhknJpFAGo50iMbjyJYlCx/CCVK+Isf8=;
 b=upDIVWsWop49nEcyXMslAKHIkCgG7IIVEPplIk3bHluCRsIPpx/NEBlrr9mA8S42sX
 M12OaL0TZ7g/wzBqbC2f9tdCQJE0GVb8Q5DSliyT1hAlzhwUOWU97jztSeVhBg2nDjn5
 ceny1XTNJeexzTcBOfET6Uvs8JUFrDbHTmfOZ1YXudAc2BD6aLWAFZUwcvm+xF/k9Gbz
 HKjvreiXGuffXtZq3M4DkB6fA6rCVnA52obB9sp/1Pt5Noo6ALw6OedNwcLXfoZw/32J
 LY8EvAFwrZYNepAHhG126q1Y6fYY6S0VrqBaOlyIHne4Y4RA1RjCO6H3qaa3VXS1MkbK
 T1nQ==
X-Gm-Message-State: AOJu0YyEG3tEohRmlChRriOe9nVvOMSgiVwGZ7jUjl+m3OwdTdXniXAi
 OzSRrPEP27hTpG5rm9cxQgItVQ==
X-Google-Smtp-Source: AGHT+IEBjnPiJn6iWJLu7YX98L4ojQv3g8KXQa8fjJb4ZSIU2ly5q9i5nliKZY6K4o7RjmpmG+uNzQ==
X-Received: by 2002:a05:6358:724c:b0:16d:fb29:d78 with SMTP id
 i12-20020a056358724c00b0016dfb290d78mr13055265rwa.2.1701143248083; 
 Mon, 27 Nov 2023 19:47:28 -0800 (PST)
Received: from google.com (193.132.150.34.bc.googleusercontent.com.
 [34.150.132.193]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac84502000000b00423829b6d91sm4242296qtn.8.2023.11.27.19.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 19:47:27 -0800 (PST)
Date: Tue, 28 Nov 2023 03:47:26 +0000
From: Paz Zcharya <pazz@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Fix phys_base to be
 relative not absolute
Message-ID: <ZWVizpRkf5iJ2LnQ@google.com>
References: <20231105172718.18673-1-pazz@chromium.org>
 <ZVQ3d8FFqxsy0OX7@intel.com> <ZVfw3ghfBLdHB7uk@google.com>
 <8dd6f4da-dcc9-4ea3-8395-bf048b0dbc93@intel.com>
 <6f08cfee-a60b-4f6e-b69a-20517c563259@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f08cfee-a60b-4f6e-b69a-20517c563259@intel.com>
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
Cc: Subrata Banik <subratabanik@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 Marcin Wojtas <mwojtas@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 matthew.auld@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Drew Davenport <ddavenport@chromium.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, Nov 27, 2023 at 8:20 PM Paz Zcharya <pazz@chromium.org> wrote:
>
> On 21.11.2023 13:06, Andrzej Hajda wrote:
> > On 18.11.2023 00:01, Paz Zcharya wrote:
> > > On Tue, Nov 14, 2023 at 10:13:59PM -0500, Rodrigo Vivi wrote:
> > > > On Sun, Nov 05, 2023 at 05:27:03PM +0000, Paz Zcharya wrote:
> > >
> > > Hi Rodrigo, thanks for the great comments.
> > >
> > > Apologies for using a wrong/confusing terminology. I think 'phys_base'
> > > is supposed to be the offset in the GEM BO, where base (or
> > > "Surface Base Address") is supposed to be the GTT offset.
> >
> > Since base is taken from PLANE_SURF register it should be resolvable via
> > GGTT to physical address pointing to actual framebuffer.
> > I couldn't find anything in the specs.
>
> It was quite cryptic. I meant I have not found anything about assumption
> from commit history that for iGPU there should be 1:1 mapping, this is why
> there was an assignment "phys_base = base". Possibly the assumption is not
> valid anymore for MTL(?).
> Without the assumption we need to check GGTT to determine phys address.
>
> > The simplest approach would be then do the same as in case of DGFX:
> >          gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
> >          gen8_pte_t pte;
> >
> >          gte += base / I915_GTT_PAGE_SIZE;
> >
> >          pte = ioread64(gte);
> >          phys_base = pte & I915_GTT_PAGE_MASK;
> >
> > Regards
> > Andrzej

Hey Andrzej,

On a second thought, what do you think about something like

+               gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
+               gen8_pte_t pte;
+               gte += base / I915_GTT_PAGE_SIZE;
+               pte = ioread64(gte);
+               pte = pte & I915_GTT_PAGE_MASK;
+               phys_base = pte - i915->mm.stolen_region->region.start;

The only difference is the last line.

Based on what I wrote before, I think `phys_base` is named incorrectly and
that it does not reflect the physical address, but the start offset of
i915->mm.stolen_region. So if we offset the start value of the stolen
region, this code looks correct to me (and it also works on my
MeteorLake device).

What do you think?


Many thanks,
Paz

