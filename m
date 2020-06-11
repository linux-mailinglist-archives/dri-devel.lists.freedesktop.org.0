Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823541F617B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 08:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3567B6E184;
	Thu, 11 Jun 2020 06:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231936E184;
 Thu, 11 Jun 2020 06:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id D15073F549;
 Thu, 11 Jun 2020 08:12:42 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=YlFnJNUr; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSRkZ3Q2_OhF; Thu, 11 Jun 2020 08:12:41 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id B70A03F45D;
 Thu, 11 Jun 2020 08:12:38 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 015A1360305;
 Thu, 11 Jun 2020 08:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1591855958; bh=F+pzL+/7Iepj8sbdVKXL9keDZaOhOOp5+bhmnhZ/FzQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YlFnJNUrh4WPbOZ9tC6bji7w3aSXPZrWDiHLiy6jdr/4M82FgP0RCwPwkmMnTGuIp
 v03/fYuJ5EGbkf49r2pTHUGs6BLGPTDBLm83kEI81VwWUvCkMJDLXeX28XyLqECqcz
 Gk2KiL7uAbtdUk6i/79bwhIlyr/GKQZWT1W8pw9A=
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: Daniel Vetter <daniel@ffwll.ch>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
 <ce6f6109-67df-e3d0-d56e-3f5c27df40a0@amd.com>
 <20200610153020.GZ20149@phenom.ffwll.local>
 <715ad9d4-7763-382e-237e-8daab42eff46@shipmail.org>
 <CAKMK7uGyKKEk4fFdr45ipe0MmS_1qrv8z0QEPWk=zuwhiUajVA@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <a243f0c6-2b92-a9a8-5ed7-b33a403db54e@shipmail.org>
