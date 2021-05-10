Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6316379FBC
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 08:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB226E9BF;
	Tue, 11 May 2021 06:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0D86E4CA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 17:57:19 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id k19so14165005pfu.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mWPrNb69nyGWKI0m9pPGW0IsoOENSpHi4HuteUPIllA=;
 b=WDir0qDOMsL25iK8wuf0VwNf0hPuuhOqUjjIVr1hs7XzcxFvbzfzYbFkdx/sh9mljA
 1j3r5+a480WbR1tiGdAGMc75YHoI0pWIg1rBqEVgUfMYWxjA8ZHrhNHj2pd2/8iAlJB3
 sfcnzbav23KQ6dzUy2Z0rWCgkThAw+d2CBVFPzYeT8htkYT+muYNLyNGbzHzWUMRWPUf
 9tdzV2Im41JBWIiZLskLQGpj0ERl0rBZNSWHYrwPKUQD8N2F23w1M3xGeP8qAW2tMSoZ
 GUP5y2jtRz6EtzZTPRO0KyFrNDU+cJ0rqnkbYZuw1wJeYbmYfrrKCXk9NNQmDdnhDo8N
 GaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mWPrNb69nyGWKI0m9pPGW0IsoOENSpHi4HuteUPIllA=;
 b=FI62hZvilL2jIne0YgnZoh5//gx3iiwoMnoTb0fZhWvtSCuqqjhw2L0Vo5TuJ//8uN
 do03kBRiLhokZcvfsKOGL3Aywj6oCkjUXDeuB0mpmGIshyBfoW3dZ/UhQP1scMXiCpU2
 ElW02h3apHGsAjMaS/fjOLcxtIqmwxNFdi1rAtzhBfaTRlUt4lPpPQmZERf31THKIWVk
 U5/JkpN8zUhKb1+U8tEgnUHppyiGl63r2w6565QIuCaiJp3nuqUTYnX/mwPMWOWxauzg
 q9SSVaaMZRzDyK8+bOR2ikLLQpRpV96TNbP4IWgzwXoA84gHZZOVKKs47y0ZZz0w1usp
 NvJg==
X-Gm-Message-State: AOAM530RZDzhQI9PpnMfXOaUTK8DLI6HtoRX11MiMQ4aRC1mOMQ3QnrF
 wGwE8+vWvStTPJdj+U2CdUigjA==
X-Google-Smtp-Source: ABdhPJxGmr5OAWApep3UYINJrGM2ui/EZ9ttx3t/4ewaXx+5Bt9eSw10BXX2oHyBKAcRoxeHzRohHg==
X-Received: by 2002:a62:d108:0:b029:25d:497e:2dfd with SMTP id
 z8-20020a62d1080000b029025d497e2dfdmr26602164pfg.29.1620669438673; 
 Mon, 10 May 2021 10:57:18 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com.
 [35.247.111.240])
 by smtp.gmail.com with ESMTPSA id s21sm11918766pjn.29.2021.05.10.10.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 10:57:18 -0700 (PDT)
Date: Mon, 10 May 2021 17:57:14 +0000
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <YJlz+p787mK8tAh+@google.com>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <20210510135031.GF2047089@ziepe.ca>
 <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
 <20210510153412.GG2047089@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510153412.GG2047089@ziepe.ca>
X-Mailman-Approved-At: Tue, 11 May 2021 06:36:25 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux-MM <linux-mm@kvack.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Paolo

On Mon, May 10, 2021, Jason Gunthorpe wrote:
> On Mon, May 10, 2021 at 04:55:39PM +0200, Daniel Vetter wrote:
> 
> > yeah vfio is still broken for the case I care about. I think there's
> > also some questions open still about whether kvm really uses
> > mmu_notifier in all cases correctly, 
> 
> IIRC kvm doesn't either.

Yep, KVM on x86 has a non-trivial number of flows that don't properly hook into
the mmu_notifier.  Paolo is working on fixing the problem, but I believe the
rework won't be ready until 5.14.
