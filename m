Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF947EEBC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AF86ED02;
	Fri,  2 Aug 2019 08:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464456E863;
 Fri,  2 Aug 2019 02:20:59 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k8so33033763plt.3;
 Thu, 01 Aug 2019 19:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=DwFrbQToZ5W3N4P2GyeseCUGbnJvjpM7dqPrcEuERTREsenAjpY8yTCE7bT0wxWuFk
 taCYkrM5fKA/MlMwlPh1NdIWVcQ1XIxtHx6bDlM6r3e1EMVBYf9HP4ial9nsKK0Ud1St
 7jp3Km/XDRtexXEZZTD2E0Fr5Xz3mH7FCay0DD1prAy0ZQRY1peK6VRr/TEmOSxTJjHi
 42Aw7XQAFNhaKH+4Ms3OVne21d3vgCaExjmaJfXcxoINYN66Hc3A8sZOHbxzn/5Huqeg
 a9MSGXMhMB1Vqs5jyde6tbEmZIbqN6mgD4kGjVMEV8bH3JM1BbTLnz8PWfT+0TLxbrGS
 t12Q==
X-Gm-Message-State: APjAAAX/AXLOLo6Uhao1IlHD2dl+ZGEpYqdAghoqbEqgQLoIZLaLLsUi
 WtIlA0u2oUUN88wShyZWLeE=
X-Google-Smtp-Source: APXvYqzzllbFm5p1RJ6Hv9sdYEOY7jdZkiYuzxv4vZdIzU4+gyWXMgDLOAREt7Tj2iCCice8+nHYSA==
X-Received: by 2002:a17:902:24b:: with SMTP id
 69mr123385473plc.250.1564712458970; 
 Thu, 01 Aug 2019 19:20:58 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:58 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 30/34] crypt: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:20:01 -0700
Message-Id: <20190802022005.5117-31-jhubbard@nvidia.com>
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
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=elfpTxMe1/6j0BhX2ft/28omzWdU5w7mpxF5KS6Ry8a8zkGJScYbqAJ2NTQjOpA+gX
 oQX8NO2qfr8fQYzhkmlI2m44i8n5UA95IshiSsHQfSaUB55LfEMP8Nf6Bwly/9Em6O/v
 kb75MLzprl0H6ilua+Tsx9/J/pL9/kQBkbd23F8nfmf7/S2UoqNko9rQth0i8PtjUyLH
 QNhM+JJQO3CxcyAMQTRjV2IrQz9Ukzpv3t7kO6uUD4p+f92uGnc2g/qdEf6YIu13QPQ3
 M8XRiksoxntjoSZ9RhVKNzEdpCIwtT4CToNN39nu0gxIxKKgNM9/D3+uDvkH0PFa7iEb
 mOeg==
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
