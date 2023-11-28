Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02617FAF78
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 02:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3D510E40C;
	Tue, 28 Nov 2023 01:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228C510E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 01:20:49 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-41cba6e8e65so25754231cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 17:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701134448; x=1701739248;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GzX49nF8SiWuVdK7w0akp5E0dTX8yBNhts9C+qDJdRw=;
 b=LSDY3BpysGrc+CoZSWQJiONCAVXVQtXlXuaImPdJqdGNtxlklPWbJ1nufO/7aVEHCX
 thvvsUIAkG0OzZZ6/p41c8i7ktz3l1fQ/MFJa5rosjvarzfT0hpMiz5MSlIprxhqCyLf
 z0qzKtMziegL1XToTqulsbFimpUlliGn0yPjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701134448; x=1701739248;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GzX49nF8SiWuVdK7w0akp5E0dTX8yBNhts9C+qDJdRw=;
 b=OO/Pm0NfQt+Z2S85G5iYqyAbwpQzWpiAjl5Nrx7KAmV3JUWLVoXhCThOQos3YrXE8Q
 jjKNVvzlxecEQtA9d8yqleXMTjibbLXCKKtBDvIGbYlsz14RfT6d5tXxDasdlcG0h2nr
 FRt4cZrTtFG4F6yVcQ8yc2jDZ5y0fb/UTk/fciYf+vSiG5POR7s87KK6DMmqJlNrdtgu
 noVaFTctO1426k4REMXujS20FOF5ZqcdYiIIh7sapgThQTBvAYn3BqEoagdGF2e+QEAH
 YbFypTbQd3s0POgOvIlukqkHuhsmedS5U8a5XSqPToQmqw0oCIGtOanWUhAuc3hZ189y
 u2EQ==
X-Gm-Message-State: AOJu0YyRP5kKILuxklj0lxH7bmHg63zN2saXgR10fGdMUihZ1N9rsXaw
 70SfjtBn6XJtl86Y6eCexS571g==
X-Google-Smtp-Source: AGHT+IFamZIO8hF8tkJZE9Bgro1qMB3ojDtG/Q6kH5rdkqNuliozgB+d17Mc6UL4xmrPk8OrBk4jNg==
X-Received: by 2002:a05:622a:6a89:b0:423:a31f:665a with SMTP id
 ih9-20020a05622a6a8900b00423a31f665amr7867879qtb.13.1701134448093; 
 Mon, 27 Nov 2023 17:20:48 -0800 (PST)
Received: from google.com (193.132.150.34.bc.googleusercontent.com.
 [34.150.132.193]) by smtp.gmail.com with ESMTPSA id
 z25-20020ac86b99000000b003f6ac526568sm4179813qts.39.2023.11.27.17.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 17:20:47 -0800 (PST)
Date: Tue, 28 Nov 2023 01:20:46 +0000
From: Paz Zcharya <pazz@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Fix phys_base to be
 relative not absolute
Message-ID: <ZWVAbpzBq9wN2WFy@google.com>
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

On Wed, Nov 22, 2023 at 02:26:55PM +0100, Andrzej Hajda wrote:
> 
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
> >          gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
> >          gen8_pte_t pte;
> > 
> >          gte += base / I915_GTT_PAGE_SIZE;
> > 
> >          pte = ioread64(gte);
> >          phys_base = pte & I915_GTT_PAGE_MASK;
> > 
> > Regards
> > Andrzej
Hey Andrzej,

Sorry for the late response. I was OOO :)
I tried using the code you mentioned. It translates (in the very specific
case of MTL + GOP driver) to phys_base == 0080_0000h. Unfortunately, it
results in a corrupted screen -- the framebuffer is filled with zeros.

It seems like `i915_vma_pin_ww` already reserves and binds the GEM BO to the
correct address space independently of the value of `phys_base`.
The only thing `phys_base` affects is the value of `stolen->start`
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/gem/i915_gem_stolen.c#L747

So it seems to me that the maybe `phys_base` is named incorrectly and that it
does not reflect the physical address, but the start offset of
i915->mm.stolen_region.

I'm happy to run more tests / debug further.
Do you have more ideas of things to try?


Many thanks,
Paz
