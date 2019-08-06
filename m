Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923A483205
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 14:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590266E370;
	Tue,  6 Aug 2019 12:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23946E370;
 Tue,  6 Aug 2019 12:59:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F133F50F4D;
 Tue,  6 Aug 2019 12:59:35 +0000 (UTC)
Received: from treble (ovpn-121-192.rdu2.redhat.com [10.10.121.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC1291001284;
 Tue,  6 Aug 2019 12:59:33 +0000 (UTC)
Date: Tue, 6 Aug 2019 07:59:31 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
Message-ID: <20190806125931.oqeqateyzqikusku@treble>
References: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
 <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
 <156416793450.30723.5556760526480191131@skylake-alporthouse-com>
 <alpine.DEB.2.21.1907262116530.1791@nanos.tec.linutronix.de>
 <156416944205.21451.12269136304831943624@skylake-alporthouse-com>
 <CA+icZUXwBFS-6e+Qp4e3PhnRzEHvwdzWtS6OfVsgy85R5YNGOg@mail.gmail.com>
 <CA+icZUWA6e0Zsio6sthRUC=Ehb2-mw_9U76UnvwGc_tOnOqt7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+icZUWA6e0Zsio6sthRUC=Ehb2-mw_9U76UnvwGc_tOnOqt7w@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 06 Aug 2019 12:59:36 +0000 (UTC)
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
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDk6Mjk6NTNQTSArMDIwMCwgU2VkYXQgRGlsZWsgd3Jv
dGU6Cj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMjoyNSBQTSBTZWRhdCBEaWxlayA8c2VkYXQu
ZGlsZWtAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCA5
OjMwIFBNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cm90ZToKPiA+
ID4KPiA+ID4gUXVvdGluZyBUaG9tYXMgR2xlaXhuZXIgKDIwMTktMDctMjYgMjA6MTg6MzIpCj4g
PiA+ID4gT24gRnJpLCAyNiBKdWwgMjAxOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gPiA+ID4g
UXVvdGluZyBUaG9tYXMgR2xlaXhuZXIgKDIwMTktMDctMjUgMjI6NTU6NDUpCj4gPiA+ID4gPiA+
IE9uIFRodSwgMjUgSnVsIDIwMTksIEpvc2ggUG9pbWJvZXVmIHdyb3RlOgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IE9ianRvb2wgcmVwb3J0czoKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIubzogd2Fybmlu
Zzogb2JqdG9vbDogLmFsdGluc3RyX3JlcGxhY2VtZW50KzB4MzY6IHJlZHVuZGFudCBVQUNDRVNT
IGRpc2FibGUKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IF9fY29weV9mcm9tX3VzZXIoKSBh
bHJlYWR5IGRvZXMgYm90aCBTVEFDIGFuZCBDTEFDLCBzbyB0aGUKPiA+ID4gPiA+ID4gPiB1c2Vy
X2FjY2Vzc19lbmQoKSBpbiBpdHMgZXJyb3IgcGF0aCBhZGRzIGFuIGV4dHJhIHVubmVjZXNzYXJ5
IENMQUMuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBGaXhlczogMGIyYzhmOGI2YjBjICgi
aTkxNTogZml4IG1pc3NpbmcgdXNlcl9hY2Nlc3NfZW5kKCkgaW4gcGFnZSBmYXVsdCBleGNlcHRp
b24gY2FzZSIpCj4gPiA+ID4gPiA+ID4gUmVwb3J0ZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgo+ID4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBTZWRhdCBEaWxlayA8
c2VkYXQuZGlsZWtAZ21haWwuY29tPgo+ID4gPiA+ID4gPiA+IEFja2VkLWJ5OiBQZXRlciBaaWps
c3RyYSAoSW50ZWwpIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiA+ID4gPiA+ID4gPiBUZXN0ZWQt
Ynk6IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPgo+ID4gPiA+ID4g
PiA+IFRlc3RlZC1ieTogU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWlsLmNvbT4KPiA+ID4g
PiA+ID4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lz
c3Vlcy82MTcKPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb3NoIFBvaW1ib2V1ZiA8anBv
aW1ib2VAcmVkaGF0LmNvbT4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdo
aWNoIHRyZWUgZG8geW91IHBsYW4gdG8gYXBwbHkgaXQgdG8/IEkgY2FuIHB1dCBpbiBkcm0taW50
ZWwsIGFuZCB3aXRoCj4gPiA+ID4gPiB0aGUgZml4ZXMgdGFnIGl0IHdpbGwgcGVyY29sYXRlIHRo
cm91Z2ggdG8gNS4zIGFuZCBiZXlvbmQsIGJ1dCBpZiB5b3UKPiA+ID4gPiA+IHdhbnQgdG8gYXBw
bHkgaXQgZGlyZWN0bHkgdG8gc3F1YXNoIHRoZSBidWlsZCB3YXJuaW5ncywgZmVlbCBmcmVlLgo+
ID4gPiA+Cj4gPiA+ID4gSXQgd291bGQgYmUgbmljZSB0byBnZXQgaXQgaW50byA1LjMuIEkgY2Fu
IHJvdXRlIGl0IGxpbnV4d2FyZHMgaWYgeW91IGdpdmUKPiA+ID4gPiBhbiBBY2tlZC1ieSwgYnV0
IEknbSBoYXBweSB0byBoYW5kIGl0IHRvIHlvdSA6KQo+ID4gPgo+ID4gPiBBY2tlZC1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPgo+ID4gVGhvbWFzIGRpZCB5
b3UgdGFrZSB0aGlzIHRocm91Z2ggdGlwIHRyZWUgYWZ0ZXIgQ2hyaXMnIEFDSz8KPiA+Cj4gCj4g
SGksCj4gCj4gR2VudGxlIHBpbmcuLi4KPiBUaG9tYXMgYW5kIENocmlzOiBXaWxsIHNvbWVvbmUg
b2YgeW91IHBpY2sgdGhpcyB1cD8KPiBBcyAib2JqdG9vbDogSW1wcm92ZSBVQUNDRVNTIGNvdmVy
YWdlIiBbMV0gd2VudCB0cm91Z2ggdGlwIHRyZWUgSQo+IGhpZ2hseSBhcHByZWNpYXRlIHRvIGRv
IHNvIHdpdGggdGhpcyBvbmUuCgpJIHRoaW5rIFRob21hcyBoYXMgZ29uZSBvbiBob2xpZGF5LCBz
byBob3BlZnVsbHkgQ2hyaXMgY2FuIHBpY2sgaXQgdXAKYWZ0ZXIgYWxsLgoKLS0gCkpvc2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
