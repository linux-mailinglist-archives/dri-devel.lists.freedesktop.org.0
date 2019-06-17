Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FD48E70
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 21:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50388892B9;
	Mon, 17 Jun 2019 19:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FF3892B9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 19:25:29 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id l15so1029856otn.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 12:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HNxPoXz08Bkv6XLKAsIWbiHb1gnesryRGgT+tAFHLoc=;
 b=T+3uhMGJ1k6x0du/Ns4kOXOVqLJCRbCMM/gdPetgdufPuZB8icE5MpOnbXaeAGq2FV
 Iap1SY3JZj/BLC5kIdMlxD2PFsVqOM5iC61POos8gNucphQJokR48X+yFXWQk6/SJTmb
 3JeMjwmeFoi3MiLMWsMwe4wW59pfklDZLCmvpFRnu48M7ZLN9kmqJyrJpDAMeVvkmT5P
 PZhP2sVZKkeYSUearyDo+hmTWIn/jgVc7JlH8GMqjiTPhUN6tbokyNSDlAzDXpSHj9jg
 ESJ5sIUQ2f814kJhiYAc8VamLsblTy1PWTlEZ43nFNvsop+n58jpizPVIZHdsqTNt179
 a/Vg==
X-Gm-Message-State: APjAAAU4bwdiX22Q/VH5vWm1f6f4hhzPfsP4y9yjARHWVVLpEOcGvTo+
 nvuBBvQowmKipDnh15mnJ+Pq7xvvP7Le8sdGKkuqYA==
X-Google-Smtp-Source: APXvYqyQusXzMIvOnOSDlzozCSKeY3iIGkQ0PmM8jIAxg1c9m+Lhh4LXmnIB3y6iM6i/y/0k5RVphJmN2SXJiVLtpbU=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr55333952otn.247.1560799528939; 
 Mon, 17 Jun 2019 12:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-11-hch@lst.de>
In-Reply-To: <20190617122733.22432-11-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 17 Jun 2019 12:25:17 -0700
Message-ID: <CAPcyv4jtZSK7bgQX_Sm1E-Thqmyhs30SrZKoSApjghRLL12Ngg@mail.gmail.com>
Subject: Re: [PATCH 10/25] memremap: lift the devmap_enable manipulation into
 devm_memremap_pages
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HNxPoXz08Bkv6XLKAsIWbiHb1gnesryRGgT+tAFHLoc=;
 b=zsU6x4/n004yGk33kbKQd/6ii5ctCApqWKr2xXu2QHfi+ncPf+6aOer/hnDk2UAkcB
 jGunUn0he2nTR0uU2859WbUUtlv6pvLc41AXK2T6AWHriY76vgq0YRD//La6/nHXzo1Z
 YPIa/GBGOk0VXAfuIX+0DmRt+mlbZWG/S7zDJ2J1W8prL2gnJon9QkcM3fcOMMdwSo4e
 4OrGQSbgcfUmMeefb3e2ZPd0f7T54UdNfjjuNpUJ/GMYEaMNtkVI6YVgubTvq1/bIgZo
 qVrNws/T9AqY75DGEixSkuSqStvevZuszwTUzd/rSGi9BdsaPARyVCoYryGFhOd3HmF5
 Pgcg==
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNToyOCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBKdXN0IGNoZWNrIGlmIHRoZXJlIGlzIGEgLT5wYWdlX2ZyZWUgb3Bl
cmF0aW9uIHNldCBhbmQgdGFrZSBjYXJlIG9mIHRoZQo+IHN0YXRpYyBrZXkgZW5hYmxlLCBhcyB3
ZWxsIGFzIHRoZSBwdXQgdXNpbmcgZGV2aWNlIG1hbmFnZWQgcmVzb3VyY2VzLgo+IEFsc28gY2hl
Y2sgdGhhdCBhIC0+cGFnZV9mcmVlIGlzIHByb3ZpZGVkIGZvciB0aGUgcGdtYXBzIHR5cGVzIHRo
YXQKPiByZXF1aXJlIGl0LCBhbmQgY2hlY2sgZm9yIGEgdmFsaWQgdHlwZSBhcyB3ZWxsIHdoaWxl
IHdlIGFyZSBhdCBpdC4KPgo+IE5vdGUgdGhhdCB0aGlzIGFsc28gZml4ZXMgdGhlIGZhY3QgdGhh
dCBobW0gbmV2ZXIgY2FsbGVkCj4gZGV2X3BhZ2VtYXBfcHV0X29wcyBhbmQgdGh1cyB3b3VsZCBs
ZWF2ZSB0aGUgc2xvdyBwYXRoIGVuYWJsZWQgZm9yZXZlciwKPiBldmVuIGFmdGVyIGEgZGV2aWNl
IGRyaXZlciB1bmxvYWQgb3IgZGlzYWJsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBkcml2ZXJzL252ZGltbS9wbWVtLmMgfCAyMyAr
KystLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmggICAgfCAxMCAtLS0tLS0tLQo+
ICBrZXJuZWwvbWVtcmVtYXAuYyAgICAgfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tCj4gIG1tL2htbS5jICAgICAgICAgICAgICB8ICAyIC0tCj4gIDQgZmls
ZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCj4KWy4uXQo+IGRp
ZmYgLS1naXQgYS9rZXJuZWwvbWVtcmVtYXAuYyBiL2tlcm5lbC9tZW1yZW1hcC5jCj4gaW5kZXgg
YmE3MTU2YmQ1MmQxLi43MjcyMDI3ZmJkZDcgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL21lbXJlbWFw
LmMKPiArKysgYi9rZXJuZWwvbWVtcmVtYXAuYwpbLi5dCj4gQEAgLTE5MCw2ICsyMTksMTIgQEAg
dm9pZCAqZGV2bV9tZW1yZW1hcF9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZf
cGFnZW1hcCAqcGdtYXApCj4gICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FSU5WQUwp
Owo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBpZiAocGdtYXAtPnR5cGUgIT0gTUVNT1JZX0RFVklD
RV9QQ0lfUDJQRE1BKSB7CgpPbmNlIHdlIGhhdmUgTUVNT1JZX0RFVklDRV9ERVZEQVggdGhlbiB0
aGlzIGNoZWNrIG5lZWRzIHRvIGJlIGZpeGVkIHVwCnRvIHNraXAgdGhhdCBjYXNlIGFzIHdlbGws
IG90aGVyd2lzZToKCiBNaXNzaW5nIHBhZ2VfZnJlZSBtZXRob2QKIFdBUk5JTkc6IENQVTogMTkg
UElEOiAxNTE4IGF0IGtlcm5lbC9tZW1yZW1hcC5jOjMzCmRldm1fbWVtcmVtYXBfcGFnZXMrMHg3
NDUvMHg3ZDAKIFJJUDogMDAxMDpkZXZtX21lbXJlbWFwX3BhZ2VzKzB4NzQ1LzB4N2QwCiBDYWxs
IFRyYWNlOgogIGRldl9kYXhfcHJvYmUrMHhjNi8weDFlMCBbZGV2aWNlX2RheF0KICByZWFsbHlf
cHJvYmUrMHhlZi8weDM5MAogID8gZHJpdmVyX2FsbG93c19hc3luY19wcm9iaW5nKzB4NTAvMHg1
MAogIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHhiNC8weDEwMApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
