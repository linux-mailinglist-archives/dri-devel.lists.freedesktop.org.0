Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C9845B0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630366E622;
	Wed,  7 Aug 2019 07:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1A08905A;
 Wed,  7 Aug 2019 01:34:36 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id u14so42516639pfn.2;
 Tue, 06 Aug 2019 18:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=fDxzvSaNEgeSa3mn1LSDTXn+sHwXeVM3NHf6FJuQOLSy5ESgpsV3jxIk77iBMFZ6iJ
 fjW+gHl0NVxHvRYMW3z7rP5FDe8qrNiGzrQ9JTcU4LWja8qyi+upCfX/DpR3RkJSqHkD
 5Q7TDjIizRQ87pWztWTHby9iSmNzcrklStBtJ8L/XBS7t9rtZwTFaDE6jrWfD70iWigG
 R5vbxq8rpHsY5JRNSHi3bUceVcggrYoDIGj2j1Ve4QpKw4J6bVL9OrzrblCBEJb7Rxzb
 2LUeHiStGVRFYO1ZDQZ50sp5YehUm7mZ6T2nu9xP9NX0sN4YC4UzpYNha/Mei7OlVfiG
 Cemg==
X-Gm-Message-State: APjAAAUvB5nzd/Gnef1cKvydttHthHKbPd8I1JZvxr4YjFa0Gh96cYxI
 pZiCnVTQBgr1NMJFzwLUZPs=
X-Google-Smtp-Source: APXvYqyxpq50qUVkp6HWZCQLNWkEvhnyucBHKSZoboyNMe/1/wbJw75uRBEC9F8SIFpx6GEidj30Zg==
X-Received: by 2002:a17:90a:de02:: with SMTP id
 m2mr6000462pjv.18.1565141676262; 
 Tue, 06 Aug 2019 18:34:36 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:35 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 32/41] crypt: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:31 -0700
Message-Id: <20190807013340.9706-33-jhubbard@nvidia.com>
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
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=fg/Pfm4bbVSmVcCrQT7+5JHEhqSFsHPgOaHWfBPnZWxRApjKfb4cb3kH5stgfnMMig
 zbelcrPsCI0tI4xwfOZRnckTrTKeUm3wG0kqfTVOMRYMB6MvjyF1Rql1N0HWLaZIzEfM
 iWdx9yjCpgBpQS5lPDIGFaAFICDzqEqnoV9x5MiP1hBYLTSZ4ogFH5QAAV9Yz6tw/8b2
 ZykLmdq9ZFns/SDVctWkjbZ0w3aCcCbjN/JvbQSxSyp41bzHjOAMChIKQXNa4QdCxgL9
 jwRKUeEurDeq/o0JqzXeiTfFAPo9oNntq7QpxEmENoOSeaVMGgE1SeT20aw5cXMwj05c
 mafQ==
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
 rds-devel@oss.oracle.com, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogSGVyYmVy
dCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1PgpDYzogRGF2aWQgUy4gTWlsbGVyIDxk
YXZlbUBkYXZlbWxvZnQubmV0PgpDYzogbGludXgtY3J5cHRvQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogY3J5cHRv
L2FmX2FsZy5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NyeXB0by9hZl9hbGcuYyBiL2NyeXB0by9hZl9h
bGcuYwppbmRleCA4NzljZjIzZjc0ODkuLmVkZDM1OGVhNjRkYSAxMDA2NDQKLS0tIGEvY3J5cHRv
L2FmX2FsZy5jCisrKyBiL2NyeXB0by9hZl9hbGcuYwpAQCAtNDI4LDEwICs0MjgsNyBAQCBzdGF0
aWMgdm9pZCBhZl9hbGdfbGlua19zZyhzdHJ1Y3QgYWZfYWxnX3NnbCAqc2dsX3ByZXYsCiAKIHZv
aWQgYWZfYWxnX2ZyZWVfc2coc3RydWN0IGFmX2FsZ19zZ2wgKnNnbCkKIHsKLQlpbnQgaTsKLQot
CWZvciAoaSA9IDA7IGkgPCBzZ2wtPm5wYWdlczsgaSsrKQotCQlwdXRfcGFnZShzZ2wtPnBhZ2Vz
W2ldKTsKKwlwdXRfdXNlcl9wYWdlcyhzZ2wtPnBhZ2VzLCBzZ2wtPm5wYWdlcyk7CiB9CiBFWFBP
UlRfU1lNQk9MX0dQTChhZl9hbGdfZnJlZV9zZyk7CiAKQEAgLTY2OCw3ICs2NjUsNyBAQCBzdGF0
aWMgdm9pZCBhZl9hbGdfZnJlZV9hcmVxX3NnbHMoc3RydWN0IGFmX2FsZ19hc3luY19yZXEgKmFy
ZXEpCiAJCWZvcl9lYWNoX3NnKHRzZ2wsIHNnLCBhcmVxLT50c2dsX2VudHJpZXMsIGkpIHsKIAkJ
CWlmICghc2dfcGFnZShzZykpCiAJCQkJY29udGludWU7Ci0JCQlwdXRfcGFnZShzZ19wYWdlKHNn
KSk7CisJCQlwdXRfdXNlcl9wYWdlKHNnX3BhZ2Uoc2cpKTsKIAkJfQogCiAJCXNvY2tfa2ZyZWVf
cyhzaywgdHNnbCwgYXJlcS0+dHNnbF9lbnRyaWVzICogc2l6ZW9mKCp0c2dsKSk7Ci0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
