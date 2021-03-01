Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A796327A9B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 10:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D5589FD9;
	Mon,  1 Mar 2021 09:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C1189FD9;
 Mon,  1 Mar 2021 09:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CDE5D3F3A1;
 Mon,  1 Mar 2021 10:21:19 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=pTwKGOoe; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcU_ueMgXl_O; Mon,  1 Mar 2021 10:21:19 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id AFBB83F393;
 Mon,  1 Mar 2021 10:21:16 +0100 (CET)
Received: from [10.249.254.148] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E9C783600BA;
 Mon,  1 Mar 2021 10:21:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1614590476; bh=v/6gYa+I8Tt8B9P3C8K3rFhm+y2ThcWR/NttZk59Mig=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pTwKGOoeZY6eQEETMEQFzNBP9mngHUBwdZttR6CPWTgPJ2KDTyLMNuMQIRYHqdH3k
 QVkSi3bBIaNdTDnlUwK6I5ZGdqMl3XtNuurr+MqgJmryh5kAKP/lI0iA7Ih0c4cW74
 ECt01QAIkTQUiQU988RWC/zJVXRzMqBUVNpyULPo=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: Daniel Vetter <daniel@ffwll.ch>
References: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
 <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
 <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
 <YDyuYk8x5QeX83s6@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org>
