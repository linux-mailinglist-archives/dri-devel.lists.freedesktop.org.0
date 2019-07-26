Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A45771D3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 21:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E3E6EE37;
	Fri, 26 Jul 2019 19:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCFC6EE38;
 Fri, 26 Jul 2019 19:05:59 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17638005-1500050 for multiple; Fri, 26 Jul 2019 20:05:36 +0100
MIME-Version: 1.0
To: Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
References: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
 <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
Message-ID: <156416793450.30723.5556760526480191131@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
Date: Fri, 26 Jul 2019 20:05:34 +0100
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sedat Dilek <sedat.dilek@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBUaG9tYXMgR2xlaXhuZXIgKDIwMTktMDctMjUgMjI6NTU6NDUpCj4gT24gVGh1LCAy
NSBKdWwgMjAxOSwgSm9zaCBQb2ltYm9ldWYgd3JvdGU6Cj4gCj4gPiBPYmp0b29sIHJlcG9ydHM6
Cj4gPiAKPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIu
bzogd2FybmluZzogb2JqdG9vbDogLmFsdGluc3RyX3JlcGxhY2VtZW50KzB4MzY6IHJlZHVuZGFu
dCBVQUNDRVNTIGRpc2FibGUKPiA+IAo+ID4gX19jb3B5X2Zyb21fdXNlcigpIGFscmVhZHkgZG9l
cyBib3RoIFNUQUMgYW5kIENMQUMsIHNvIHRoZQo+ID4gdXNlcl9hY2Nlc3NfZW5kKCkgaW4gaXRz
IGVycm9yIHBhdGggYWRkcyBhbiBleHRyYSB1bm5lY2Vzc2FyeSBDTEFDLgo+ID4gCj4gPiBGaXhl
czogMGIyYzhmOGI2YjBjICgiaTkxNTogZml4IG1pc3NpbmcgdXNlcl9hY2Nlc3NfZW5kKCkgaW4g
cGFnZSBmYXVsdCBleGNlcHRpb24gY2FzZSIpCj4gPiBSZXBvcnRlZC1ieTogVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gPiBSZXBvcnRlZC1ieTogU2VkYXQgRGlsZWsgPHNl
ZGF0LmRpbGVrQGdtYWlsLmNvbT4KPiA+IEFja2VkLWJ5OiBQZXRlciBaaWpsc3RyYSAoSW50ZWwp
IDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiA+IFRlc3RlZC1ieTogTmljayBEZXNhdWxuaWVycyA8
bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+Cj4gPiBUZXN0ZWQtYnk6IFNlZGF0IERpbGVrIDxzZWRh
dC5kaWxla0BnbWFpbC5jb20+Cj4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWls
dExpbnV4L2xpbnV4L2lzc3Vlcy82MTcKPiA+IFNpZ25lZC1vZmYtYnk6IEpvc2ggUG9pbWJvZXVm
IDxqcG9pbWJvZUByZWRoYXQuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBUaG9tYXMgR2xlaXhuZXIg
PHRnbHhAbGludXRyb25peC5kZT4KCldoaWNoIHRyZWUgZG8geW91IHBsYW4gdG8gYXBwbHkgaXQg
dG8/IEkgY2FuIHB1dCBpbiBkcm0taW50ZWwsIGFuZCB3aXRoCnRoZSBmaXhlcyB0YWcgaXQgd2ls
bCBwZXJjb2xhdGUgdGhyb3VnaCB0byA1LjMgYW5kIGJleW9uZCwgYnV0IGlmIHlvdQp3YW50IHRv
IGFwcGx5IGl0IGRpcmVjdGx5IHRvIHNxdWFzaCB0aGUgYnVpbGQgd2FybmluZ3MsIGZlZWwgZnJl
ZS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
