Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CE38584
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A45F89C05;
	Fri,  7 Jun 2019 07:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0263589686
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:49 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g18so2147158qkl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cde22D2D/SQ7DjRMRDYakpeqSceiEmLYAy9R4sDRFZ4=;
 b=QlQOotOgDk9aGxXgRF+QkJQIt6d+v7GuNyI9S6eIhxcB0jK9APkv2PMJRtA9GA8tK6
 qwRDs1/TdRvmL46dG2yPjxFA0hUR11SDd7xeCm4RVjg1xlEUhB6C6l7PPBL41fPKK//7
 K1mucL36j4XhRXq5X5HZ4QY9mV1r0ACxwFwrcpMCakheEZVsCGHW7WQfZpfZwP8WCyG9
 CbxQ7mHzqKkbFeKWfl1ZFp5Y/uGxwDNV1CkPRQNYzocqflpTaFlsWE5ha02Sff9VnMLo
 jSVQXju98lAz0crGAT11qgGFgDddjAWqqSKjopqivcCUGt1ziKYumatVYvX59iw8+E+h
 b3cQ==
X-Gm-Message-State: APjAAAV3w0I7Qmd/OTBwPnCnz/BtJFBwo2BiBqvYQPUr8s8FfH2DhW5c
 Cng40popr3lAyzRTFRd5/hJFQw==
X-Google-Smtp-Source: APXvYqxTSq7xbg9zxLiy0kEDCOrZTnZLTLbqUahJa+pbRkNf/2oRcK31kQh3sfGGk+OlBqVQE/baDQ==
X-Received: by 2002:a37:4fca:: with SMTP id
 d193mr40455150qkb.298.1559846688185; 
 Thu, 06 Jun 2019 11:44:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id o38sm1731656qto.96.2019.06.06.11.44.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008IN-IO; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 04/11] mm/hmm: Simplify hmm_get_or_create and make it
 reliable
