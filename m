Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFC47EEDB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FDD6ED25;
	Fri,  2 Aug 2019 08:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C783B6E85E;
 Fri,  2 Aug 2019 02:20:37 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id u14so35169744pfn.2;
 Thu, 01 Aug 2019 19:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CBO3xGCo70BH915jG2N5Cwh2jdAxvuNp3xf6kgL3BUo=;
 b=afhkm9Tl5on5wMvcBgl6pV0sSp/OWiG26sKIN6IIYjMSKTkkPRyQ0jObWQMcObvjGP
 jvXUbotHLfaM89fcFFe6cKCmEQuSqm7f562ay5Gxb+JYVZpnfQp0XsGSymW/RXrTIZsS
 F2xR+RHJHeGEFL7YUuHsJwn6IWMXEXDvBxBYu/oTkpX+peOZ9V6wSGgilIAwOLYDsFJa
 yLcYwhiNHDswi387OxZpIuKTTxIU7i7Zxty7HyPOtZEnNOh/MbY/BoPPTNt1glksoYzZ
 PyXKNuOf2yGNcLHoJbQ9c9SOLp4NJbo7eyfvEVoH/a60m7n9Q24yKM3d6FbdBVtD3C/r
 uEyA==
X-Gm-Message-State: APjAAAWMuNKcCSfHODZfqH/3oTtFm3hBeL5b5JzgfZv+4kuTB1qvpEUc
 P8sN28b0AlW40DQIBawgcNM=
X-Google-Smtp-Source: APXvYqxkmOrmri+Wx3FPhMPhDHr4oTLl0gd58UJ9/zI2U5cFZ+LG43cVChESIiZ/iGIXbamewPD5YA==
X-Received: by 2002:a65:51c1:: with SMTP id i1mr101132075pgq.417.1564712437381; 
 Thu, 01 Aug 2019 19:20:37 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:36 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 16/34] drivers/tee: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:47 -0700
Message-Id: <20190802022005.5117-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CBO3xGCo70BH915jG2N5Cwh2jdAxvuNp3xf6kgL3BUo=;
 b=ICzJUrYTaIdsry/DtrBHUvha+R1kZxiR3TimqNDYFmB7o5jfa7m5UsfpaX/zpz7gqG
 QDNhfomKE98We8ADhaaApqL24L4GLju/2Iqw8fB/Gdc8zIwCPKElMlCmrcylshjiY6HA
 Wpq/jdgFFEI2UXPzsw4kiY3k+2UuXyC1t4Wgx970D5YK3PPwUf+ffB7bQXfIs3z5ka8f
 jIxsm6PzFlXfLaS3w/r9zrOwtEfiVXxBJ3zPq4sXYknfWxx8T3YIHBMUaH+laDDR6clX
 EbIaZCmFhhDYcIMZgiNQmuBlXcj32bO5TFJ498KeDHFEPtpyis1t2GqB2XiuUnW1fIm6
 uMYw==
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogSmVucyBX
aWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IEpvaG4g
SHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL3RlZS90ZWVfc2htLmMg
fCAxMCArKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVlL3RlZV9zaG0uYyBiL2RyaXZlcnMvdGVl
L3RlZV9zaG0uYwppbmRleCAyZGEwMjZmZDEyYzkuLmM5NjdkMDQyMGI2NyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy90ZWUvdGVlX3NobS5jCisrKyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwpAQCAtMzEs
MTYgKzMxLDEzIEBAIHN0YXRpYyB2b2lkIHRlZV9zaG1fcmVsZWFzZShzdHJ1Y3QgdGVlX3NobSAq
c2htKQogCiAJCXBvb2xtLT5vcHMtPmZyZWUocG9vbG0sIHNobSk7CiAJfSBlbHNlIGlmIChzaG0t
PmZsYWdzICYgVEVFX1NITV9SRUdJU1RFUikgewotCQlzaXplX3QgbjsKIAkJaW50IHJjID0gdGVl
ZGV2LT5kZXNjLT5vcHMtPnNobV91bnJlZ2lzdGVyKHNobS0+Y3R4LCBzaG0pOwogCiAJCWlmIChy
YykKIAkJCWRldl9lcnIodGVlZGV2LT5kZXYucGFyZW50LAogCQkJCSJ1bnJlZ2lzdGVyIHNobSAl
cCBmYWlsZWQ6ICVkIiwgc2htLCByYyk7CiAKLQkJZm9yIChuID0gMDsgbiA8IHNobS0+bnVtX3Bh
Z2VzOyBuKyspCi0JCQlwdXRfcGFnZShzaG0tPnBhZ2VzW25dKTsKLQorCQlwdXRfdXNlcl9wYWdl
cyhzaG0tPnBhZ2VzLCBzaG0tPm51bV9wYWdlcyk7CiAJCWtmcmVlKHNobS0+cGFnZXMpOwogCX0K
IApAQCAtMzEzLDE2ICszMTAsMTMgQEAgc3RydWN0IHRlZV9zaG0gKnRlZV9zaG1fcmVnaXN0ZXIo
c3RydWN0IHRlZV9jb250ZXh0ICpjdHgsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAlyZXR1cm4gc2ht
OwogZXJyOgogCWlmIChzaG0pIHsKLQkJc2l6ZV90IG47Ci0KIAkJaWYgKHNobS0+aWQgPj0gMCkg
ewogCQkJbXV0ZXhfbG9jaygmdGVlZGV2LT5tdXRleCk7CiAJCQlpZHJfcmVtb3ZlKCZ0ZWVkZXYt
Pmlkciwgc2htLT5pZCk7CiAJCQltdXRleF91bmxvY2soJnRlZWRldi0+bXV0ZXgpOwogCQl9CiAJ
CWlmIChzaG0tPnBhZ2VzKSB7Ci0JCQlmb3IgKG4gPSAwOyBuIDwgc2htLT5udW1fcGFnZXM7IG4r
KykKLQkJCQlwdXRfcGFnZShzaG0tPnBhZ2VzW25dKTsKKwkJCXB1dF91c2VyX3BhZ2VzKHNobS0+
cGFnZXMsIHNobS0+bnVtX3BhZ2VzKTsKIAkJCWtmcmVlKHNobS0+cGFnZXMpOwogCQl9CiAJfQot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
