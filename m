Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2147374834
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523CF6E694;
	Thu, 25 Jul 2019 07:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E406E63C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:21:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 201so34596943qkm.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q7VJ5lbRcag+sb2GFiCBi0ogY7ktByen10i6R5SYdYM=;
 b=BMSGgzSqFs5/IAVbSjjIeOVmK6PHPhP5LMHvSDLh4j61gkY6qKz9KlcHMOvdo4Y10n
 JY+fmCaGSngKSKt3E3+iSWOx6niCONl/wlpDeX2ORaB5hQ5XqQ7Cjj5mQunYWMFtihBl
 OKdEuGwGrv6DGNWb/K0q0/fZ4+yem5Tt8PMG6eG8jKyAUcfK581ukFlURXnarq61Ztcl
 1iByE6VyNoq3eFcZ7SOpnQ952KLFbqPPRybHGc04owCJX/XfoQGKLPjm4H4oZGvUymss
 BEQXqFo1BW3dKrR1FSYJqfZog+4cUp68axom5A4L4hh8TOdvVmd98zbb4J7o1bCT4Uog
 U9Kg==
X-Gm-Message-State: APjAAAU2kfRp/yWPtS3XcCdaN1Lxy7AIaQi3TG17h31A+3ETdWH6782q
 GTOliNppKgWm+i8AcZZgdU/SbQ26FPLa3w==
X-Google-Smtp-Source: APXvYqxIqRA+0VLqS5/ktYsyx1BSHKocPYVvc0BAedibqfRz0wbPwwvU+Y1GIKj2RSb05TRVjFqKEg==
X-Received: by 2002:a05:620a:1425:: with SMTP id
 k5mr56337391qkj.146.1563996116084; 
 Wed, 24 Jul 2019 12:21:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id l19sm27634792qtb.6.2019.07.24.12.21.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:21:55 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hqMpn-0006gr-3W; Wed, 24 Jul 2019 16:21:55 -0300
Date: Wed, 24 Jul 2019 16:21:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Message-ID: <20190724192155.GG28493@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
 <20190724175858.GC6410@dhcp22.suse.cz>
 <20190724180837.GF28493@ziepe.ca>
 <20190724185617.GE6410@dhcp22.suse.cz>
 <20190724185910.GF6410@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724185910.GF6410@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q7VJ5lbRcag+sb2GFiCBi0ogY7ktByen10i6R5SYdYM=;
 b=ZyJ3zgq6h4cja/hdaLrA6IkzBFDVRDUJUFtWz1fzLJwFO3+4I4Mk/FCq69MWFKhPkn
 VmJtaQRVCCbTW4B/7vtp3EFV7mKQ0Du9zN1ddOb32MyshNPl6WhBSEDHrm+k6o2CyMMO
 4KyPGLB4T/6MfLf1NsYTF9rAzr1pU8FsMWEvqr8KtU1D2GgXOl729S0aNG0wyoeil1db
 UU7GVtf1oaMsSE860psV8LYDQAfcq3WrN/GcPafu+19PCrIlmB/lcCJJ/hsWVBf9sq/S
 3j9mLwgItOsVezznIUV4U2H56ZO80MnsJTCG1n8+5OJ16YnPZyPc+ck/lacJ5FRZiPcz
 PO7Q==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDg6NTk6MTBQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IE9uIFdlZCAyNC0wNy0xOSAyMDo1NjoxNywgTWljaGFsIEhvY2tvIHdyb3RlOgo+ID4g
