Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6AB5A4FC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 21:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911876E987;
	Fri, 28 Jun 2019 19:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0C26E987
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 19:14:55 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id x21so7037199otq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3EPvpztsPK7520nxsbDhjXQoNlIusJTLU8rYF+ocke4=;
 b=Gpr1E0HCMSHCxzjFvowbeAX8ieiGGG9qA3hOzpheOjDJQzoaGV2MGTdnzs0sXLBBSe
 vUqc5Ys4+hVBcqOY7D++y3oCFNjWPI2wraCwu1YZBIaTlReP3tZK0ApUoyuGiGwqN/2h
 fP2xvIqc91LbD/4pbdinVN+etM+GBymyLIm/w5OMNiU9mipJUGamWCKNuJHAruApdQ6V
 2JwZ0i79ab34tkhrWU4hRaLgTbu3hko3eQtFGHh5yJp2s096Rz6UZemCePCKi26KhXMw
 zihppCTgK0PbOUWJCeii/5++DJpnFeQeZ09Ng1f/3qg9Yl4byOWkHbeLETrVfIFbxrE3
 yYpA==
X-Gm-Message-State: APjAAAV485bKqcuZcBDfMYvJzAvQJPqE7kX8qiV1CbGu4BbKExkHiz13
 PGnrxrcCE2ky3Bt1EmTPO5ZzaCho9tjxix9yY3R3uA==
X-Google-Smtp-Source: APXvYqwk0yjTvQhVqTpz4jl7ioGiwvBTeiygz26S4gTf6ee6guEN0yjq3zRwNg6EKq8iXaiv+Kpq8rgpgiSlzbcUkgY=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr8541745otn.71.1561749295055; 
 Fri, 28 Jun 2019 12:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
 <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
 <20190628182922.GA15242@mellanox.com>
 <CAPcyv4g+zk9pnLcj6Xvwh-svKM+w4hxfYGikcmuoBAFGCr-HAw@mail.gmail.com>
 <20190628185152.GA9117@lst.de>
 <CAPcyv4i+b6bKhSF2+z7Wcw4OUAvb1=m289u9QF8zPwLk402JVg@mail.gmail.com>
 <20190628190207.GA9317@lst.de>
In-Reply-To: <20190628190207.GA9317@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 12:14:44 -0700
Message-ID: <CAPcyv4h90DAVHbZ4bgvJwpfB8wr2K28oEes6HcdQOpf02+NL=g@mail.gmail.com>
Subject: Re: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3EPvpztsPK7520nxsbDhjXQoNlIusJTLU8rYF+ocke4=;
 b=jX7l/aScOnNag6NN8PLCh3f8Z8jWQa8rXqdmRFTm19zC5cGsMg4bGsXFEunae/2WjS
 ovvvaTeYJH2utyMhChKwGiGq8ZBoeIIKayiImspczzJ8SDCf8XDDL3viRbXyjtD1lYaK
 kzh/gY0uzN3viGFbDD3U65We27uV73cZy9DpexfMTRSqDZy8x6zljmPhhW1gZcx2hqFe
 GQ/mPFT2QGn+yrEJgjwPpeYXNTM2MxsKsrWYit2Wtxn/cph7hWSIQxFHWHLu8ToPNVuS
 0Ys9z5mBN7oGuoBHQrTDBIA0uIvuwg0tIL5G5RHXTDvUcDFV767ifaCgmnx0wSkTm7cV
 iWpw==
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
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTI6MDIgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6NTk6MTlBTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gSXQncyBhIGJ1ZyB0aGF0IHRoZSBjYWxsIHRvIHB1
dF9kZXZtYXBfbWFuYWdlZF9wYWdlKCkgd2FzIGdhdGVkIGJ5Cj4gPiBNRU1PUllfREVWSUNFX1BV
QkxJQyBpbiByZWxlYXNlX3BhZ2VzKCkuIFRoYXQgcGF0aCBpcyBhbHNvIGFwcGxpY2FibGUKPiA+
IHRvIE1FTU9SWV9ERVZJQ0VfRlNEQVggYmVjYXVzZSBpdCBuZWVkcyB0byB0cmlnZ2VyIHRoZSAt
PnBhZ2VfZnJlZSgpCj4gPiBjYWxsYmFjayB0byB3YWtlIHVwIHdhaXRfb25fdmFyKCkgdmlhIGZz
ZGF4X3BhZ2VmcmVlKCkuCj4gPgo+ID4gU28gSSBndWVzcyB5b3UgY291bGQgYXJndWUgdGhhdCB0
aGUgTUVNT1JZX0RFVklDRV9QVUJMSUMgcmVtb3ZhbCBwYXRjaAo+ID4gbGVmdCB0aGUgb3JpZ2lu
YWwgYnVnIGluIHBsYWNlLiBJbiB0aGF0IHNlbnNlIHdlJ3JlIG5vIHdvcnNlIG9mZiwgYnV0Cj4g
PiBzaW5jZSB3ZSBrbm93IGFib3V0IHRoZSBidWcsIHRoZSBmaXggYW5kIHRoZSBwYXRjaGVzIGhh
dmUgbm90IGJlZW4KPiA+IGFwcGxpZWQgeWV0LCB3aHkgbm90IGZpeCBpdCBub3c/Cj4KPiBUaGUg
Zml4IGl0IG5vdyB3b3VsZCBzaW1wbHkgYmUgdG8gYXBwbHkgSXJhIG9yaWdpbmFsIHBhdGNoIG5v
dywgYnV0Cj4gZ2l2ZW4gdGhhdCB3ZSBhcmUgYXQgLXJjNiBpcyB0aGlzIHJlYWxseSBhIGdvb2Qg
dGltZT8gIEFuZCBpZiB3ZSBkb24ndAo+IGFwcGx5IGl0IG5vdyBiYXNlZCBvbiB0aGUgcXVpbHQg
YmFzZWQgLW1tIHdvcmZsb3cgaXQganVzdCBzZWVtcyBhIGxvdAo+IGVhc2llciB0byBhcHBseSBp
dCBhZnRlciBteSBzZXJpZXMuICBVbmxlc3Mgd2Ugd2FudCB0byBpbmNsdWRlIGl0IGluCj4gdGhl
IHNlcmllcywgaW4gd2hpY2ggY2FzZSBJIGNhbiBkbyBhIHF1aWNrIHJlYmFzZSwgd2UnZCBqdXN0
IG5lZWQgdG8KPiBtYWtlIHN1cmUgQW5kcmV3IHB1bGxzIGl0IGZyb20gLW1tLgoKSSBiZWxpZXZl
IC1tbSBhdXRvIGRyb3BzIHBhdGNoZXMgd2hlbiB0aGV5IGFwcGVhciBpbiB0aGUgLW5leHQKYmFz
ZWxpbmUuIFNvIGl0IHNob3VsZCAianVzdCB3b3JrIiB0byBwdWxsIGl0IGludG8gdGhlIHNlcmll
cyBhbmQgc2VuZAppdCBhbG9uZyBmb3IgLW5leHQgaW5jbHVzaW9uLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
