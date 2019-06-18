Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D048C4AB1B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C646E22F;
	Tue, 18 Jun 2019 19:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ABC6E22F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:44:12 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id s20so16703419otp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lWeoQffD9ULTiTlyWHRUgEl3LLxJ/1SEB3UmhnFdNVc=;
 b=fhOnEjc+OKBY5RsKak1aNaY86n1xvDjXm754HUujGI0D8goUQkegjuKy6WgFZFDOAv
 WFO3yBrCZbRQ/aXjH/ftNi/Qm4AwjUzY/IHH8LLUzT2j5V06Ud5U0y4diOOhLMbJ0WB+
 9RScQPMkiZBogpWhPD3JWeBCXZa8LZ2QJQEmOXn2Gr761m0YqjZnbEQ+fQseYqEJEcx/
 tfy5uheNaSUxcyWo7sP+FT4qsCf0sT5tsaTBEq1sQJiVGTBvJKp7ZVIFs/MvSoqJ+fPQ
 ClnNEBcFXcLDROYKo19tG1mjBBs2S9Or0e028HFQq0jkOUNAf8rQAaSCL6hZ6YNYsVsk
 0UBA==
X-Gm-Message-State: APjAAAV29u5z9Ghpa5SOi40CBAOahmYtC8RT4oSFAAnP5okomv1977md
 xdCJrM6votMIRnQaBaykh09/DQelX60LOB74jIz5pDdz
X-Google-Smtp-Source: APXvYqzvEbAUxmiQsuBWOyCSPoJJ82/NJ4V945yWJ3d7PH0Xyc52nRxuIrMvp5YF3AqD0GfjC1CQKPjmX1N5IlCt5jk=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr817279otn.247.1560887051616; 
 Tue, 18 Jun 2019 12:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-16-hch@lst.de>
In-Reply-To: <20190617122733.22432-16-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 18 Jun 2019 12:43:59 -0700
Message-ID: <CAPcyv4iwawKnG4jQtcNWNtXQeH3PYG6iWc6JV59DnyixmwDEcg@mail.gmail.com>
Subject: Re: [PATCH 15/25] device-dax: use the dev_pagemap internal refcount
To: Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="0000000000003f3c23058b9e5615"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lWeoQffD9ULTiTlyWHRUgEl3LLxJ/1SEB3UmhnFdNVc=;
 b=HBM18VPXHIC97mbLA+LtY3CIlBwNWPFZh/XoVx5V3O56HGcLOwYjjgGO1PCDnbVpDc
 WuU8ZDq2UjT5VxR4klcAB/lbVRwJ0Z9ei+7ASbtZTF9eoDvBooNqgG4Cn7b0fuW7CjTF
 tjaPfRs8CiVIRv+lH1b32DeFE6GrR8lZUQVBLu7ROfno0v4YRmMIO57Ecxyn/H1ZBXWv
 x5WqNsR4Y/xpS8+RU0wqIjPMvyzhezRAZFOBqwNX2yAIZCUzqW7J36ZwySrmdeosgciw
 9qQOkEYFUoFGBQz/HfT+wqA9YYfTgjxDdiIQfwbk3QkFIUp0slBDktARnSOPSBIAzdUu
 VMdw==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003f3c23058b9e5615
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 17, 2019 at 5:28 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The functionality is identical to the one currently open coded in
> device-dax.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/dax/dax-private.h |  4 ----
>  drivers/dax/device.c      | 43 ---------------------------------------
>  2 files changed, 47 deletions(-)

This needs the mock devm_memremap_pages() to setup the common
percpu_ref. Incremental patch attached:

--0000000000003f3c23058b9e5615
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-tools-testing-nvdimm-Support-the-internal-ref-of-dev.patch"
Content-Disposition: attachment; 
	filename="0001-tools-testing-nvdimm-Support-the-internal-ref-of-dev.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jx27u7050>
X-Attachment-Id: f_jx27u7050

