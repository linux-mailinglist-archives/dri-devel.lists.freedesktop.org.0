Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98164249909
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 11:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6406E200;
	Wed, 19 Aug 2020 09:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 35CB86E200;
 Wed, 19 Aug 2020 09:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1A61D2A6042;
 Wed, 19 Aug 2020 11:08:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 2EgwE8ADu5r7; Wed, 19 Aug 2020 11:08:10 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 7AD492A6016;
 Wed, 19 Aug 2020 11:08:10 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1k8K4i-0022xI-ON; Wed, 19 Aug 2020 11:08:04 +0200
Subject: Re: [PATCH] drm/amdgpu/dc: Simplify drm_crtc_state::active checks
To: Alex Deucher <alexdeucher@gmail.com>
References: <20200722123813.721041-1-michel@daenzer.net>
 <CAKMK7uGO3K0P1yJsdT0urEXOVyBCU_Gsm8JaAW3R0TrBkueYNg@mail.gmail.com>
 <c1bed91c-aa9d-140e-701b-6946995cf24f@amd.com>
 <46b17209-09f6-d5a8-1335-0ff5371659f6@daenzer.net>
 <CADnq5_MWoNt5LR3-E8eMbXhXNFS_ccbqev+96BJphzzeKi16nw@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <c0fa93ad-021d-8fb1-3fd3-f0d223a90563@daenzer.net>
Date: Wed, 19 Aug 2020 11:08:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_MWoNt5LR3-E8eMbXhXNFS_ccbqev+96BJphzzeKi16nw@mail.gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNy0yMiA3OjEyIHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToKPiBPbiBXZWQsIEp1
bCAyMiwgMjAyMCBhdCAxMDoyNSBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
PiB3cm90ZToKPj4gT24gMjAyMC0wNy0yMiAzOjEwIHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFz
IHdyb3RlOgo+Pj4gT24gMjAyMC0wNy0yMiA4OjUxIGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6
Cj4+Pj4gT24gV2VkLCBKdWwgMjIsIDIwMjAgYXQgMjozOCBQTSBNaWNoZWwgRMOkbnplciA8bWlj
aGVsQGRhZW56ZXIubmV0PiB3cm90ZToKPj4+Pj4KPj4+Pj4gRnJvbTogTWljaGVsIETDpG56ZXIg
PG1kYWVuemVyQHJlZGhhdC5jb20+Cj4+Pj4+Cj4+Pj4+IGRybV9hdG9taWNfY3J0Y19jaGVjayBl
bmZvcmNlcyB0aGF0IDo6YWN0aXZlIGNhbiBvbmx5IGJlIHRydWUgaWYKPj4+Pj4gOjplbmFibGUg
aXMgYXMgd2VsbC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGVsIETDpG56ZXIgPG1k
YWVuemVyQHJlZGhhdC5jb20+Cj4+Pgo+Pj4gTG9va3MgZmluZSB0byBtZS4gVGhlIGNoZWNrIGlz
IHN1ZmZpY2llbnRseSBvbGQgZW5vdWdoIHRoYXQgSSBkb24ndCBtaW5kCj4+PiByZWx5aW5nIG9u
IHRoZSBjb3JlIGZvciB0aGlzIGVpdGhlci4KPj4+Cj4+PiBSZXZpZXdlZC1ieTogTmljaG9sYXMg
S2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgo+Pj4KPj4+Pgo+Pj4+IG1v
ZGVzZXQgdnMgbW9kZXJlc2V0IGlzIGEgYml0IGFuIGluZ2xvcmlvdXMgbmFtZSBjaG9pY2UgLi4u
IHNpbmNlIHRoaXMKPj4+PiBzZWVtcyB0byBiZSBnbHVlIGNvZGUgYW5kIG5vdCBwYXJ0IG9mIGNv
cmUgZGMsIG1heWJlIHJlbmFtZSB0bwo+Pj4+IGVuYWJsZV9yZXF1aXJlZC9kaXNhYmxlX3JlcXVp
cmVkIHRvIGtlZXAgaXQgY29uc2lzdGVudCB3aXRoIHRoZQo+Pj4+IHdvcmRpbmcgYXRvbWljIGhl
bHBlcnMgdXNlPyBEQyBhbHNvIHNlZW1zIHRvIHVzZSByZXNldCBmb3IgYSBsb3Qgb2YKPj4+PiBv
dGhlciB0aGluZ3MgYWxyZWFkeSAoc3RhdGUgcmVzZXQsIGxpa2UgYXRvbWljLCBvciBncHUgcmVz
ZXQgbGlrZQo+Pj4+IGRybS9zY2hlZHVsZXIncyB0ZF9yXyksIHNvIEkgdGhpbmsgdGhpcyB3b3Vs
ZCBhbHNvIGhlbHAgY2xhcml0eSBmcm9tIGEKPj4+PiBEQyBwZXJzcGVjdGl2ZS4KPj4+Pgo+Pj4+
IFBhdGNoIGl0c2VsZiBpcyBnb29kLCBhYm92ZSBqdXN0IGFuIGlkZWEgZm9yIGFub3RoZXIgcGF0
Y2ggb24gdG9wLgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+Cj4+Cj4+IFRoYW5rcyBmb3IgdGhlIHJldmlld3MhIEkgYXNzdW1lIHRo
aXMgd2lsbCBnZXQgcGlja2VkIHVwIGJ5IGEgREMKPj4gZGV2ZWxvcGVyIG9yIEFsZXgvQ2hyaXN0
aWFuLgo+IAo+IEFwcGxpZWQuICBUaGFua3MhCgpUaGFuayB5b3UuIENhbid0IHNlZSBpdCBpbiB0
aGUgRFJNIGNoYW5nZXMgZm9yIDUuOSB0aG91Z2guCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOk
bnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGli
cmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5k
IFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
