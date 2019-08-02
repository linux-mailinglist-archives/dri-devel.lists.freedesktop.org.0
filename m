Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390347EEFA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885E86ED48;
	Fri,  2 Aug 2019 08:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A426ECC8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 06:29:19 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id e20so16880200iob.9
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 23:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8J0CG6n/mGE9VY7Tzl2V8r1MEJfljCPCP1w3kMFb7gU=;
 b=J/l+55CMeBy8jw8TNn2MqdiccvUhpBPXBrRBXgCTRsmiO42mq/Yc7exXwyZPhAIkww
 4BQaDokmpSYK42P25gYSyrSjysMryLxTLDGU1Zpci7xlAgPs8nHOKhsDXOGVJIlZCom4
 h6TWsz5uVUhFqWpjcLIKYGq6E/XdnRKS1aq3yEqs3FOelvECX1a22P9xFyZaf2VAONZL
 bhdUPyFrmh8lEyJB5St9FVF+fllkDHG6B9hQFm1oMqzKU1h0HMZ8SWHeBvoHJc2mFfxl
 PIM5e4dS9cRhL4hPcs8N6vsfoGZXWYETMuxq41CNMEUlhXasaGIPgYb/Xiv56A1E6Yp9
 NhLA==
X-Gm-Message-State: APjAAAV6rMiOYIUVbIRxTPNQCDdwFZzmXrrxZd3Flywq0RKSX2TUAntL
 fpH25GLVrOpBRFfN6QNsVMSVSehFGy+x1N2Nbfgm/A==
X-Google-Smtp-Source: APXvYqyCEEQjF5gUAqe0Jy7lkgRv7S109dxiMqY3y1rXR3KgTUxyI68+/GDAwhKmPjZXNLxgfhvOgGBjK0GGgCuPqfQ=
X-Received: by 2002:a6b:3b89:: with SMTP id i131mr71226796ioa.33.1564727358352; 
 Thu, 01 Aug 2019 23:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-17-jhubbard@nvidia.com>
In-Reply-To: <20190802022005.5117-17-jhubbard@nvidia.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 2 Aug 2019 08:29:07 +0200
Message-ID: <CAHUa44G++iiwU62jj7QH=V3sr4z26sf007xrwWLPw6AAeMLAEw@mail.gmail.com>
Subject: Re: [PATCH 16/34] drivers/tee: convert put_page() to put_user_page*()
To: john.hubbard@gmail.com
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8J0CG6n/mGE9VY7Tzl2V8r1MEJfljCPCP1w3kMFb7gU=;
 b=RjyjBD2oGv8Yelvkiciev/lZ+Q3xXx8QFqdYzdY4aCHOlugQGM86oI6FqZDvirisZ5
 VJ+QLkBMLnRka6ltoYGD5wyPSjpGXQPHFctjuGwd1+UFurx0yvKt9ushEUj8EZV9ix2W
 01tKC6Gaz3MS8M+0E+YLTPk1gYgnaZnSfnfDmi+UFK25mv5gEzSDgABsBJUiG+nhSsUl
 RKT5eQ9kRkeBcJ7gT+NzJThlFQ8TbWheTrXZG+kEcBrFAA6KQockx50ATbHKRl86DAya
 RCLedopliZ67rTczSP3iIMKDggIEdiJgpUtX8J4w3apFv4UIzEajhXW7aw51MfImXOri
 CFCw==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMiwgMjAxOSBhdCA0OjIwIEFNIDxqb2huLmh1YmJhcmRAZ21haWwuY29tPiB3
