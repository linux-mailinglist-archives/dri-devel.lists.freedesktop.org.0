Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF55B32796A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7ED6E511;
	Mon,  1 Mar 2021 08:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD01F6E509;
 Mon,  1 Mar 2021 08:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 796FD3F630;
 Mon,  1 Mar 2021 09:40:03 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=KFKC1cY5; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.449
X-Spam-Level: 
X-Spam-Status: No, score=-2.449 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egBorp5EqkHP; Mon,  1 Mar 2021 09:40:02 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5D5FB3F758;
 Mon,  1 Mar 2021 09:39:57 +0100 (CET)
Received: from [10.249.254.148] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E47263600BA;
 Mon,  1 Mar 2021 09:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1614587997; bh=3yD8FoJ9tqt8v8EC2ovVKJDzIsnt+TH/fSsrxvLzKcI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KFKC1cY5Bl6oZF7XHixRFkB3vh2NnxNLPQZm1ZT5hBiDj4BNARy/P9spZVDis/y7b
 eUo5AoTRQkOueepPu8iQnwC4xwc9/Wvz3AZSAWax4UrwndgyWuVR4PT9xI+O7+NKmW
 /iP0XNKaBE1dz9imtoJwaMYVFzduO2lH+xU/lqeg=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
 <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
 <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
