Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F1100D28
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 21:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F84898F0;
	Mon, 18 Nov 2019 20:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14303898F0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:31:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAIKUemM042962;
 Mon, 18 Nov 2019 14:30:40 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAIKUeiO059253
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Nov 2019 14:30:40 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 14:30:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 14:30:40 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAIKUdtt074954;
 Mon, 18 Nov 2019 14:30:39 -0600
Subject: Re: [PATCH v16 0/5] DMA-BUF Heaps (destaging ION)
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20191118202332.109172-1-john.stultz@linaro.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <5a9ea98d-3486-8167-d2d5-aa055da65198@ti.com>
Date: Mon, 18 Nov 2019 15:30:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118202332.109172-1-john.stultz@linaro.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574109040;
 bh=1HeOOZNyIamu59+iWhM46Oa1+PcUf2PobgeWjYTCvkY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NCwSgh+zeYhqxG0WR45QaYJgg86n2DlKgc+twgdF5kJMP7Iiluw4ldxlc4ed/D1gW
 sSJkREwhKimFyZe+kRocT+nO4J4RfEmHIYLmPlkFmjtOvJl7VjoeymIkdBG99v3ZpL
 NZPAyDBvPlZpf8IlFnxGxS/vVnEAXkkZljCNMaks=
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>, dri-devel@lists.freedesktop.org,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTgvMTkgMzoyMyBQTSwgSm9obiBTdHVsdHogd3JvdGU6Cj4gSnVzdCB3YW50ZWQgdG8g
cmVzZW5kIHYxNiB3aXRoIGEgZmV3IG1pbm9yIGNoYW5nZXMuCj4gCj4gVGhpcyBwYXRjaHNldCBp
bXBsZW1lbnRzIHBlci1oZWFwIGRldmljZXMgd2hpY2ggY2FuIGJlIG9wZW5lZAo+IGRpcmVjdGx5
IGFuZCB0aGVuIGFuIGlvY3RsIGlzIHVzZWQgdG8gYWxsb2NhdGUgYSBkbWFidWYgZnJvbSB0aGUK
PiBoZWFwLgo+IAo+IFRoZSBpbnRlcmZhY2UgaXMgc2ltaWxhciwgYnV0IG11Y2ggc2ltcGxlciB0
aGVuIElPTnMsIG9ubHkKPiBwcm92aWRpbmcgYW4gQUxMT0MgaW9jdGwuCj4gCj4gQWxzbywgSSd2
ZSBwcm92aWRlZCByZWxhdGl2ZWx5IHNpbXBsZSBzeXN0ZW0gYW5kIGNtYSBoZWFwcy4KPiAKPiBJ
J3ZlIGJvb3RlZCBhbmQgdGVzdGVkIHRoZXNlIHBhdGNoZXMgd2l0aCBBT1NQIG9uIHRoZSBIaUtl
eTk2MAo+IHVzaW5nIHRoZSBrZXJuZWwgdHJlZSBoZXJlOgo+ICAgaHR0cHM6Ly9naXQubGluYXJv
Lm9yZy9wZW9wbGUvam9obi5zdHVsdHovYW5kcm9pZC1kZXYuZ2l0L2xvZy8/aD1kZXYvZG1hLWJ1
Zi1oZWFwCj4gCj4gQW5kIHRoZSByZXZpZXdlZCAoKzInZWQpIHVzZXJzcGFjZSBjaGFuZ2VzIGhl
cmU6Cj4gICBodHRwczovL2FuZHJvaWQtcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vYy9kZXZpY2Uv
bGluYXJvL2hpa2V5LysvOTA5NDM2Cj4gCj4gQ29tcGFyZWQgdG8gSU9OLCB0aGlzIHBhdGNoc2V0
IGlzIG1pc3NpbmcgdGhlIHN5c3RlbS1jb250aWcsCj4gY2FydmVvdXQgYW5kIGNodW5rIGhlYXBz
LCBhcyBJIGRvbid0IGhhdmUgYSBkZXZpY2UgdGhhdCB1c2VzCgoKSU9OJ3MgQ2FydmVvdXQgYW5k
IENodW5rIGhlYXBzIGdvdCBkcm9wcGVkIGZyb20gdXBzdHJlYW0sIHNvIG5vIGdhcAp0aGVyZS4g
OikKCkFuZHJldwoKCj4gdGhvc2UsIHNvIEknbSB1bmFibGUgdG8gZG8gbXVjaCB1c2VmdWwgdmFs
aWRhdGlvbiB0aGVyZS4KPiBBZGRpdGlvbmFsbHkgd2UgaGF2ZSBubyB1cHN0cmVhbSB1c2VycyBv
ZiBjaHVuayBvciBjYXJ2ZW91dCwKPiBhbmQgdGhlIHN5c3RlbS1jb250aWcgaGFzIGJlZW4gZGVw
cmVjYXRlZCBpbiB0aGUgY29tbW9uL2FuZG9pZC0qCj4ga2VybmVscywgc28gdGhpcyBzaG91bGQg
YmUgb2suCj4gCj4gSSd2ZSBhbHNvIHJlbW92ZWQgdGhlIHN0YXRzIGFjY291bnRpbmcsIHNpbmNl
IGFueSBzdWNoCj4gYWNjb3VudGluZyBzaG91bGQgYmUgaW1wbGVtZW50ZWQgYnkgZG1hLWJ1ZiBj
b3JlIG9yIHRoZSBoZWFwcwo+IHRoZW1zZWx2ZXMuCj4gCj4gTmV3IGluIHYxNjoKPiAqIFR5cG8g
Zml4IHN1Z2dlc3RlZCBieSBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KPiAq
IEFkZCBleHRyYSBlcnJvciBhbmQgaW9jdGwgY29tcGF0aWJpbGl0eSB0ZXN0aW5nIHN1Z2dlc3Rl
ZCBieQo+ICAgRGFuaWVsIFZldHRlciB0byB0aGUga3NlbGZ0ZXN0IHRlc3QKPiAKPiBUaGFua3Mg
YWdhaW4gZm9yIGFsbCB0aGUgcmV2aWV3cyBhbmQgZmVlZGJhY2shCj4gLWpvaG4KPiAKPiBDYzog
TGF1cmEgQWJib3R0IDxsYWJib3R0QHJlZGhhdC5jb20+Cj4gQ2M6IEJlbmphbWluIEdhaWduYXJk
IDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3Jn
Pgo+IENjOiBQcmF0aWsgUGF0ZWwgPHByYXRpa3BAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IEJyaWFu
IFN0YXJrZXkgPEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4KPiBDYzogVmluY2VudCBEb25uZWZvcnQg
PFZpbmNlbnQuRG9ubmVmb3J0QGFybS5jb20+Cj4gQ2M6IFN1ZGlwdG8gUGF1bCA8U3VkaXB0by5Q
YXVsQGFybS5jb20+Cj4gQ2M6IEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4KPiBDYzogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPgo+IENjOiBDaGVuYm8gRmVuZyA8ZmVu
Z2NAZ29vZ2xlLmNvbT4KPiBDYzogQWxpc3RhaXIgU3RyYWNoYW4gPGFzdHJhY2hhbkBnb29nbGUu
Y29tPgo+IENjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KPiBDYzogU2Fu
ZGVlcCBQYXRpbCA8c3NwYXRpbEBnb29nbGUuY29tPgo+IENjOiBIaWxsZiBEYW50b24gPGhkYW50
b25Ac2luYS5jb20+Cj4gQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IAo+IEFuZHJldyBGLiBEYXZpcyAoMSk6
Cj4gICBkbWEtYnVmOiBBZGQgZG1hLWJ1ZiBoZWFwcyBmcmFtZXdvcmsKPiAKPiBKb2huIFN0dWx0
eiAoNCk6Cj4gICBkbWEtYnVmOiBoZWFwczogQWRkIGhlYXAgaGVscGVycwo+ICAgZG1hLWJ1Zjog
aGVhcHM6IEFkZCBzeXN0ZW0gaGVhcCB0byBkbWFidWYgaGVhcHMKPiAgIGRtYS1idWY6IGhlYXBz
OiBBZGQgQ01BIGhlYXAgdG8gZG1hYnVmIGhlYXBzCj4gICBrc2VsZnRlc3RzOiBBZGQgZG1hLWhl
YXAgdGVzdAo+IAo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTggKwo+ICBkcml2ZXJzL2RtYS1idWYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTEgKwo+ICBkcml2ZXJzL2RtYS1idWYvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDIgKwo+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyAgICAgICAgICAgICAgICAg
ICAgfCAyOTcgKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgfCAgMTQgKwo+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgfCAgIDQgKwo+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAu
YyAgICAgICAgICAgICAgfCAxNzcgKysrKysrKysKPiAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hl
YXAtaGVscGVycy5jICAgICAgICAgIHwgMjcxICsrKysrKysrKysrKwo+ICBkcml2ZXJzL2RtYS1i
dWYvaGVhcHMvaGVhcC1oZWxwZXJzLmggICAgICAgICAgfCAgNTMgKysrCj4gIGRyaXZlcnMvZG1h
LWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jICAgICAgICAgICB8IDEyMyArKysrKysKPiAgaW5jbHVk
ZS9saW51eC9kbWEtaGVhcC5oICAgICAgICAgICAgICAgICAgICAgIHwgIDU5ICsrKwo+ICBpbmNs
dWRlL3VhcGkvbGludXgvZG1hLWhlYXAuaCAgICAgICAgICAgICAgICAgfCAgNTMgKysrCj4gIHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9NYWtlZmlsZSB8ICAgNiArCj4gIC4u
Li9zZWxmdGVzdHMvZG1hYnVmLWhlYXBzL2RtYWJ1Zi1oZWFwLmMgICAgICB8IDM5NiArKysrKysr
KysrKysrKysrKysKPiAgMTQgZmlsZXMgY2hhbmdlZCwgMTQ4NCBpbnNlcnRpb25zKCspCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYwo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9NYWtlZmlsZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9saW51eC9kbWEtaGVhcC5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L3VhcGkvbGludXgvZG1hLWhlYXAuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvZG1hYnVmLWhlYXBzL01ha2VmaWxlCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kbWFidWYtaGVhcHMvZG1hYnVmLWhlYXAuYwo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
