Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02C229A02
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 16:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A3F6E82C;
	Wed, 22 Jul 2020 14:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 708706E822;
 Wed, 22 Jul 2020 14:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id ACA672A6042;
 Wed, 22 Jul 2020 16:25:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id TJlbLCb-8e4Y; Wed, 22 Jul 2020 16:25:11 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 0E7842A6016;
 Wed, 22 Jul 2020 16:25:11 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1jyFgI-000tAO-OX; Wed, 22 Jul 2020 16:25:10 +0200
Subject: Re: [PATCH] drm/amdgpu/dc: Simplify drm_crtc_state::active checks
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200722123813.721041-1-michel@daenzer.net>
 <CAKMK7uGO3K0P1yJsdT0urEXOVyBCU_Gsm8JaAW3R0TrBkueYNg@mail.gmail.com>
 <c1bed91c-aa9d-140e-701b-6946995cf24f@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <46b17209-09f6-d5a8-1335-0ff5371659f6@daenzer.net>
Date: Wed, 22 Jul 2020 16:25:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c1bed91c-aa9d-140e-701b-6946995cf24f@amd.com>
Content-Language: en-CA
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNy0yMiAzOjEwIHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+IE9u
IDIwMjAtMDctMjIgODo1MSBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+PiBPbiBXZWQsIEp1
bCAyMiwgMjAyMCBhdCAyOjM4IFBNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+
IHdyb3RlOgo+Pj4KPj4+IEZyb206IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29t
Pgo+Pj4KPj4+IGRybV9hdG9taWNfY3J0Y19jaGVjayBlbmZvcmNlcyB0aGF0IDo6YWN0aXZlIGNh
biBvbmx5IGJlIHRydWUgaWYKPj4+IDo6ZW5hYmxlIGlzIGFzIHdlbGwuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+Cj4gCj4gTG9va3Mg
ZmluZSB0byBtZS4gVGhlIGNoZWNrIGlzIHN1ZmZpY2llbnRseSBvbGQgZW5vdWdoIHRoYXQgSSBk
b24ndCBtaW5kCj4gcmVseWluZyBvbiB0aGUgY29yZSBmb3IgdGhpcyBlaXRoZXIuCj4gCj4gUmV2
aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNv
bT4KPiAKPj4KPj4gbW9kZXNldCB2cyBtb2RlcmVzZXQgaXMgYSBiaXQgYW4gaW5nbG9yaW91cyBu
YW1lIGNob2ljZSAuLi4gc2luY2UgdGhpcwo+PiBzZWVtcyB0byBiZSBnbHVlIGNvZGUgYW5kIG5v
dCBwYXJ0IG9mIGNvcmUgZGMsIG1heWJlIHJlbmFtZSB0bwo+PiBlbmFibGVfcmVxdWlyZWQvZGlz
YWJsZV9yZXF1aXJlZCB0byBrZWVwIGl0IGNvbnNpc3RlbnQgd2l0aCB0aGUKPj4gd29yZGluZyBh
dG9taWMgaGVscGVycyB1c2U/IERDIGFsc28gc2VlbXMgdG8gdXNlIHJlc2V0IGZvciBhIGxvdCBv
Zgo+PiBvdGhlciB0aGluZ3MgYWxyZWFkeSAoc3RhdGUgcmVzZXQsIGxpa2UgYXRvbWljLCBvciBn
cHUgcmVzZXQgbGlrZQo+PiBkcm0vc2NoZWR1bGVyJ3MgdGRfcl8pLCBzbyBJIHRoaW5rIHRoaXMg
d291bGQgYWxzbyBoZWxwIGNsYXJpdHkgZnJvbSBhCj4+IERDIHBlcnNwZWN0aXZlLgo+Pgo+PiBQ
YXRjaCBpdHNlbGYgaXMgZ29vZCwgYWJvdmUganVzdCBhbiBpZGVhIGZvciBhbm90aGVyIHBhdGNo
IG9uIHRvcC4KPj4KPj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+CgpUaGFua3MgZm9yIHRoZSByZXZpZXdzISBJIGFzc3VtZSB0aGlzIHdpbGwgZ2V0
IHBpY2tlZCB1cCBieSBhIERDCmRldmVsb3BlciBvciBBbGV4L0NocmlzdGlhbi4KCgo+IFRoYXQg
c291bmRzIGxpa2UgYSByZWFzb25hYmxlIGlkZWEgdG8gbWUuIFRoZXNlIGFyZSB1c2VkIG1vcmUg
YXMgYQo+IHN0cmVhbV9jaGFuZ2VkIC8gc3RyZWFtX3JlbW92ZWQgZmxhZywgYnV0IEkgZG9uJ3Qg
dGhpbmsgdGhlc2UgaGVscGVycwo+IHJlYWxseSBuZWVkIHRvIGV4aXN0IGF0IGFsbC4KPiAKPiBU
aGF0IGNvdWxkIGNvbWUgYXMgYSBmb2xsb3cgdXAgcGF0Y2guCgpZZWFoLCBJJ20gbGVhdmluZyB0
aGF0IHRvIHlvdSBndXlzLiA6KQoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJl
IGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Bl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
