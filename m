Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3F326047
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 10:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3D06E28B;
	Fri, 26 Feb 2021 09:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8596E249;
 Fri, 26 Feb 2021 09:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 5574A3F71E;
 Fri, 26 Feb 2021 10:41:13 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=LfLxKa00; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.534
X-Spam-Level: 
X-Spam-Status: No, score=-2.534 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pa_KGOuTX1l6; Fri, 26 Feb 2021 10:41:10 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 20FF43F6D3;
 Fri, 26 Feb 2021 10:41:07 +0100 (CET)
Received: from [10.249.254.23] (irdmzpr01-ext.ir.intel.com [192.198.151.36])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7B5893600D9;
 Fri, 26 Feb 2021 10:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1614332467; bh=oFakJDD0y6u0RjK0RB8ojGNfQbbvgx821ZF1dWa6LWk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LfLxKa00FtOwjT6ow4NaHyKCnW2bQpNM0ORpnRTLPNQChXF21NtkSfvUML6HhtFj4
 wCIca95gFvLMmlxYNp08LXrO/a3VeuacMM9gPi62fFgXfe7qWtrvULgHKuctPpFhBd
 OuXCdDQawWSGquUsnmkoTuQB3HoIYQEWBiU+8RVs=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
Date: Fri, 26 Feb 2021 10:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Matthew Wilcox <willy@infradead.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMjUvMjEgNDo0OSBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIEZlYiAy
NSwgMjAyMSBhdCAxMTo0NCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3Rl
Ogo+PiBPbiBUaHUsIEZlYiAyNSwgMjAyMSBhdCAxMToyODozMUFNICswMTAwLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOgo+Pj4gQW0gMjQuMDIuMjEgdW0gMTA6MzEgc2NocmllYiBEYW5pZWwgVmV0
dGVyOgo+Pj4+IE9uIFdlZCwgRmViIDI0LCAyMDIxIGF0IDEwOjE2IEFNIFRob21hcyBIZWxsc3Ry
w7ZtIChJbnRlbCkKPj4+PiA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+Pj4+IE9u
IDIvMjQvMjEgOTo0NSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4+IE9uIFdlZCwgRmVi
IDI0LCAyMDIxIGF0IDg6NDYgQU0gVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQo+Pj4+Pj4gPHRo
b21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Pj4+Pj4+IE9uIDIvMjMvMjEgMTE6NTkgQU0s
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+Pj4+IHRsZHI7IERNQSBidWZmZXJzIGFyZW4ndCBu
b3JtYWwgbWVtb3J5LCBleHBlY3RpbmcgdGhhdCB5b3UgY2FuIHVzZQo+Pj4+Pj4+PiB0aGVtIGxp
a2UgdGhhdCAobGlrZSBjYWxsaW5nIGdldF91c2VyX3BhZ2VzIHdvcmtzLCBvciB0aGF0IHRoZXkn
cmUKPj4+Pj4+Pj4gYWNjb3VudGluZyBsaWtlIGFueSBvdGhlciBub3JtYWwgbWVtb3J5KSBjYW5u
b3QgYmUgZ3VhcmFudGVlZC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2luY2Ugc29tZSB1c2Vyc3BhY2Ug
b25seSBydW5zIG9uIGludGVncmF0ZWQgZGV2aWNlcywgd2hlcmUgYWxsCj4+Pj4+Pj4+IGJ1ZmZl
cnMgYXJlIGFjdHVhbGx5IGFsbCByZXNpZGVudCBzeXN0ZW0gbWVtb3J5LCB0aGVyZSdzIGEgaHVn
ZQo+Pj4+Pj4+PiB0ZW1wdGF0aW9uIHRvIGFzc3VtZSB0aGF0IGEgc3RydWN0IHBhZ2UgaXMgYWx3
YXlzIHByZXNlbnQgYW5kIHVzZWFibGUKPj4+Pj4+Pj4gbGlrZSBmb3IgYW55IG1vcmUgcGFnZWNh
Y2hlIGJhY2tlZCBtbWFwLiBUaGlzIGhhcyB0aGUgcG90ZW50aWFsIHRvCj4+Pj4+Pj4+IHJlc3Vs
dCBpbiBhIHVhcGkgbmlnaHRtYXJlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUbyBzdG9wIHRoaXMgZ2Fw
IHJlcXVpcmUgdGhhdCBETUEgYnVmZmVyIG1tYXBzIGFyZSBWTV9QRk5NQVAsIHdoaWNoCj4+Pj4+
Pj4+IGJsb2NrcyBnZXRfdXNlcl9wYWdlcyBhbmQgYWxsIHRoZSBvdGhlciBzdHJ1Y3QgcGFnZSBi
YXNlZAo+Pj4+Pj4+PiBpbmZyYXN0cnVjdHVyZSBmb3IgZXZlcnlvbmUuIEluIHNwaXJpdCB0aGlz
IGlzIHRoZSB1YXBpIGNvdW50ZXJwYXJ0IHRvCj4+Pj4+Pj4+IHRoZSBrZXJuZWwtaW50ZXJuYWwg
Q09ORklHX0RNQUJVRl9ERUJVRy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gTW90aXZhdGVkIGJ5IGEgcmVj
ZW50IHBhdGNoIHdoaWNoIHdhbnRlZCB0byBzd2ljaCB0aGUgc3lzdGVtIGRtYS1idWYKPj4+Pj4+
Pj4gaGVhcCB0byB2bV9pbnNlcnRfcGFnZSBpbnN0ZWFkIG9mIHZtX2luc2VydF9wZm4uCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IHYyOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBKYXNvbiBicm91Z2h0IHVwIHRoYXQg
d2UgYWxzbyB3YW50IHRvIGd1YXJhbnRlZSB0aGF0IGFsbCBwdGVzIGhhdmUgdGhlCj4+Pj4+Pj4+
IHB0ZV9zcGVjaWFsIGZsYWcgc2V0LCB0byBjYXRjaCBmYXN0IGdldF91c2VyX3BhZ2VzIChvbiBh
cmNoaXRlY3R1cmVzCj4+Pj4+Pj4+IHRoYXQgc3VwcG9ydCB0aGlzKS4gQWxsb3dpbmcgVk1fTUlY
RURNQVAgKGxpa2UgVk1fU1BFQ0lBTCBkb2VzKSB3b3VsZAo+Pj4+Pj4+PiBzdGlsbCBhbGxvdyB2
bV9pbnNlcnRfcGFnZSwgYnV0IGxpbWl0aW5nIHRvIFZNX1BGTk1BUCB3aWxsIGNhdGNoIHRoYXQu
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgICBGcm9tIGF1ZGl0aW5nIHRoZSB2YXJpb3VzIGZ1bmN0aW9u
cyB0byBpbnNlcnQgcGZuIHB0ZSBlbnRpcmVzCj4+Pj4+Pj4+ICh2bV9pbnNlcnRfcGZuX3Byb3Qs
IHJlbWFwX3Bmbl9yYW5nZSBhbmQgYWxsIGl0J3MgY2FsbGVycyBsaWtlCj4+Pj4+Pj4+IGRtYV9t
bWFwX3djKSBpdCBsb29rcyBsaWtlIFZNX1BGTk1BUCBpcyBhbHJlYWR5IHJlcXVpcmVkIGFueXdh
eSwgc28KPj4+Pj4+Pj4gdGhpcyBzaG91bGQgYmUgdGhlIGNvcnJlY3QgZmxhZyB0byBjaGVjayBm
b3IuCj4+Pj4+Pj4+Cj4+Pj4+Pj4gSWYgd2UgcmVxdWlyZSBWTV9QRk5NQVAsIGZvciBvcmRpbmFy
eSBwYWdlIG1hcHBpbmdzLCB3ZSBhbHNvIG5lZWQgdG8KPj4+Pj4+PiBkaXNhbGxvdyBDT1cgbWFw
cGluZ3MsIHNpbmNlIGl0IHdpbGwgbm90IHdvcmsgb24gYXJjaGl0ZWN0dXJlcyB0aGF0Cj4+Pj4+
Pj4gZG9uJ3QgaGF2ZSBDT05GSUdfQVJDSF9IQVNfUFRFX1NQRUNJQUwsIChzZWUgdGhlIGRvY3Mg
Zm9yIHZtX25vcm1hbF9wYWdlKCkpLgo+Pj4+Pj4gSG0gSSBmaWd1cmVkIGV2ZXJ5b25lIGp1c3Qg
dXNlcyBNQVBfU0hBUkVEIGZvciBidWZmZXIgb2JqZWN0cyBzaW5jZQo+Pj4+Pj4gQ09XIHJlYWxs
eSBtYWtlcyBhYnNvbHV0ZWx5IG5vIHNlbnNlLiBIb3cgd291bGQgd2UgZW5mb3JjZSB0aGlzPwo+
Pj4+PiBQZXJoYXBzIHJldHVybmluZyAtRUlOVkFMIG9uIGlzX2Nvd19tYXBwaW5nKCkgYXQgbW1h
cCB0aW1lLiBFaXRoZXIgdGhhdAo+Pj4+PiBvciBhbGxvd2luZyBNSVhFRE1BUC4KPj4+Pj4KPj4+
Pj4+PiBBbHNvIHdvcnRoIG5vdGluZyBpcyB0aGUgY29tbWVudCBpbiAgdHRtX2JvX21tYXBfdm1h
X3NldHVwKCkgd2l0aAo+Pj4+Pj4+IHBvc3NpYmxlIHBlcmZvcm1hbmNlIGltcGxpY2F0aW9ucyB3
aXRoIHg4NiArIFBBVCArIFZNX1BGTk1BUCArIG5vcm1hbAo+Pj4+Pj4+IHBhZ2VzLiBUaGF0J3Mg
YSB2ZXJ5IG9sZCBjb21tZW50LCB0aG91Z2gsIGFuZCBtaWdodCBub3QgYmUgdmFsaWQgYW55bW9y
ZS4KPj4+Pj4+IEkgdGhpbmsgdGhhdCdzIHdoeSB0dG0gaGFzIGEgcGFnZSBjYWNoZSBmb3IgdGhl
c2UsIGJlY2F1c2UgaXQgaW5kZWVkCj4+Pj4+PiBzdWNrcy4gVGhlIFBBVCBjaGFuZ2VzIG9uIHBh
Z2VzIGFyZSByYXRoZXIgZXhwZW5zaXZlLgo+Pj4+PiBJSVJDIHRoZSBwYWdlIGNhY2hlIHdhcyBp
bXBsZW1lbnRlZCBiZWNhdXNlIG9mIHRoZSBzbG93bmVzcyBvZiB0aGUKPj4+Pj4gY2FjaGluZyBt
b2RlIHRyYW5zaXRpb24gaXRzZWxmLCBtb3JlIHNwZWNpZmljYWxseSB0aGUgd2JpbnZkKCkgY2Fs
bCArCj4+Pj4+IGdsb2JhbCBUTEIgZmx1c2guCj4+PiBZZXMsIGV4YWN0bHkgdGhhdC4gVGhlIGds
b2JhbCBUTEIgZmx1c2ggaXMgd2hhdCByZWFsbHkgYnJlYWtzIG91ciBuZWNrIGhlcmUKPj4+IGZy
b20gYSBwZXJmb3JtYW5jZSBwZXJzcGVjdGl2ZS4KPj4+Cj4+Pj4+PiBUaGVyZSBpcyBzdGlsbCBh
biBpc3N1ZSBmb3IgaW9tZW0gbWFwcGluZ3MsIGJlY2F1c2UgdGhlIFBBVCB2YWxpZGF0aW9uCj4+
Pj4+PiBkb2VzIGEgbGluZWFyIHdhbGsgb2YgdGhlIHJlc291cmNlIHRyZWUgKGxvbCkgZm9yIGV2
ZXJ5IHZtX2luc2VydF9wZm4uCj4+Pj4+PiBCdXQgZm9yIGk5MTUgYXQgbGVhc3QgdGhpcyBpcyBm
aXhlZCBieSB1c2luZyB0aGUgaW9fbWFwcGluZwo+Pj4+Pj4gaW5mcmFzdHJ1Y3R1cmUsIHdoaWNo
IGRvZXMgdGhlIFBBVCByZXNlcnZhdGlvbiBvbmx5IG9uY2Ugd2hlbiB5b3Ugc2V0Cj4+Pj4+PiB1
cCB0aGUgbWFwcGluZyBhcmVhIGF0IGRyaXZlciBsb2FkLgo+Pj4+PiBZZXMsIEkgZ3Vlc3MgdGhh
dCB3YXMgdGhlIGlzc3VlIHRoYXQgdGhlIGNvbW1lbnQgZGVzY3JpYmVzLCBidXQgdGhlCj4+Pj4+
IGlzc3VlIHdhc24ndCB0aGVyZSB3aXRoIHZtX2luc2VydF9taXhlZCgpICsgVk1fTUlYRURNQVAu
Cj4+Pj4+Cj4+Pj4+PiBBbHNvIFRUTSB1c2VzIFZNX1BGTk1BUCByaWdodCBub3cgZm9yIGV2ZXJ5
dGhpbmcsIHNvIGl0IGNhbid0IGJlIGEKPj4+Pj4+IHByb2JsZW0gdGhhdCBodXJ0cyBtdWNoIDot
KQo+Pj4+PiBIbW0sIGJvdGggNS4xMSBhbmQgZHJtLXRpcCBhcHBlYXJzIHRvIHN0aWxsIHVzZSBN
SVhFRE1BUD8KPj4+Pj4KPj4+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jI0w1NTQKPj4+PiBVaCB0
aGF0J3MgYmFkLCBiZWNhdXNlIG1peGVkIG1hcHMgcG9pbnRpbmcgYXQgc3RydWN0IHBhZ2Ugd29u
dCBzdG9wCj4+Pj4gZ3VwLiBBdCBsZWFzdCBhZmFpay4KPj4+IEh1aT8gSSdtIHByZXR0eSBzdXJl
IE1JWEVETUFQIHN0b3BzIGd1cCBhcyB3ZWxsLiBPdGhlcndpc2Ugd2Ugd291bGQgaGF2ZQo+Pj4g
YWxyZWFkeSBzZWVuIHRvbnMgb2YgcHJvYmxlbXMgd2l0aCB0aGUgcGFnZSBjYWNoZS4KPj4gT24g
YW55IGFyY2hpdGVjdHVyZSB3aGljaCBoYXMgQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMIHZt
X2luc2VydF9taXhlZAo+PiBib2lscyBkb3duIHRvIHZtX2luc2VydF9wZm4gd3J0IGd1cC4gQW5k
IHNwZWNpYWwgcHRlIHN0b3BzIGd1cCBmYXN0IHBhdGguCj4+Cj4+IEJ1dCBpZiB5b3UgZG9uJ3Qg
aGF2ZSBWTV9JTyBvciBWTV9QRk5NQVAgc2V0LCB0aGVuIEknbSBub3Qgc2VlaW5nIGhvdwo+PiB5
b3UncmUgc3RvcHBpbmcgZ3VwIHNsb3cgcGF0aC4gU2VlIGNoZWNrX3ZtYV9mbGFncygpIGluIG1t
L2d1cC5jLgo+Pgo+PiBBbHNvIGlmIHlvdSBkb24ndCBoYXZlIENPTkZJR19BUkNIX0hBU19QVEVf
U1BFQ0lBTCB0aGVuIEkgZG9uJ3QgdGhpbmsKPj4gdm1faW5zZXJ0X21peGVkIGV2ZW4gd29ya3Mg
b24gaW9tZW0gcGZucy4gVGhlcmUncyB0aGUgZGV2bWFwIGV4Y2VwdGlvbiwKPj4gYnV0IHdlJ3Jl
IG5vdCBkZXZtYXAuIFdvcnNlIHR0bSBhYnVzZXMgc29tZSBhY2NpZGVudGFsIGNvZGVwYXRoIHRv
IHNtdWdnbGUKPj4gaW4gaHVnZXB0ZSBzdXBwb3J0IGJ5IGludGVudGlvbmFsbHkgbm90IGJlaW5n
IGRldm1hcC4KPj4KPj4gU28gSSdtIHJlYWxseSBub3Qgc3VyZSB0aGlzIHdvcmtzIGFzIHdlIHRo
aW5rIGl0IHNob3VsZC4gTWF5YmUgZ29vZCB0byBkbwo+PiBhIHF1aWNrIHRlc3QgcHJvZ3JhbSBv
biBhbWRncHUgd2l0aCBhIGJ1ZmZlciBpbiBzeXN0ZW0gbWVtb3J5IG9ubHkgYW5kIHRyeQo+PiB0
byBkbyBkaXJlY3QgaW8gaW50byBpdC4gSWYgaXQgd29ya3MsIHlvdSBoYXZlIGEgcHJvYmxlbSwg
YW5kIGEgYmFkIG9uZS4KPiBUaGF0J3MgcHJvYmFibHkgaW1wb3NzaWJsZSwgc2luY2UgYSBxdWlj
ayBnaXQgZ3JlcCBzaG93cyB0aGF0IHByZXR0eQo+IG11Y2ggYW55dGhpbmcgcmVhc29uYWJsZSBo
YXMgc3BlY2lhbCBwdGVzOiBhcmMsIGFybSwgYXJtNjQsIHBvd2VycGMsCj4gcmlzY3YsIHMzOTAs
IHNoLCBzcGFyYywgeDg2LiBJIGRvbid0IHRoaW5rIHlvdSdsbCBoYXZlIGEgcGxhdGZvcm0KPiB3
aGVyZSB5b3UgY2FuIHBsdWcgYW4gYW1kZ3B1IGluIGFuZCBhY3R1YWxseSBleGVyY2lzZSB0aGUg
YnVnIDotKQoKSG0uIEFGQUlLIF9pbnNlcnRfbWl4ZWQoKSBkb2Vzbid0IHNldCBQVEVfU1BFQ0lB
TCBvbiBzeXN0ZW0gcGFnZXMsIHNvIEkgCmRvbid0IHNlZSB3aGF0IHNob3VsZCBiZSBzdG9wcGlu
ZyBndXAgdG8gdGhvc2U/CgovVGhvbWFzCgoKCj4KPiBTbyBtYXliZSB3ZSBzaG91bGQganVzdCBz
d2l0Y2ggb3ZlciB0byBWTV9QRk5NQVAgZm9yIHR0bSBmb3IgbW9yZSBjbGFyaXR5Pwo+IC1EYW5p
ZWwKPgo+Cj4+PiBSZWdhcmRzLAo+Pj4gQ2hyaXN0aWFuLgo+Pj4KPj4+PiBDaHJpc3RpYW4sIGRv
IHdlIG5lZWQgdG8gcGF0Y2ggdGhpcyB1cCwgYW5kIG1heWJlIGZpeCB1cCB0dG0gZmF1bHQKPj4+
PiBoYW5kbGVyIHRvIHVzZSBpb19tYXBwaW5nIHNvIHRoZSB2bV9pbnNlcnRfcGZuIHN0dWZmIGlz
IGZhc3Q/Cj4+Pj4gLURhbmllbAo+PiAtLQo+PiBEYW5pZWwgVmV0dGVyCj4+IFNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+PiBodHRwOi8vYmxvZy5mZndsbC5jaAo+Cj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