T24gV2VkIDI0LTA3LTE5IDE1OjA4OjM3LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+IE9u
IFdlZCwgSnVsIDI0LCAyMDE5IGF0IDA3OjU4OjU4UE0gKzAyMDAsIE1pY2hhbCBIb2NrbyB3cm90
ZToKPiA+IFsuLi5dCj4gPiA+ID4gTWF5YmUgbmV3IHVzZXJzIGhhdmUgc3RhcnRlZCByZWx5aW5n
IG9uIGEgbmV3IHNlbWFudGljIGluIHRoZSBtZWFudGltZSwKPiA+ID4gPiBiYWNrIHRoZW4sIG5v
bmUgb2YgdGhlIG5vdGlmaWVyIGhhcyBldmVuIHN0YXJ0ZWQgYW55IGFjdGlvbiBpbiBibG9ja2lu
Zwo+ID4gPiA+IG1vZGUgb24gYSBFQUdBSU4gYmFpbG91dC4gTW9zdCBvZiB0aGVtIHNpbXBseSBk
aWQgdHJ5bG9jayBlYXJseSBpbiB0aGUKPiA+ID4gPiBwcm9jZXNzIGFuZCBiYWlsZWQgb3V0IHNv
IHRoZXJlIHdhcyBub3RoaW5nIHRvIGRvIGZvciB0aGUgcmFuZ2VfZW5kCj4gPiA+ID4gY2FsbGJh
Y2suCj4gPiA+IAo+ID4gPiBTaW5nbGUgbm90aWZpZXJzIGFyZSBub3QgdGhlIHByb2JsZW0uIEkg
dHJpZWQgdG8gbWFrZSB0aGlzIGNsZWFyIGluCj4gPiA+IHRoZSBjb21taXQgbWVzc2FnZSwgYnV0
IGxldHMgYmUgbW9yZSBleHBsaWNpdC4KPiA+ID4gCj4gPiA+IFdlIGhhdmUgKnR3byogbm90aWZp
ZXJzIHJlZ2lzdGVyZWQgdG8gdGhlIG1tLCBBIGFuZCBCOgo+ID4gPiAKPiA+ID4gQSBpbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0OiAoaGFzIG5vIGJsb2NraW5nKQo+ID4gPiAgICAgc3Bpbl9sb2NrKCkK
PiA+ID4gICAgIGNvdW50ZXIrKwo+ID4gPiAgICAgc3Bpbl91bmxvY2soKQo+ID4gPiAKPiA+ID4g
QSBpbnZhbGlkYXRlX3JhbmdlX2VuZDoKPiA+ID4gICAgIHNwaW5fbG9jaygpCj4gPiA+ICAgICBj
b3VudGVyLS0KPiA+ID4gICAgIHNwaW5fdW5sb2NrKCkKPiA+ID4gCj4gPiA+IEFuZCB0aGlzIG9u
ZToKPiA+ID4gCj4gPiA+IEIgaW52YWxpZGF0ZV9yYW5nZV9zdGFydDogKGhhcyBibG9ja2luZykK
PiA+ID4gICAgIGlmICghdHJ5X211dGV4X2xvY2soKSkKPiA+ID4gICAgICAgICByZXR1cm4gLUVB
R0FJTjsKPiA+ID4gICAgIGNvdW50ZXIrKwo+ID4gPiAgICAgbXV0ZXhfdW5sb2NrKCkKPiA+ID4g
Cj4gPiA+IEIgaW52YWxpZGF0ZV9yYW5nZV9lbmQ6Cj4gPiA+ICAgICBzcGluX2xvY2soKQo+ID4g
PiAgICAgY291bnRlci0tCj4gPiA+ICAgICBzcGluX3VubG9jaygpCj4gPiA+IAo+ID4gPiBTbyBu
b3cgdGhlIG9vbSBwYXRoIGRvZXM6Cj4gPiA+IAo+ID4gPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0
X25vbl9ibG9ja2luZzoKPiA+ID4gIGZvciBlYWNoIG1uOgo+ID4gPiAgICBhLT5pbnZhbGlkYXRl
X3JhbmdlX3N0YXJ0Cj4gPiA+ICAgIGItPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQKPiA+ID4gICAg
cmMgPSBFQUdBSU4KPiA+ID4gCj4gPiA+IE5vdyB3ZSBTS0lQIEEncyBpbnZhbGlkYXRlX3Jhbmdl
X2VuZCBldmVuIHRob3VnaCBBIGhhZCBubyBpZGVhIHRoaXMKPiA+ID4gd291bGQgaGFwcGVuIGhh
cyBzdGF0ZSB0aGF0IG5lZWRzIHRvIGJlIHVud291bmQuIEEgaXMgYnJva2VuLgo+ID4gPiAKPiA+
ID4gQiBzdXJ2aXZlZCBqdXN0IGZpbmUuCj4gPiA+IAo+ID4gPiBBIGFuZCBCICphbG9uZSogd29y
ayBmaW5lLCBjb21iaW5lZCB0aGV5IGZhaWwuCj4gPiAKPiA+IEJ1dCB0aGF0IHJlcXVpcmVzIHRo
YXQgdGhleSBzaGFyZSBzb21lIHN0YXRlLCByaWdodD8KPiA+IAo+ID4gPiBXaGVuIHRoZSBjb21t
aXQgd2FzIGxhbmRlZCB5b3UgY2FuIHVzZSBLVk0gYXMgYW4gZXhhbXBsZSBvZiBBIGFuZCBSRE1B
Cj4gPiA+IE9EUCBhcyBhbiBleGFtcGxlIG9mIEIKPiA+IAo+ID4gQ291bGQgeW91IHBvaW50IG1l
IHdoZXJlIHRob3NlIHR3byBzaGFyZSB0aGUgc3RhdGUgcGxlYXNlPyBLVk0gc2VlbXMgdG8KPiA+
IGJlIHVzaW5nIGt2bS0+bW11X25vdGlmaWVyX2NvdW50IGJ1dCBJIGRvIG5vdCBrbm93IHdoZXJl
IHRvIGxvb2sgZm9yIHRoZQo+ID4gUkRNQS4uLgo+IAo+IFNjcmF0Y2ggdGhhdC4gRUxPTkdEQVku
Li4gSSBjYW4gc2VlIHlvdXIgcG9pbnQuIEl0IGlzIGFsbCBvciBub3RoaW5nCj4gdGhhdCBkb2Vz
bid0IHJlYWxseSB3b3JrIGhlcmUuIExvb2tpbmcgYmFjayBhdCB5b3VyIHBhdGNoIGl0IHNlZW1z
Cj4gcmVhc29uYWJsZSBidXQgSSBhbSBub3Qgc3VyZSB3aGF0IGlzIHN1cHBvc2VkIHRvIGJlIGEg
YmVoYXZpb3IgZm9yCj4gbm90aWZpZXJzIHRoYXQgZmFpbGVkLgoKT2theSwgZ29vZCB0byBrbm93
IEknbSBub3QgbWlzc2luZyBzb21ldGhpbmcuIFRoZSBpZGVhIHdhcyB0aGUgZmFpbGVkCm5vdGlm
aWVyIHdvdWxkIGhhdmUgdG8gaGFuZGxlIHRoZSBtYW5kYXRvcnkgX2VuZCBjYWxsYmFjay4KCkkn
dmUgcmVmbGVjdGVkIG9uIGl0IHNvbWUgbW9yZSwgYW5kIEkgaGF2ZSBhIHNjaGVtZSB0byBiZSBh
YmxlIHRvCid1bmRvJyB0aGF0IGlzIHNhZmUgYWdhaW5zdCBjb25jdXJyZW50IGhsaXN0X2RlbF9y
Y3UuCgpJZiB3ZSBjaGFuZ2UgdGhlIHJlZ2lzdGVyIHRvIGtlZXAgdGhlIGhsaXN0IHNvcnRlZCBi
eSBhZGRyZXNzIHRoZW4gd2UKY2FuIGRvIGEgdGFyZ2V0dGVkICd1bmRvJyBvZiBwYXN0IHN0YXJ0
cyB0ZXJtaW5hdGVkIGJ5IGFkZHJlc3MKbGVzcy10aGFuIGNvbXBhcmlzb24gb2YgdGhlIGZpcnN0
IGZhaWxpbmcgc3RydWN0IG1tdV9ub3RpZmllci4KCkl0IHJlbGllcyBvbiB0aGUgZmFjdCB0aGF0
IHJjdSBpcyBvbmx5IHVzZWQgdG8gcmVtb3ZlIGl0ZW1zLCB0aGUgbGlzdAphZGRzIGFyZSBhbGwg
cHJvdGVjdGVkIGJ5IG1tIGxvY2tzLCBhbmQgdGhlIG51bWJlciBvZiBtbXUgbm90aWZpZXJzIGlz
CnZlcnkgc21hbGwuCgpUaGlzIHNlZW1zIHdvcmthYmxlIGFuZCBkb2VzIG5vdCBuZWVkIG1vcmUg
ZHJpdmVyIHJldmlldy91cGRhdGUuLi4KCkhvd2V2ZXIsIGhtbSdzIGltcGxlbWVudGF0aW9uIHN0
aWxsIG5lZWRzIG1vcmUgZml4aW5nLgoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
