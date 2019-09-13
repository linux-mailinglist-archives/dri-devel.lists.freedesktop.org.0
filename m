Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D461B1A86
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 11:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACC06EEE4;
	Fri, 13 Sep 2019 09:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D66556EEE4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:12:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F2FD28;
 Fri, 13 Sep 2019 02:12:56 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 823273F59C;
 Fri, 13 Sep 2019 02:12:55 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Prevent race when handling page fault
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190905121141.42820-1-steven.price@arm.com>
 <CAL_JsqKyKUBOK7+fSpr+ShjUz72oXC91ySOKCST9WyWjd0nqww@mail.gmail.com>
 <d0fb9ba9-d8af-1523-192c-23376e467f12@arm.com>
 <CAKMK7uF1PYEPjQBvZwFOzAtjQ4YbY7AWj5mV106fvk_e=2ohsw@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3a82ea91-c178-0ada-d762-3f3802dfc7c5@arm.com>
Date: Fri, 13 Sep 2019 10:12:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF1PYEPjQBvZwFOzAtjQ4YbY7AWj5mV106fvk_e=2ohsw@mail.gmail.com>
Content-Language: en-GB
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDkvMjAxOSAyMDozNiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIFNlcCA2
LCAyMDE5IGF0IDI6NDIgUE0gU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIDA2LzA5LzIwMTkgMTI6MTAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+Pj4gT24g
VGh1LCBTZXAgNSwgMjAxOSBhdCAxOjExIFBNIFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFy
bS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gV2hlbiBoYW5kbGluZyBhIEdQVSBwYWdlIGZhdWx0IGFk
ZHJfdG9fZHJtX21tX25vZGUoKSBpcyB1c2VkIHRvCj4+Pj4gdHJhbnNsYXRlIHRoZSBHUFUgYWRk
cmVzcyB0byBhIGJ1ZmZlciBvYmplY3QuIEhvd2V2ZXIgaXQgaXMgcG9zc2libGUgZm9yCj4+Pj4g
dGhlIGJ1ZmZlciBvYmplY3QgdG8gYmUgZnJlZWQgYWZ0ZXIgdGhlIGZ1bmN0aW9uIGhhcyByZXR1
cm5lZCByZXN1bHRpbmcKPj4+PiBpbiBhIHVzZS1hZnRlci1mcmVlIG9mIHRoZSBCTy4KPj4+Pgo+
Pj4+IENoYW5nZSBhZGRyX3RvX2RybV9tbV9ub2RlIHRvIHJldHVybiB0aGUgcGFuZnJvc3RfZ2Vt
X29iamVjdCB3aXRoIGFuCj4+Pj4gZXh0cmEgcmVmZXJlbmNlIG9uIGl0LCBwcmV2ZW50aW5nIHRo
ZSBCTyBmcm9tIGJlaW5nIGZyZWVkIHVudGlsIGFmdGVyCj4+Pj4gdGhlIHBhZ2UgZmF1bHQgaGFz
IGJlZW4gaGFuZGxlZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3Rl
dmVuLnByaWNlQGFybS5jb20+Cj4+Pj4gLS0tCj4+Pj4KPj4+PiBJJ3ZlIG1hbmFnZWQgdG8gdHJp
Z2dlciB0aGlzLCBnZW5lcmF0aW5nIHRoZSBmb2xsb3dpbmcgc3RhY2sgdHJhY2UuCj4+Pgo+Pj4g
SHVtbSwgdGhlIGFzc3VtcHRpb24gd2FzIHRoYXQgYSBmYXVsdCBjb3VsZCBvbmx5IGhhcHBlbiBk
dXJpbmcgYSBqb2IKPj4+IGFuZCBzbyBhIHJlZmVyZW5jZSB3b3VsZCBhbHJlYWR5IGJlIGhlbGQu
IE90aGVyd2lzZSwgY291bGRuJ3QgdGhlIEdQVQo+Pj4gYWxzbyBiZSBhY2Nlc3NpbmcgdGhlIEJP
IGFmdGVyIGl0IGlzIGZyZWVkPwo+Pgo+PiBBaCwgSSBndWVzcyBJIG1pc3NlZCB0aGF0IGluIHRo
ZSBjb21taXQgbWVzc2FnZS4gVGhpcyBpcyBhc3N1bWluZyB0aGF0Cj4+IHVzZXIgc3BhY2UgZG9l
c24ndCBpbmNsdWRlIHRoZSBCTyBpbiB0aGUgam9iIGV2ZW4gdGhvdWdoIHRoZSBHUFUgdGhlbgo+
PiBkb2VzIHRyeSB0byBhY2Nlc3MgaXQuIEFJVUkgbWVzYSB3b3VsZG4ndCBkbyB0aGlzLCBidXQg
dGhpcyBpcyBzdGlsbAo+PiBlYXNpbHkgcG9zc2libGUgaWYgdXNlciBzcGFjZSB3YW50cyB0byBj
cmFzaCB0aGUga2VybmVsLgo+IAo+IERvIHdlIGhhdmUgc29tZSBuaWNlIHJlZ3Jlc3Npb24gdGVz
dHMgZm9yIHVhcGkgZXhwbG9pdHMgYW5kIGNvcm5lcgo+IGNhc2VzIGxpa2UgdGhpcz8gTWF5YmUg
ZXZlbiBpbiBpZ3Q/Cj4gLURhbmllbAoKTm90IGN1cnJlbnRseSwgSSd2ZSBiZWVuIHBsYXlpbmcg
d2l0aCB0aGUgaWRlYSBvZiBnZXR0aW5nIHRoZQpjbG9zZWQtc291cmNlIERESyBibG9iIHJ1bm5p
bmcgb24gUGFuZnJvc3QgYW5kIHRoaXMgaXMgd2hhdCBnZW5lcmF0ZXMKdGhlICJub3QtcXVpdGUt
bWVzYSIgdXNhZ2UuCgpJdCB3b3VsZCBkZWZpbml0ZWx5IGJlIGdvb2QgZXh0ZW5kIHRoZSB0ZXN0
IGNhc2VzIGluIElHVCwgSSBoYXZlIGEKc3ludGhldGljIHRlc3Qgd2hpY2ggY2FuIHRyaWdnZXIg
dGhpcyAtIEkganVzdCBuZWVkIHRvIGdldCBhcHByb3ZhbCB0bwpwb3N0IGl0LgoKU3RldmUKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
