Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFEC7EEB9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D15D6ECF8;
	Fri,  2 Aug 2019 08:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373BD6E866;
 Fri,  2 Aug 2019 02:20:48 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f5so26416481pgu.5;
 Thu, 01 Aug 2019 19:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=DRocNBXATsxCH5aC3P/Gh9Tk1dXT4JIe1U5NbgtJPmn23YsgfvtH4+lXSA4BEZr5qm
 TiI4Rc3GLHzqsbD/YCueDXvGQWURZGGEuFeSbmRwpbDHy3C1y8DhSjOXllMuozuzFuPA
 guSOmiNEd8EtdcEO+hPQ25++wybfLNkPs/oHv9GKX61lvFkLgpd/ibz+hN5aIs7mbsOv
 JHOvO/EaQELt4PHn4rT+VRqQKz3cqDWPDZRURkC5j/O+BfZi6QzrZJ5eWLxCqXu5Xscm
 fk8FxGUNvkh98/mfJAbGps4dpUDTDGiUuzVHQn8oce8oL0kK3c473mClXlq0iFW/7oXO
 ukkg==
X-Gm-Message-State: APjAAAWGsjCsx7gIGJzPezP7qPQMS7DxQpDSEQiQHtDv8dP+QDDe/5kn
 92E6Xde3o6+ug4IzucuQ7lw=
X-Google-Smtp-Source: APXvYqxwmSe9JrA8Nqe8Cu6LF/8yd68XYfT17/pT9PHXIhg3Pa3JuYgXApqhYkPrHPsf3+6NRlbhyg==
X-Received: by 2002:a17:90a:601:: with SMTP id j1mr1872789pjj.96.1564712447882; 
 Thu, 01 Aug 2019 19:20:47 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:47 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 23/34] uprobes: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:54 -0700
Message-Id: <20190802022005.5117-24-jhubbard@nvidia.com>
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
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=R1dyNzOze/eqllrUqxRpjhDn38RC7VsduB92QlfhFLYwuwka43d0Yt9myEGcw6WlZm
 fYIT193clb3cCKkKRa4gQjk01O64tt0BXAAw6nkursyUCEWzk96M/WL6vzziPZU6IL+r
 rvITeJdAvAjJK8q/L91CFM+eVayVF1xEXzXBIhRNt9HdhEGbz9zWiE6QknGvjT5Q+PbG
 0FUQwvdG6OLHf8hS8zvFCr0JHd7YtbTEpJO3//HXWtUvFA/ZCzXGA0y95q3Jed0ZzVaE
 Qk7ZxouFXvlN6jsSJv67cehYgfxqrCWaOQlJqOD886yacjrOWwt50AkY8+51bO/ECErB
 IQTg==
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
