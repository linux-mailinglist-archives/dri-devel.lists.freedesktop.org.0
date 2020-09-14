Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D86268F9F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 17:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2FA6E4CB;
	Mon, 14 Sep 2020 15:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1478D89FBC;
 Mon, 14 Sep 2020 15:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1BCC52A6042;
 Mon, 14 Sep 2020 17:22:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id MZD2H9OY1o96; Mon, 14 Sep 2020 17:22:14 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 1EABE2A6016;
 Mon, 14 Sep 2020 17:22:14 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kHqJ3-000a2j-Im; Mon, 14 Sep 2020 17:22:13 +0200
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <hwentlan@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <20200904104304.41246-1-michel@daenzer.net>
 <20200907075716.GO2352366@phenom.ffwll.local>
 <d0c95272-9a1c-f9f0-f1b9-4e7ce1f319c7@daenzer.net>
 <c64d591b-8f3c-5384-f103-3283bcf15c9d@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
Message-ID: <2c090b33-2709-1f83-41ec-56fc5cc9e2ce@daenzer.net>
Date: Mon, 14 Sep 2020 17:22:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <c64d591b-8f3c-5384-f103-3283bcf15c9d@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0xNCA0OjM3IHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+IE9u
IDIwMjAtMDktMTQgMzo1MiBhLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4gT24gMjAyMC0w
OS0wNyA5OjU3IGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+PiBPbiBGcmksIFNlcCAwNCwg
MjAyMCBhdCAxMjo0MzowNFBNICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+PiBGcm9t
OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KPj4+Pgo+Pj4+IERvbid0IGNo
ZWNrIGRybV9jcnRjX3N0YXRlOjphY3RpdmUgZm9yIHRoaXMgZWl0aGVyLCBwZXIgaXRzCj4+Pj4g
ZG9jdW1lbnRhdGlvbiBpbiBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oOgo+Pj4+Cj4+Pj4gwqAgKiBI
ZW5jZSBkcml2ZXJzIG11c3Qgbm90IGNvbnN1bHQgQGFjdGl2ZSBpbiB0aGVpciB2YXJpb3VzCj4+
Pj4gwqAgKiAmZHJtX21vZGVfY29uZmlnX2Z1bmNzLmF0b21pY19jaGVjayBjYWxsYmFjayB0byBy
ZWplY3QgYW4gYXRvbWljCj4+Pj4gwqAgKiBjb21taXQuCj4+Pj4KPj4+PiBhdG9taWNfcmVtb3Zl
X2ZiIGRpc2FibGVzIHRoZSBDUlRDIGFzIG5lZWRlZCBmb3IgZGlzYWJsaW5nIHRoZSBwcmltYXJ5
Cj4+Pj4gcGxhbmUuCj4+Pj4KPj4+PiBUaGlzIHByZXZlbnRzIGF0IGxlYXN0IHRoZSBmb2xsb3dp
bmcgcHJvYmxlbXMgaWYgdGhlIHByaW1hcnkgcGxhbmUgZ2V0cwo+Pj4+IGRpc2FibGVkIChlLmcu
IGR1ZSB0byBkZXN0cm95aW5nIHRoZSBGQiBhc3NpZ25lZCB0byB0aGUgcHJpbWFyeSBwbGFuZSwK
Pj4+PiBhcyBoYXBwZW5zIGUuZy4gd2l0aCBtdXR0ZXIgaW4gV2F5bGFuZCBtb2RlKToKPj4+Pgo+
Pj4+ICogVGhlIGxlZ2FjeSBjdXJzb3IgaW9jdGwgcmV0dXJuZWQgRUlOVkFMIGZvciBhIG5vbi0w
IGN1cnNvciBGQiBJRAo+Pj4+IMKgwqAgKHdoaWNoIGVuYWJsZXMgdGhlIGN1cnNvciBwbGFuZSku
Cj4+Pj4gKiBJZiB0aGUgY3Vyc29yIHBsYW5lIHdhcyBlbmFibGVkLCBjaGFuZ2luZyB0aGUgbGVn
YWN5IERQTVMgcHJvcGVydHkKPj4+PiDCoMKgIHZhbHVlIGZyb20gb2ZmIHRvIG9uIHJldHVybmVk
IEVJTlZBTC4KPj4+Pgo+Pj4+IHYyOgo+Pj4+ICogTWlub3IgY2hhbmdlcyB0byBjb2RlIGNvbW1l
bnQgYW5kIGNvbW1pdCBsb2csIHBlciByZXZpZXcgZmVlZGJhY2suCj4+Pj4KPj4+PiBHaXRMYWI6
IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tdXR0ZXIvLS9pc3N1ZXMvMTEwOAo+Pj4+
IEdpdExhYjogaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci8tL2lzc3Vlcy8x
MTY1Cj4+Pj4gR2l0TGFiOiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVyLy0v
aXNzdWVzLzEzNDQKPj4+PiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVy
QHJlZGhhdC5jb20+Cj4+Pgo+Pj4gQ29tbWl0IG1lc3NhZ2UgYWdyZWVzIHdpdGggbXkgdW5kZXJz
dGFuZCBvZiB0aGlzIG1hemUgbm93LCBzbzoKPj4+Cj4+PiBBY2tlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPj4KPj4gVGhhbmtzIERhbmllbCEKPj4KPj4KPj4g
TmljayAvIEhhcnJ5LCBhbnkgbW9yZSBmZWVkYmFjaz8gSWYgbm90LCBjYW4geW91IGFwcGx5IHRo
aXM/Cj4+Cj4+Cj4+IFAuUy4gU2luY2UgRENOIGRvZXNuJ3QgbWFrZSBhIGRpc3RpbmN0aW9uIGJl
dHdlZW4gcHJpbWFyeSBvciBvdmVybGF5IAo+PiBwbGFuZXMgaW4gaGFyZHdhcmUsIGNvdWxkIENo
cm9taXVtT1MgYWNoaWV2ZSB0aGUgc2FtZSBlZmZlY3Qgd2l0aCBvbmx5IAo+PiB0aGUgcHJpbWFy
eSBwbGFuZSBpbnN0ZWFkIG9mIG9ubHkgYW4gb3ZlcmxheSBwbGFuZT8gSWYgc28sIG1heWJlIAo+
PiB0aGVyZSdzIG5vIG5lZWQgZm9yIHRoZSAiYmxhY2sgcGxhbmUgaGFjayIuCj4+Cj4+Cj4gCj4g
SSBvbmx5IGtub3cgdGhhdCBhdG9taWN0ZXN0IHRyaWVzIHRvIGVuYWJsZSB0aGlzIGNvbmZpZ3Vy
YXRpb24uIE5vdCBzdXJlIAo+IGlmIENocm9taXVtT1Mgb3Igb3RoZXIgInJlYWwiIHVzZXJzcGFj
ZSB0cmllcyB0aGlzIGNvbmZpZ3VyYXRpb24uCgpTb21lb25lIG1lbnRpb25lZCB0aGF0IENocm9t
aXVtT1MgdXNlcyB0aGlzIGZvciB2aWRlbyBwbGF5YmFjayB3aXRoIApibGFjayBiYXJzICh3aGVu
IHRoZSB2aWRlbyBhc3BlY3QgcmF0aW8gZG9lc24ndCBtYXRjaCB0aGUgZGlzcGxheSdzKS4KCgo+
IE1heWJlIGZvciBub3cgdGhpcyBjYW4gZ28gaW4gYW5kIGlmIHNvbWV0aGluZyBicmVha3Mgd2Ug
Y2FuIGRlYWwgd2l0aCAKPiB0aGUgZmFsbG91dCB0aGVuLiBXZSBjYW4gYWx3YXlzIGdvIGJhY2sg
dG8gbHlpbmcgdG8gdXNlcnNwYWNlIGFib3V0IHRoZSAKPiBjdXJzb3IgYmVpbmcgdmlzaWJsZSBp
ZiB0aGUgY29tbWl0IGZhaWxzIGluIHRoYXQgY2FzZSBJIGd1ZXNzIFsuLi5dCgpJJ20gbm90IHN1
cmUgd2hhdCB5b3UgbWVhbiBieSB0aGF0IC8gaG93IGl0IGNvdWxkIHdvcmsuCgoKPiBSZXZpZXdl
ZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
VGhhbmtzIQoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAg
ICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3Qg
ICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
