Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D88E520
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 08:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E9D6E8AD;
	Thu, 15 Aug 2019 06:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F3E6E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 06:58:33 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m44so1295568edd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 23:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=9lqqkaS001tXTBszYzeiJH38HEfaSqFOiRWf4hWiQAE=;
 b=ku2/OKk6shWnt+k9Gu2s9gnqnP1iGPrrbH3EjVcX34O4OsWkMZhuQtIZyiKrRT07t4
 HRACoKew6ZtycWjl/CjIqC3WvopKgrgyyJTB9bbBAJEMi7hrflscxp2dJxyY3S8dssGr
 LaJABzlOPFHCEVzg8kmcyN79EhVc1ucHw/we4RDGDPWP8hBb0hYLphA69g/yivhW/uaN
 2Ifg1Ern2NV/1TNtoKsvlEOFmvHK2BoQ1MAPqN5LFRK8EX+MzAjiJKSIHZtcBIIHR+UT
 aiBqm3hdvygVQVCtQCd3fEzQ4j62xaI49d1GfESOT2J844JijrZIGQjZtd5eFKqVCRVZ
 ndmQ==
X-Gm-Message-State: APjAAAWhMBe0YSXGcqBW1N2qhNQLUPP6k1TZICQpTWipnS79MTMkEQMx
 ucX585cwWBu+sjL1lszkP8Jkfg==
X-Google-Smtp-Source: APXvYqxywF6ZFPpqpELjFS+YznGqSqHzYzsoNbFwgEupP5iJucMUMFx7LcA8eHspNumjBMO9waYOnw==
X-Received: by 2002:aa7:d981:: with SMTP id u1mr3719744eds.150.1565852312360; 
 Wed, 14 Aug 2019 23:58:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x11sm252024eju.26.2019.08.14.23.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 23:58:31 -0700 (PDT)
