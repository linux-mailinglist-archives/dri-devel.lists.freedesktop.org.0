Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492A38572
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8679489AB2;
	Fri,  7 Jun 2019 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD7D89686
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:51 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id u12so3920781qth.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcIuNwf0zSIjR7XDITYyS7Upr/ibuj30Et6ThDetGUk=;
 b=SKrf8sXKzSkQthnZBeWbmLw3DWFoyeC+ta0hXIamm6UrXXcjNnuajfntnHS6pYk9iM
 nN9uup+q/xfQTUJVnph5bJx03oJjx+2s17w70w8ho8JKFlRmxrS8UxPUSlgys4sMQpPQ
 L1CTYz1oBqbHVj/S7t640GiSkpErktJZTrQOjmEqU/7GPzLMup5lnMYCULdIBrcF5D3g
 TUeK56gtuiB5Xr4NkEb6NJTeXEYGojYQ8hvUtHSf1sS4yNBhW4aNn8JPQ1h893n6Q686
 FbkbtU/injYrJczI/oJaB7xevqsubvt7nK7Gxar242O1bv29dX1fNBiGKx9S4Y584s20
 80og==
X-Gm-Message-State: APjAAAXiF+1yg/IMzq5BSpT+QIu4NvyRWVCOCzSNNNjY4K7nolRcOoR0
 7OQbY69wBFSIf8lpWwTDK5s6wA==
X-Google-Smtp-Source: APXvYqykn/mITkIwjkB65/z/6RCijqiu6Ix2iI3uboXOjS2+VibgJIHgW9EaDOqfs4y2pX6u4b1Wyw==
X-Received: by 2002:aed:33e6:: with SMTP id v93mr42686308qtd.157.1559846690472; 
 Thu, 06 Jun 2019 11:44:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id y8sm1656836qth.22.2019.06.06.11.44.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008Ix-Sq; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 10/11] mm/hmm: Do not use list*_rcu() for hmm->ranges
Date: Thu,  6 Jun 2019 15:44:37 -0300
Message-Id: <20190606184438.31646-11-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IcIuNwf0zSIjR7XDITYyS7Upr/ibuj30Et6ThDetGUk=;
 b=Rvt6PYlHJVz8B4LawxVuziHGCwRJD2Qr2qMiY3NEDUJNQxIcviDgQFIUHpNOBK6bPf
 MIIBJmiWVVkfUMbHMVhNgYzIahm6Aa7GUFAb3gMyDxztH5h7Eb+fHHV92q7izqEBwwUK
 enoyn9lRGevzhavWgW36BHvjzT31gUq2EFNwzhKeKkZTpVNTzzVvik0L2TrM3EnBxw1d
 HwLNV0REutZrfhliSSQTwWrC1elVFzjojR+FeHHh1CsZjd+KT2xql8gm7opCTrlBcvvX
 NVsKXd0JcUf5SXTHZ3LhocSEFVCL79+sS0K2915hv11I6abm0hUCKJT6F6DnKNs8vXBi
 N3Ug==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhpcyBsaXN0IGlzIGFs
d2F5cyByZWFkIGFuZCB3cml0dGVuIHdoaWxlIGhvbGRpbmcgaG1tLT5sb2NrIHNvIHRoZXJlIGlz
Cm5vIG5lZWQgZm9yIHRoZSBjb25mdXNpbmcgX3JjdSBhbm5vdGF0aW9ucy4KClNpZ25lZC1vZmYt
Ynk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLD
tG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgotLS0KIG1tL2htbS5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggYzJmZWNiM2VjYjExZTEuLjcwOWQxMzhkZDQ5
MDI3IDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtOTExLDcgKzkxMSw3
IEBAIGludCBobW1fcmFuZ2VfcmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCiAJbXV0
ZXhfbG9jaygmaG1tLT5sb2NrKTsKIAogCXJhbmdlLT5obW0gPSBobW07Ci0JbGlzdF9hZGRfcmN1
KCZyYW5nZS0+bGlzdCwgJmhtbS0+cmFuZ2VzKTsKKwlsaXN0X2FkZCgmcmFuZ2UtPmxpc3QsICZo
bW0tPnJhbmdlcyk7CiAKIAkvKgogCSAqIElmIHRoZXJlIGFyZSBhbnkgY29uY3VycmVudCBub3Rp
ZmllcnMgd2UgaGF2ZSB0byB3YWl0IGZvciB0aGVtIGZvcgpAQCAtOTQxLDcgKzk0MSw3IEBAIHZv
aWQgaG1tX3JhbmdlX3VucmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiAJCXJldHVy
bjsKIAogCW11dGV4X2xvY2soJmhtbS0+bG9jayk7Ci0JbGlzdF9kZWxfcmN1KCZyYW5nZS0+bGlz
dCk7CisJbGlzdF9kZWwoJnJhbmdlLT5saXN0KTsKIAltdXRleF91bmxvY2soJmhtbS0+bG9jayk7
CiAKIAkvKiBEcm9wIHJlZmVyZW5jZSB0YWtlbiBieSBobW1fcmFuZ2VfcmVnaXN0ZXIoKSAqLwot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
