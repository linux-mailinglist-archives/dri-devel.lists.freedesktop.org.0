Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB4845EB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9EB6E67B;
	Wed,  7 Aug 2019 07:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C3088C4C;
 Wed,  7 Aug 2019 01:34:25 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id n4so812884pgv.2;
 Tue, 06 Aug 2019 18:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=Q4XI5FnK+ZJZ5bvJDEXsS4Tek21y50raNX85MnCIEYZLPJUSDHiBtoPp/v2BGWWMJ5
 eBGLm+UzDxFzqkd+VlTCumUbJ3Y2FPhlITIh4X/FgO3Y8WkjFjhRtdiSfeZg2y/XYoSK
 FC4us3vJQR7H5kr1AYTNnBU0leALD7Rdzda4t0lUPmUc1ItROQFF/ZSj05PewnFOSnM0
 gLlKeOW0IfQuIt1rYovnW0xCt6kIGhXf/w8uuICeKSdR3/AGwMIEGYTVGjHwMhLIKlHK
 YZXEo+ZVmD38PcvPD0PYFbctGzYm2VhJ/iuBDmRXPA2NHwnm4qnZwJF5Ib4IXQI5LPC/
 3xHg==
X-Gm-Message-State: APjAAAWXv9FSWlTJNdWNVepTfFX5j2zhCTW0ECpwKIIuEASsd3yhNGhR
 QGzQUvBWYupSMT9oijeyPYc=
X-Google-Smtp-Source: APXvYqy16jzsEED+wwh8ENkTlGqxRvZ0RoyFpGJNp0G/IOpaWMDvDoKlXk8GjrxTBQC2gP0d6Cw0/w==
X-Received: by 2002:a65:4205:: with SMTP id c5mr5563561pgq.267.1565141664948; 
 Tue, 06 Aug 2019 18:34:24 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:24 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 25/41] uprobes: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:24 -0700
Message-Id: <20190807013340.9706-26-jhubbard@nvidia.com>
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
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=rAOpaTjUSe2mFnrvmhnJS8xKHHDfXHpmD+l4Uv9l8gmgovmdA6+wJqXqls9UsmJQBz
 ep3JWBTwWzs2IRGwW41GCxQWL8zWFiSR6uy1gns5wXkfbjCngWqZazp0XVGWvkIrwV7K
 z/fUXqz3btTykEGkC1n2yQAIcvStpMcGGmLYj4sdGhsYd7aWY+K2HM0TRDI35Ihws22z
 bA5Wn1kxkVVUCZDFZU2yV7yqOW35XJ9lVNcA81nOyQ1MEO7P4qKnD+B4GkGo8p2H58WM
 u5trmpjCembtTJLb3EXiFKzyKJTiFQRUI8DgENKYMdkcBAeXgiFZBUUnvfxQ+ER9+IzC
 DzYw==
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
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogUGV0ZXIg
WmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJl
ZGhhdC5jb20+CkNjOiBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gPGFjbWVAa2VybmVsLm9yZz4K
Q2M6IEFsZXhhbmRlciBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVsLmNv
bT4KQ2M6IEppcmkgT2xzYSA8am9sc2FAcmVkaGF0LmNvbT4KQ2M6IE5hbWh5dW5nIEtpbSA8bmFt
aHl1bmdAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGtlcm5lbC9ldmVudHMvdXByb2Jlcy5jIHwgNiArKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
a2VybmVsL2V2ZW50cy91cHJvYmVzLmMgYi9rZXJuZWwvZXZlbnRzL3Vwcm9iZXMuYwppbmRleCA4
NGZhMDA0OTdjNDkuLjRhNTc1ZGU4Y2VjOCAxMDA2NDQKLS0tIGEva2VybmVsL2V2ZW50cy91cHJv
YmVzLmMKKysrIGIva2VybmVsL2V2ZW50cy91cHJvYmVzLmMKQEAgLTM5Nyw3ICszOTcsNyBAQCBf
X3VwZGF0ZV9yZWZfY3RyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRy
LCBzaG9ydCBkKQogCXJldCA9IDA7CiBvdXQ6CiAJa3VubWFwX2F0b21pYyhrYWRkcik7Ci0JcHV0
X3BhZ2UocGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKIAlyZXR1cm4gcmV0OwogfQogCkBA
IC01MDQsNyArNTA0LDcgQEAgaW50IHVwcm9iZV93cml0ZV9vcGNvZGUoc3RydWN0IGFyY2hfdXBy
b2JlICphdXByb2JlLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAlyZXQgPSBfX3JlcGxhY2VfcGFn
ZSh2bWEsIHZhZGRyLCBvbGRfcGFnZSwgbmV3X3BhZ2UpOwogCXB1dF9wYWdlKG5ld19wYWdlKTsK
IHB1dF9vbGQ6Ci0JcHV0X3BhZ2Uob2xkX3BhZ2UpOworCXB1dF91c2VyX3BhZ2Uob2xkX3BhZ2Up
OwogCiAJaWYgKHVubGlrZWx5KHJldCA9PSAtRUFHQUlOKSkKIAkJZ290byByZXRyeTsKQEAgLTE5
ODEsNyArMTk4MSw3IEBAIHN0YXRpYyBpbnQgaXNfdHJhcF9hdF9hZGRyKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRyKQogCQlyZXR1cm4gcmVzdWx0OwogCiAJY29weV9m
cm9tX3BhZ2UocGFnZSwgdmFkZHIsICZvcGNvZGUsIFVQUk9CRV9TV0JQX0lOU05fU0laRSk7Ci0J
cHV0X3BhZ2UocGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKICBvdXQ6CiAJLyogVGhpcyBu
ZWVkcyB0byByZXR1cm4gdHJ1ZSBmb3IgYW55IHZhcmlhbnQgb2YgdGhlIHRyYXAgaW5zbiAqLwog
CXJldHVybiBpc190cmFwX2luc24oJm9wY29kZSk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
