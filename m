Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA97845F4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F10F6E68A;
	Wed,  7 Aug 2019 07:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2758D896A3;
 Wed,  7 Aug 2019 01:34:30 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y15so42511740pfn.5;
 Tue, 06 Aug 2019 18:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQGOdku7Vl3REPvOJ8nTMNJxS9zoi9IIquO7PYdcYIA=;
 b=SxDEMYln7JfB9e5B6NUqE8LvsGCrPIMEqlEBl6GijLNZ1XIgOolfSi0hq6Zfqs9Z2Y
 EpxqlDhGcF2gxjcYmadQ7AAFiB8oXK7PkI1emHFhf9rYWyKjPJg98W4A38ztvU7+wtkT
 TnPqgLV72dihIdyCTqmKu5cWxJ3thQWJ6mHS4w0mCCu+lsSz7Fo0zAk8UT9O7JxrYYdF
 sx13+LGw7QkTGM46djoIPNsUf29w5nbUcguHX1jjWzbDX+f7Oda0+9DMlWyIq4MlLs3U
 yG0CZMVWXYEU2fsM5x+hKa7yXgaleGnWzEUTClYTn7/2PkSlnFgH3UrQnhPdJtU+70WD
 eLPw==
X-Gm-Message-State: APjAAAUjhUsnxG4n0fbLzSaag7K79I69t3Eted60smS3nA9wfdcp1sWY
 hwfwjyH/9peQNXq1FvkjdUFrOCo/
X-Google-Smtp-Source: APXvYqyaoKmDNdUJQD7xvZFSQjCmYuVY+zKJwqcOsFMJXKJ76CQxjmhpKXdBBVyw94JCP/lkY4QWYw==
X-Received: by 2002:aa7:8f2c:: with SMTP id y12mr6988234pfr.38.1565141669837; 
 Tue, 06 Aug 2019 18:34:29 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:29 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 28/41] mm/gup_benchmark.c: convert put_page() to
 put_user_page*()
Date: Tue,  6 Aug 2019 18:33:27 -0700
Message-Id: <20190807013340.9706-29-jhubbard@nvidia.com>
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
 bh=uQGOdku7Vl3REPvOJ8nTMNJxS9zoi9IIquO7PYdcYIA=;
 b=L6PrjOsrS6boUIN/DOymS83vV7YlAKPpT9Xdrfk7ax1OcCgE7PAsCiB8I3wTJde6P0
 jWSZSVN0MQGqPFzlI9I6nQdqRL1oXS8MVgrMBG2RUC/9SCRR/2JXuxH0Bc1AbFhAasOV
 xWwwBWKfNUqmzHZ9usEoeFIoZA0TFhsqfa1vxdEBmkB+UHsGh6j98UqgUEfpOkZ8azEw
 XctfU3/I30ArTXSEYH2C9KRaAbt0v2hqFYnx8WGIkLVSjGqesnYt/lo+Nif4WusFAWAo
 kwn89YnMjOOYX9/SsgW6zCkgnnE6VjyidKN7erx1BI5f02v6uid8cXohhKk4FwCmi1FI
 cYgw==
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpSZXZpZXdlZC1i
eTogS2VpdGggQnVzY2ggPGtlaXRoLmJ1c2NoQGludGVsLmNvbT4KCkNjOiBEYW4gQ2FycGVudGVy
IDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogS2VpdGggQnVzY2ggPGtlaXRoLmJ1c2NoQGludGVs
LmNvbT4KQ2M6IEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVs
LmNvbT4KQ2M6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CkNjOiBZdWVIYWli
aW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXBfYmVuY2htYXJrLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9t
bS9ndXBfYmVuY2htYXJrLmMgYi9tbS9ndXBfYmVuY2htYXJrLmMKaW5kZXggN2RkNjAyZDdmOGRi
Li41MTVhYzhlZWI2ZWUgMTAwNjQ0Ci0tLSBhL21tL2d1cF9iZW5jaG1hcmsuYworKysgYi9tbS9n
dXBfYmVuY2htYXJrLmMKQEAgLTc5LDcgKzc5LDcgQEAgc3RhdGljIGludCBfX2d1cF9iZW5jaG1h
cmtfaW9jdGwodW5zaWduZWQgaW50IGNtZCwKIAlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkr
KykgewogCQlpZiAoIXBhZ2VzW2ldKQogCQkJYnJlYWs7Ci0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsK
KwkJcHV0X3VzZXJfcGFnZShwYWdlc1tpXSk7CiAJfQogCWVuZF90aW1lID0ga3RpbWVfZ2V0KCk7
CiAJZ3VwLT5wdXRfZGVsdGFfdXNlYyA9IGt0aW1lX3VzX2RlbHRhKGVuZF90aW1lLCBzdGFydF90
aW1lKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
