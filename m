Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C45323819
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 08:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E940C89D5C;
	Wed, 24 Feb 2021 07:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 345 seconds by postgrey-1.36 at gabe;
 Wed, 24 Feb 2021 07:52:30 UTC
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A67389D5C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 07:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 770483F652;
 Wed, 24 Feb 2021 08:46:43 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=KJJgLuEU; 
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
 with ESMTP id bVLueYxh58w4; Wed, 24 Feb 2021 08:46:42 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B87863F643;
 Wed, 24 Feb 2021 08:46:39 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 194E1360057;
 Wed, 24 Feb 2021 08:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1614152799; bh=+midem5UdmkQDOaonXhpDjQ6hUcv5qjys80Y/tIhOns=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KJJgLuEUs30BqWarhKyhaQwyQ95uA8cvx4uocDmqohxrUOOzkzT8at17UI4NevDhX
 ZkF+dg4lg2DgEAWVhjLN/z5eozWop6n8jvvr2eNPqznccbm8aRYWDSFiKc7+N9jwBv
 H9C6NcglY7TYvFa7nTJRU/NClO/eXhk/ty+SKte4=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
Date: Wed, 24 Feb 2021 08:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
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
 Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMjMvMjEgMTE6NTkgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gdGxkcjsgRE1BIGJ1
ZmZlcnMgYXJlbid0IG5vcm1hbCBtZW1vcnksIGV4cGVjdGluZyB0aGF0IHlvdSBjYW4gdXNlCj4g
dGhlbSBsaWtlIHRoYXQgKGxpa2UgY2FsbGluZyBnZXRfdXNlcl9wYWdlcyB3b3Jrcywgb3IgdGhh
dCB0aGV5J3JlCj4gYWNjb3VudGluZyBsaWtlIGFueSBvdGhlciBub3JtYWwgbWVtb3J5KSBjYW5u
b3QgYmUgZ3VhcmFudGVlZC4KPgo+IFNpbmNlIHNvbWUgdXNlcnNwYWNlIG9ubHkgcnVucyBvbiBp
bnRlZ3JhdGVkIGRldmljZXMsIHdoZXJlIGFsbAo+IGJ1ZmZlcnMgYXJlIGFjdHVhbGx5IGFsbCBy
ZXNpZGVudCBzeXN0ZW0gbWVtb3J5LCB0aGVyZSdzIGEgaHVnZQo+IHRlbXB0YXRpb24gdG8gYXNz
dW1lIHRoYXQgYSBzdHJ1Y3QgcGFnZSBpcyBhbHdheXMgcHJlc2VudCBhbmQgdXNlYWJsZQo+IGxp
a2UgZm9yIGFueSBtb3JlIHBhZ2VjYWNoZSBiYWNrZWQgbW1hcC4gVGhpcyBoYXMgdGhlIHBvdGVu
dGlhbCB0bwo+IHJlc3VsdCBpbiBhIHVhcGkgbmlnaHRtYXJlLgo+Cj4gVG8gc3RvcCB0aGlzIGdh
cCByZXF1aXJlIHRoYXQgRE1BIGJ1ZmZlciBtbWFwcyBhcmUgVk1fUEZOTUFQLCB3aGljaAo+IGJs
b2NrcyBnZXRfdXNlcl9wYWdlcyBhbmQgYWxsIHRoZSBvdGhlciBzdHJ1Y3QgcGFnZSBiYXNlZAo+
IGluZnJhc3RydWN0dXJlIGZvciBldmVyeW9uZS4gSW4gc3Bpcml0IHRoaXMgaXMgdGhlIHVhcGkg
Y291bnRlcnBhcnQgdG8KPiB0aGUga2VybmVsLWludGVybmFsIENPTkZJR19ETUFCVUZfREVCVUcu
Cj4KPiBNb3RpdmF0ZWQgYnkgYSByZWNlbnQgcGF0Y2ggd2hpY2ggd2FudGVkIHRvIHN3aWNoIHRo
ZSBzeXN0ZW0gZG1hLWJ1Zgo+IGhlYXAgdG8gdm1faW5zZXJ0X3BhZ2UgaW5zdGVhZCBvZiB2bV9p
bnNlcnRfcGZuLgo+Cj4gdjI6Cj4KPiBKYXNvbiBicm91Z2h0IHVwIHRoYXQgd2UgYWxzbyB3YW50
IHRvIGd1YXJhbnRlZSB0aGF0IGFsbCBwdGVzIGhhdmUgdGhlCj4gcHRlX3NwZWNpYWwgZmxhZyBz
ZXQsIHRvIGNhdGNoIGZhc3QgZ2V0X3VzZXJfcGFnZXMgKG9uIGFyY2hpdGVjdHVyZXMKPiB0aGF0
IHN1cHBvcnQgdGhpcykuIEFsbG93aW5nIFZNX01JWEVETUFQIChsaWtlIFZNX1NQRUNJQUwgZG9l
cykgd291bGQKPiBzdGlsbCBhbGxvdyB2bV9pbnNlcnRfcGFnZSwgYnV0IGxpbWl0aW5nIHRvIFZN
X1BGTk1BUCB3aWxsIGNhdGNoIHRoYXQuCj4KPiAgRnJvbSBhdWRpdGluZyB0aGUgdmFyaW91cyBm
dW5jdGlvbnMgdG8gaW5zZXJ0IHBmbiBwdGUgZW50aXJlcwo+ICh2bV9pbnNlcnRfcGZuX3Byb3Qs
IHJlbWFwX3Bmbl9yYW5nZSBhbmQgYWxsIGl0J3MgY2FsbGVycyBsaWtlCj4gZG1hX21tYXBfd2Mp
IGl0IGxvb2tzIGxpa2UgVk1fUEZOTUFQIGlzIGFscmVhZHkgcmVxdWlyZWQgYW55d2F5LCBzbwo+
IHRoaXMgc2hvdWxkIGJlIHRoZSBjb3JyZWN0IGZsYWcgdG8gY2hlY2sgZm9yLgo+CklmIHdlIHJl
cXVpcmUgVk1fUEZOTUFQLCBmb3Igb3JkaW5hcnkgcGFnZSBtYXBwaW5ncywgd2UgYWxzbyBuZWVk
IHRvIApkaXNhbGxvdyBDT1cgbWFwcGluZ3MsIHNpbmNlIGl0IHdpbGwgbm90IHdvcmsgb24gYXJj
aGl0ZWN0dXJlcyB0aGF0IApkb24ndCBoYXZlIENPTkZJR19BUkNIX0hBU19QVEVfU1BFQ0lBTCwg
KHNlZSB0aGUgZG9jcyBmb3Igdm1fbm9ybWFsX3BhZ2UoKSkuCgpBbHNvIHdvcnRoIG5vdGluZyBp
cyB0aGUgY29tbWVudCBpbsKgIHR0bV9ib19tbWFwX3ZtYV9zZXR1cCgpIHdpdGggCnBvc3NpYmxl
IHBlcmZvcm1hbmNlIGltcGxpY2F0aW9ucyB3aXRoIHg4NiArIFBBVCArIFZNX1BGTk1BUCArIG5v
cm1hbCAKcGFnZXMuIFRoYXQncyBhIHZlcnkgb2xkIGNvbW1lbnQsIHRob3VnaCwgYW5kIG1pZ2h0
IG5vdCBiZSB2YWxpZCBhbnltb3JlLgoKL1Rob21hcwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
