Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866AC2001F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BD689304;
	Thu, 16 May 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CE8892D2;
 Wed, 15 May 2019 11:53:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E504AF6E;
 Wed, 15 May 2019 11:53:45 +0000 (UTC)
Date: Wed, 15 May 2019 13:53:44 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] kernel/locking/semaphore: use wake_q in up()
Message-ID: <20190515115344.oqkei4yzkqxu2uqf@pathway.suse.cz>
References: <20190509120903.28939-1-daniel.vetter@ffwll.ch>
 <20190509200633.19678-1-daniel.vetter@ffwll.ch>
 <20190510092819.elu4b7fcojzcek2q@pathway.suse.cz>
 <CAKMK7uEPAH82xv8r+8Rh3eQT1mTO00A-sFTEqQMwA=zFtWmfxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEPAH82xv8r+8Rh3eQT1mTO00A-sFTEqQMwA=zFtWmfxQ@mail.gmail.com>
User-Agent: NeoMutt/20170912 (1.9.0)
X-Mailman-Approved-At: Thu, 16 May 2019 07:22:48 +0000
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpIDIwMTktMDUtMTAgMTc6MjA6MTUsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gRnJp
LCBNYXkgMTAsIDIwMTkgYXQgMTE6MjggQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIFRodSAyMDE5LTA1LTA5IDIyOjA2OjMzLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOgo+ID4gPiBjb25zb2xlX3RyeWxvY2ssIGNhbGxlZCBmcm9tIHdpdGhpbiBwcmludGss
IGNhbiBiZSBjYWxsZWQgZnJvbSBwcmV0dHkKPiA+ID4gbXVjaCBhbnl3aGVyZS4gSW5jbHVkaW5n
IHRyeV90b193YWtlX3VwLiBOb3RlIHRoYXQgdGhpcyBpc24ndCBjb21tb24sCj4gPiA+IHVzdWFs
bHkgdGhlIGJveCBpcyBpbiBwcmV0dHkgYmFkIHNoYXBlIGF0IHRoYXQgcG9pbnQgYWxyZWFkeS4g
QnV0IGl0Cj4gPiA+IHJlYWxseSBkb2Vzbid0IGhlbHAgd2hlbiB0aGVuIGxvY2tkZXAganVtcHMg
aW4gYW5kIHNwYW1zIHRoZSBsb2dzLAo+ID4gPiBwb3RlbnRpYWxseSBvYnNjdXJpbmcgdGhlIHJl
YWwgYmFja3RyYWNlIHdlJ3JlIHJlYWxseSBpbnRlcmVzdGVkIGluLgo+ID4gPiBPbmUgY2FzZSBJ
J3ZlIHNlZW4gKHNsaWdodGx5IHNpbXBsaWZpZWQgYmFja3RyYWNlKToKPiA+ID4KPiA+ID4gRml4
IHRoaXMgc3BlY2lmaWMgbG9ja2luZyByZWN1cnNpb24gYnkgbW92aW5nIHRoZSB3YWtlX3VwX3By
b2Nlc3Mgb3V0Cj4gPiA+IGZyb20gdW5kZXIgdGhlIHNlbWFwaG9yZS5sb2NrIHNwaW5sb2NrLCB1
c2luZyB3YWtlX3EgYXMgcmVjb21tZW5kZWQgYnkKPiA+ID4gUGV0ZXIgWmlqbHN0cmEuCj4gPgo+
ID4gSXQgbWlnaHQgbWFrZSBzZW5zZSB0byBtZW50aW9uIGFsc28gdGhlIG9wdGltaXphdGlvbiBl
ZmZlY3QgbWVudGlvbmVkCj4gPiBieSBQZXRlci4KPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9rZXJu
ZWwvbG9ja2luZy9zZW1hcGhvcmUuYyBiL2tlcm5lbC9sb2NraW5nL3NlbWFwaG9yZS5jCj4gPiA+
IGluZGV4IDU2MWFjZGQzOTk2MC4uN2E2ZjMzNzE1Njg4IDEwMDY0NAo+ID4gPiAtLS0gYS9rZXJu
ZWwvbG9ja2luZy9zZW1hcGhvcmUuYwo+ID4gPiArKysgYi9rZXJuZWwvbG9ja2luZy9zZW1hcGhv
cmUuYwo+ID4gPiBAQCAtMTY5LDYgKzE2OSwxNCBAQCBpbnQgZG93bl90aW1lb3V0KHN0cnVjdCBz
ZW1hcGhvcmUgKnNlbSwgbG9uZyB0aW1lb3V0KQo+ID4gPiAgfQo+ID4gPiAgRVhQT1JUX1NZTUJP
TChkb3duX3RpbWVvdXQpOwo+ID4gPgo+ID4gPiArLyogRnVuY3Rpb25zIGZvciB0aGUgY29udGVu
ZGVkIGNhc2UgKi8KPiA+ID4gKwo+ID4gPiArc3RydWN0IHNlbWFwaG9yZV93YWl0ZXIgewo+ID4g
PiArICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4gPiA+ICsgICAgIHN0cnVjdCB0YXNrX3N0
cnVjdCAqdGFzazsKPiA+ID4gKyAgICAgYm9vbCB1cDsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4g
IC8qKgo+ID4gPiAgICogdXAgLSByZWxlYXNlIHRoZSBzZW1hcGhvcmUKPiA+ID4gICAqIEBzZW06
IHRoZSBzZW1hcGhvcmUgdG8gcmVsZWFzZQo+ID4gPiBAQCAtMTc5LDI0ICsxODcsMjUgQEAgRVhQ
T1JUX1NZTUJPTChkb3duX3RpbWVvdXQpOwo+ID4gPiAgdm9pZCB1cChzdHJ1Y3Qgc2VtYXBob3Jl
ICpzZW0pCj4gPiA+ICB7Cj4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPiA+ICsg
ICAgIHN0cnVjdCBzZW1hcGhvcmVfd2FpdGVyICp3YWl0ZXI7Cj4gPiA+ICsgICAgIERFRklORV9X
QUtFX1Eod2FrZV9xKTsKPiA+Cj4gPiBXZSBuZWVkIHRvIGNhbGwgd2FrZV9xX2luaXQoJndha2Vf
cSkgdG8gbWFrZSBzdXJlIHRoYXQKPiA+IGl0IGlzIGVtcHR5Lgo+IAo+IERFRklORV9XQUtFX1Eg
ZG9lcyB0aGF0IGFscmVhZHksIGFuZCBpZiBpdCBkaWRuJ3QsIEknZCB3b25kZXIgaG93IEkKPiBt
YW5hZ2VkIHRvIGJvb3Qgd2l0aCB0aGlzIHBhdGNoLiBjb25zb2xlX2xvY2sgaXMgdXNhbGx5IHRl
cnJpYmx5Cj4gY29udGVudGVkIGJlY2F1c2UgdGhhbmtzIHRvIGZiY29uIHdlIG11c3QgZG8gYSBm
dWxsIGRpc3BsYXkgbW9kZXNldAo+IHdoaWxlIGhvbGRpbmcgaXQsIHdoaWNoIHRha2VzIGZvcmV2
ZXIuIEFzIGxvbmcgYXMgYW55b25lIHByaW50a3MKPiBtZWFud2hpbGUgKGd1YXJhbnRlZWQgd2hp
bGUgbG9hZGluZyBkcml2ZXJzIHJlYWxseSkgeW91IGhhdmUKPiBjb250ZW50aW9uLgo+IC1EYW5p
ZWwKCllvdSBhcmUgcmlnaHQuIEl0IGlzIGluaXRpYWxpemVkIGJ5IERFRklORV9XQUtFX1EuClRo
ZSBwYXRjaCBsb29rcyBjb3JyZWN0IHRvIG1lIHRoZW46CgpSZXZpZXdlZC1ieTogUGV0ciBNbGFk
ZWsgPHBtbGFkZWtAc3VzZSxjb20+CgpCZXN0IFJlZ2FyZHMsClBldHIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