Date: Mon, 1 Mar 2021 10:21:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDyuYk8x5QeX83s6@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMS8yMSAxMDowNSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIE1hciAw
MSwgMjAyMSBhdCAwOTozOTo1M0FNICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIHdy
b3RlOgo+PiBIaSwKPj4KPj4gT24gMy8xLzIxIDk6MjggQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6
Cj4+PiBPbiBTYXQsIEZlYiAyNywgMjAyMSBhdCA5OjA2IEFNIFRob21hcyBIZWxsc3Ryw7ZtIChJ
bnRlbCkKPj4+IDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPj4+PiBPbiAyLzI2LzIx
IDI6MjggUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+IFNvIEkgdGhpbmsgaXQgc3RvcHMg
Z3VwLiBCdXQgSSBoYXZlbid0IHZlcmlmaWVkIGF0IGFsbC4gV291bGQgYmUgZ29vZAo+Pj4+PiBp
ZiBDaHJpc3RpYW4gY2FuIGNoZWNrIHRoaXMgd2l0aCBzb21lIGRpcmVjdCBpbyB0byBhIGJ1ZmZl
ciBpbiBzeXN0ZW0KPj4+Pj4gbWVtb3J5Lgo+Pj4+IEhtbSwKPj4+Pgo+Pj4+IERvY3MgKGFnYWlu
IHZtX25vcm1hbF9wYWdlKCkgc2F5KQo+Pj4+Cj4+Pj4gICAgICogVk1fTUlYRURNQVAgbWFwcGlu
Z3MgY2FuIGxpa2V3aXNlIGNvbnRhaW4gbWVtb3J5IHdpdGggb3Igd2l0aG91dCAic3RydWN0Cj4+
Pj4gICAgICogcGFnZSIgYmFja2luZywgaG93ZXZlciB0aGUgZGlmZmVyZW5jZSBpcyB0aGF0IF9h
bGxfIHBhZ2VzIHdpdGggYSBzdHJ1Y3QKPj4+PiAgICAgKiBwYWdlICh0aGF0IGlzLCB0aG9zZSB3
aGVyZSBwZm5fdmFsaWQgaXMgdHJ1ZSkgYXJlIHJlZmNvdW50ZWQgYW5kCj4+Pj4gY29uc2lkZXJl
ZAo+Pj4+ICAgICAqIG5vcm1hbCBwYWdlcyBieSB0aGUgVk0uIFRoZSBkaXNhZHZhbnRhZ2UgaXMg
dGhhdCBwYWdlcyBhcmUgcmVmY291bnRlZAo+Pj4+ICAgICAqICh3aGljaCBjYW4gYmUgc2xvd2Vy
IGFuZCBzaW1wbHkgbm90IGFuIG9wdGlvbiBmb3Igc29tZSBQRk5NQVAKPj4+PiB1c2VycykuIFRo
ZQo+Pj4+ICAgICAqIGFkdmFudGFnZSBpcyB0aGF0IHdlIGRvbid0IGhhdmUgdG8gZm9sbG93IHRo
ZSBzdHJpY3QgbGluZWFyaXR5IHJ1bGUgb2YKPj4+PiAgICAgKiBQRk5NQVAgbWFwcGluZ3MgaW4g
b3JkZXIgdG8gc3VwcG9ydCBDT1dhYmxlIG1hcHBpbmdzLgo+Pj4+Cj4+Pj4gYnV0IGl0J3MgdHJ1
ZSBfX3ZtX2luc2VydF9taXhlZCgpIGVuZHMgdXAgaW4gdGhlIGluc2VydF9wZm4oKSBwYXRoLCBz
bwo+Pj4+IHRoZSBhYm92ZSBpc24ndCByZWFsbHkgdHJ1ZSwgd2hpY2ggbWFrZXMgbWUgd29uZGVy
IGlmIGFuZCBpbiB0aGF0IGNhc2UKPj4+PiB3aHkgdGhlcmUgY291bGQgYW55IGxvbmdlciBldmVy
IGJlIGEgc2lnbmlmaWNhbnQgcGVyZm9ybWFuY2UgZGlmZmVyZW5jZQo+Pj4+IGJldHdlZW4gTUlY
RURNQVAgYW5kIFBGTk1BUC4KPj4+IFllYWggaXQncyBkZWZpbml0ZWx5IGNvbmZ1c2luZy4gSSBn
dWVzcyBJJ2xsIGhhY2sgdXAgYSBwYXRjaCBhbmQgc2VlCj4+PiB3aGF0IHN0aWNrcy4KPj4+Cj4+
Pj4gQlRXIHJlZ2FyZGluZyB0aGUgVFRNIGh1Z2VwdGVzLCBJIGRvbid0IHRoaW5rIHdlIGV2ZXIg
bGFuZGVkIHRoYXQgZGV2bWFwCj4+Pj4gaGFjaywgc28gdGhleSBhcmUgKGZvciB0aGUgbm9uLWd1
cCBjYXNlKSByZWx5aW5nIG9uCj4+Pj4gdm1hX2lzX3NwZWNpYWxfaHVnZSgpLiBGb3IgdGhlIGd1
cCBjYXNlLCBJIHRoaW5rIHRoZSBidWcgaXMgc3RpbGwgdGhlcmUuCj4+PiBNYXliZSB0aGVyZSdz
IGFub3RoZXIgZGV2bWFwIGhhY2ssIGJ1dCB0aGUgdHRtX3ZtX2luc2VydCBmdW5jdGlvbnMgZG8K
Pj4+IHVzZSBQRk5fREVWIGFuZCBhbGwgdGhhdC4gQW5kIEkgdGhpbmsgdGhhdCBzdG9wcyBndXBf
ZmFzdCBmcm9tIHRyeWluZwo+Pj4gdG8gZmluZCB0aGUgdW5kZXJseWluZyBwYWdlLgo+Pj4gLURh
bmllbAo+PiBIbW0gcGVyaGFwcyBpdCBtaWdodCwgYnV0IEkgZG9uJ3QgdGhpbmsgc28uIFRoZSBm
aXggSSB0cmllZCBvdXQgd2FzIHRvIHNldAo+Pgo+PiBQRk5fREVWIHwgUEZOX01BUCBmb3IgaHVn
ZSBQVEVzIHdoaWNoIGNhdXNlcyBwZm5fZGV2bWFwKCkgdG8gYmUgdHJ1ZSwgYW5kCj4+IHRoZW4K
Pj4KPj4gZm9sbG93X2Rldm1hcF9wbWQoKS0+Z2V0X2Rldl9wYWdlbWFwKCkgd2hpY2ggcmV0dXJu
cyBOVUxMIGFuZCBndXBfZmFzdCgpCj4+IGJhY2tzIG9mZiwKPj4KPj4gaW4gdGhlIGVuZCB0aGF0
IHdvdWxkIG1lYW4gc2V0dGluZyBpbiBzdG9uZSB0aGF0ICJpZiB0aGVyZSBpcyBhIGh1Z2UgZGV2
bWFwCj4+IHBhZ2UgdGFibGUgZW50cnkgZm9yIHdoaWNoIHdlIGhhdmVuJ3QgcmVnaXN0ZXJlZCBh
bnkgZGV2bWFwIHN0cnVjdCBwYWdlcwo+PiAoZ2V0X2Rldl9wYWdlbWFwIHJldHVybnMgTlVMTCks
IHdlIHNob3VsZCB0cmVhdCB0aGF0IGFzIGEgInNwZWNpYWwiIGh1Z2UKPj4gcGFnZSB0YWJsZSBl
bnRyeSIuCj4+Cj4+ICBGcm9tIHdoYXQgSSBjYW4gdGVsbCwgYWxsIGNvZGUgY2FsbGluZyBnZXRf
ZGV2X3BhZ2VtYXAoKSBhbHJlYWR5IGRvZXMgdGhhdCwKPj4gaXQncyBqdXN0IGEgcXVlc3Rpb24g
b2YgZ2V0dGluZyBpdCBhY2NlcHRlZCBhbmQgZm9ybWFsaXppbmcgaXQuCj4gT2ggSSB0aG91Z2h0
IHRoYXQncyBhbHJlYWR5IGhvdyBpdCB3b3Jrcywgc2luY2UgSSBkaWRuJ3Qgc3BvdCBhbnl0aGlu
Zwo+IGVsc2UgdGhhdCB3b3VsZCBibG9jayBndXBfZmFzdCBmcm9tIGZhbGxpbmcgb3Zlci4gSSBn
dWVzcyByZWFsbHkgd291bGQKPiBuZWVkIHNvbWUgdGVzdGNhc2VzIHRvIG1ha2Ugc3VyZSBkaXJl
Y3QgaS9vICh0aGF0J3MgdGhlIGVhc2llc3QgdG8gdGVzdCkKPiBmYWlscyBsaWtlIHdlIGV4cGVj
dC4KClllYWgsIElJUkMgdGhlICJ8IFBGTl9NQVAiIGlzIHRoZSBtaXNzaW5nIHBpZWNlIGZvciBU
VE0gaHVnZSBwdGVzLiAKT3RoZXJ3aXNlIHBtZF9kZXZtYXAoKSB3aWxsIG5vdCByZXR1cm4gdHJ1
ZSBhbmQgc2luY2UgdGhlcmUgaXMgbm8gCnBtZF9zcGVjaWFsKCkgdGhpbmdzIGJyZWFrLgoKL1Ro
b21hcwoKCgo+IC1EYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
