Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C07FF48D56
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 21:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC4B89286;
	Mon, 17 Jun 2019 19:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911B1891B5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 19:02:21 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id s20so10578846otp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 12:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BlHoKzaMfcTndlIUZpaHNLrZG84G4vKyhA8APL9TYlo=;
 b=pNsjzKdgx2VzrdMMRt1wBEwYS/DUrUuPJpoQ/CKKJ8Awpm75BuyCkepfzG4S/YR4OU
 u9ROjPQDqsXE+DoElU/gCUU4X2oCURI5LMqTcWZ5WtdmQQcR1O4DXcTXINswX5oX/RSo
 K+TWyPr7057rUG6P71XgQgALU7YrPxR2CNXfZ0M8yGpffY8MvyXK65admq5QtE+OEnwv
 QEXaZuQhomLx+VC8vGOaDrntHYfExOZmRhM4qhHoKWLUawwXy9o40qs4eLCBxTdCkp5X
 BxuZ+rm1TDTC+7TBg6KM1ugx2j+fgh72zJoubpD7dy69yNU+x7RLfy/35/X66/nSJYA6
 iCDw==
X-Gm-Message-State: APjAAAVNfx5CA8tl1tFreS69IOJX+lyhzgQKiqmgeE9pRgmkX3rNaC8l
 1xMA0NeFrh0rTwFCNfSOJZZDMsb9CuljPZ8RqPIq8g==
X-Google-Smtp-Source: APXvYqzJpQgCLYpd5HiWxDsy1wcz73meBykPfY3oY8gVfhGSrrrXTjfeSfxjaTy4CC9Dtjp1KjOhC26LvRkxDcN1gDI=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr51912079otn.71.1560798140931; 
 Mon, 17 Jun 2019 12:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-8-hch@lst.de>
In-Reply-To: <20190617122733.22432-8-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 17 Jun 2019 12:02:09 -0700
Message-ID: <CAPcyv4hbGfOawfafqQ-L1CMr6OMFGmnDtdgLTXrgQuPxYNHA2w@mail.gmail.com>
Subject: Re: [PATCH 07/25] memremap: validate the pagemap type passed to
 devm_memremap_pages
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BlHoKzaMfcTndlIUZpaHNLrZG84G4vKyhA8APL9TYlo=;
 b=GQLW4HsTHqCZEV9mnOjnMrJWlLsdN8IhjnBoXVeTWqMkmbCxk8sZBD5lQSSBonTJIM
 PQpLqvxmfSU97Mp7ZkXYfzmZvyaftV4da/a21l7cSiFjBd/MqoX/xe2Q1eES5mKJF5Gx
 CjLeVsYnpL1abS+tpATrdwoL8cfv1W46T/pNOxBw8rYqsvqcySs4doJJNlylxXen8sQu
 0tArKmv0hrkikKLc1DMK+s8fkM1rgXKen4eyLlfkzY9W6Wctk+b/3/fC7QVMsGZuOWHr
 vLKx/QLeQzPNSvOdmqkQgk5dMQpH8k73LtoVoK1CABRsAj/MA+31rF03f1vzZFLYB6Mk
 qStg==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNToyNyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBNb3N0IHBnbWFwIHR5cGVzIGFyZSBvbmx5IHN1cHBvcnRlZCB3aGVu
IGNlcnRhaW4gY29uZmlnIG9wdGlvbnMgYXJlCj4gZW5hYmxlZC4gIENoZWNrIGZvciBhIHR5cGUg
dGhhdCBpcyB2YWxpZCBmb3IgdGhlIGN1cnJlbnQgY29uZmlndXJhdGlvbgo+IGJlZm9yZSBzZXR0
aW5nIHVwIHRoZSBwYWdlbWFwLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGtlcm5lbC9tZW1yZW1hcC5jIHwgMjcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEva2VybmVsL21lbXJlbWFwLmMgYi9rZXJuZWwvbWVtcmVtYXAuYwo+IGluZGV4
IDZlMTk3MDcxOWRjMi4uNmEyZGQzMWE2MjUwIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9tZW1yZW1h
cC5jCj4gKysrIGIva2VybmVsL21lbXJlbWFwLmMKPiBAQCAtMTU3LDYgKzE1NywzMyBAQCB2b2lk
ICpkZXZtX21lbXJlbWFwX3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldl9wYWdl
bWFwICpwZ21hcCkKPiAgICAgICAgIHBncHJvdF90IHBncHJvdCA9IFBBR0VfS0VSTkVMOwo+ICAg
ICAgICAgaW50IGVycm9yLCBuaWQsIGlzX3JhbTsKPgo+ICsgICAgICAgc3dpdGNoIChwZ21hcC0+
dHlwZSkgewo+ICsgICAgICAgY2FzZSBNRU1PUllfREVWSUNFX1BSSVZBVEU6Cj4gKyAgICAgICAg
ICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfREVWSUNFX1BSSVZBVEUpKSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgV0FSTigxLCAiRGV2aWNlIHByaXZhdGUgbWVtb3J5IG5vdCBzdXBw
b3J0ZWRcbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FSU5W
QUwpOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAg
ICAgY2FzZSBNRU1PUllfREVWSUNFX1BVQkxJQzoKPiArICAgICAgICAgICAgICAgaWYgKCFJU19F
TkFCTEVEKENPTkZJR19ERVZJQ0VfUFVCTElDKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAg
IFdBUk4oMSwgIkRldmljZSBwdWJsaWMgbWVtb3J5IG5vdCBzdXBwb3J0ZWRcbiIpOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ICsgICAgICAgICAg
ICAgICB9Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSBNRU1PUllfREVW
SUNFX0ZTX0RBWDoKPiArICAgICAgICAgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19aT05F
X0RFVklDRSkgfHwKPiArICAgICAgICAgICAgICAgICAgIElTX0VOQUJMRUQoQ09ORklHX0ZTX0RB
WF9MSU1JVEVEKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIFdBUk4oMSwgIkZpbGUgc3lz
dGVtIERBWCBub3Qgc3VwcG9ydGVkXG4iKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gRVJSX1BUUigtRUlOVkFMKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAg
ICBicmVhazsKPiArICAgICAgIGNhc2UgTUVNT1JZX0RFVklDRV9QQ0lfUDJQRE1BOgoKTmVlZCBh
IGxlYWQgaW4gcGF0Y2ggdGhhdCBpbnRyb2R1Y2VzIE1FTU9SWV9ERVZJQ0VfREVWREFYLCBvdGhl
cndpc2U6CgogSW52YWxpZCBwZ21hcCB0eXBlIDAKIFdBUk5JTkc6IENQVTogNiBQSUQ6IDEzMTYg
YXQga2VybmVsL21lbXJlbWFwLmM6MTgzCmRldm1fbWVtcmVtYXBfcGFnZXMrMHgxZDgvMHg3MDAK
IFsuLl0KIFJJUDogMDAxMDpkZXZtX21lbXJlbWFwX3BhZ2VzKzB4MWQ4LzB4NzAwCiBbLi5dCiBD
YWxsIFRyYWNlOgogIGRldl9kYXhfcHJvYmUrMHhjNy8weDFlMCBbZGV2aWNlX2RheF0KICByZWFs
bHlfcHJvYmUrMHhlZi8weDM5MAogIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHhiNC8weDEwMAogIGRl
dmljZV9kcml2ZXJfYXR0YWNoKzB4NGYvMHg2MApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
