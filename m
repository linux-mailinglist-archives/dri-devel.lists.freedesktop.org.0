Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14086845BB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64DA6E621;
	Wed,  7 Aug 2019 07:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4576E581
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 23:16:17 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h21so86382266qtn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 16:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mjtpPFkSq3UiLsyLXzaYFfxy47hSUzru4mJ5ITxeLVU=;
 b=H/ygY2k0MmzaxMMkxXOIFRBTZrsmnv6dKlt+XuQRRgadrmIl7ojiItVxt2KbDewsMr
 x59fwBdBgsLHJke/UzE4h5n6hytJjRoVrHniXZndHuxky2odajJalpr7BTWbtwbjXgmQ
 wJhwq+TAhTprERl64Pvbbd7ScuuVj6i39I/2/qhEo7+WyTESWcg0WV8/38rQeX6IOYXD
 4dOEo5mtXSYXr9/VepREWKs8x6ejcvgi4qYeFkbgc7LpJQuggE1FV30er1Fc1YkYJkJh
 Gep44RMOOkfbIeC8lhXKbwXZr/BSeH6/wmJRdcZpDXwpSfq4K0sOReJ3d3f4NhF80J76
 k9oA==
X-Gm-Message-State: APjAAAXDIax5DIdv/p+BorxbB5aMiV7GPWGVL5cPklcvyZuptgpQrW/5
 5DJaCrPjId3BdLv0EPFceAotLw==
X-Google-Smtp-Source: APXvYqz63tweA2E8MzBrzK5yWz5htOs/6XLwX1oleep4fUjPNFszgc4r2awnmY97Q4W0cA2HokN6fA==
X-Received: by 2002:aed:2435:: with SMTP id r50mr1433667qtc.43.1565133376646; 
 Tue, 06 Aug 2019 16:16:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id x206sm40603751qkb.127.2019.08.06.16.16.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 16:16:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv8gg-0006es-Bw; Tue, 06 Aug 2019 20:16:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 07/11] RDMA/odp: remove ib_ucontext from ib_umem
Date: Tue,  6 Aug 2019 20:15:44 -0300
Message-Id: <20190806231548.25242-8-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mjtpPFkSq3UiLsyLXzaYFfxy47hSUzru4mJ5ITxeLVU=;
 b=Aqt2P6wkNDk7Ey4zJ/R2dr20/+p+3YhHJwj0w4amgSQKlEOzS7bH+L1Oepqzsr46++
 aqXCSW5qQ+ZwByqVsAB+aLiCdaOPYHZoHMNlOBje6tt/3/uvpiTCTJbTvN+WthemRndl
 /kJKQxc7MJH2ISRonRwzYob3+PusKHZyNLKSSWfe24VwuwxIhBYqxbeduEP8ekflzqn+
 3yA1G3kjs09AVnNH83BdYQtbyyY6PmgYHmcfgbvOmvx4hl79v7MqlTCtxlX6HMoPt34s
 F8GhD+KbHjGiBPnxWQSt/UpHQqEubqay3aXPCjsT8vtbafoNOzsV5GtwtBxXRIkev7JZ
 fWtQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKQXQgdGhpcyBwb2ludCB0
