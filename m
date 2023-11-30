Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 397927FF501
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF0110E731;
	Thu, 30 Nov 2023 16:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F2B10E72E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:25:02 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-67a8a6d104bso2434816d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 08:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701361502; x=1701966302;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=my1t1P8SWkl8MqywnACtSrV/Cg5hc9HpmKaWspyD2aI=;
 b=gCRzNUj3JSQY95I4jQB6wMSuqzX5JUrzAuKyOb2tcxTL3td2SACcTc1NQl5nVy0TH8
 Z9i8GiysEEHxNIKYjxpY6jxGIX1CZigoAC8TS3c+gM0/0arzMfVpQ60PV5qBKpHFeTGQ
 zKLfi3LWAh/x4QZGfIhsDrY/ZTB1xdZ2uigjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701361502; x=1701966302;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=my1t1P8SWkl8MqywnACtSrV/Cg5hc9HpmKaWspyD2aI=;
 b=tchI9mXO6udm0B0zpYB2Vws1D6HraAPKtNosBHKdobV8elvTjTuVbSKmIl/pRXFJ/S
 LiL62YUw0rRILj/5HRnJwGW2lQN1PYPX/LUu8LcGfiwQMNfShpksPzBYlNNyrappRUTI
 zlbmnEmdC9LWu5KEcbEQhe4XzplOszB4m7WMBJe7GuJtCkdoda1XUulwYkm1t4i6eDoT
 kHSgcPlRyNp6OmKPg50LcVzgg4001T0NHbhNeUdgop06wjSjsZO9sjYMSxKArwFQq9xh
 Bqspba2VNnr/wKqgFolByDFdpErnWasKkn9N9wGWeMgWTRxRQCbjzyB4+/zQAsA+cfKe
 WDEg==
X-Gm-Message-State: AOJu0YzG6p9COl4xAHGbVQ9xtt6+nnHDvtBML3fDf1EikQ7WUEumjaxi
 LH2ihSwu+jOL3JsPkHwW6MC39g==
X-Google-Smtp-Source: AGHT+IFawe0Afhp7iXVnLrDiPGhZ2DR+S4GaJyZefC4rp8NXx7yyA8UAxN/lcHVi7V5Lj1egodPtCA==
X-Received: by 2002:ad4:5249:0:b0:67a:33b5:594c with SMTP id
 s9-20020ad45249000000b0067a33b5594cmr16998574qvq.13.1701361501693; 
 Thu, 30 Nov 2023 08:25:01 -0800 (PST)
Received: from google.com (193.132.150.34.bc.googleusercontent.com.
 [34.150.132.193]) by smtp.gmail.com with ESMTPSA id
 b18-20020a0c9b12000000b0065b13180892sm641645qve.16.2023.11.30.08.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 08:25:01 -0800 (PST)
Date: Thu, 30 Nov 2023 16:24:59 +0000
From: Paz Zcharya <pazz@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Fix phys_base to be
 relative not absolute
Message-ID: <ZWi3WzM6kYRotWrd@google.com>
References: <20231105172718.18673-1-pazz@chromium.org>
 <ZVQ3d8FFqxsy0OX7@intel.com> <ZVfw3ghfBLdHB7uk@google.com>
 <8dd6f4da-dcc9-4ea3-8395-bf048b0dbc93@intel.com>
 <6f08cfee-a60b-4f6e-b69a-20517c563259@intel.com>
 <ZWVizpRkf5iJ2LnQ@google.com>
 <51baffb9-2249-4080-a245-eb1e03c02b9b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51baffb9-2249-4080-a245-eb1e03c02b9b@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 matthew.auld@intel.com, Marcin Wojtas <mwojtas@chromium.org>,
 Drew Davenport <ddavenport@chromium.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 12:12:08PM +0100, Andrzej Hajda wrote:
> On 28.11.2023 04:47, Paz Zcharya wrote:
> > 
> > On Mon, Nov 27, 2023 at 8:20 PM Paz Zcharya <pazz@chromium.org> wrote:
> > > 
> > > On 21.11.2023 13:06, Andrzej Hajda wrote:
> > > 
> > > > The simplest approach would be then do the same as in case of DGFX:
> > > >           gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
> > > >           gen8_pte_t pte;
> > > > 
> > > >           gte += base / I915_GTT_PAGE_SIZE;
> > > > 
> > > >           pte = ioread64(gte);
> > > >           phys_base = pte & I915_GTT_PAGE_MASK;
> > > > 
> > > > Regards
> > > > Andrzej
> > 
> > Hey Andrzej,
> > 
> > On a second thought, what do you think about something like
> > 
> > +               gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
> > +               gen8_pte_t pte;
> > +               gte += base / I915_GTT_PAGE_SIZE;
> > +               pte = ioread64(gte);
> > +               pte = pte & I915_GTT_PAGE_MASK;
> > +               phys_base = pte - i915->mm.stolen_region->region.start;
> > 
> > The only difference is the last line.
> 
> Bingo :) It seems to be generic algorithm to get phys_base for all
> platforms:
> - on older platforms stolen_region points to system memory which starts at
> 0,
> - on DG2 it uses lmem region which starts at 0 as well,
> - on MTL stolen_region points to stolen-local which starts at 0x800000.
> 
> So this whole "if (IS_DGFX(i915)) {...} else {...}" could be replaced
> with sth generic.
> 1. Find pte.
> 2. if(IS_DGFX(i915) && pte & GEN12_GGTT_PTE_LM) mem =
> i915->mm.regions[INTEL_REGION_LMEM_0] else mem = i915->mm.stolen_region
> 3. phys_base = (pte & I915_GTT_PAGE_MASK) - mem->region.start;
> 
> Regards
> Andrzej
> 
> 

Hey Andrzej,

I uploaded https://patchwork.freedesktop.org/series/127130/ based on
algorithm. Please take a look and let me know if you'd like me to change
anything.

Really appreciate all of your help!


Best,
Paz

