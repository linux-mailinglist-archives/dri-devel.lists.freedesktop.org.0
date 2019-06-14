Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3FD4561A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE918990D;
	Fri, 14 Jun 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4A2892FA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 01:04:04 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so662281qkl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8awC9I57ul4Ehs65t7/5PNP0ULl1lssVMkwIyYI5A4o=;
 b=QTBQ+RoM5/NH5Hc2kRNCQtdvj7FlC6ZOp4MbR8MbHXdkGcomCT/Pm5d3ZtE3j6rxUh
 V0gZNSRG/zUMQJcU/R/WqkOHCD9WAa2VaQbWntfX4du0ZmVqg8GiHiU5dqtnrQZZl4qT
 37evcq7rjuvdaLiKexrnigVhrIERCeKSl2W4afMr6ZgRVTBckjSawWaxGcIm2fmQ/L/M
 ZXJUaOVdzls+Svklzt9iuoHyyMdtUFejkC03g8rEMjIhTEB0g0y6BpARd6ypRDFSt2bm
 f7w7uZ/iMz6yWy31iELSW7c1D93OALccnufxC2I3+qJlUS8ytbUI02hCm0fZTuWp7S5z
 IxvA==
X-Gm-Message-State: APjAAAXEghX5O8QPPEJ3ANq26REo+mcwgi+vmd1ScVd3+fZUEW+FTRkw
 PTJU6/9xgkeMsJwYa3dS95W6vw==
X-Google-Smtp-Source: APXvYqxXIo3h4su+d4IRSr2dLrSynk5yL3SLa1bT6tdawPdbOlK3JH39LvD6Y28mBndOcMefOVTFTQ==
X-Received: by 2002:a05:620a:5ad:: with SMTP id
 q13mr19545434qkq.154.1560474243703; 
 Thu, 13 Jun 2019 18:04:03 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id g53sm699466qtk.65.2019.06.13.18.04.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 18:04:03 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbaKs-0005KW-2y; Thu, 13 Jun 2019 21:44:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 11/12] mm/hmm: Remove confusing comment and logic from
 hmm_release
Date: Thu, 13 Jun 2019 21:44:49 -0300
Message-Id: <20190614004450.20252-12-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614004450.20252-1-jgg@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:22:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8awC9I57ul4Ehs65t7/5PNP0ULl1lssVMkwIyYI5A4o=;
 b=d7bdApJpYLjcmtg3xYRxybVOfz2KS93AC0fzZ1fW4XyHVqwL3OM+gFQej1Ln9qn0DE
 xz1SgRMDXyVjAJ/iauLJS09acThOE7zN7n1V63w1pV4dNLuGqG3b8zAuTr/PFa4b30o3
 fbxyk9MLPAGnMTt8pryVLuPSPpy6jxJkRiEUy1WphR9OOkegUcdTJ5BDKJnvCM2Hh4yW
 n+3I8FhRNhZAxdrmmWxLdwqvz0zePJfQiNoLHWaFUtjNaqK8MbBX+kIYlUs31nGnJC6k
 xIJaEsma2lTn79hWn1/ETECrmvNZum8sX2V88MjB1tGUFrF/ZbWZmNodexZOS8frzOdP
 2fhg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKaG1tX3JlbGVhc2UoKSBp
