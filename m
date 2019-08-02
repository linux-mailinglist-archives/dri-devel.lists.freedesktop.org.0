Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05667EEF7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0672C6ED3C;
	Fri,  2 Aug 2019 08:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF1A6E85E;
 Fri,  2 Aug 2019 02:17:01 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id d1so2414608pgp.4;
 Thu, 01 Aug 2019 19:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qSYlns3rxzw4u/DyjG2ivKH4pSlvpz3tTvNpv+Vzl0A=;
 b=NP0ZfUSoQXiJCspNDbztyS86gyCdcGnGRbllhU7zRoVDJU4KKMY7SWMYgCxQSHvEQf
 JWYkyK6MsQqIo48QipnWmhmxUX8+SgYNPYkRKigvtXQzC5QSWtZW9JV0X8K3LWcovSMF
 Id7SEvTCZU8WwVvUREpREbSci6rJkKvLYwHYXLwYConMHWzGV6l2BbBxvR4ZU0NI71Z3
 s0P62vN+ocDc78fC5GD0n87XBvGqI3JL2j2D9a0nDL1OmHXm5nS0hfV/QQqWoDHfEb9O
 KV3Y+MLY+ntuu5iGrLYnvkSXRwHiDdHJQz+dWRUqpitEgMB0XCUT6RabiUitOieJeb4z
 Zk7Q==
X-Gm-Message-State: APjAAAXDJOC4WS5iTCudREcoXbVZ5nxGboj/nV20kHqMtx3reMGMBVrH
 DAwU83KbEJLOceExFAO0S3Q=
X-Google-Smtp-Source: APXvYqzbu0fqyx1S9wHk9TZWdOKFNLR8W4aJ20JQpVBVWnaUPwqEe+RFqTrVv58Rvjaf0s5gNM1HPA==
X-Received: by 2002:a17:90a:ba93:: with SMTP id
 t19mr1809345pjr.139.1564712221494; 
 Thu, 01 Aug 2019 19:17:01 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 p187sm118200292pfg.89.2019.08.01.19.16.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:17:00 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/34] net/rds: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:16:21 -0700
