Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AB8133A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B76892E3;
	Mon,  5 Aug 2019 07:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D1D89CDF;
 Sun,  4 Aug 2019 22:49:35 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t132so38659658pgb.9;
 Sun, 04 Aug 2019 15:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKnEf1dGeTf0vHOLp5WCTJvqak8NT8hcLNnzrVdQpMI=;
 b=JYRRGNdt001eSbzumyczy5qRU9iDy6LhtZjkQ6bwXboY7RRtDtHXpLdHdEX9m5eMp7
 58pTVjDp1DCIUpNi9iM/2b9Pz+WyKre9lvrCN//GFjvG5FJaTJWW7sCLEKBOlTppPYUF
 xbqW9FV5aa8dYJWPbqybVshAUQpWHoN2qQ3rBe21YpMeWpqudMX5kKozzySmgjGvC408
 kke92xwehomWAhsgQtXtbuj3MCfha6ySbh07gB71zyy07OsHVcCduu6XxRc463wj26/W
 QKMHD7C0DKK7dnmITySZwtKZ0drPCEV7MPmSsr3kqKdyNIui6I1J6v6oPqONxc6w1vkM
 Gu3A==
X-Gm-Message-State: APjAAAWwZnaRHMRzFiS/QYadb16Tun42eKpqxifUw+HhvKlX7zPz5Tw+
 NAmsn3UfUPopLSaRYeUWrB0=
X-Google-Smtp-Source: APXvYqzq3Lz+VjHUVJbOvV+K9KYqaCKO4VLPyE3SqnlHZP1nl3CDkSu6mPMA16qqbAvOmUhc3KYfTA==
X-Received: by 2002:a17:90a:1c1:: with SMTP id 1mr15255619pjd.72.1564958975035; 
 Sun, 04 Aug 2019 15:49:35 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:34 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 10/34] genwqe: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:48:51 -0700
Message-Id: <20190804224915.28669-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKnEf1dGeTf0vHOLp5WCTJvqak8NT8hcLNnzrVdQpMI=;
 b=UAVd4mr7vGvTBL1keSKDuwOUviwbBqcp6QKy80u93848ZN8eU6de8F8i32424yePdd
 zhJ1O4RduGczBUBLeccU6nytEoiOUUwRkUsjuEyue319dSQS2bud/HybqSeEP9UaizKY
 00ht31Ehoc2cMo40WzQ9rGK2yX18fybqCo7t+dG1vWpDgDbdQz/Q1YLF3bcEr/VsNC/+
 VEsECPXiobaIgfjOirKP1fhQQn2wJJKwgSQoEP5vN1KZqZSBZAcxorwveJr5kCfvgpyC
 h19lHwiz4dU7jiPcnb0kWz/BIQhyT1yRrfBg3wROHEiu6fO26e4X5u3gRUvcijrb3cqf
 EWfg==
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
 "Guilherme G . Piccoli" <gpiccoli@linux.vnet.ibm.com>,
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
IHdpdGhpbiBhIHJhbmdlIG9mIHBpbm5lZCBwYWdlcy4KCkFja2VkLWJ5OiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgoKQ2M6IEZyYW5rIEhhdmVya2FtcCA8
aGF2ZXJAbGludXgudm5ldC5pYm0uY29tPgpDYzogR3VpbGhlcm1lIEcuIFBpY2NvbGkgPGdwaWNj
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
