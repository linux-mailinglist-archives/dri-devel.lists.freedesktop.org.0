Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8331D8E508
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 08:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AC76E8A6;
	Thu, 15 Aug 2019 06:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1395A6E8A6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 06:52:26 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f22so1314422edt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 23:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=AdThTK4irWjRHbKRNPRojupEGI8CuxNqyMHUGO6haU0=;
 b=mAMPJ6jAK8oAiFrtPqfVXCWZeo06sHI/3fP/DkUTPQeZypy8gVT2hqly8guBuoG42m
 WtFFuX4mDB/3JpdC/XEGuRbhgfOxdK23vYG9MYyUuP4CjFmqE4TExjYzFOBU+KnJe8Ct
 oLyPGfukIq10FBA4Lhk5Q89bEnB6RSK8PqPhIB+oIhm421WyiCRIO9DHGqCAbgc1RR5Z
 YpJM1eWyR/1KGF1P6PsyBjxYkLTaAGykPswyVfBkwb+mWUO0L6Og1lF+jyOdO7hFZofk
 dPQZt7xhYNLf3OmWz+lMDQStFDiAhNg1KX/HU/lxWX895T9yNE+Sm4Uj+XX2HoN3osTq
 ZifQ==
X-Gm-Message-State: APjAAAXOg3obWTniq/etniZDj5Zlwf5Zw6R0cY1hRcr4hkdqS1LtTg8s
 1e+26OllVVViSv9PiNzEbB3TvQ==
X-Google-Smtp-Source: APXvYqzKfh04I5n5jqpFb/od47twmHRq+smHNDBFxhta5k8M0iVd0qgYIIokvl2AA/0YJfkhp6dXOw==
X-Received: by 2002:a50:a485:: with SMTP id w5mr3690508edb.277.1565851944641; 
 Wed, 14 Aug 2019 23:52:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w3sm391183edu.4.2019.08.14.23.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 23:52:23 -0700 (PDT)
Date: Thu, 15 Aug 2019 08:52:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815065221.GZ7444@phenom.ffwll.local>
Mail-Followup-To: Andrew Morton <akpm@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Wei Wang <wvw@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jann Horn <jannh@google.com>,
 Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=AdThTK4irWjRHbKRNPRojupEGI8CuxNqyMHUGO6haU0=;
 b=YBWFagRxj3AfoQNeT1UBuJe04QemjMpngCbeoAlxYRV7G8aAfyWVf43ySnd4OGigxl
 Ns4xbcsW7Azu5FyzHwpJgyFbWPQVJjetlQmlGonoYkSnreGT+4qCoMjbqjRsUQV31Hvp
 z9jyRdBKqwQdDr3jRTT1T/yIfgsHR8yJHCyq0=
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
 Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDE6NDU6NThQTSAtMDcwMCwgQW5kcmV3IE1vcnRvbiB3