Message-Id: <20190802021653.4882-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802021653.4882-1-jhubbard@nvidia.com>
References: <20190802021653.4882-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qSYlns3rxzw4u/DyjG2ivKH4pSlvpz3tTvNpv+Vzl0A=;
 b=ri/g8fH5EMbaRGeRCBUMa0gqvf5sZKxxRTcoGNlKvndtobuEMarAmuyiWR0Or0yt3d
 ZgeLr0P+kW4cqW28KQH/rOYsII5pR9Pk0M0WFYUApB7SKz6vEgjXY+F34hxONagLYY9L
 Py6Blyj3NR1ZdTatlTm5llaJcajjxdcYrAkl23WVqTVg9XAD+0Qg+cC1rauwop+vVeNx
 bVVFBfM1nAEvoH8ncIKlerRWnqRBlhjzlfCDLJ981KoDXyQRyzFGpLUw/iRcSWFkJ5xl
 t+5zV5laKnX+3Bq/BiZ3lREDjIqp5Q8qRulPXvOqGHi7pfUVWIrfUbywjbnDPsqYnoHP
 +z/w==
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
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogU2FudG9z
aCBTaGlsaW1rYXIgPHNhbnRvc2guc2hpbGlta2FyQG9yYWNsZS5jb20+CkNjOiBEYXZpZCBTLiBN
aWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+CkNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCkNj
OiBsaW51eC1yZG1hQHZnZXIua2VybmVsLm9yZwpDYzogcmRzLWRldmVsQG9zcy5vcmFjbGUuY29t
ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBu
ZXQvcmRzL2luZm8uYyAgICB8ICA1ICsrLS0tCiBuZXQvcmRzL21lc3NhZ2UuYyB8ICAyICstCiBu
ZXQvcmRzL3JkbWEuYyAgICB8IDE1ICsrKysrKystLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9uZXQvcmRzL2lu
Zm8uYyBiL25ldC9yZHMvaW5mby5jCmluZGV4IDAzZjZmZDU2ZDIzNy4uY2E2YWYyODg5YWRmIDEw
MDY0NAotLS0gYS9uZXQvcmRzL2luZm8uYworKysgYi9uZXQvcmRzL2luZm8uYwpAQCAtMTYyLDcg
KzE2Miw2IEBAIGludCByZHNfaW5mb19nZXRzb2Nrb3B0KHN0cnVjdCBzb2NrZXQgKnNvY2ssIGlu
dCBvcHRuYW1lLCBjaGFyIF9fdXNlciAqb3B0dmFsLAogCXN0cnVjdCByZHNfaW5mb19sZW5ndGhz
IGxlbnM7CiAJdW5zaWduZWQgbG9uZyBucl9wYWdlcyA9IDA7CiAJdW5zaWduZWQgbG9uZyBzdGFy
dDsKLQl1bnNpZ25lZCBsb25nIGk7CiAJcmRzX2luZm9fZnVuYyBmdW5jOwogCXN0cnVjdCBwYWdl
ICoqcGFnZXMgPSBOVUxMOwogCWludCByZXQ7CkBAIC0yMzUsOCArMjM0LDggQEAgaW50IHJkc19p
bmZvX2dldHNvY2tvcHQoc3RydWN0IHNvY2tldCAqc29jaywgaW50IG9wdG5hbWUsIGNoYXIgX191
c2VyICpvcHR2YWwsCiAJCXJldCA9IC1FRkFVTFQ7CiAKIG91dDoKLQlmb3IgKGkgPSAwOyBwYWdl
cyAmJiBpIDwgbnJfcGFnZXM7IGkrKykKLQkJcHV0X3BhZ2UocGFnZXNbaV0pOworCWlmIChwYWdl
cykKKwkJcHV0X3VzZXJfcGFnZXMocGFnZXMsIG5yX3BhZ2VzKTsKIAlrZnJlZShwYWdlcyk7CiAK
IAlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvbmV0L3Jkcy9tZXNzYWdlLmMgYi9uZXQvcmRzL21l
c3NhZ2UuYwppbmRleCA1MGYxM2YxZDRhZTAuLmQ3YjBkMjY2YzQzNyAxMDA2NDQKLS0tIGEvbmV0
L3Jkcy9tZXNzYWdlLmMKKysrIGIvbmV0L3Jkcy9tZXNzYWdlLmMKQEAgLTQwNCw3ICs0MDQsNyBA
QCBzdGF0aWMgaW50IHJkc19tZXNzYWdlX3pjb3B5X2Zyb21fdXNlcihzdHJ1Y3QgcmRzX21lc3Nh
Z2UgKnJtLCBzdHJ1Y3QgaW92X2l0ZXIgKgogCQkJaW50IGk7CiAKIAkJCWZvciAoaSA9IDA7IGkg
PCBybS0+ZGF0YS5vcF9uZW50czsgaSsrKQotCQkJCXB1dF9wYWdlKHNnX3BhZ2UoJnJtLT5kYXRh
Lm9wX3NnW2ldKSk7CisJCQkJcHV0X3VzZXJfcGFnZShzZ19wYWdlKCZybS0+ZGF0YS5vcF9zZ1tp
XSkpOwogCQkJbW1wID0gJnJtLT5kYXRhLm9wX21tcF96bm90aWZpZXItPnpfbW1wOwogCQkJbW1f
dW5hY2NvdW50X3Bpbm5lZF9wYWdlcyhtbXApOwogCQkJcmV0ID0gLUVGQVVMVDsKZGlmZiAtLWdp
dCBhL25ldC9yZHMvcmRtYS5jIGIvbmV0L3Jkcy9yZG1hLmMKaW5kZXggOTE2ZjVlYzM3M2Q4Li42
NzYyZTg2OTZiOTkgMTAwNjQ0Ci0tLSBhL25ldC9yZHMvcmRtYS5jCisrKyBiL25ldC9yZHMvcmRt
YS5jCkBAIC0xNjIsOCArMTYyLDcgQEAgc3RhdGljIGludCByZHNfcGluX3BhZ2VzKHVuc2lnbmVk
IGxvbmcgdXNlcl9hZGRyLCB1bnNpZ25lZCBpbnQgbnJfcGFnZXMsCiAJCQkJICBwYWdlcyk7CiAK
IAlpZiAocmV0ID49IDAgJiYgcmV0IDwgbnJfcGFnZXMpIHsKLQkJd2hpbGUgKHJldC0tKQotCQkJ
cHV0X3BhZ2UocGFnZXNbcmV0XSk7CisJCXB1dF91c2VyX3BhZ2VzKHBhZ2VzLCByZXQpOwogCQly
ZXQgPSAtRUZBVUxUOwogCX0KIApAQCAtMjc2LDcgKzI3NSw3IEBAIHN0YXRpYyBpbnQgX19yZHNf
cmRtYV9tYXAoc3RydWN0IHJkc19zb2NrICpycywgc3RydWN0IHJkc19nZXRfbXJfYXJncyAqYXJn
cywKIAogCWlmIChJU19FUlIodHJhbnNfcHJpdmF0ZSkpIHsKIAkJZm9yIChpID0gMCA7IGkgPCBu
ZW50czsgaSsrKQotCQkJcHV0X3BhZ2Uoc2dfcGFnZSgmc2dbaV0pKTsKKwkJCXB1dF91c2VyX3Bh
Z2Uoc2dfcGFnZSgmc2dbaV0pKTsKIAkJa2ZyZWUoc2cpOwogCQlyZXQgPSBQVFJfRVJSKHRyYW5z
X3ByaXZhdGUpOwogCQlnb3RvIG91dDsKQEAgLTQ2NCw5ICs0NjMsMTAgQEAgdm9pZCByZHNfcmRt
YV9mcmVlX29wKHN0cnVjdCBybV9yZG1hX29wICpybykKIAkJICogdG8gbG9jYWwgbWVtb3J5ICov
CiAJCWlmICghcm8tPm9wX3dyaXRlKSB7CiAJCQlXQVJOX09OKCFwYWdlLT5tYXBwaW5nICYmIGly
cXNfZGlzYWJsZWQoKSk7Ci0JCQlzZXRfcGFnZV9kaXJ0eShwYWdlKTsKKwkJCXB1dF91c2VyX3Bh
Z2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEsIHRydWUpOworCQl9IGVsc2UgeworCQkJcHV0X3VzZXJf
cGFnZShwYWdlKTsKIAkJfQotCQlwdXRfcGFnZShwYWdlKTsKIAl9CiAKIAlrZnJlZShyby0+b3Bf
bm90aWZpZXIpOwpAQCAtNDgxLDggKzQ4MSw3IEBAIHZvaWQgcmRzX2F0b21pY19mcmVlX29wKHN0
cnVjdCBybV9hdG9taWNfb3AgKmFvKQogCS8qIE1hcmsgcGFnZSBkaXJ0eSBpZiBpdCB3YXMgcG9z
c2libHkgbW9kaWZpZWQsIHdoaWNoCiAJICogaXMgdGhlIGNhc2UgZm9yIGEgUkRNQV9SRUFEIHdo
aWNoIGNvcGllcyBmcm9tIHJlbW90ZQogCSAqIHRvIGxvY2FsIG1lbW9yeSAqLwotCXNldF9wYWdl
X2RpcnR5KHBhZ2UpOwotCXB1dF9wYWdlKHBhZ2UpOworCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xv
Y2soJnBhZ2UsIDEsIHRydWUpOwogCiAJa2ZyZWUoYW8tPm9wX25vdGlmaWVyKTsKIAlhby0+b3Bf
bm90aWZpZXIgPSBOVUxMOwpAQCAtODY3LDcgKzg2Niw3IEBAIGludCByZHNfY21zZ19hdG9taWMo
c3RydWN0IHJkc19zb2NrICpycywgc3RydWN0IHJkc19tZXNzYWdlICpybSwKIAlyZXR1cm4gcmV0
OwogZXJyOgogCWlmIChwYWdlKQotCQlwdXRfcGFnZShwYWdlKTsKKwkJcHV0X3VzZXJfcGFnZShw
YWdlKTsKIAlybS0+YXRvbWljLm9wX2FjdGl2ZSA9IDA7CiAJa2ZyZWUocm0tPmF0b21pYy5vcF9u
b3RpZmllcik7CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
