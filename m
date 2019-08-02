Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98417EEC6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091016ED0D;
	Fri,  2 Aug 2019 08:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D996E866;
 Fri,  2 Aug 2019 02:20:24 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id y8so33024984plr.12;
 Thu, 01 Aug 2019 19:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qLhYs8BKsJD26dkkDQW7qDqDKRQ6ceEysj+E+zVe/Zg=;
 b=ldaMXR8d/r4vWKmy7UVG1h80DmBYZZt+j0iHpC9jKyE5d+SyBikJlj+zS3JsEvWede
 d8njapnPnYFSYhH1ENAzVSTQL0LjAvDZa5Fsz9981e5CwYYWLbD2s4awZx3K60/JG5dh
 xmYjUyvi2O9cD4V/5po/jlqcJeaAiaAbhfqDEWnAaML1Wt4ZK6SYmarOaI8JJE7gmmXT
 BQwxTHN68XiT75nPYn7+ve7jt2Nqn9s7dzJ0J0cPx0rnSJFrNZcoo+4FYeXPzfvZzV5p
 ux17W7ZPX5Tb7SSwHS5rkcB+L5kfVRzS/Dx0mxdU8a4bR5ctmXGzWdEP/Ijw4e4Jfci9
 cByA==
X-Gm-Message-State: APjAAAXXGbqNKTBzQbDYJa0ZIdnZVvXedS5TFayCgCvXUGYRn7UtOaMs
 aT69OkcGaNNNu8N2tjLKi8o=
X-Google-Smtp-Source: APXvYqzyCRty8QPAc9XoTrRagrp/y/95vNaIlWT3LNdx/ZaWWXrbiDzYki+gcyf8LhQXoed6UV6NgQ==
X-Received: by 2002:a17:902:6b0c:: with SMTP id
 o12mr26388046plk.113.1564712424200; 
 Thu, 01 Aug 2019 19:20:24 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:23 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 08/34] media/ivtv: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:39 -0700
