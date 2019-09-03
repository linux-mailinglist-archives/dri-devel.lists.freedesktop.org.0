Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416F4A7C75
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9220E893CD;
	Wed,  4 Sep 2019 07:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682D6894FE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 07:36:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k1so16883844wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 00:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+Dv55tyGyqXMrZX83SwrRIU+i9nALQjaNWq68c03GXI=;
 b=uKGzrNQOrReoNazu6hi4XKZorT4ZZyJBWkAuw66Bbo3z5pJSX8om3eOmO22xMqX9QI
 VyluPgV4iTYJelrvBKkslU/KWvDn6XqkJVCjmVaN5ozhtjDoHzk13UWVRFVb0xiqNZS/
 uiHBEosLHdmwl6tX45vL9GmrskWUSJeH3VeleQoA6AUQKemBmkqX2ENhn5I54Aq04b5m
 Bp/SUXY82cyggB0G39rCH9L7k8D4gQUlG0oj2prS87K3PIJRuD8s6jzWJrFAVOACATxv
 eZZ7UcNTzmTH+gjeEivk4A9trwADPQw/89Lp7HgTPR9etEytAMw6TfaWwXyvU0Cfm6Xd
 kCMA==
X-Gm-Message-State: APjAAAXndyfY2uWTzWUkycqjGTxAGpLM03NI6oufVFBt989W5IO8HIHX
 kus+NM9Q14/M63vWrIwvWu8zbA==
X-Google-Smtp-Source: APXvYqyxuGiS8BcsynmmU6sW7DpxWQ4xWRBDdJxslrhLv19Q6kkbrC33NvvCD/8YfCrP44tF4Jl5rA==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr9353932wma.165.1567496205721; 
 Tue, 03 Sep 2019 00:36:45 -0700 (PDT)
Received: from ziepe.ca ([193.47.165.251])
 by smtp.gmail.com with ESMTPSA id g26sm14684174wmh.32.2019.09.03.00.36.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Sep 2019 00:36:45 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i53Mq-00012C-1s; Tue, 03 Sep 2019 04:36:44 -0300
Date: Tue, 3 Sep 2019 04:36:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/5] kernel.h: Add non_block_start/end()
Message-ID: <20190903073644.GB4500@ziepe.ca>
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
 <20190826201425.17547-4-daniel.vetter@ffwll.ch>
 <20190827225002.GB30700@ziepe.ca>
 <CAKMK7uHKiLwXLHd1xThZVM1dH-oKrtpDZ=FxLBBwtY7XmJKgtA@mail.gmail.com>
 <20190828184330.GD933@ziepe.ca>
 <CAKMK7uFJESH1XHTCqYoDb4iMfThxnib3Uz=RUcd7h=SS-TJWbg@mail.gmail.com>
 <CAKMK7uET7GL-nmRd_wxkxu0KsiYiSZcGTsSstcUpqaT=mKTbmg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uET7GL-nmRd_wxkxu0KsiYiSZcGTsSstcUpqaT=mKTbmg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 04 Sep 2019 07:14:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+Dv55tyGyqXMrZX83SwrRIU+i9nALQjaNWq68c03GXI=;
 b=Ljbpw4fhx6QxNHXels3qpp2aUOAk8vlbavDiQesD0cWLwVLty3aJba0Mv+G14WwXUY
 J6tOlIq7x99iKlJszy6ygTHrSVdJhXdK4R9c4ECB9cFI7FJHkU28AdmbdsPcfR2wey5T
 2uIj2Q78IAXWGJXaFwa7ksHJsfhMYzZrLIq9OiOBFzhKliEPePgfxIZGvexZhC2kwGKF
 VpZXEbGPaBuzF/kmA5CnRXOJPjaPLFjCeCMyCghU1hffYinkPrhF89gIm5WmpAAaQTiZ
 5SR9ZaIV7l/UyhZjbRsOTLtl+1e1D599Ms4rDFsEtWiyRYSo254B1+YiLiOMYVPmDxGH
 PHtQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDk6Mjg6MjNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gPiBDbGVhbmVzdCB3b3VsZCBiZSBhIG5ldyBoZWFkZXIgSSBndWVzcywgdG9nZXRo
ZXIgd2l0aCBtaWdodF9zbGVlcCgpLgo+ID4gQnV0IG1vdmluZyB0aGF0IGlzIGEgYml0IG11Y2gg
SSB0aGluaywgdGhlcmUncyBhbG1vc3QgNTAwIGNhbGxlcnMgb2YKPiA+IHRoYXQgb25lIGZyb20g
YSBxdWljayBnaXQgZ3JlcAo+ID4KPiA+ID4gSWYgZHJvcHBpbmcgZG8gd2hpbGUgaXMgdGhlIG9u
bHkgY2hhbmdlIHRoZW4gSSBjYW4gZWRpdCBpdCBpbi4uCj4gPiA+IEkgdGhpbmsgd2UgaGF2ZSB0
aGUgYWNrcyBub3cKPiA+Cj4gPiBZZWFoIHNvdW5kcyBzaW1wbGVzdCwgdGhhbmtzLgo+IAo+IEhp
IEphc29uLAo+IAo+IERvIHlvdSBleHBlY3QgbWUgdG8gcmVzZW5kIG5vdywgb3IgZG8geW91IHBs
YW4gdG8gZG8gdGhlIHBhdGNod29yawo+IGFwcGVhc2VtZW50IHdoZW4gYXBwbHlpbmc/IEkndmUg
c2VlbiB5b3UgbWVyZ2VkIHRoZSBvdGhlciBwYXRjaGVzCj4gKHRoYW5rcyEpLCBidXQgbm90IHRo
ZXNlIHR3byBoZXJlLgoKU29ycnksIEkgZGlkbid0IGdldCB0byB0aGlzIGJlZm9yZSBJIHN0YXJ0
ZWQgdHJhdmVsbGluZywgYW5kIGRlZmVycmVkCml0IHNpbmNlIHdlIHdlcmUgaGF2aW5nIGxpbnV4
LW5leHQgcmVsYXRlZCBwcm9ibGVtcyB3aXRoIGhtbS5naXQuIEkKaG9wZSB0byBkbyBpdCB0b2Rh
eS4KCkkgd2lsbCBmaXggaXQgdXAgYXMgcHJvbWlzZWQKClRoYW5rcywKSmFzb24KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