Date: Thu, 15 Aug 2019 08:58:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815065829.GA7444@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>,
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
 <20190814235805.GB11200@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814235805.GB11200@ziepe.ca>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9lqqkaS001tXTBszYzeiJH38HEfaSqFOiRWf4hWiQAE=;
 b=kGKYX8WCtIWPm4IRO12hI1D0cjf/mI6eQP72qIiFFGtnNzwCY04Wmo7zjazUdqpw/d
 Del5Qla1OnO++32rcBWEVNsFe4PD3aQALBzRK4Su/mIZ4kIuX0VTEYN8IY+6aVsSvcOZ
 7BJQBjHzNo13izdIP+UvcB7SJ2tHQ6yPSCE5g=
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
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDg6NTg6MDVQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDEwOjIwOjI0UE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBJbiBzb21lIHNwZWNpYWwgY2FzZXMgd2UgbXVzdCBub3QgYmxv
Y2ssIGJ1dCB0aGVyZSdzIG5vdCBhCj4gPiBzcGlubG9jaywgcHJlZW1wdC1vZmYsIGlycXMtb2Zm
IG9yIHNpbWlsYXIgY3JpdGljYWwgc2VjdGlvbiBhbHJlYWR5Cj4gPiB0aGF0IGFybXMgdGhlIG1p
Z2h0X3NsZWVwKCkgZGVidWcgY2hlY2tzLiBBZGQgYSBub25fYmxvY2tfc3RhcnQvZW5kKCkKPiA+
IHBhaXIgdG8gYW5ub3RhdGUgdGhlc2UuCj4gPiAKPiA+IFRoaXMgd2lsbCBiZSB1c2VkIGluIHRo
ZSBvb20gcGF0aHMgb2YgbW11LW5vdGlmaWVycywgd2hlcmUgYmxvY2tpbmcgaXMKPiA+IG5vdCBh
bGxvd2VkIHRvIG1ha2Ugc3VyZSB0aGVyZSdzIGZvcndhcmQgcHJvZ3Jlc3MuIFF1b3RpbmcgTWlj
aGFsOgo+ID4gCj4gPiAiVGhlIG5vdGlmaWVyIGlzIGNhbGxlZCBmcm9tIHF1aXRlIGEgcmVzdHJp
Y3RlZCBjb250ZXh0IC0gb29tX3JlYXBlciAtCj4gPiB3aGljaCBzaG91bGRuJ3QgZGVwZW5kIG9u
IGFueSBsb2NrcyBvciBzbGVlcGFibGUgY29uZGl0aW9uYWxzLiBUaGUgY29kZQo+ID4gc2hvdWxk
IGJlIHN3aWZ0IGFzIHdlbGwgYnV0IHdlIG1vc3RseSBkbyBjYXJlIGFib3V0IGl0IHRvIG1ha2Ug
YSBmb3J3YXJkCj4gPiBwcm9ncmVzcy4gQ2hlY2tpbmcgZm9yIHNsZWVwYWJsZSBjb250ZXh0IGlz
IHRoZSBiZXN0IHRoaW5nIHdlIGNvdWxkIGNvbWUKPiA+IHVwIHdpdGggdGhhdCB3b3VsZCBkZXNj
cmliZSB0aGVzZSBkZW1hbmRzIGF0IGxlYXN0IHBhcnRpYWxseS4iCj4gCj4gQnV0IHRoaXMgZGVz
Y3JpYmVzIGZzX3JlY2xhaW1fYWNxdWlyZSgpIC0gaXMgdGhlcmUgc29tZSByZWFzb24gd2UgYXJl
Cj4gY29uZmxhdGluZyBmc19yZWNsYWltIHdpdGggbm9uLXNsZWVwaW5nPwoKTm8gaWRlYSB3aHkg
eW91IHRpZSB0aGlzIGludG8gZnNfcmVjbGFpbS4gV2UgY2FuIGRlZmluaXRseSBzbGVlcCBpbiB0
aGVyZSwKYW5kIGZvciBlLmcuIGtzd2FwZCAod2hpY2ggYWxzbyB3cmFwcyBldmVyeXRoaW5nIGlu
IGZzX3JlY2xhaW0pIHdlJ3JlCmV2ZW50IHN1cHBvc2VkIHRvIEkgdGhvdWdodC4gVG8gbWFrZSBz
dXJlIHdlIGNhbiBnZXQgYXQgdGhlIGxhc3QgYml0IG9mCm1lbW9yeSBieSBmbHVzaGluZyBhbGwg
dGhlIHF1ZXVlcyBhbmQgd2FpdGluZyBmb3IgZXZlcnl0aGluZyB0byBiZSBjbGVhbmVkCm91dC4K
Cj4gaWUgaXMgdGhlcmUgc29tZSBmdW5kYW1lbnRhbCBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIGJs
b2NrIHN0YWNrCj4gc2xlZXBpbmcgZHVyaW5nIHJlY2xhaW0gd2hpbGUgaXQgd2FpdHMgZm9yIGEg
ZHJpdmVyIHRvIHdyaXRlIG91dCBhCj4gcGFnZSBhbmQgYSBHUFUgZHJpdmVyIHNsZWVwaW5nIGR1
cmluZyBPT00gd2hpbGUgaXQgd2FpdHMgZm9yIGl0J3MgSFcKPiB0byBmZW5jZSBETUEgb24gYSBw
YWdlPwo+IAo+IEZ1bmRhbWVudGFsbHkgd2UgaGF2ZSBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkg
dnMgaW52YWxpZGF0ZV9yYW5nZSgpCj4gYXMgdGhlIHN0YXJ0KCkgdmVyc2lvbiBpcyBhYmxlIHRv
IHNsZWVwLiBJZiBkcml2ZXJzIGNhbiBkbyB0aGVpciB3b3JrCj4gd2l0aG91dCBzbGVlcGluZyB0
aGVuIHRoZXkgc2hvdWxkIGJlIHVzaW5nIGludmFsaWRhcmVfcmFuZ2UoKSBpbnN0ZWFkLgo+IAo+
IFRodXMsIGl0IGRvZXNuJ3Qgc2VlbSB0byBtYWtlIGFueSBzZW5zZSB0byBhc2sgYSBkcml2ZXIg
dGhhdCByZXF1aXJlcyBhCj4gc2xlZXBpbmcgQVBJIG5vdCB0byBzbGVlcC4KPiAKPiBBRkFJQ1Qg
d2hhdCBpcyByZWFsbHkgZ29pbmcgb24gaGVyZSBpcyB0aGF0IGRyaXZlcnMgY2FyZSBhYm91dCBv
bmx5IGEKPiBzdWJzZXQgb2YgdGhlIFZBIHNwYWNlLCBhbmQgd2Ugd2FudCB0byBxdWVyeSB0aGUg
ZHJpdmVyIGlmIGl0IGNhcmVzCj4gYWJvdXQgdGhlIHJhbmdlIHByb3Bvc2VkIHRvIGJlIE9PTSdk
LCBzbyB3ZSBjYW4gT09NIHJhbmdlcyB0aGF0IGFyZQo+IGRvIG5vdCBoYXZlIFNQVEVzLgo+IAo+
IGllIGlmIHlvdSBsb29rIHByZXR0eSBtdWNoIGFsbCBkcml2ZXJzIGRvIGV4YWN0bHkgYXMKPiB1
c2VycHRyX21uX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSBkb2VzLCBhbmQgYmFpbCBvbmNlIHRo
ZXkgZGV0ZWN0Cj4gdGhlIFZBIHJhbmdlIGlzIG9mIGludGVyZXN0Lgo+IAo+IFNvLCBJJ20gd29y
a2luZyBvbiBhIHBhdGNoIHRvIGxpZnQgdGhlIGludGVydmFsIHRyZWUgaW50byB0aGUgbm90aWZp
ZXIKPiBjb3JlIGFuZCB0aGVuIGRvIHRoZSBWQSB0ZXN0IE9PTSBuZWVkcyB3aXRob3V0IGJvdGhl
cmluZyB0aGUKPiBkcml2ZXIuIERyaXZlcnMgY2FuIHJldGFpbiB0aGUgYmxvY2tpbmcgQVBJIHRo
ZXkgcmVxdWlyZSBhbmQgT09NIGNhbgo+IHdvcmsgb24gVkEncyB0aGF0IGRvbid0IGhhdmUgU1BU
RXMuCgpIbSBJIGZpZ3VyZWQgdGhlIHBvaW50IG9mIGhtbV9taXJyb3IgaXMgdG8gaGF2ZSB0aGF0
IGludGVydmFsIHRyZWUgZm9yCmV2ZXJ5b25lIChhbW9uZyBvdGhlciB0aGluZ3MpLiBCdXQgeWVh
aCBsaWZ0aW5nIHRvIG1tdV9ub3RpZmllciBzb3VuZHMKbGlrZSBhIGNsZWFuIHNvbHV0aW9uIGZv
ciB0aGlzLCBidXQgSSByZWFsbHkgaGF2ZSBub3QgbXVjaCBjbHVlIGFib3V0IHdoeQp3ZSBldmVu
IGhhdmUgdGhpcyBmb3Igc3BlY2lhbCBtb2RlIGluIHRoZSBvb20gY2FzZS4gSSdtIGp1c3QgdHJ5
aW5nIHRvCmluY3JlYXNlIHRoZSBvZGRzIHRoYXQgZHJpdmVycyBob2xkIHVwIHRoZWlyIGVuZCBv
ZiB0aGUgYmFyZ2Fpbi4KCj4gVGhpcyBhcHByb2FjaCBhbHNvIHNvbHZlcyB0aGUgY3JpdGljYWwg
YnVnIGluIHRoaXMgcGF0aDoKPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIw
MTkwODA3MTkxNjI3LkdBMzAwOEB6aWVwZS5jYS8KPiAKPiBBbmQgc29sdmVzIGEgYnVuY2ggb2Yg
b3RoZXIgYnVncyBpbiB0aGUgZHJpdmVycy4KPiAKPiA+IFBldGVyIGFsc28gYXNrZWQgd2hldGhl
ciB3ZSB3YW50IHRvIGNhdGNoIHNwaW5sb2NrcyBvbiB0b3AsIGJ1dCBNaWNoYWwKPiA+IHNhaWQg
dGhvc2UgYXJlIGxlc3Mgb2YgYSBwcm9ibGVtIGJlY2F1c2Ugc3BpbmxvY2tzIGNhbid0IGhhdmUg
YW4KPiA+IGluZGlyZWN0IGRlcGVuZGVuY3kgdXBvbiB0aGUgcGFnZSBhbGxvY2F0b3IgYW5kIGhl
bmNlIGNsb3NlIHRoZSBsb29wCj4gPiB3aXRoIHRoZSBvb20gcmVhcGVyLgo+IAo+IEFnYWluLCB0
aGlzIGVudGlyZWx5IHNvdW5kcyBsaWtlIGZzX3JlY2xhaW0gLSBpc24ndCB0aGF0IGV4YWN0bHkg
d2hhdAo+IGl0IGlzIGZvcj8KPiAKPiBJIGhhdmUgaGFkIG9uIG15IGxpc3QgYSBzZWNvbmQgYW5k
IHZlcnkgcmVsYXRlZCBwb3NzaWJsZSBidWcuIEkgcmFuCj4gaW50byBjb21taXQgMzVjZmEyYjBi
NDkxICgibW0vbW11X25vdGlmaWVyOiBhbGxvY2F0ZSBtbXVfbm90aWZpZXIgaW4KPiBhZHZhbmNl
Iikgd2hpY2ggc2F5cyB0aGF0IG1hcHBpbmctPmlfbW1hcF9tdXRleCBpcyB1bmRlciBmc19yZWNs
YWltKCkuCj4gCj4gV2UgZG8gaG9sZCBpX21tYXBfcndzZW0gd2hpbGUgY2FsbGluZyBpbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0KCk6Cj4gCj4gIHVubWFwX21hcHBpbmdfcGFnZXMKPiAgIGlfbW1hcF9s
b2NrX3dyaXRlKG1hcHBpbmcpOyAvLyBpZSBpX21tYXBfcndzZW0KPiAgIHVubWFwX21hcHBpbmdf
cmFuZ2VfdHJlZQo+ICAgIHVubWFwX21hcHBpbmdfcmFuZ2Vfdm1hCj4gICAgIHphcF9wYWdlX3Jh
bmdlX3NpbmdsZQo+ICAgICAgbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQKPiAK
PiBTbywgaWYgaXQgaXMgc3RpbGwgdHJ1ZSB0aGF0IGlfbW1hcF9yd3NlbSBpcyB1bmRlciBmc19y
ZWNsYWltIHRoZW4KPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0IGlzICphbHdheXMqIHVuZGVyIGZz
X3JlY2xhaW0gYW55aG93ISAodGhpcyBJIGRvCj4gbm90IGtub3cpCj4gCj4gVGh1cyB3ZSBzaG91
bGQgdXNlIGxvY2tkZXAgdG8gZm9yY2UgdGhpcyBhbmQgZml4IGFsbCB0aGUgZHJpdmVycy4KPiAK
PiAuLiBhbmQgaWYgd2UgZm9yY2UgZnNfcmVjbGFpbSBhbHdheXMsIGRvIHdlIGNhcmUgYWJvdXQg
YmxvY2thYmxlCj4gYW55bW9yZT8/CgpTdGlsbCBub3Qgc3VyZSB3aGF0IGZzX3JlY2xhaW0gbWF0
dGVycyBoZXJlLiBPbmUgb2YgdGhlIGxhdGVyIHBhdGNoZXMKc3RlYWxzIHRoZSBmc19yZWNsYWlt
IGlkZWEgZm9yIG1tdV9ub3RpZmllcnMsIGJ1dCB0aGF0IHRpZXMgdG9nZXRoZXIKY29tcGxldGVs
eSBkaWZmZXJlbnQgcGF0aHMuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