Message-Id: <20190802022005.5117-9-jhubbard@nvidia.com>
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
 bh=qLhYs8BKsJD26dkkDQW7qDqDKRQ6ceEysj+E+zVe/Zg=;
 b=mO2EsXInu3VlKA104JEnfgx6jDjnSEwvGouzsXnnB6AUhB4nvA/xUkFDDFSnp0kAVb
 uzJcZIfv98AAj+k04bO7VhQK6uHpuI27M0R+JJmNHqmsuBRinpXiyXzVO3vG2KOnwG10
 9wLLSCL2f4bGbhp3gn22p2RGwRVC/ywoZ78m+PYeQh5xx0q2EjBUJcL8fGu/7GpGYNTC
 uoBxihJiCgimiOEov856ivIQlm2ZtbCKKeyCad06O9lOqE5uy2qRmSTr2cNmPxvRt3hH
 pW5v3ngGfAjNbaRjAeL1vDJ+MdUfb90y74Jjb2kpsnBznTRKzfySI1iA5+bGvCblKYHE
 C88Q==
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Andy Walls <awalls@md.metrocast.net>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQW5keSBX
YWxscyA8YXdhbGxzQG1kLm1ldHJvY2FzdC5uZXQ+CkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWJAa2VybmVsLm9yZz4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVy
cy9tZWRpYS9wY2kvaXZ0di9pdnR2LXVkbWEuYyB8IDE0ICsrKystLS0tLS0tLS0tCiBkcml2ZXJz
L21lZGlhL3BjaS9pdnR2L2l2dHYteXV2LmMgIHwgMTAgKysrLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvcGNpL2l2dHYvaXZ0di11ZG1hLmMgYi9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2
dHYtdWRtYS5jCmluZGV4IDVmODg4MzAzMWM5Yy4uN2M3ZjMzYzI0MTJiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHYtdWRtYS5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGNp
L2l2dHYvaXZ0di11ZG1hLmMKQEAgLTkyLDcgKzkyLDcgQEAgaW50IGl2dHZfdWRtYV9zZXR1cChz
dHJ1Y3QgaXZ0diAqaXR2LCB1bnNpZ25lZCBsb25nIGl2dHZfZGVzdF9hZGRyLAogewogCXN0cnVj
dCBpdnR2X2RtYV9wYWdlX2luZm8gdXNlcl9kbWE7CiAJc3RydWN0IGl2dHZfdXNlcl9kbWEgKmRt
YSA9ICZpdHYtPnVkbWE7Ci0JaW50IGksIGVycjsKKwlpbnQgZXJyOwogCiAJSVZUVl9ERUJVR19E
TUEoIml2dHZfdWRtYV9zZXR1cCwgZHN0OiAweCUwOHhcbiIsICh1bnNpZ25lZCBpbnQpaXZ0dl9k
ZXN0X2FkZHIpOwogCkBAIC0xMTksOCArMTE5LDcgQEAgaW50IGl2dHZfdWRtYV9zZXR1cChzdHJ1
Y3QgaXZ0diAqaXR2LCB1bnNpZ25lZCBsb25nIGl2dHZfZGVzdF9hZGRyLAogCQlJVlRWX0RFQlVH
X1dBUk4oImZhaWxlZCB0byBtYXAgdXNlciBwYWdlcywgcmV0dXJuZWQgJWQgaW5zdGVhZCBvZiAl
ZFxuIiwKIAkJCSAgIGVyciwgdXNlcl9kbWEucGFnZV9jb3VudCk7CiAJCWlmIChlcnIgPj0gMCkg
ewotCQkJZm9yIChpID0gMDsgaSA8IGVycjsgaSsrKQotCQkJCXB1dF9wYWdlKGRtYS0+bWFwW2ld
KTsKKwkJCXB1dF91c2VyX3BhZ2VzKGRtYS0+bWFwLCBlcnIpOwogCQkJcmV0dXJuIC1FSU5WQUw7
CiAJCX0KIAkJcmV0dXJuIGVycjsKQEAgLTEzMCw5ICsxMjksNyBAQCBpbnQgaXZ0dl91ZG1hX3Nl
dHVwKHN0cnVjdCBpdnR2ICppdHYsIHVuc2lnbmVkIGxvbmcgaXZ0dl9kZXN0X2FkZHIsCiAKIAkv
KiBGaWxsIFNHIExpc3Qgd2l0aCBuZXcgdmFsdWVzICovCiAJaWYgKGl2dHZfdWRtYV9maWxsX3Nn
X2xpc3QoZG1hLCAmdXNlcl9kbWEsIDApIDwgMCkgewotCQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5w
YWdlX2NvdW50OyBpKyspIHsKLQkJCXB1dF9wYWdlKGRtYS0+bWFwW2ldKTsKLQkJfQorCQlwdXRf
dXNlcl9wYWdlcyhkbWEtPm1hcCwgZG1hLT5wYWdlX2NvdW50KTsKIAkJZG1hLT5wYWdlX2NvdW50
ID0gMDsKIAkJcmV0dXJuIC1FTk9NRU07CiAJfQpAQCAtMTUzLDcgKzE1MCw2IEBAIGludCBpdnR2
X3VkbWFfc2V0dXAoc3RydWN0IGl2dHYgKml0diwgdW5zaWduZWQgbG9uZyBpdnR2X2Rlc3RfYWRk
ciwKIHZvaWQgaXZ0dl91ZG1hX3VubWFwKHN0cnVjdCBpdnR2ICppdHYpCiB7CiAJc3RydWN0IGl2
dHZfdXNlcl9kbWEgKmRtYSA9ICZpdHYtPnVkbWE7Ci0JaW50IGk7CiAKIAlJVlRWX0RFQlVHX0lO
Rk8oIml2dHZfdW5tYXBfdXNlcl9kbWFcbiIpOwogCkBAIC0xNzAsOSArMTY2LDcgQEAgdm9pZCBp
dnR2X3VkbWFfdW5tYXAoc3RydWN0IGl2dHYgKml0dikKIAlpdnR2X3VkbWFfc3luY19mb3JfY3B1
KGl0dik7CiAKIAkvKiBSZWxlYXNlIFVzZXIgUGFnZXMgKi8KLQlmb3IgKGkgPSAwOyBpIDwgZG1h
LT5wYWdlX2NvdW50OyBpKyspIHsKLQkJcHV0X3BhZ2UoZG1hLT5tYXBbaV0pOwotCX0KKwlwdXRf
dXNlcl9wYWdlcyhkbWEtPm1hcCwgZG1hLT5wYWdlX2NvdW50KTsKIAlkbWEtPnBhZ2VfY291bnQg
PSAwOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHYteXV2LmMg
Yi9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHYteXV2LmMKaW5kZXggY2QyZmUyZDQ0NGMwLi45
NDY1YTdkNDUwYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0di15dXYu
YworKysgYi9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHYteXV2LmMKQEAgLTgxLDggKzgxLDcg
QEAgc3RhdGljIGludCBpdnR2X3l1dl9wcmVwX3VzZXJfZG1hKHN0cnVjdCBpdnR2ICppdHYsIHN0
cnVjdCBpdnR2X3VzZXJfZG1hICpkbWEsCiAJCQkJIHV2X3BhZ2VzLCB1dl9kbWEucGFnZV9jb3Vu
dCk7CiAKIAkJCWlmICh1dl9wYWdlcyA+PSAwKSB7Ci0JCQkJZm9yIChpID0gMDsgaSA8IHV2X3Bh
Z2VzOyBpKyspCi0JCQkJCXB1dF9wYWdlKGRtYS0+bWFwW3lfcGFnZXMgKyBpXSk7CisJCQkJcHV0
X3VzZXJfcGFnZXMoJmRtYS0+bWFwW3lfcGFnZXNdLCB1dl9wYWdlcyk7CiAJCQkJcmMgPSAtRUZB
VUxUOwogCQkJfSBlbHNlIHsKIAkJCQlyYyA9IHV2X3BhZ2VzOwpAQCAtOTMsOCArOTIsNyBAQCBz
dGF0aWMgaW50IGl2dHZfeXV2X3ByZXBfdXNlcl9kbWEoc3RydWN0IGl2dHYgKml0diwgc3RydWN0
IGl2dHZfdXNlcl9kbWEgKmRtYSwKIAkJCQkgeV9wYWdlcywgeV9kbWEucGFnZV9jb3VudCk7CiAJ
CX0KIAkJaWYgKHlfcGFnZXMgPj0gMCkgewotCQkJZm9yIChpID0gMDsgaSA8IHlfcGFnZXM7IGkr
KykKLQkJCQlwdXRfcGFnZShkbWEtPm1hcFtpXSk7CisJCQlwdXRfdXNlcl9wYWdlcyhkbWEtPm1h
cCwgeV9wYWdlcyk7CiAJCQkvKgogCQkJICogSW5oZXJpdCB0aGUgLUVGQVVMVCBmcm9tIHJjJ3MK
IAkJCSAqIGluaXRpYWxpemF0aW9uLCBidXQgYWxsb3cgaXQgdG8gYmUKQEAgLTExMiw5ICsxMTAs
NyBAQCBzdGF0aWMgaW50IGl2dHZfeXV2X3ByZXBfdXNlcl9kbWEoc3RydWN0IGl2dHYgKml0diwg
c3RydWN0IGl2dHZfdXNlcl9kbWEgKmRtYSwKIAkvKiBGaWxsICYgbWFwIFNHIExpc3QgKi8KIAlp
ZiAoaXZ0dl91ZG1hX2ZpbGxfc2dfbGlzdCAoZG1hLCAmdXZfZG1hLCBpdnR2X3VkbWFfZmlsbF9z
Z19saXN0IChkbWEsICZ5X2RtYSwgMCkpIDwgMCkgewogCQlJVlRWX0RFQlVHX1dBUk4oImNvdWxk
IG5vdCBhbGxvY2F0ZSBib3VuY2UgYnVmZmVycyBmb3IgaGlnaG1lbSB1c2Vyc3BhY2UgYnVmZmVy
c1xuIik7Ci0JCWZvciAoaSA9IDA7IGkgPCBkbWEtPnBhZ2VfY291bnQ7IGkrKykgewotCQkJcHV0
X3BhZ2UoZG1hLT5tYXBbaV0pOwotCQl9CisJCXB1dF91c2VyX3BhZ2VzKGRtYS0+bWFwLCBkbWEt
PnBhZ2VfY291bnQpOwogCQlkbWEtPnBhZ2VfY291bnQgPSAwOwogCQlyZXR1cm4gLUVOT01FTTsK
IAl9Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