RnJvbSA4NzVlNzE0ODljODQ4NTQ0OGE1YjdkZjJkOGE4YjJlZDc3ZDJiNTU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNv
bT4KRGF0ZTogVHVlLCAxOCBKdW4gMjAxOSAxMTo1ODoyNCAtMDcwMApTdWJqZWN0OiBbUEFUQ0hd
IHRvb2xzL3Rlc3RpbmcvbnZkaW1tOiBTdXBwb3J0IHRoZSAnaW50ZXJuYWwnIHJlZiBvZgogZGV2
X3BhZ2VtYXAKCkZvciB1c2VycyBvZiB0aGUgY29tbW9uIHBlcmNwdS1yZWYgaW1wbGVtZW50YXRp
b24sIGxpa2UgZGV2aWNlLWRheCwKYXJyYW5nZSBmb3IgbmZpdF90ZXN0IHRvIGluaXRpYWxpemUg
dGhlIGNvbW1vbiBwYXJhbWV0ZXJzLgoKU2lnbmVkLW9mZi1ieTogRGFuIFdpbGxpYW1zIDxkYW4u
ai53aWxsaWFtc0BpbnRlbC5jb20+Ci0tLQogdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21h
cC5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9udmRpbW0vdGVzdC9pb21hcC5jIGIvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21h
cC5jCmluZGV4IDNiYzFjMTZjNGVmOS4uOTAxOWRkOGFmYmMxIDEwMDY0NAotLS0gYS90b29scy90
ZXN0aW5nL252ZGltbS90ZXN0L2lvbWFwLmMKKysrIGIvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVz
dC9pb21hcC5jCkBAIC0xMDgsOCArMTA4LDYgQEAgc3RhdGljIHZvaWQgbmZpdF90ZXN0X2tpbGwo
dm9pZCAqX3BnbWFwKQogewogCXN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAgPSBfcGdtYXA7CiAK
LQlXQVJOX09OKCFwZ21hcCB8fCAhcGdtYXAtPnJlZik7Ci0KIAlpZiAocGdtYXAtPm9wcyAmJiBw
Z21hcC0+b3BzLT5raWxsKQogCQlwZ21hcC0+b3BzLT5raWxsKHBnbWFwKTsKIAllbHNlCkBAIC0x
MjMsMjAgKzEyMSw0NSBAQCBzdGF0aWMgdm9pZCBuZml0X3Rlc3Rfa2lsbCh2b2lkICpfcGdtYXAp
CiAJfQogfQogCitzdGF0aWMgdm9pZCBkZXZfcGFnZW1hcF9wZXJjcHVfcmVsZWFzZShzdHJ1Y3Qg
cGVyY3B1X3JlZiAqcmVmKQoreworCXN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAgPQorCQljb250
YWluZXJfb2YocmVmLCBzdHJ1Y3QgZGV2X3BhZ2VtYXAsIGludGVybmFsX3JlZik7CisKKwljb21w
bGV0ZSgmcGdtYXAtPmRvbmUpOworfQorCiB2b2lkICpfX3dyYXBfZGV2bV9tZW1yZW1hcF9wYWdl
cyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXApCiB7CisJaW50
IGVycm9yOwogCXJlc291cmNlX3NpemVfdCBvZmZzZXQgPSBwZ21hcC0+cmVzLnN0YXJ0OwogCXN0
cnVjdCBuZml0X3Rlc3RfcmVzb3VyY2UgKm5maXRfcmVzID0gZ2V0X25maXRfcmVzKG9mZnNldCk7
CiAKLQlpZiAobmZpdF9yZXMpIHsKLQkJaW50IHJjOworCWlmICghbmZpdF9yZXMpCisJCXJldHVy
biBkZXZtX21lbXJlbWFwX3BhZ2VzKGRldiwgcGdtYXApOwogCi0JCXJjID0gZGV2bV9hZGRfYWN0
aW9uX29yX3Jlc2V0KGRldiwgbmZpdF90ZXN0X2tpbGwsIHBnbWFwKTsKLQkJaWYgKHJjKQotCQkJ
cmV0dXJuIEVSUl9QVFIocmMpOwotCQlyZXR1cm4gbmZpdF9yZXMtPmJ1ZiArIG9mZnNldCAtIG5m
aXRfcmVzLT5yZXMuc3RhcnQ7CisJcGdtYXAtPmRldiA9IGRldjsKKwlpZiAoIXBnbWFwLT5yZWYp
IHsKKwkJaWYgKHBnbWFwLT5vcHMgJiYgKHBnbWFwLT5vcHMtPmtpbGwgfHwgcGdtYXAtPm9wcy0+
Y2xlYW51cCkpCisJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKKworCQlpbml0X2NvbXBsZXRp
b24oJnBnbWFwLT5kb25lKTsKKwkJZXJyb3IgPSBwZXJjcHVfcmVmX2luaXQoJnBnbWFwLT5pbnRl
cm5hbF9yZWYsCisJCQkJZGV2X3BhZ2VtYXBfcGVyY3B1X3JlbGVhc2UsIDAsIEdGUF9LRVJORUwp
OworCQlpZiAoZXJyb3IpCisJCQlyZXR1cm4gRVJSX1BUUihlcnJvcik7CisJCXBnbWFwLT5yZWYg
PSAmcGdtYXAtPmludGVybmFsX3JlZjsKKwl9IGVsc2UgeworCQlpZiAoIXBnbWFwLT5vcHMgfHwg
IXBnbWFwLT5vcHMtPmtpbGwgfHwgIXBnbWFwLT5vcHMtPmNsZWFudXApIHsKKwkJCVdBUk4oMSwg
Ik1pc3NpbmcgcmVmZXJlbmNlIGNvdW50IHRlYXJkb3duIGRlZmluaXRpb25cbiIpOworCQkJcmV0
dXJuIEVSUl9QVFIoLUVJTlZBTCk7CisJCX0KIAl9Ci0JcmV0dXJuIGRldm1fbWVtcmVtYXBfcGFn
ZXMoZGV2LCBwZ21hcCk7CisKKwllcnJvciA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYs
IG5maXRfdGVzdF9raWxsLCBwZ21hcCk7CisJaWYgKGVycm9yKQorCQlyZXR1cm4gRVJSX1BUUihl
cnJvcik7CisJcmV0dXJuIG5maXRfcmVzLT5idWYgKyBvZmZzZXQgLSBuZml0X3Jlcy0+cmVzLnN0
YXJ0OwogfQogRVhQT1JUX1NZTUJPTF9HUEwoX193cmFwX2Rldm1fbWVtcmVtYXBfcGFnZXMpOwog
Ci0tIAoyLjIwLjEKCg==
--0000000000003f3c23058b9e5615
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--0000000000003f3c23058b9e5615--