cyBjYWxsZWQgZXhhY3RseSBvbmNlIHBlciBobW0uIG9wcy0+cmVsZWFzZSgpIGNhbm5vdAphY2Np
ZGVudGFsbHkgdHJpZ2dlciBhbnkgYWN0aW9uIHRoYXQgd291bGQgcmVjdXJzZSBiYWNrIG9udG8K
aG1tLT5taXJyb3JzX3NlbS4KClRoaXMgZml4ZXMgYSB1c2UgYWZ0ZXItZnJlZSByYWNlIG9mIHRo
ZSBmb3JtOgoKICAgICAgIENQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQ
VTEKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhtbV9yZWxlYXNl
KCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXBfd3JpdGUo
JmhtbS0+bWlycm9yc19zZW0pOwogaG1tX21pcnJvcl91bnJlZ2lzdGVyKG1pcnJvcikKICBkb3du
X3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKICB1cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7
CiAga2ZyZWUobWlycm9yKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtaXJyb3ItPm9wcy0+cmVsZWFzZShtaXJyb3IpCgpUaGUgb25seSB1c2VyIHdlIGhhdmUg
dG9kYXkgZm9yIG9wcy0+cmVsZWFzZSBpcyBhbiBlbXB0eSBmdW5jdGlvbiwgc28gdGhpcwppcyB1
bmFtYmlndW91c2x5IHNhZmUuCgpBcyBhIGNvbnNlcXVlbmNlIG9mIHBsdWdnaW5nIHRoaXMgcmFj
ZSBkcml2ZXJzIGFyZSBub3QgYWxsb3dlZCB0bwpyZWdpc3Rlci91bnJlZ2lzdGVyIG1pcnJvcnMg
ZnJvbSB3aXRoaW4gYSByZWxlYXNlIG9wLgoKU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBl
IDxqZ2dAbWVsbGFub3guY29tPgpUZXN0ZWQtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0Bh
bWQuY29tPgotLS0KIG1tL2htbS5jIHwgMjggKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCAyNmFmNTExY2JkZDA3NS4uYzBkNDMzMDJm
ZDZiMmYgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xMzcsMjYgKzEz
NywxNiBAQCBzdGF0aWMgdm9pZCBobW1fcmVsZWFzZShzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwg
c3RydWN0IG1tX3N0cnVjdCAqbW0pCiAJV0FSTl9PTighbGlzdF9lbXB0eSgmaG1tLT5yYW5nZXMp
KTsKIAltdXRleF91bmxvY2soJmhtbS0+bG9jayk7CiAKLQlkb3duX3dyaXRlKCZobW0tPm1pcnJv
cnNfc2VtKTsKLQltaXJyb3IgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJmhtbS0+bWlycm9y
cywgc3RydWN0IGhtbV9taXJyb3IsCi0JCQkJCSAgbGlzdCk7Ci0Jd2hpbGUgKG1pcnJvcikgewot
CQlsaXN0X2RlbF9pbml0KCZtaXJyb3ItPmxpc3QpOwotCQlpZiAobWlycm9yLT5vcHMtPnJlbGVh
c2UpIHsKLQkJCS8qCi0JCQkgKiBEcm9wIG1pcnJvcnNfc2VtIHNvIHRoZSByZWxlYXNlIGNhbGxi
YWNrIGNhbiB3YWl0Ci0JCQkgKiBvbiBhbnkgcGVuZGluZyB3b3JrIHRoYXQgbWlnaHQgaXRzZWxm
IHRyaWdnZXIgYQotCQkJICogbW11X25vdGlmaWVyIGNhbGxiYWNrIGFuZCB0aHVzIHdvdWxkIGRl
YWRsb2NrIHdpdGgKLQkJCSAqIHVzLgotCQkJICovCi0JCQl1cF93cml0ZSgmaG1tLT5taXJyb3Jz
X3NlbSk7CisJZG93bl9yZWFkKCZobW0tPm1pcnJvcnNfc2VtKTsKKwlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5KG1pcnJvciwgJmhtbS0+bWlycm9ycywgbGlzdCkgeworCQkvKgorCQkgKiBOb3RlOiBUaGUg
ZHJpdmVyIGlzIG5vdCBhbGxvd2VkIHRvIHRyaWdnZXIKKwkJICogaG1tX21pcnJvcl91bnJlZ2lz
dGVyKCkgZnJvbSB0aGlzIHRocmVhZC4KKwkJICovCisJCWlmIChtaXJyb3ItPm9wcy0+cmVsZWFz
ZSkKIAkJCW1pcnJvci0+b3BzLT5yZWxlYXNlKG1pcnJvcik7Ci0JCQlkb3duX3dyaXRlKCZobW0t
Pm1pcnJvcnNfc2VtKTsKLQkJfQotCQltaXJyb3IgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwo
JmhtbS0+bWlycm9ycywKLQkJCQkJCSAgc3RydWN0IGhtbV9taXJyb3IsIGxpc3QpOwogCX0KLQl1
cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7CisJdXBfcmVhZCgmaG1tLT5taXJyb3JzX3NlbSk7
CiAKIAlobW1fcHV0KGhtbSk7CiB9CkBAIC0yODYsNyArMjc2LDcgQEAgdm9pZCBobW1fbWlycm9y
X3VucmVnaXN0ZXIoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcikKIAlzdHJ1Y3QgaG1tICpobW0g
PSBtaXJyb3ItPmhtbTsKIAogCWRvd25fd3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwotCWxpc3Rf
ZGVsX2luaXQoJm1pcnJvci0+bGlzdCk7CisJbGlzdF9kZWwoJm1pcnJvci0+bGlzdCk7CiAJdXBf
d3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwogCWhtbV9wdXQoaG1tKTsKIAltZW1zZXQoJm1pcnJv
ci0+aG1tLCBQT0lTT05fSU5VU0UsIHNpemVvZihtaXJyb3ItPmhtbSkpOwotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