Date: Mon, 1 Mar 2021 09:39:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzEvMjEgOToyOCBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBTYXQsIEZl
YiAyNywgMjAyMSBhdCA5OjA2IEFNIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkKPiA8dGhvbWFz
X29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+IE9uIDIvMjYvMjEgMjoyOCBQTSwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPj4+IFNvIEkgdGhpbmsgaXQgc3RvcHMgZ3VwLiBCdXQgSSBoYXZlbid0IHZl
cmlmaWVkIGF0IGFsbC4gV291bGQgYmUgZ29vZAo+Pj4gaWYgQ2hyaXN0aWFuIGNhbiBjaGVjayB0
aGlzIHdpdGggc29tZSBkaXJlY3QgaW8gdG8gYSBidWZmZXIgaW4gc3lzdGVtCj4+PiBtZW1vcnku
Cj4+IEhtbSwKPj4KPj4gRG9jcyAoYWdhaW4gdm1fbm9ybWFsX3BhZ2UoKSBzYXkpCj4+Cj4+ICAg
ICogVk1fTUlYRURNQVAgbWFwcGluZ3MgY2FuIGxpa2V3aXNlIGNvbnRhaW4gbWVtb3J5IHdpdGgg
b3Igd2l0aG91dCAic3RydWN0Cj4+ICAgICogcGFnZSIgYmFja2luZywgaG93ZXZlciB0aGUgZGlm
ZmVyZW5jZSBpcyB0aGF0IF9hbGxfIHBhZ2VzIHdpdGggYSBzdHJ1Y3QKPj4gICAgKiBwYWdlICh0
aGF0IGlzLCB0aG9zZSB3aGVyZSBwZm5fdmFsaWQgaXMgdHJ1ZSkgYXJlIHJlZmNvdW50ZWQgYW5k
Cj4+IGNvbnNpZGVyZWQKPj4gICAgKiBub3JtYWwgcGFnZXMgYnkgdGhlIFZNLiBUaGUgZGlzYWR2
YW50YWdlIGlzIHRoYXQgcGFnZXMgYXJlIHJlZmNvdW50ZWQKPj4gICAgKiAod2hpY2ggY2FuIGJl
IHNsb3dlciBhbmQgc2ltcGx5IG5vdCBhbiBvcHRpb24gZm9yIHNvbWUgUEZOTUFQCj4+IHVzZXJz
KS4gVGhlCj4+ICAgICogYWR2YW50YWdlIGlzIHRoYXQgd2UgZG9uJ3QgaGF2ZSB0byBmb2xsb3cg
dGhlIHN0cmljdCBsaW5lYXJpdHkgcnVsZSBvZgo+PiAgICAqIFBGTk1BUCBtYXBwaW5ncyBpbiBv
cmRlciB0byBzdXBwb3J0IENPV2FibGUgbWFwcGluZ3MuCj4+Cj4+IGJ1dCBpdCdzIHRydWUgX192
bV9pbnNlcnRfbWl4ZWQoKSBlbmRzIHVwIGluIHRoZSBpbnNlcnRfcGZuKCkgcGF0aCwgc28KPj4g
dGhlIGFib3ZlIGlzbid0IHJlYWxseSB0cnVlLCB3aGljaCBtYWtlcyBtZSB3b25kZXIgaWYgYW5k
IGluIHRoYXQgY2FzZQo+PiB3aHkgdGhlcmUgY291bGQgYW55IGxvbmdlciBldmVyIGJlIGEgc2ln
bmlmaWNhbnQgcGVyZm9ybWFuY2UgZGlmZmVyZW5jZQo+PiBiZXR3ZWVuIE1JWEVETUFQIGFuZCBQ
Rk5NQVAuCj4gWWVhaCBpdCdzIGRlZmluaXRlbHkgY29uZnVzaW5nLiBJIGd1ZXNzIEknbGwgaGFj
ayB1cCBhIHBhdGNoIGFuZCBzZWUKPiB3aGF0IHN0aWNrcy4KPgo+PiBCVFcgcmVnYXJkaW5nIHRo
ZSBUVE0gaHVnZXB0ZXMsIEkgZG9uJ3QgdGhpbmsgd2UgZXZlciBsYW5kZWQgdGhhdCBkZXZtYXAK
Pj4gaGFjaywgc28gdGhleSBhcmUgKGZvciB0aGUgbm9uLWd1cCBjYXNlKSByZWx5aW5nIG9uCj4+
IHZtYV9pc19zcGVjaWFsX2h1Z2UoKS4gRm9yIHRoZSBndXAgY2FzZSwgSSB0aGluayB0aGUgYnVn
IGlzIHN0aWxsIHRoZXJlLgo+IE1heWJlIHRoZXJlJ3MgYW5vdGhlciBkZXZtYXAgaGFjaywgYnV0
IHRoZSB0dG1fdm1faW5zZXJ0IGZ1bmN0aW9ucyBkbwo+IHVzZSBQRk5fREVWIGFuZCBhbGwgdGhh
dC4gQW5kIEkgdGhpbmsgdGhhdCBzdG9wcyBndXBfZmFzdCBmcm9tIHRyeWluZwo+IHRvIGZpbmQg
dGhlIHVuZGVybHlpbmcgcGFnZS4KPiAtRGFuaWVsCgpIbW0gcGVyaGFwcyBpdCBtaWdodCwgYnV0
IEkgZG9uJ3QgdGhpbmsgc28uIFRoZSBmaXggSSB0cmllZCBvdXQgd2FzIHRvIHNldAoKUEZOX0RF
ViB8IFBGTl9NQVAgZm9yIGh1Z2UgUFRFcyB3aGljaCBjYXVzZXMgcGZuX2Rldm1hcCgpIHRvIGJl
IHRydWUsIAphbmQgdGhlbgoKZm9sbG93X2Rldm1hcF9wbWQoKS0+Z2V0X2Rldl9wYWdlbWFwKCkg
d2hpY2ggcmV0dXJucyBOVUxMIGFuZCBndXBfZmFzdCgpIApiYWNrcyBvZmYsCgppbiB0aGUgZW5k
IHRoYXQgd291bGQgbWVhbiBzZXR0aW5nIGluIHN0b25lIHRoYXQgImlmIHRoZXJlIGlzIGEgaHVn
ZSAKZGV2bWFwIHBhZ2UgdGFibGUgZW50cnkgZm9yIHdoaWNoIHdlIGhhdmVuJ3QgcmVnaXN0ZXJl
ZCBhbnkgZGV2bWFwIApzdHJ1Y3QgcGFnZXMgKGdldF9kZXZfcGFnZW1hcCByZXR1cm5zIE5VTEwp
LCB3ZSBzaG91bGQgdHJlYXQgdGhhdCBhcyBhIAoic3BlY2lhbCIgaHVnZSBwYWdlIHRhYmxlIGVu
dHJ5Ii4KCiBGcm9tIHdoYXQgSSBjYW4gdGVsbCwgYWxsIGNvZGUgY2FsbGluZyBnZXRfZGV2X3Bh
Z2VtYXAoKSBhbHJlYWR5IGRvZXMgCnRoYXQsIGl0J3MganVzdCBhIHF1ZXN0aW9uIG9mIGdldHRp
bmcgaXQgYWNjZXB0ZWQgYW5kIGZvcm1hbGl6aW5nIGl0LgoKL1Rob21hcwoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