cm90ZToKPgo+IEZyb206IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPgo+IEZv
ciBwYWdlcyB0aGF0IHdlcmUgcmV0YWluZWQgdmlhIGdldF91c2VyX3BhZ2VzKigpLCByZWxlYXNl
IHRob3NlIHBhZ2VzCj4gdmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5z
dGVhZCBvZiB2aWEgcHV0X3BhZ2UoKSBvcgo+IHJlbGVhc2VfcGFnZXMoKS4KPgo+IFRoaXMgaXMg
cGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29tbWl0IGZjMWQ4
ZTdjY2EyZAo+ICgibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdlKigpLCBwbGFjZWhvbGRlciB2
ZXJzaW9ucyIpLgo+Cj4gQ2M6IEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8u
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy90ZWUvdGVlX3NobS5jIHwgMTAgKystLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IEplbnMg
V2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPgoKSSBzdXBwb3NlIHlvdSdyZSB0
YWtpbmcgdGhpcyB2aWEgeW91ciBvd24gdHJlZSBvciBzdWNoLgoKVGhhbmtzLApKZW5zCgo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVlL3RlZV9zaG0uYyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0u
Ywo+IGluZGV4IDJkYTAyNmZkMTJjOS4uYzk2N2QwNDIwYjY3IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdGVlL3RlZV9zaG0uYwo+ICsrKyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwo+IEBAIC0zMSwx
NiArMzEsMTMgQEAgc3RhdGljIHZvaWQgdGVlX3NobV9yZWxlYXNlKHN0cnVjdCB0ZWVfc2htICpz
aG0pCj4KPiAgICAgICAgICAgICAgICAgcG9vbG0tPm9wcy0+ZnJlZShwb29sbSwgc2htKTsKPiAg
ICAgICAgIH0gZWxzZSBpZiAoc2htLT5mbGFncyAmIFRFRV9TSE1fUkVHSVNURVIpIHsKPiAtICAg
ICAgICAgICAgICAgc2l6ZV90IG47Cj4gICAgICAgICAgICAgICAgIGludCByYyA9IHRlZWRldi0+
ZGVzYy0+b3BzLT5zaG1fdW5yZWdpc3RlcihzaG0tPmN0eCwgc2htKTsKPgo+ICAgICAgICAgICAg
ICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Vycih0ZWVkZXYtPmRl
di5wYXJlbnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidW5yZWdpc3RlciBz
aG0gJXAgZmFpbGVkOiAlZCIsIHNobSwgcmMpOwo+Cj4gLSAgICAgICAgICAgICAgIGZvciAobiA9
IDA7IG4gPCBzaG0tPm51bV9wYWdlczsgbisrKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHB1
dF9wYWdlKHNobS0+cGFnZXNbbl0pOwo+IC0KPiArICAgICAgICAgICAgICAgcHV0X3VzZXJfcGFn
ZXMoc2htLT5wYWdlcywgc2htLT5udW1fcGFnZXMpOwo+ICAgICAgICAgICAgICAgICBrZnJlZShz
aG0tPnBhZ2VzKTsKPiAgICAgICAgIH0KPgo+IEBAIC0zMTMsMTYgKzMxMCwxMyBAQCBzdHJ1Y3Qg
dGVlX3NobSAqdGVlX3NobV9yZWdpc3RlcihzdHJ1Y3QgdGVlX2NvbnRleHQgKmN0eCwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAo+ICAgICAgICAgcmV0dXJuIHNobTsKPiAgZXJyOgo+ICAgICAgICAgaWYg
KHNobSkgewo+IC0gICAgICAgICAgICAgICBzaXplX3QgbjsKPiAtCj4gICAgICAgICAgICAgICAg
IGlmIChzaG0tPmlkID49IDApIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBtdXRleF9sb2Nr
KCZ0ZWVkZXYtPm11dGV4KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZHJfcmVtb3ZlKCZ0
ZWVkZXYtPmlkciwgc2htLT5pZCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgbXV0ZXhfdW5s
b2NrKCZ0ZWVkZXYtPm11dGV4KTsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAg
ICBpZiAoc2htLT5wYWdlcykgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIGZvciAobiA9IDA7
IG4gPCBzaG0tPm51bV9wYWdlczsgbisrKQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcHV0X3BhZ2Uoc2htLT5wYWdlc1tuXSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHV0
X3VzZXJfcGFnZXMoc2htLT5wYWdlcywgc2htLT5udW1fcGFnZXMpOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGtmcmVlKHNobS0+cGFnZXMpOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAg
ICB9Cj4gLS0KPiAyLjIyLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
