Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C45A1F9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 19:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F71B6E40A;
	Fri, 28 Jun 2019 17:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745F26E3FC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 17:10:24 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id j19so6715971otq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qddKJwRb2cnRQ/FqFwYrdLbb8wYT8FUIpp0K6iYqKlE=;
 b=hCukIsZw9i6uD3oXbG8ceya/0sMV7OgiJFQ8FRaKvYNZy58yTnMTmNOZxZiwJOm4EV
 hnoX3ZsawCXw4ey/K7lRAjQecO0O8b1YOeDubWhcU7H9Tm+UsONaAw5xt8txHr9vK16i
 AQVV8uh10SHaUMqRO+63PZy4WAqxvOxjyc+XWnZc8Ovj2pfEZfq+nwLOy+79Wuiez5G1
 2uokRAS4yBMH0p6rqiaNC6F+06IDC6Fwsm5I5M0jIROpjVRZHPQbR+1N0vj9CgT9Ggz7
 2Xk+Kz/0XhavN8FVrH4uEiwuVCjdW/2PLaLk2o4AxPB8/+2rTdHpev8/A523bJCp9JTS
 N0MQ==
X-Gm-Message-State: APjAAAUd3D1KliR2ZQIDfBBwz6nbXLkdwYfMjVDMUUJrpGWgcIs1mwEY
 2A1b4YX0oEvwlALcyZrcA84TexsnFBT57LJRuroGwV/s
X-Google-Smtp-Source: APXvYqziEb+tNzkKv17KjDDhi4UpD13NUfzT1yqPT34PEQGi0shpxcj8jFfercRLfAyVoLhNe8H8Bkb71Cnf2tL/n+k=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr8124495otn.71.1561741823760; 
 Fri, 28 Jun 2019 10:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
In-Reply-To: <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 10:10:12 -0700
Message-ID: <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
Subject: Re: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qddKJwRb2cnRQ/FqFwYrdLbb8wYT8FUIpp0K6iYqKlE=;
 b=UnNjKOhDg6JhNrF0ffG6CmZkREW7rw22qwft9R1X5G1Y463lGz745qKb1Cpvvz1sEl
 zLMecGaZR5ynK6GE8f7Ml3Ex/6APldy0qkkzEaBAkhcBHC+GivS+i5qPLFaYjJ5IxfYg
 Ix0HdpLCjBnqAz9m39WW1jharT+5YOHNU4YfrM8Ah8R+FrEe4b6pxjgCmbbqGgh3sqcB
 2VYQ2agoAbSDUL/b0JhCGJa4iHWfU4XJrqUvTFK2MBTunnoIIjMYIkxDb4U+7zHLnerF
 GdJi7b5u2PxxVuLRhm8fJldQb7CTmEb8WCfsS3hc/y78yAwulmlFeUWonzJRUQpwECvp
 g/gw==
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTA6MDggQU0gRGFuIFdpbGxpYW1zIDxkYW4uai53aWxs
aWFtc0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTA6MDIg
QU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBG
cmksIEp1biAyOCwgMjAxOSBhdCAwOToyNzo0NEFNIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6
Cj4gPiA+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDg6MzkgQU0gSmFzb24gR3VudGhvcnBlIDxq
Z2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwgSnVuIDI2LCAy
MDE5IGF0IDAyOjI3OjE1UE0gKzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiA+
ID4gVGhlIGZ1bmN0aW9uYWxpdHkgaXMgaWRlbnRpY2FsIHRvIHRoZSBvbmUgY3VycmVudGx5IG9w
ZW4gY29kZWQgaW4KPiA+ID4gPiA+IGRldmljZS1kYXguCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiA+ID4gPiBSZXZp
ZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+ID4gPiA+ID4gIGRyaXZl
cnMvZGF4L2RheC1wcml2YXRlLmggfCAgNCAtLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9kYXgvZGV2
aWNlLmMgICAgICB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDcgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4g
PiBEYW5XOiBJIHRoaW5rIHRoaXMgc2VyaWVzIGhhcyByZWFjaGVkIGVub3VnaCByZXZpZXcsIGRp
ZCB5b3Ugd2FudAo+ID4gPiA+IHRvIGFjay90ZXN0IGFueSBmdXJ0aGVyPwo+ID4gPiA+Cj4gPiA+
ID4gVGhpcyBuZWVkcyB0byBsYW5kIGluIGhtbS5naXQgc29vbiB0byBtYWtlIHRoZSBtZXJnZSB3
aW5kb3cuCj4gPiA+Cj4gPiA+IEkgd2FzIGF3YWl0aW5nIGEgZGVjaXNpb24gYWJvdXQgcmVzb2x2
aW5nIHRoZSBjb2xsaXNpb24gd2l0aCBJcmEncwo+ID4gPiBwYXRjaCBiZWZvcmUgdGVzdGluZyB0
aGUgZmluYWwgcmVzdWx0IGFnYWluIFsxXS4gWW91IGNhbiBnbyBhaGVhZCBhbmQKPiA+ID4gYWRk
IG15IHJldmlld2VkLWJ5IGZvciB0aGUgc2VyaWVzLCBidXQgbXkgdGVzdGVkLWJ5IHNob3VsZCBi
ZSBvbiB0aGUKPiA+ID4gZmluYWwgc3RhdGUgb2YgdGhlIHNlcmllcy4KPiA+Cj4gPiBUaGUgY29u
ZmxpY3QgbG9va3MgT0sgdG8gbWUsIEkgdGhpbmsgd2UgY2FuIGxldCBBbmRyZXcgYW5kIExpbnVz
Cj4gPiByZXNvbHZlIGl0Lgo+ID4KPgo+IEFuZHJldydzIHRyZWUgZWZmZWN0aXZlbHkgYWx3YXlz
IHJlYmFzZXMgc2luY2UgaXQncyBhIHF1aWx0IHNlcmllcy4KPiBJJ2QgcmVjb21tZW5kIHB1bGxp
bmcgSXJhJ3MgcGF0Y2ggb3V0IG9mIC1tbSBhbmQgYXBwbHlpbmcgaXQgd2l0aCB0aGUKPiByZXN0
IG9mIGhtbSByZXdvcmtzLiBBbnkgb3RoZXIgZ2l0IHRyZWUgSSdkIGFncmVlIHdpdGgganVzdCBk
b2luZyB0aGUKPiBsYXRlIGNvbmZsaWN0IHJlc29sdXRpb24sIGJ1dCBJJ20gbm90IGNsZWFyIG9u
IHdoYXQncyB0aGUgYmVzdAo+IHByYWN0aWNlIHdoZW4gY29uZmxpY3Rpbmcgd2l0aCAtbW0uCgpS
ZWdhcmRsZXNzIHRoZSBwYXRjaCBpcyBidWdneS4gSWYgeW91IHdhbnQgdG8gZG8gdGhlIGNvbmZs
aWN0CnJlc29sdXRpb24gaXQgc2hvdWxkIGJlIGJlY2F1c2UgdGhlIERFVklDRV9QVUJMSUMgcmVt
b3ZhbCBlZmZlY3RpdmVseQpkb2VzIHRoZSBzYW1lIGZpeCBvdGhlcndpc2Ugd2UncmUga25vd2lu
Z2x5IGxlYXZpbmcgYSBicm9rZW4gcG9pbnQgaW4KdGhlIGhpc3RvcnkuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
