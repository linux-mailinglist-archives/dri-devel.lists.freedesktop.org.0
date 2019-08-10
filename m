Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD6F88BA7
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54BA6E422;
	Sat, 10 Aug 2019 13:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2616C6EF3E;
 Sat, 10 Aug 2019 05:59:13 +0000 (UTC)
Received: from p200300ddd71876237e7a91fffec98e25.dip0.t-ipconnect.de
 ([2003:dd:d718:7623:7e7a:91ff:fec9:8e25])
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hwKPD-0001rk-4j; Sat, 10 Aug 2019 07:59:07 +0200
Date: Sat, 10 Aug 2019 07:59:01 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
In-Reply-To: <CA+icZUWgE5NTEa9Q0jof0Hv52tZM8-869Daww7dueaaMMXt+7A@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1908100754560.7324@nanos.tec.linutronix.de>
References: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
 <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
 <156416793450.30723.5556760526480191131@skylake-alporthouse-com>
 <alpine.DEB.2.21.1907262116530.1791@nanos.tec.linutronix.de>
 <156416944205.21451.12269136304831943624@skylake-alporthouse-com>
 <CA+icZUXwBFS-6e+Qp4e3PhnRzEHvwdzWtS6OfVsgy85R5YNGOg@mail.gmail.com>
 <CA+icZUWA6e0Zsio6sthRUC=Ehb2-mw_9U76UnvwGc_tOnOqt7w@mail.gmail.com>
 <20190806125931.oqeqateyzqikusku@treble>
 <CAKwvOd=wa-XPCpoLQoQJH8Me7S=fXLfog0XsiKyFZKu8ojW_UQ@mail.gmail.com>
 <alpine.DEB.2.21.1908082221150.2882@nanos.tec.linutronix.de>
 <CAKwvOdkTD-0inuEKLTsH_tKXzXjvzwnUDwYZ++-hOUrC_FU=sw@mail.gmail.com>
 <CA+icZUWgE5NTEa9Q0jof0Hv52tZM8-869Daww7dueaaMMXt+7A@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:12 +0000
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
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCA5IEF1ZyAyMDE5LCBTZWRhdCBEaWxlayB3cm90ZToKPiBPbiBGcmksIEF1ZyA5LCAy
MDE5IGF0IDE6MDMgQU0gTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgQXVnIDgsIDIwMTkgYXQgMToyMiBQTSBUaG9tYXMgR2xl
aXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+ID4gdGdseCBqdXN0IHBpY2tl
ZCB1cCAyIG90aGVyIHBhdGNoZXMgb2YgbWluZSwgYnVtcGluZyBqdXN0IGluIGNhc2UgaGUncwo+
ID4gPiA+IG5vdCBwaWNraW5nIHVwIHBhdGNoZXMgd2hpbGUgb24gdmFjYXRpb24uIDspCj4gPiA+
Cj4gPiA+IEknbSBvbmx5IGhhbGYgb24gdmFjYXRpb24gOikKPiA+ID4KPiA+ID4gU28gSSBjYW4g
cGljayBpdCB1cC4KPiA+Cj4gPiBUaGFua3MsIHdpbGwgc2VuZCBoYWxmIG1hcmdhcml0YXMuCj4g
Pgo+IAo+IFNlbmRzIHNvbWUgVHVya2lzaCBDYXkuCgpPbmUgZGF5LCBJJ20gZ29pbmcgdG8gY29s
bGVjdCBhbGwgdGhlIHRoaW5ncyBwZW9wbGUgcHJvbWlzZWQgdG8gc2VuZCBvciBidXkKbWUgaW4g
dGhlIHBhc3QgMTUgeWVhcnMuIFRoYXQncyBnb2luZyB0byBiZSBhIHJlYWxseSBodWdlIHBhcnR5
IDopCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