Date: Thu,  6 Jun 2019 15:44:31 -0300
Message-Id: <20190606184438.31646-5-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cde22D2D/SQ7DjRMRDYakpeqSceiEmLYAy9R4sDRFZ4=;
 b=lSL5uWTCwCDgnbM/9/jrfQbxzPhWl8p/lDEgf4FT0uXH6Y+QewAJIhobM0Y5pnTV9Q
 mHJJmWUwI+A1PUB/WHWHue/Bz0y86gLvYZNesbGU1EQLEO4zSV4kHiD4h1a3k/MFDCdt
 WER1Mq2EaZX18rAxQeUToKW/nL69Y1jxs8Z6SnX3i9uxlnWxabF1Y6RuKi6OeGO9ieDQ
 MKnU5o9rvxa7nvv/y/bNKbuZLHNH9r7rBleushaJ37/rgvNJIPoVwIFEEjE9KU47+m6B
 Zk1tFH65d0SU9drWp7Mv6gBGKQ18TW6fwuehe84ewVEWflPwK/zZvOf9mFM3yphUj1/7
 R/wA==
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKQXMgY29kZWQgdGhpcyBm
dW5jdGlvbiBjYW4gZmFsc2UtZmFpbCBpbiB2YXJpb3VzIHJhY3kgc2l0dWF0aW9ucy4gTWFrZSBp
dApyZWxpYWJsZSBieSBydW5uaW5nIG9ubHkgdW5kZXIgdGhlIHdyaXRlIHNpZGUgb2YgdGhlIG1t
YXBfc2VtIGFuZCBhdm9pZGluZwp0aGUgZmFsc2UtZmFpbGluZyBjb21wYXJlL2V4Y2hhbmdlIHBh
dHRlcm4uCgpBbHNvIG1ha2UgdGhlIGxvY2tpbmcgdmVyeSBlYXN5IHRvIHVuZGVyc3RhbmQgYnkg
b25seSBldmVyIHJlYWRpbmcgb3IKd3JpdGluZyBtbS0+aG1tIHdoaWxlIGhvbGRpbmcgdGhlIHdy
aXRlIHNpZGUgb2YgdGhlIG1tYXBfc2VtLgoKU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBl
IDxqZ2dAbWVsbGFub3guY29tPgotLS0KdjI6Ci0gRml4IGVycm9yIHVud2luZCBvZiBtbWdyYWIg
KEplcm9tZSkKLSBVc2UgaG1tIGxvY2FsIGluc3RlYWQgb2YgMm5kIGNvbnRhaW5lcl9vZiAoSmVy
b21lKQotLS0KIG1tL2htbS5jIHwgODAgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCsp
LCA1MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4
IGNjN2MyNmZkYTMzMDBlLi5kYzMwZWRhZDlhOGEwMiAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysr
IGIvbW0vaG1tLmMKQEAgLTQwLDE2ICs0MCw2IEBACiAjaWYgSVNfRU5BQkxFRChDT05GSUdfSE1N
X01JUlJPUikKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyBobW1fbW11X25v
dGlmaWVyX29wczsKIAotc3RhdGljIGlubGluZSBzdHJ1Y3QgaG1tICptbV9nZXRfaG1tKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tKQotewotCXN0cnVjdCBobW0gKmhtbSA9IFJFQURfT05DRShtbS0+aG1t
KTsKLQotCWlmIChobW0gJiYga3JlZl9nZXRfdW5sZXNzX3plcm8oJmhtbS0+a3JlZikpCi0JCXJl
dHVybiBobW07Ci0KLQlyZXR1cm4gTlVMTDsKLX0KLQogLyoqCiAgKiBobW1fZ2V0X29yX2NyZWF0
ZSAtIHJlZ2lzdGVyIEhNTSBhZ2FpbnN0IGFuIG1tIChITU0gaW50ZXJuYWwpCiAgKgpAQCAtNjQs
MTEgKzU0LDIwIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGhtbSAqbW1fZ2V0X2htbShzdHJ1Y3Qg
bW1fc3RydWN0ICptbSkKICAqLwogc3RhdGljIHN0cnVjdCBobW0gKmhtbV9nZXRfb3JfY3JlYXRl
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQogewotCXN0cnVjdCBobW0gKmhtbSA9IG1tX2dldF9obW0o
bW0pOwotCWJvb2wgY2xlYW51cCA9IGZhbHNlOworCXN0cnVjdCBobW0gKmhtbTsKIAotCWlmICho
bW0pCi0JCXJldHVybiBobW07CisJbG9ja2RlcF9hc3NlcnRfaGVsZF9leGNsdXNpdmUoJm1tLT5t
bWFwX3NlbSk7CisKKwlpZiAobW0tPmhtbSkgeworCQlpZiAoa3JlZl9nZXRfdW5sZXNzX3plcm8o
Jm1tLT5obW0tPmtyZWYpKQorCQkJcmV0dXJuIG1tLT5obW07CisJCS8qCisJCSAqIFRoZSBobW0g
aXMgYmVpbmcgZnJlZWQgYnkgc29tZSBvdGhlciBDUFUgYW5kIGlzIHBlbmRpbmcgYQorCQkgKiBS
Q1UgZ3JhY2UgcGVyaW9kLCBidXQgdGhpcyBDUFUgY2FuIE5VTEwgbm93IGl0IHNpbmNlIHdlCisJ
CSAqIGhhdmUgdGhlIG1tYXBfc2VtLgorCQkgKi8KKwkJbW0tPmhtbSA9IE5VTEw7CisJfQogCiAJ
aG1tID0ga21hbGxvYyhzaXplb2YoKmhtbSksIEdGUF9LRVJORUwpOwogCWlmICghaG1tKQpAQCAt
ODMsNTcgKzgyLDM2IEBAIHN0YXRpYyBzdHJ1Y3QgaG1tICpobW1fZ2V0X29yX2NyZWF0ZShzdHJ1
Y3QgbW1fc3RydWN0ICptbSkKIAlobW0tPm5vdGlmaWVycyA9IDA7CiAJaG1tLT5kZWFkID0gZmFs
c2U7CiAJaG1tLT5tbSA9IG1tOwotCW1tZ3JhYihobW0tPm1tKTsKLQotCXNwaW5fbG9jaygmbW0t
PnBhZ2VfdGFibGVfbG9jayk7Ci0JaWYgKCFtbS0+aG1tKQotCQltbS0+aG1tID0gaG1tOwotCWVs
c2UKLQkJY2xlYW51cCA9IHRydWU7Ci0Jc3Bpbl91bmxvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2sp
OwogCi0JaWYgKGNsZWFudXApCi0JCWdvdG8gZXJyb3I7Ci0KLQkvKgotCSAqIFdlIHNob3VsZCBv
bmx5IGdldCBoZXJlIGlmIGhvbGQgdGhlIG1tYXBfc2VtIGluIHdyaXRlIG1vZGUgaWUgb24KLQkg
KiByZWdpc3RyYXRpb24gb2YgZmlyc3QgbWlycm9yIHRocm91Z2ggaG1tX21pcnJvcl9yZWdpc3Rl
cigpCi0JICovCiAJaG1tLT5tbXVfbm90aWZpZXIub3BzID0gJmhtbV9tbXVfbm90aWZpZXJfb3Bz
OwotCWlmIChfX21tdV9ub3RpZmllcl9yZWdpc3RlcigmaG1tLT5tbXVfbm90aWZpZXIsIG1tKSkK
LQkJZ290byBlcnJvcl9tbTsKKwlpZiAoX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIoJmhtbS0+bW11
X25vdGlmaWVyLCBtbSkpIHsKKwkJa2ZyZWUoaG1tKTsKKwkJcmV0dXJuIE5VTEw7CisJfQogCisJ
bW1ncmFiKGhtbS0+bW0pOworCW1tLT5obW0gPSBobW07CiAJcmV0dXJuIGhtbTsKLQotZXJyb3Jf
bW06Ci0Jc3Bpbl9sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKLQlpZiAobW0tPmhtbSA9PSBo
bW0pCi0JCW1tLT5obW0gPSBOVUxMOwotCXNwaW5fdW5sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2Nr
KTsKLWVycm9yOgotCW1tZHJvcChobW0tPm1tKTsKLQlrZnJlZShobW0pOwotCXJldHVybiBOVUxM
OwogfQogCiBzdGF0aWMgdm9pZCBobW1fZnJlZV9yY3Uoc3RydWN0IHJjdV9oZWFkICpyY3UpCiB7
Ci0Ja2ZyZWUoY29udGFpbmVyX29mKHJjdSwgc3RydWN0IGhtbSwgcmN1KSk7CisJc3RydWN0IGht
bSAqaG1tID0gY29udGFpbmVyX29mKHJjdSwgc3RydWN0IGhtbSwgcmN1KTsKKworCWRvd25fd3Jp
dGUoJmhtbS0+bW0tPm1tYXBfc2VtKTsKKwlpZiAoaG1tLT5tbS0+aG1tID09IGhtbSkKKwkJaG1t
LT5tbS0+aG1tID0gTlVMTDsKKwl1cF93cml0ZSgmaG1tLT5tbS0+bW1hcF9zZW0pOworCW1tZHJv
cChobW0tPm1tKTsKKworCWtmcmVlKGhtbSk7CiB9CiAKIHN0YXRpYyB2b2lkIGhtbV9mcmVlKHN0
cnVjdCBrcmVmICprcmVmKQogewogCXN0cnVjdCBobW0gKmhtbSA9IGNvbnRhaW5lcl9vZihrcmVm
LCBzdHJ1Y3QgaG1tLCBrcmVmKTsKLQlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGhtbS0+bW07Ci0K
LQltbXVfbm90aWZpZXJfdW5yZWdpc3Rlcl9ub19yZWxlYXNlKCZobW0tPm1tdV9ub3RpZmllciwg
bW0pOwogCi0Jc3Bpbl9sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKLQlpZiAobW0tPmhtbSA9
PSBobW0pCi0JCW1tLT5obW0gPSBOVUxMOwotCXNwaW5fdW5sb2NrKCZtbS0+cGFnZV90YWJsZV9s
b2NrKTsKLQotCW1tZHJvcChobW0tPm1tKTsKKwltbXVfbm90aWZpZXJfdW5yZWdpc3Rlcl9ub19y
ZWxlYXNlKCZobW0tPm1tdV9ub3RpZmllciwgaG1tLT5tbSk7CiAJbW11X25vdGlmaWVyX2NhbGxf
c3JjdSgmaG1tLT5yY3UsIGhtbV9mcmVlX3JjdSk7CiB9CiAKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