Date: Thu, 11 Jun 2020 08:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGyKKEk4fFdr45ipe0MmS_1qrv8z0QEPWk=zuwhiUajVA@mail.gmail.com>
Content-Language: en-US
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
Cc: "michel@daenzer.net" <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTAvMjAgMTE6MTYgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gV2VkLCBKdW4g
MTAsIDIwMjAgYXQgMTA6MzAgUE0gVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQo+IDx0aG9tYXNf
b3NAc2hpcG1haWwub3JnPiB3cm90ZToKPj4KPj4gT24gNi8xMC8yMCA1OjMwIFBNLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+Pj4gT24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMDQ6MDU6MDRQTSArMDIw
MCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBBbSAxMC4wNi4yMCB1bSAxNTo1NCBzY2hy
aWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+PiBPbiA2LzEwLzIwIDY6MTUgQU0sIFRob21hcyBI
ZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4+Pj4+PiBPbiA2LzkvMjAgNzoyMSBQTSwgS29lbmln
LCBDaHJpc3RpYW4gd3JvdGU6Cj4+Pj4+Pj4gQW0gMDkuMDYuMjAyMCAxODozNyBzY2hyaWViICJH
cm9kem92c2t5LCBBbmRyZXkiCj4+Pj4+Pj4gPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+Ogo+
Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAgICBPbiA2LzUvMjAgMjo0MCBQTSwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToKPj4+Pj4+PiAgICAgICA+IEFtIDA1LjA2LjIwIHVtIDE2OjI5IHNjaHJp
ZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4gICAgICAgPj4KPj4+Pj4+PiAgICAgICA+PiBP
biA1LzExLzIwIDI6NDUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4gICAgICAg
Pj4+IEFtIDA5LjA1LjIwIHVtIDIwOjUxIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+
Pj4gICAgICAgPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdy
b2R6b3Zza3lAYW1kLmNvbT4KPj4+Pj4+PiAgICAgICA+Pj4+IC0tLQo+Pj4+Pj4+ICAgICAgID4+
Pj4gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICB8IDIyICsrKysrKysrKysrKysrKysr
KysrKy0KPj4+Pj4+PiAgICAgICA+Pj4+IGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgg
fCAgMiArKwo+Pj4+Pj4+ICAgICAgID4+Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4+PiAgICAgICA+Pj4+Cj4+Pj4+Pj4gICAgICAgPj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+Pj4+ICAgICAg
ID4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+Pj4gICAgICAgPj4+PiBp
bmRleCBjNWI1MTZmLi5lYWU2MWNjIDEwMDY0NAo+Pj4+Pj4+ICAgICAgID4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+Pj4+ICAgICAgID4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+Pj4+ICAgICAgID4+Pj4gQEAgLTE3NTAsOSArMTc1
MCwyOSBAQCB2b2lkIHR0bV9ib191bm1hcF92aXJ0dWFsKHN0cnVjdAo+Pj4+Pj4+ICAgICAgID4+
Pj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+Pj4+Pj4+ICAgICAgID4+Pj4gdHRtX2JvX3VubWFw
X3ZpcnR1YWxfbG9ja2VkKGJvKTsKPj4+Pj4+PiAgICAgICA+Pj4+IHR0bV9tZW1faW9fdW5sb2Nr
KG1hbik7Cj4+Pj4+Pj4gICAgICAgPj4+PiAgIH0KPj4+Pj4+PiAgICAgICA+Pj4+ICtFWFBPUlRf
U1lNQk9MKHR0bV9ib191bm1hcF92aXJ0dWFsKTsKPj4+Pj4+PiAgICAgICA+Pj4+ICAgK3ZvaWQg
dHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZShzdHJ1Y3QKPj4+Pj4+PiAgICAgICB0
dG1fYm9fZGV2aWNlICpiZGV2KQo+Pj4+Pj4+ICAgICAgID4+Pj4gK3sKPj4+Pj4+PiAgICAgICA+
Pj4+ICsgICAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW47Cj4+Pj4+Pj4gICAgICAg
Pj4+PiArICAgIGludCBpOwo+Pj4+Pj4+ICAgICAgID4+Pj4gLUVYUE9SVF9TWU1CT0wodHRtX2Jv
X3VubWFwX3ZpcnR1YWwpOwo+Pj4+Pj4+ICAgICAgID4+Pgo+Pj4+Pj4+ICAgICAgID4+Pj4gKyAg
ICBmb3IgKGkgPSAwOyBpIDwgVFRNX05VTV9NRU1fVFlQRVM7IGkrKykgewo+Pj4+Pj4+ICAgICAg
ID4+Pj4gKyAgICAgICAgbWFuID0gJmJkZXYtPm1hbltpXTsKPj4+Pj4+PiAgICAgICA+Pj4+ICsg
ICAgICAgIGlmIChtYW4tPmhhc190eXBlICYmIG1hbi0+dXNlX3R5cGUpCj4+Pj4+Pj4gICAgICAg
Pj4+PiArIHR0bV9tZW1faW9fbG9jayhtYW4sIGZhbHNlKTsKPj4+Pj4+PiAgICAgICA+Pj4+ICsg
ICAgfQo+Pj4+Pj4+ICAgICAgID4+Pgo+Pj4+Pj4+ICAgICAgID4+PiBZb3Ugc2hvdWxkIGRyb3Ag
dGhhdCBpdCB3aWxsIGp1c3QgcmVzdWx0IGluIGEgZGVhZGxvY2sKPj4+Pj4+PiAgICAgICB3YXJu
aW5nIGZvcgo+Pj4+Pj4+ICAgICAgID4+PiBOb3V2ZWF1IGFuZCBoYXMgbm8gZWZmZWN0IGF0IGFs
bC4KPj4+Pj4+PiAgICAgICA+Pj4KPj4+Pj4+PiAgICAgICA+Pj4gQXBhcnQgZnJvbSB0aGF0IGxv
b2tzIGdvb2QgdG8gbWUsCj4+Pj4+Pj4gICAgICAgPj4+IENocmlzdGlhbi4KPj4+Pj4+PiAgICAg
ICA+Pgo+Pj4+Pj4+ICAgICAgID4+Cj4+Pj4+Pj4gICAgICAgPj4gQXMgSSBhbSBjb25zaWRlcmlu
ZyB0byByZS1pbmNsdWRlIHRoaXMgaW4gVjIgb2YgdGhlCj4+Pj4+Pj4gICAgICAgcGF0Y2hzZXRz
LCBjYW4KPj4+Pj4+PiAgICAgICA+PiB5b3UgY2xhcmlmeSBwbGVhc2Ugd2h5IHRoaXMgd2lsbCBo
YXZlIG5vIGVmZmVjdCBhdCBhbGwgPwo+Pj4+Pj4+ICAgICAgID4KPj4+Pj4+PiAgICAgICA+IFRo
ZSBsb2NrcyBhcmUgZXhjbHVzaXZlIGZvciBOb3V2ZWF1IHRvIGFsbG9jYXRlL2ZyZWUgdGhlIGlv
Cj4+Pj4+Pj4gICAgICAgYWRkcmVzcwo+Pj4+Pj4+ICAgICAgID4gc3BhY2UuCj4+Pj4+Pj4gICAg
ICAgPgo+Pj4+Pj4+ICAgICAgID4gU2luY2Ugd2UgZG9uJ3QgZG8gdGhpcyBoZXJlIHdlIGRvbid0
IG5lZWQgdGhlIGxvY2tzLgo+Pj4+Pj4+ICAgICAgID4KPj4+Pj4+PiAgICAgICA+IENocmlzdGlh
bi4KPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgICAgU28gYmFzaWNhbGx5IGNhbGxpbmcgdW5t
YXBfbWFwcGluZ19yYW5nZSBkb2Vzbid0IHJlcXVpcmUgYW55IGV4dHJhCj4+Pj4+Pj4gICAgICAg
bG9ja2luZyBhcm91bmQgaXQgYW5kIHdoYXRldmVyIGxvY2tzIGFyZSB0YWtlbiB3aXRoaW4gdGhl
IGZ1bmN0aW9uCj4+Pj4+Pj4gICAgICAgc2hvdWxkIGJlIGVub3VnaCA/Cj4+Pj4+Pj4KPj4+Pj4+
Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB0aGluayBzbywgeWVzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hyaXN0
aWFuLgo+Pj4+Pj4gWWVzLCB0aGF0J3MgdHJ1ZS4gSG93ZXZlciwgd2l0aG91dCB0aGUgYm8gcmVz
ZXJ2YXRpb24sIG5vdGhpbmcgc3RvcHMKPj4+Pj4+IGEgUFRFIGZyb20gYmVpbmcgaW1tZWRpYXRl
bHkgcmUtZmF1bHRlZCBiYWNrIGFnYWluLiBFdmVuIHdoaWxlCj4+Pj4+PiB1bm1hcF9tYXBwaW5n
X3JhbmdlKCkgaXMgcnVubmluZy4KPj4+Pj4+Cj4+Pj4+IENhbiB5b3UgZXhwbGFpbiBtb3JlIG9u
IHRoaXMgLSBzcGVjaWZpY2FsbHksIHdoaWNoIGZ1bmN0aW9uIHRvIHJlc2VydmUKPj4+Pj4gdGhl
IEJPLCB3aHkgQk8gcmVzZXJ2YXRpb24gd291bGQgcHJldmVudCByZS1mYXVsdCBvZiB0aGUgUFRF
ID8KPj4+Pj4KPj4+PiBUaG9tYXMgaXMgdGFsa2luZyBhYm91dCB0dG1fYm9fcmVzZXJ2ZXIoKS90
dG1fYm9fdW5yZXNlcnZlKCksIGJ1dCB3ZSBkb24ndAo+Pj4+IG5lZWQgdGhpcyBiZWNhdXNlIHdl
IHVubWFwIGV2ZXJ5dGhpbmcgYmVjYXVzZSB0aGUgd2hvbGUgZGV2aWNlIGlzIGdvbmUgYW5kCj4+
Pj4gbm90IGp1c3QgbWFuaXB1bGF0ZSBhIHNpbmdsZSBCTy4KPj4+Pgo+Pj4+Pj4gU28gdGhlIGRl
dmljZSByZW1vdmVkIGZsYWcgbmVlZHMgdG8gYmUgYWR2ZXJ0aXplZCBiZWZvcmUgdGhpcwo+Pj4+
Pj4gZnVuY3Rpb24gaXMgcnVuLAo+Pj4+Pj4KPj4+Pj4gSSBpbmRlZWQgaW50ZW5kIHRvIGNhbGwg
dGhpcyAgcmlnaHQgYWZ0ZXIgY2FsbGluZyBkcm1fZGV2X3VucGx1ZyBmcm9tCj4+Pj4+IGFtZGdw
dV9wY2lfcmVtb3ZlIHdoaWxlIGFkZGluZyBkcm1fZGV2X2VudGVyL2V4aXQgaW4gdHRtX2JvX3Zt
X2ZhdWx0IChvcgo+Pj4+PiBpbiBhbWRncHUgc3BlY2lmaWMgd3JhcHBlciBzaW5jZSBJIGRvbid0
IHNlZSBob3cgY2FuIEkgYWNjZXNzIHN0cnVjdAo+Pj4+PiBkcm1fZGV2aWNlIGZyb20gdHRtX2Jv
X3ZtX2ZhdWx0KSBhbmQgdGhpcyBpbiBteSB1bmRlcnN0YW5kaW5nIHNob3VsZAo+Pj4+PiBzdG9w
IGEgUFRFIGZyb20gYmVpbmcgcmUtZmF1bHRlZCBiYWNrIGFzIHlvdSBwb2ludGVkIG91dCAtIHNv
IGFnYWluIEkKPj4+Pj4gZG9uJ3Qgc2VlIGhvdyAgYm8gcmVzZXJ2YXRpb24gd291bGQgcHJldmVu
dCBpdCBzbyBpdCBsb29rcyBsaWtlIEkgYW0KPj4+Pj4gbWlzc2luZyBzb21ldGhpbmcuLi4KPj4+
Pj4KPj4+Pj4KPj4+Pj4+IChwZXJoYXBzIHdpdGggYSBtZW1vcnkgYmFycmllciBwYWlyKS4KPj4+
Pj4+Cj4+Pj4+IGRybV9kZXZfdW5wbHVnIGFuZCBkcm1fZGV2X2VudGVyL2V4aXQgYXJlIFJDVSBz
eW5jaHJvbml6ZWQgYW5kIHNvIEkKPj4+Pj4gZG9uJ3QgdGhpbmsgcmVxdWlyZSBhbnkgZXh0cmEg
bWVtb3J5IGJhcnJpZXJzIGZvciB2aXNpYmlsaXR5IG9mIHRoZQo+Pj4+PiByZW1vdmVkIGZsYWcg
YmVpbmcgc2V0Cj4+Pj4+Cj4+Pj4gQXMgZmFyIGFzIEkgY2FuIHNlZSB0aGF0IHNob3VsZCBiZSBw
ZXJmZWN0bHkgc3VmZmljaWVudC4KPj4+IE9ubHkgaWYgeW91IGhhdmUgYSBkcm1fZGV2X2VudGVy
L2V4aXQgcGFpciBpbiB5b3VyIGZhdWx0IGhhbmRsZXIuCj4+PiBPdGhlcndpc2UgeW91J3JlIHN0
aWxsIG9wZW4gdG8gdGhlIHJhY2VzIFRob21hcyBkZXNjcmliZWQuIEJ1dCBhc2lkZSBmcm9tCj4+
PiB0aGF0IHRoZSBkcm1fZGV2X3VucGx1ZyBzdHVmZiBoYXMgYWxsIHRoZSBiYXJyaWVycyBhbmQg
c3R1ZmYgdG8gbWFrZSBzdXJlCj4+PiBub3RoaW5nIGVzY2FwZXMuCj4+Pgo+Pj4gRmFpbHVyZSB0
byBkcm1fZGV2X2VudGVyIGNvdWxkIHRoZW4gYWxzbyB0cmlnZ2VyIHRoZSBzcGVjaWFsIGNhc2Ug
d2hlcmUgd2UKPj4+IHB1dCBhIGR1bW15IHBhZ2UgaW4gcGxhY2UuCj4+PiAtRGFuaWVsCj4+IEht
bSwgWWVzLCBpbmRlZWQgYWR2ZXJ0aXppbmcgdGhlIGZsYWcgYmVmb3JlIHRoZSBjYWxsIHRvCj4+
IHVubWFwX21hcHBpbmdfcmFuZ2UgaXNuJ3QgZW5vdWdoLCBzaW5jZSB0aGVyZSBtaWdodCBiZSBm
YXVsdCBoYW5kbGVycwo+PiBydW5uaW5nIHRoYXQgaGF2ZW4ndCBwaWNrZWQgdXAgdGhlIGZsYWcg
d2hlbiB1bm1hcF9tYXBwaW5nX3JhbmdlIGlzCj4+IGxhdW5jaGVkLgo+IEhtIC4uLiBOb3cgSSdt
IG5vdCBzdXJlIGRybV9kZXZfZW50ZXIvZXhpdCBpcyBhY3R1YWxseSBnb29kIGVub3VnaC4gSQo+
IGd1ZXNzIGlmIHlvdSB1c2Ugdm1mX2luc2VydF9wZm4gd2l0aGluIHRoZSBkcm1fZGV2X2VudGVy
L2V4aXQgY3JpdGljYWwKPiBzZWN0aW9uLCBpdCBzaG91bGQgYmUgZmluZS4gQnV0IEkgdGhpbmsg
eW91IGNhbiBhbHNvIGRvIGZhdWx0IGhhbmRsZXJzCj4gdGhhdCBqdXN0IHJldHVybiB0aGUgc3Ry
dWN0IHBhZ2UgYW5kIHRoZW4gbGV0IGNvcmUgaGFuZGxlIHRoZSBwdGUKPiB3cmFuZ2xpbmcsIHRo
b3NlIHdvdWxkIGluZGVlZCByYWNlIGFuZCB3ZSBjYW4ndCBoYXZlIHRoYXQgSSB0aGluay4KCkZv
ciB0aGUgVFRNIGRyaXZlcnMsIGhhdmluZyBhIGZhdWx0IGhhbmRsZXIgdGhhdCBkZWZlcnMgdGhl
IHB0ZSAKaW5zZXJ0aW9uIHRvIHRoZSBjb3JlIHdvdWxkIGJyZWFrIGFsc28gdGhlIGJvIHN5bmNo
cm9uaXphdGlvbiBzbyBJIGRvbid0IAp0aGluayB0aGF0IHdpbGwgZXZlciBoYXBwZW4uIFRvIG1h
a2Ugc3VyZSB3ZSBjb3VsZCBwZXJoYXBzIGFkZCBhIHJldHVybiAKdmFsdWUgd2FybmluZyBhdCB0
aGUgZW5kIG9mIHRoZSBmYXVsdCBoYW5kbGVyIHdpdGggYSBjb21tZW50IGV4cGxhaW5pbmcgCndo
eSB0aGlzIGlzIGEgYmFkIGlkZWEuCgo+Cj4gSSB0aGluayB3ZSBzaG91bGQgdHJ5IGFuZCBtYWtl
IHN1cmUgKGFzIG11Y2ggYXMgcG9zc2libGUpIHRoYXQgdGhpcyBpcwo+IGRvbmUgYWxsIGRvbmUg
aW4gaGVscGVycyBhbmQgbm90IHNvbWUgb3BlbiBjb2RlZCBzdHVmZiBpbiBkcml2ZXJzLCBvcgo+
IHdlJ2xsIGp1c3QgZ2V0IGl0IGFsbCB3cm9uZyBpbiB0aGUgZGV0YWlscy4KCklmIGRvYWJsZSwg
Y29uc2lkZXJpbmcgYWxsIHRoZSB2YXJpb3VzIGZhdWx0IGhhbmRsZXJzIHdlIGhhdmUgaW4gRFJN
LCBJIAphZ3JlZS4KCi9UaG9tYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
