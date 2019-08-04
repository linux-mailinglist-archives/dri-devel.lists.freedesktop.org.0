Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB88134A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3017189F5F;
	Mon,  5 Aug 2019 07:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F2989C29;
 Sun,  4 Aug 2019 22:49:30 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b7so35728904pls.6;
 Sun, 04 Aug 2019 15:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2GwgSJoRuvPfZ2J7Awdgxw+WyrY01QvDnyFb1fV9Xk=;
 b=kHu4OQyaejz0/sKXLZiWDGNvvSKvFpk5iw2zsSPhJ/qOAPhhEl8zxZVBbKA0+Nd79M
 pW6OKpKBJCAGIw4qbdpk8OTS1SKgg/PSZk6VYmbTDje0n7kbWc+D99GU7r9ZyqdqXKh3
 atm8SSfjOC4fn/1prBJ8cEYdXSmEUKRi5CpULJtEk+JQ8lgR1ok2/bF3lDYTd5q+dCYs
 xDvNM1A/4iPGVELkiLlEIMtkxe0iFEQ8ObPWHFR4gM64HJbQ8eSkIS2gyIK+sJYTU7g8
 5v5mKATVSROgm5GTQ1SRmVat/ZtQv3ZcIMSL21+adynlg8nSrG1SgdiElnXl4Y/J3SPf
 hYyg==
X-Gm-Message-State: APjAAAX/F5VY76AvH1WI8t0nV/7uXy9j8rC1wryDKqJvPrL3kQDvtiMK
 y0r50ZtPhI59IBs0NdYxWNA=
X-Google-Smtp-Source: APXvYqzkwKiNRyTGG1wY4vsK+VenpXGpZnU+FOR0NniR/kq9Ywi59tDMXfkUVow9nHIhYFHAcQFleQ==
X-Received: by 2002:a17:902:e282:: with SMTP id
 cf2mr143340556plb.301.1564958970256; 
 Sun, 04 Aug 2019 15:49:30 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:29 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 07/34] drm/radeon: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:48:48 -0700
Message-Id: <20190804224915.28669-8-jhubbard@nvidia.com>
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
 bh=o2GwgSJoRuvPfZ2J7Awdgxw+WyrY01QvDnyFb1fV9Xk=;
 b=IixwRKA1QE3hWrmSzVu2XYy+JWLjNAQrucyf3NmNwYmsVM90KnIP/Y31YnkjOev47U
 W5BLgfFrXSW8PROIAFlomTaKNpVy1Vu5By67adxMe4BBJxN/wVE8FkT1LMOB065Mk0v2
 mSKCOGzenGHlXCxavESBy8UzJUM5v3SbHyYItPfvN0BCRa3ugcdFoCHED6cZcBJjkH8M
 ktZ6/qTMPJteWEcAIxyF4khSUAdUalV8iDMz2BZGmRYRaKNynSgB+6FWP696OD7W7rKp
 ihl6Zic4VgOX9hVo+fby0upSQX/BJURRdR3g7cpl9a4Zd0ppOamvzLqwtGuG3Jg66+lE
 8+nQ==
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgKENodW5NaW5nKSBaaG91IDxEYXZp
ZDEuWmhvdUBhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl90dG0uYwppbmRleCBmYjM2OTZiYzYxNmQuLjRjOTk0M2ZhMTBkZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAgLTU0MCw3ICs1NDAsNyBAQCBzdGF0aWMgaW50IHJh
ZGVvbl90dG1fdHRfcGluX3VzZXJwdHIoc3RydWN0IHR0bV90dCAqdHRtKQogCWtmcmVlKHR0bS0+
c2cpOwogCiByZWxlYXNlX3BhZ2VzOgotCXJlbGVhc2VfcGFnZXModHRtLT5wYWdlcywgcGlubmVk
KTsKKwlwdXRfdXNlcl9wYWdlcyh0dG0tPnBhZ2VzLCBwaW5uZWQpOwogCXJldHVybiByOwogfQog
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