aGUgdWNvbnRleHQgaXMgb25seSBiZWluZyBzdG9yZWQgdG8gYWNjZXNzIHRoZSBpYl9kZXZpY2Us
CnNvIGp1c3Qgc3RvcmUgdGhlIGliX2RldmljZSBkaXJlY3RseSBpbnN0ZWFkLiBUaGlzIGlzIG1v
cmUgbmF0dXJhbCBhbmQKbG9naWNhbCBhcyB0aGUgdW1lbSBoYXMgbm90aGluZyB0byBkbyB3aXRo
IHRoZSB1Y29udGV4dC4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxh
bm94LmNvbT4KLS0tCiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMgICAgIHwgIDQgKyst
LQogZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbV9vZHAuYyB8IDEzICsrKysrKy0tLS0tLS0K
IGluY2x1ZGUvcmRtYS9pYl91bWVtLmggICAgICAgICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0u
YwppbmRleCBjNTlhYTU3ZDM2NTEwZi4uNWFiOTE2NWZmYmVmMGEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYworKysgYi9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91
bWVtLmMKQEAgLTI0Miw3ICsyNDIsNyBAQCBzdHJ1Y3QgaWJfdW1lbSAqaWJfdW1lbV9nZXQoc3Ry
dWN0IGliX3VkYXRhICp1ZGF0YSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJcmV0dXJuIEVSUl9Q
VFIoLUVOT01FTSk7CiAJfQogCi0JdW1lbS0+Y29udGV4dCAgICA9IGNvbnRleHQ7CisJdW1lbS0+
aWJkZXYgPSBjb250ZXh0LT5kZXZpY2U7CiAJdW1lbS0+bGVuZ3RoICAgICA9IHNpemU7CiAJdW1l
bS0+YWRkcmVzcyAgICA9IGFkZHI7CiAJdW1lbS0+d3JpdGFibGUgICA9IGliX2FjY2Vzc193cml0
YWJsZShhY2Nlc3MpOwpAQCAtMzcwLDcgKzM3MCw3IEBAIHZvaWQgaWJfdW1lbV9yZWxlYXNlKHN0
cnVjdCBpYl91bWVtICp1bWVtKQogCQlyZXR1cm47CiAJfQogCi0JX19pYl91bWVtX3JlbGVhc2Uo
dW1lbS0+Y29udGV4dC0+ZGV2aWNlLCB1bWVtLCAxKTsKKwlfX2liX3VtZW1fcmVsZWFzZSh1bWVt
LT5pYmRldiwgdW1lbSwgMSk7CiAKIAlhdG9taWM2NF9zdWIoaWJfdW1lbV9udW1fcGFnZXModW1l
bSksICZ1bWVtLT5vd25pbmdfbW0tPnBpbm5lZF92bSk7CiAJX19pYl91bWVtX3JlbGVhc2VfdGFp
bCh1bWVtKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW1fb2RwLmMg
Yi9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtX29kcC5jCmluZGV4IGEwMmU2ZTNkN2I3MmZi
Li5kYTcyMzE4ZTE3NTkyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1l
bV9vZHAuYworKysgYi9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtX29kcC5jCkBAIC0xMDMs
NyArMTAzLDcgQEAgc3RhdGljIHZvaWQgaWJfdW1lbV9ub3RpZmllcl9yZWxlYXNlKHN0cnVjdCBt
bXVfbm90aWZpZXIgKm1uLAogCQkgKi8KIAkJc21wX3dtYigpOwogCQljb21wbGV0ZV9hbGwoJnVt
ZW1fb2RwLT5ub3RpZmllcl9jb21wbGV0aW9uKTsKLQkJdW1lbV9vZHAtPnVtZW0uY29udGV4dC0+
ZGV2aWNlLT5vcHMuaW52YWxpZGF0ZV9yYW5nZSgKKwkJdW1lbV9vZHAtPnVtZW0uaWJkZXYtPm9w
cy5pbnZhbGlkYXRlX3JhbmdlKAogCQkJdW1lbV9vZHAsIGliX3VtZW1fc3RhcnQodW1lbV9vZHAp
LAogCQkJaWJfdW1lbV9lbmQodW1lbV9vZHApKTsKIAl9CkBAIC0xMTYsNyArMTE2LDcgQEAgc3Rh
dGljIGludCBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X3RyYW1wb2xpbmUoc3RydWN0IGliX3VtZW1f
b2RwICppdGVtLAogCQkJCQkgICAgIHU2NCBzdGFydCwgdTY0IGVuZCwgdm9pZCAqY29va2llKQog
ewogCWliX3VtZW1fbm90aWZpZXJfc3RhcnRfYWNjb3VudChpdGVtKTsKLQlpdGVtLT51bWVtLmNv
bnRleHQtPmRldmljZS0+b3BzLmludmFsaWRhdGVfcmFuZ2UoaXRlbSwgc3RhcnQsIGVuZCk7CisJ
aXRlbS0+dW1lbS5pYmRldi0+b3BzLmludmFsaWRhdGVfcmFuZ2UoaXRlbSwgc3RhcnQsIGVuZCk7
CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTMxOSw3ICszMTksNyBAQCBzdHJ1Y3QgaWJfdW1lbV9vZHAg
KmliX3VtZW1fb2RwX2FsbG9jX2ltcGxpY2l0KHN0cnVjdCBpYl91ZGF0YSAqdWRhdGEsCiAJaWYg
KCF1bWVtX29kcCkKIAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CiAJdW1lbSA9ICZ1bWVtX29k
cC0+dW1lbTsKLQl1bWVtLT5jb250ZXh0ID0gY29udGV4dDsKKwl1bWVtLT5pYmRldiA9IGNvbnRl
eHQtPmRldmljZTsKIAl1bWVtLT53cml0YWJsZSA9IGliX2FjY2Vzc193cml0YWJsZShhY2Nlc3Mp
OwogCXVtZW0tPm93bmluZ19tbSA9IGN1cnJlbnQtPm1tOwogCXVtZW1fb2RwLT5pc19pbXBsaWNp
dF9vZHAgPSAxOwpAQCAtMzY0LDcgKzM2NCw3IEBAIHN0cnVjdCBpYl91bWVtX29kcCAqaWJfdW1l
bV9vZHBfYWxsb2NfY2hpbGQoc3RydWN0IGliX3VtZW1fb2RwICpyb290LAogCWlmICghb2RwX2Rh
dGEpCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCXVtZW0gPSAmb2RwX2RhdGEtPnVtZW07
Ci0JdW1lbS0+Y29udGV4dCAgICA9IHJvb3QtPnVtZW0uY29udGV4dDsKKwl1bWVtLT5pYmRldiA9
IHJvb3QtPnVtZW0uaWJkZXY7CiAJdW1lbS0+bGVuZ3RoICAgICA9IHNpemU7CiAJdW1lbS0+YWRk
cmVzcyAgICA9IGFkZHI7CiAJdW1lbS0+d3JpdGFibGUgICA9IHJvb3QtPnVtZW0ud3JpdGFibGU7
CkBAIC00NzcsOCArNDc3LDcgQEAgc3RhdGljIGludCBpYl91bWVtX29kcF9tYXBfZG1hX3Npbmds
ZV9wYWdlKAogCQl1NjQgYWNjZXNzX21hc2ssCiAJCXVuc2lnbmVkIGxvbmcgY3VycmVudF9zZXEp
CiB7Ci0Jc3RydWN0IGliX3Vjb250ZXh0ICpjb250ZXh0ID0gdW1lbV9vZHAtPnVtZW0uY29udGV4
dDsKLQlzdHJ1Y3QgaWJfZGV2aWNlICpkZXYgPSBjb250ZXh0LT5kZXZpY2U7CisJc3RydWN0IGli
X2RldmljZSAqZGV2ID0gdW1lbV9vZHAtPnVtZW0uaWJkZXY7CiAJZG1hX2FkZHJfdCBkbWFfYWRk
cjsKIAlpbnQgcmVtb3ZlX2V4aXN0aW5nX21hcHBpbmcgPSAwOwogCWludCByZXQgPSAwOwpAQCAt
NjkxLDcgKzY5MCw3IEBAIHZvaWQgaWJfdW1lbV9vZHBfdW5tYXBfZG1hX3BhZ2VzKHN0cnVjdCBp
Yl91bWVtX29kcCAqdW1lbV9vZHAsIHU2NCB2aXJ0LAogewogCWludCBpZHg7CiAJdTY0IGFkZHI7
Ci0Jc3RydWN0IGliX2RldmljZSAqZGV2ID0gdW1lbV9vZHAtPnVtZW0uY29udGV4dC0+ZGV2aWNl
OworCXN0cnVjdCBpYl9kZXZpY2UgKmRldiA9IHVtZW1fb2RwLT51bWVtLmliZGV2OwogCiAJdmly
dCA9IG1heF90KHU2NCwgdmlydCwgaWJfdW1lbV9zdGFydCh1bWVtX29kcCkpOwogCWJvdW5kID0g
bWluX3QodTY0LCBib3VuZCwgaWJfdW1lbV9lbmQodW1lbV9vZHApKTsKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvcmRtYS9pYl91bWVtLmggYi9pbmNsdWRlL3JkbWEvaWJfdW1lbS5oCmluZGV4IDEwNTJk
MGQ2MmJlN2QyLi5hOTFiMmFmNjRlYzQ3YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9yZG1hL2liX3Vt
ZW0uaAorKysgYi9pbmNsdWRlL3JkbWEvaWJfdW1lbS5oCkBAIC00Miw3ICs0Miw3IEBAIHN0cnVj
dCBpYl91Y29udGV4dDsKIHN0cnVjdCBpYl91bWVtX29kcDsKIAogc3RydWN0IGliX3VtZW0gewot
CXN0cnVjdCBpYl91Y29udGV4dCAgICAgKmNvbnRleHQ7CisJc3RydWN0IGliX2RldmljZSAgICAg
ICAqaWJkZXY7CiAJc3RydWN0IG1tX3N0cnVjdCAgICAgICAqb3duaW5nX21tOwogCXNpemVfdAkJ
CWxlbmd0aDsKIAl1bnNpZ25lZCBsb25nCQlhZGRyZXNzOwotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
