Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEA4845F8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B276E694;
	Wed,  7 Aug 2019 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095106E58A;
 Wed,  7 Aug 2019 01:34:14 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id ay6so38635349plb.9;
 Tue, 06 Aug 2019 18:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=NK3Zwgjuvb/GUb7bxy97lJUfK+3fAPqW5NNBoU4xFNaZTDZJBH04sxdzFvmjGCdMJl
 el2iReNzN8mSIYHyJaOX/EYDfsAQjyYr3/vk+N1ghmRF2vg7cxJlUXmW1Vv2cqarXn/t
 41tAxkoL7SnrAyM1z7m9aT+kTbyJovMGc8E4WgMKBaVaM/3CCJJwI0OGcO8wgCIzAkOf
 dx2ZtSWCvNt1OrTNeTPS4nIr1OhHzvFdCvkyPihX5n9hAKCl3kulC6tM7W7YKpwY7jEq
 67LVpOpdb/Kpxz2TBFfJWszgRAwdXxFArPwRXGw7Z5iYTvGXwQ3MNPtTNeXUlEeKQd3H
 yGKQ==
X-Gm-Message-State: APjAAAUQCOxSVWVMGvSmyISC9iVwUBK2G7lAA9hO8RpEvNCeB+NNpX5A
 MZaiaRjPUkntvydvGgHkgAg=
X-Google-Smtp-Source: APXvYqzTT0+13248qiTrSGNvS1mzJ345uGp41Ak44ir6kC277kEDTytzqOp0Yto6oZ69oylCJdvvLQ==
X-Received: by 2002:a17:902:f204:: with SMTP id
 gn4mr5916565plb.3.1565141653735; 
 Tue, 06 Aug 2019 18:34:13 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:13 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 18/41] drivers/tee: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:17 -0700
Message-Id: <20190807013340.9706-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=KDwx8fQCZQ/Suzu3VWi1DDiS9f3wTi5qeR5KhjjsQerQ6jWb9Bppmpi69n/V7tCxcC
 9V2HGmZDwg97QSRgi6Hzl0GWRBp4H3fcCqkNmUDvJ7PxDk1fQHC9lxTEdaxbxQEHg95+
 fmJWsxqnzJxJ030LBsGzIkf3pk8sgU5o1+lx7X7ZwO38eZaDsEUDZZ+Gf9yjWoGjqdBb
 oE7CxyrW2H4Sq40LC5GKmO3wadn0xgnPrP2IQTLB/VxU0JkFqP6vTrlLsm15L7ZnAf7Z
 6nnOQfF4c4+DtdbQKQz7daub11+4pw4UtoY7fINHO6b6C0kllebTtI7UQsSaNXpquZs/
 z2sg==
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
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpBY2tlZC1ieTog
SmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6
IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL3RlZS90ZWVf
c2htLmMgfCAxMCArKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVlL3RlZV9zaG0uYyBiL2RyaXZl
cnMvdGVlL3RlZV9zaG0uYwppbmRleCAyZGEwMjZmZDEyYzkuLmM5NjdkMDQyMGI2NyAxMDA2NDQK
LS0tIGEvZHJpdmVycy90ZWUvdGVlX3NobS5jCisrKyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwpA
QCAtMzEsMTYgKzMxLDEzIEBAIHN0YXRpYyB2b2lkIHRlZV9zaG1fcmVsZWFzZShzdHJ1Y3QgdGVl
X3NobSAqc2htKQogCiAJCXBvb2xtLT5vcHMtPmZyZWUocG9vbG0sIHNobSk7CiAJfSBlbHNlIGlm
IChzaG0tPmZsYWdzICYgVEVFX1NITV9SRUdJU1RFUikgewotCQlzaXplX3QgbjsKIAkJaW50IHJj
ID0gdGVlZGV2LT5kZXNjLT5vcHMtPnNobV91bnJlZ2lzdGVyKHNobS0+Y3R4LCBzaG0pOwogCiAJ
CWlmIChyYykKIAkJCWRldl9lcnIodGVlZGV2LT5kZXYucGFyZW50LAogCQkJCSJ1bnJlZ2lzdGVy
IHNobSAlcCBmYWlsZWQ6ICVkIiwgc2htLCByYyk7CiAKLQkJZm9yIChuID0gMDsgbiA8IHNobS0+
bnVtX3BhZ2VzOyBuKyspCi0JCQlwdXRfcGFnZShzaG0tPnBhZ2VzW25dKTsKLQorCQlwdXRfdXNl
cl9wYWdlcyhzaG0tPnBhZ2VzLCBzaG0tPm51bV9wYWdlcyk7CiAJCWtmcmVlKHNobS0+cGFnZXMp
OwogCX0KIApAQCAtMzEzLDE2ICszMTAsMTMgQEAgc3RydWN0IHRlZV9zaG0gKnRlZV9zaG1fcmVn
aXN0ZXIoc3RydWN0IHRlZV9jb250ZXh0ICpjdHgsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAlyZXR1
cm4gc2htOwogZXJyOgogCWlmIChzaG0pIHsKLQkJc2l6ZV90IG47Ci0KIAkJaWYgKHNobS0+aWQg
Pj0gMCkgewogCQkJbXV0ZXhfbG9jaygmdGVlZGV2LT5tdXRleCk7CiAJCQlpZHJfcmVtb3ZlKCZ0
ZWVkZXYtPmlkciwgc2htLT5pZCk7CiAJCQltdXRleF91bmxvY2soJnRlZWRldi0+bXV0ZXgpOwog
CQl9CiAJCWlmIChzaG0tPnBhZ2VzKSB7Ci0JCQlmb3IgKG4gPSAwOyBuIDwgc2htLT5udW1fcGFn
ZXM7IG4rKykKLQkJCQlwdXRfcGFnZShzaG0tPnBhZ2VzW25dKTsKKwkJCXB1dF91c2VyX3BhZ2Vz
KHNobS0+cGFnZXMsIHNobS0+bnVtX3BhZ2VzKTsKIAkJCWtmcmVlKHNobS0+cGFnZXMpOwogCQl9
CiAJfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