cm90ZToKPiBPbiBXZWQsIDE0IEF1ZyAyMDE5IDIyOjIwOjI0ICswMjAwIERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+IAo+ID4gSW4gc29tZSBzcGVjaWFsIGNh
c2VzIHdlIG11c3Qgbm90IGJsb2NrLCBidXQgdGhlcmUncyBub3QgYQo+ID4gc3BpbmxvY2ssIHBy
ZWVtcHQtb2ZmLCBpcnFzLW9mZiBvciBzaW1pbGFyIGNyaXRpY2FsIHNlY3Rpb24gYWxyZWFkeQo+
ID4gdGhhdCBhcm1zIHRoZSBtaWdodF9zbGVlcCgpIGRlYnVnIGNoZWNrcy4gQWRkIGEgbm9uX2Js
b2NrX3N0YXJ0L2VuZCgpCj4gPiBwYWlyIHRvIGFubm90YXRlIHRoZXNlLgo+ID4gCj4gPiBUaGlz
IHdpbGwgYmUgdXNlZCBpbiB0aGUgb29tIHBhdGhzIG9mIG1tdS1ub3RpZmllcnMsIHdoZXJlIGJs
b2NraW5nIGlzCj4gPiBub3QgYWxsb3dlZCB0byBtYWtlIHN1cmUgdGhlcmUncyBmb3J3YXJkIHBy
b2dyZXNzLiBRdW90aW5nIE1pY2hhbDoKPiA+IAo+ID4gIlRoZSBub3RpZmllciBpcyBjYWxsZWQg
ZnJvbSBxdWl0ZSBhIHJlc3RyaWN0ZWQgY29udGV4dCAtIG9vbV9yZWFwZXIgLQo+ID4gd2hpY2gg
c2hvdWxkbid0IGRlcGVuZCBvbiBhbnkgbG9ja3Mgb3Igc2xlZXBhYmxlIGNvbmRpdGlvbmFscy4g
VGhlIGNvZGUKPiA+IHNob3VsZCBiZSBzd2lmdCBhcyB3ZWxsIGJ1dCB3ZSBtb3N0bHkgZG8gY2Fy
ZSBhYm91dCBpdCB0byBtYWtlIGEgZm9yd2FyZAo+ID4gcHJvZ3Jlc3MuIENoZWNraW5nIGZvciBz
bGVlcGFibGUgY29udGV4dCBpcyB0aGUgYmVzdCB0aGluZyB3ZSBjb3VsZCBjb21lCj4gPiB1cCB3
aXRoIHRoYXQgd291bGQgZGVzY3JpYmUgdGhlc2UgZGVtYW5kcyBhdCBsZWFzdCBwYXJ0aWFsbHku
Igo+ID4gCj4gPiBQZXRlciBhbHNvIGFza2VkIHdoZXRoZXIgd2Ugd2FudCB0byBjYXRjaCBzcGlu
bG9ja3Mgb24gdG9wLCBidXQgTWljaGFsCj4gPiBzYWlkIHRob3NlIGFyZSBsZXNzIG9mIGEgcHJv
YmxlbSBiZWNhdXNlIHNwaW5sb2NrcyBjYW4ndCBoYXZlIGFuCj4gPiBpbmRpcmVjdCBkZXBlbmRl
bmN5IHVwb24gdGhlIHBhZ2UgYWxsb2NhdG9yIGFuZCBoZW5jZSBjbG9zZSB0aGUgbG9vcAo+ID4g
d2l0aCB0aGUgb29tIHJlYXBlci4KPiAKPiBJIGNvbnRpbnVlIHRvIHN0cnVnZ2xlIHdpdGggdGhp
cy4gIEl0IGludHJvZHVjZXMgYSBuZXcga2VybmVsIHN0YXRlCj4gInJ1bm5pbmcgcHJlZW1wdGli
bHkgYnV0IG11c3Qgbm90IGNhbGwgc2NoZWR1bGUoKSIuICBIb3cgZG9lcyB0aGlzIG1ha2UKPiBh
bnkgc2Vuc2U/Cj4gCj4gUGVyaGFwcyBhIG11Y2gsIG11Y2ggbW9yZSBkZXRhaWxlZCBkZXNjcmlw
dGlvbiBvZiB0aGUgb29tX3JlYXBlcgo+IHNpdHVhdGlvbiB3b3VsZCBoZWxwIG91dC4KCkkgYWdy
ZWUgb24gYm90aCBwb2ludHMsIGJ1dCBJIGd1ZXNzIEknbSBub3QgdGhlIGV4cGVydCB0byBleHBs
YWluIHdoeSB3ZQpoYXZlIHRoaXMuIEFsbCBJJ20gdHJ5aW5nIHRvIGRvIGlzIHRoYXQgZHJpdmVy
cyBob2xkIHVwIHRoZWlyIHNpZGUuIElmIHlvdQp3YW50IHRvIGhhdmUgYmV0dGVyIGRvY3VtZW50
YXRpb24gZm9yIHdoeSB0aGUgb29tIGNhc2UgbmVlZHMgdGhpcyBzcGVjaWFsCm5ldyBtb2RlLCB5
b3UncmUgbG9va2luZyBhdCB0aGUgd3JvbmcgZ3V5IGZvciB0aGF0IDotKQoKT2YgY291cnNlIGlm
IHlvdSBmb2xrcyBhbGwgZGVjaWRlIHRoYXQgeW91IGp1c3QgZG9uJ3Qgd2FudCB0byBiZQpyZW1l
bWJlcmVkIGFib3V0IHRoYXQgSSBndWVzcyB3ZSBjYW4gZHJvcCB0aGlzIG9uZSBoZXJlLCBidXQg
eW91J3JlIGp1c3QKc2hvb3RpbmcgdGhlIG1lc3NlbmdlciBJIHRoaW5rLgotRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
