Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7357EED0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226DA6ED11;
	Fri,  2 Aug 2019 08:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEA86E865;
 Fri,  2 Aug 2019 02:20:27 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w10so35239593pgj.7;
 Thu, 01 Aug 2019 19:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qd17+I20JNTl38JpPt9ENs79+ajS7TX5o2e3ywFXns4=;
 b=Sij2t9l22Fs5MUjcrynOe7fnZrzww4om5fs6P9xT60M556dG+AdBelbpsmijl+3yFK
 FpiJ6nuzw8Pwb6omvC7MclAGuHeJnUmD8iynZ/Ajwraa6acQ9oVcEh4oeXgMNghJb4pp
 ODXgGUw/OLK4uO6MZzIX6UgpYfEW2E3TmSnArYe3PgAAZQ8TclFH5BhIy3weu8i30ldg
 DJmLkCtON1WUlm2Y2oxBh6t/Pv6MatHAZ504qzyM2NLk+dDFQ1x5Ejec8hOXHvgeH9LB
 aiFInnIj+JcjJM+cBIHhVguhdL6PzzdfDR1VS9FKleV4UL0XXWgWEdpYs4ZjMBeLx9AG
 XY5g==
X-Gm-Message-State: APjAAAX9VOX1lc9VWLD+hpbVPP/PPeiTgCS5WRXhWGJbN8Wm6KDMuQg/
 Hqk43WAvu+kwt0vrX8YY4KM=
X-Google-Smtp-Source: APXvYqzcfAPxLmmHN9CIJXSofnjYAmirbplKZ2y79i+8ei53QCOaijMzmdrNExYuUwo7YKHbzyVulQ==
X-Received: by 2002:a63:4e60:: with SMTP id o32mr124066909pgl.68.1564712427200; 
 Thu, 01 Aug 2019 19:20:27 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:26 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 10/34] genwqe: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:41 -0700
Message-Id: <20190802022005.5117-11-jhubbard@nvidia.com>
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
 bh=Qd17+I20JNTl38JpPt9ENs79+ajS7TX5o2e3ywFXns4=;
 b=gkgYcjKv8mviCpscfvidKdy0yp2exmwhbdFHg1VYLE3YGnNwT45rP9cYRgwxWvdSGD
 XzCmVpBd7+RlIjI+MEb+wWJpyo2f4ZmUYQSjUgDqWwLqeKRJRBA6AZnXsK08IyCyXhiy
 4dNgArxki6iOU/cWoHR8rdD6eQRfJHzRIm1i/ZNo3u5RbTwbDPqtUA6ksm0/Lv2IxLjK
 q70kCAhSPRAGOQENe2IrIBNCWn54pipkVfZgN+QCwPKsZgDTTDuP78ZHv5mKxve9ym1t
 pLsjPHA1rQycUPxkIzWtiiwiI/XQHl1n8MJ/ZwIZ8xTcRU1Mrrugy/JGwgBrkRXuy135
 NXOg==
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
 Arnd Bergmann <arnd@arndb.de>,
 "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Frank Haverkamp <haver@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGNoYW5n
ZXMgdGhlIHJlbGVhc2UgY29kZSBzbGlnaHRseSwgYmVjYXVzZSBlYWNoIHBhZ2Ugc2xvdCBpbiB0
aGUKcGFnZV9saXN0W10gYXJyYXkgaXMgbm8gbG9uZ2VyIGNoZWNrZWQgZm9yIE5VTEwuIEhvd2V2
ZXIsIHRoYXQgY2hlY2sKd2FzIHdyb25nIGFueXdheSwgYmVjYXVzZSB0aGUgZ2V0X3VzZXJfcGFn
ZXMoKSBwYXR0ZXJuIG9mIHVzYWdlIGhlcmUKbmV2ZXIgYWxsb3dlZCBmb3IgTlVMTCBlbnRyaWVz
IHdpdGhpbiBhIHJhbmdlIG9mIHBpbm5lZCBwYWdlcy4KCkNjOiBGcmFuayBIYXZlcmthbXAgPGhh
dmVyQGxpbnV4LnZuZXQuaWJtLmNvbT4KQ2M6ICJHdWlsaGVybWUgRy4gUGljY29saSIgPGdwaWNj
b2xpQGxpbnV4LnZuZXQuaWJtLmNvbT4KQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVy
cy9taXNjL2dlbndxZS9jYXJkX3V0aWxzLmMgfCAxNyArKystLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9taXNjL2dlbndxZS9jYXJkX3V0aWxzLmMgYi9kcml2ZXJzL21pc2MvZ2Vud3FlL2Nh
cmRfdXRpbHMuYwppbmRleCAyZTFjNGQyOTA1ZTguLjJhODg4ZjMxZDJjNSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9taXNjL2dlbndxZS9jYXJkX3V0aWxzLmMKKysrIGIvZHJpdmVycy9taXNjL2dlbndx
ZS9jYXJkX3V0aWxzLmMKQEAgLTUxNywyNCArNTE3LDEzIEBAIGludCBnZW53cWVfZnJlZV9zeW5j
X3NnbChzdHJ1Y3QgZ2Vud3FlX2RldiAqY2QsIHN0cnVjdCBnZW53cWVfc2dsICpzZ2wpCiAvKioK
ICAqIGdlbndxZV9mcmVlX3VzZXJfcGFnZXMoKSAtIEdpdmUgcGlubmVkIHBhZ2VzIGJhY2sKICAq
Ci0gKiBEb2N1bWVudGF0aW9uIG9mIGdldF91c2VyX3BhZ2VzIGlzIGluIG1tL2d1cC5jOgotICoK
LSAqIElmIHRoZSBwYWdlIGlzIHdyaXR0ZW4gdG8sIHNldF9wYWdlX2RpcnR5IChvciBzZXRfcGFn
ZV9kaXJ0eV9sb2NrLAotICogYXMgYXBwcm9wcmlhdGUpIG11c3QgYmUgY2FsbGVkIGFmdGVyIHRo
ZSBwYWdlIGlzIGZpbmlzaGVkIHdpdGgsIGFuZAotICogYmVmb3JlIHB1dF9wYWdlIGlzIGNhbGxl
ZC4KKyAqIFRoZSBwYWdlcyBtYXkgaGF2ZSBiZWVuIHdyaXR0ZW4gdG8sIHNvIHdlIGNhbGwgcHV0
X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLAorICogcmF0aGVyIHRoYW4gcHV0X3VzZXJfcGFnZXMo
KS4KICAqLwogc3RhdGljIGludCBnZW53cWVfZnJlZV91c2VyX3BhZ2VzKHN0cnVjdCBwYWdlICoq
cGFnZV9saXN0LAogCQkJdW5zaWduZWQgaW50IG5yX3BhZ2VzLCBpbnQgZGlydHkpCiB7Ci0JdW5z
aWduZWQgaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkrKykgewotCQlpZiAo
cGFnZV9saXN0W2ldICE9IE5VTEwpIHsKLQkJCWlmIChkaXJ0eSkKLQkJCQlzZXRfcGFnZV9kaXJ0
eV9sb2NrKHBhZ2VfbGlzdFtpXSk7Ci0JCQlwdXRfcGFnZShwYWdlX2xpc3RbaV0pOwotCQl9Ci0J
fQorCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2socGFnZV9saXN0LCBucl9wYWdlcywgZGlydHkp
OwogCXJldHVybiAwOwogfQogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
