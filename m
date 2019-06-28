Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D525A4AC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 20:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEF66E4DE;
	Fri, 28 Jun 2019 18:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE8B6E982
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 18:59:30 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id s20so7023162otp.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 11:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZKi8dPs5bce5TA+lDYDR67LZgo76bXK/epIzKFvivc=;
 b=YGTtsrEpHvpyOPWaq/GUnm28lxpZaGrAgrEckEJ0gqRRSI1KmlT6LNc5od/KF9bDBp
 qRfYRXgVVcVyjEcAZNsNQjNKuA/sd+NMgN+rLjEkWd0nVj5Rh4lmWVKOvcvFdIDzB4fu
 rAZzqijRkBSBgXhRpfPpMsU9g/kU8IN+H0MDi/JmT4BwE8qMms/zKVQDjKOKjeQ0jjDq
 KXTPfOpioYTkZSCIellS6UPz35l7smDS3/9Ns5J1ZLiu/Pbso8u0vPfM7ZLrjhBhLj4q
 9rHVzfYwSxjPQTi4o9LwU0DZBXspPdcJhoEevMPR+xniEep35FBWGkipfdkdtZGeR2tv
 uIQQ==
X-Gm-Message-State: APjAAAVJ1MGzhRn3m+PCBUjc1clvnuJrKGnAXEug6HLlxLd3sWkglR+b
 kbWq053+6GO26bQuXbk+aMsQ/J++W7thMb3Qgmn0cQ==
X-Google-Smtp-Source: APXvYqxUAlE0PhQVf+kI2qGh3xwcV/BdcPGn6HCqEnYJmqo0MIx4gI+EfnCAuColBmsblnHh366HyPqaX1Z8NdWYLok=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr8858325otn.247.1561748370285; 
 Fri, 28 Jun 2019 11:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
 <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
 <20190628182922.GA15242@mellanox.com>
 <CAPcyv4g+zk9pnLcj6Xvwh-svKM+w4hxfYGikcmuoBAFGCr-HAw@mail.gmail.com>
 <20190628185152.GA9117@lst.de>
In-Reply-To: <20190628185152.GA9117@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 11:59:19 -0700
Message-ID: <CAPcyv4i+b6bKhSF2+z7Wcw4OUAvb1=m289u9QF8zPwLk402JVg@mail.gmail.com>
Subject: Re: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xZKi8dPs5bce5TA+lDYDR67LZgo76bXK/epIzKFvivc=;
 b=w73nxePK59nSfEruxrF1M0kHpQTfXV+T0BR3rvgPNUWzxDsJQPeaM7uFD7eKRrxE9Y
 9ImwGmBtt6yXJ6nlctHx0FbYi1ua/8g/5ZblEqYZrPEU8IkQx9AAwyacMH73KkUPSZW4
 2CnxLw8FBn5LZR6QuLzXXkPegk+n9WnVTkvOy7EQwUeDTJ/KqrjyTyioxg0mlKF5l5Fl
 pBgbtoepm7/tvV+XTP8uNL6F6V5682w/nGp9yu+fmrqAAOl3CXi6A8E63DaUmygnIHBK
 Lo3TxfO9CsdVEHmVkApvqnki+XHSFnPPV047Ep963nO0SUi6VwELdrivAHXWP8JUXEYH
 XM8g==
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

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6NTIgQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6NDQ6MzVBTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gVGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggdGhlIHNl
cmllcyBpbiBDSCdzIHRyZWUuIEl0IHJlbW92ZXMgdGhlCj4gPiAtPnBhZ2VfZnJlZSgpIGNhbGxi
YWNrIGZyb20gdGhlIHJlbGVhc2VfcGFnZXMoKSBwYXRoIGJlY2F1c2UgaXQgZ29lcwo+ID4gdG9v
IGZhciBhbmQgcmVtb3ZlcyB0aGUgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UoKSBjYWxsLgo+Cj4g
cmVsZWFzZV9wYWdlcyBvbmx5IGNhbGxlZCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZSBmb3IgZGV2
aWNlIHB1YmxpYwo+IHBhZ2VzLiAgU28gSSBjYW4ndCBzZWUgaG93IHRoYXQgaXMgaW4gYW55IHdh
eSBhIHByb2JsZW0uCgpJdCdzIGEgYnVnIHRoYXQgdGhlIGNhbGwgdG8gcHV0X2Rldm1hcF9tYW5h
Z2VkX3BhZ2UoKSB3YXMgZ2F0ZWQgYnkKTUVNT1JZX0RFVklDRV9QVUJMSUMgaW4gcmVsZWFzZV9w
YWdlcygpLiBUaGF0IHBhdGggaXMgYWxzbyBhcHBsaWNhYmxlCnRvIE1FTU9SWV9ERVZJQ0VfRlNE
QVggYmVjYXVzZSBpdCBuZWVkcyB0byB0cmlnZ2VyIHRoZSAtPnBhZ2VfZnJlZSgpCmNhbGxiYWNr
IHRvIHdha2UgdXAgd2FpdF9vbl92YXIoKSB2aWEgZnNkYXhfcGFnZWZyZWUoKS4KClNvIEkgZ3Vl
c3MgeW91IGNvdWxkIGFyZ3VlIHRoYXQgdGhlIE1FTU9SWV9ERVZJQ0VfUFVCTElDIHJlbW92YWwg
cGF0Y2gKbGVmdCB0aGUgb3JpZ2luYWwgYnVnIGluIHBsYWNlLiBJbiB0aGF0IHNlbnNlIHdlJ3Jl
IG5vIHdvcnNlIG9mZiwgYnV0CnNpbmNlIHdlIGtub3cgYWJvdXQgdGhlIGJ1ZywgdGhlIGZpeCBh
bmQgdGhlIHBhdGNoZXMgaGF2ZSBub3QgYmVlbgphcHBsaWVkIHlldCwgd2h5IG5vdCBmaXggaXQg
bm93PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
