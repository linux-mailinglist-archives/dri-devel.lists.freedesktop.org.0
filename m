Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3807EF02
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABFE6ED36;
	Fri,  2 Aug 2019 08:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8316E864;
 Fri,  2 Aug 2019 02:20:34 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id m30so35164717pff.8;
 Thu, 01 Aug 2019 19:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=dtBM3HN1rg+ySJFwh4VPwuJ63PfLkCTp4FUD9bsyJQVhfw8GO3lYj06mt+P3FpdS98
 TovFjv4A2l0HqAOuo2Kda0zZEkLJZj+l9/ZRl60BIkahCY+aH9syCc8/vi5/+PJKrpa1
 I5WG/e9+eJQV4WQt6wt41WwQjwSghr+T1bX3jMVjaWHLPvsMdZHu4QMDusfe6URRoQCd
 MLUaZXOO2Zh/GNgV8AmRAZkIhY6uy4oY+mW+Zyrb+S+EpraL34uICfPOL3UB6LEqopGk
 ZaeVzvhpgq+pZAPt8u29bknsavBBoVMkySKKBJyOD6A9dlAqgzlzky3wDkKEVlEOnanw
 4GQQ==
X-Gm-Message-State: APjAAAUvs/U39zi1cqCsoOYRekR/4J4phgvjZau/V6sZIVvVy6ojPHNS
 bmHiXEeMObFzzhNRKAxlZW4=
X-Google-Smtp-Source: APXvYqxawjrrBWhVHWqru35UkhsNUwOEktD3Ze9ukSGMVZSHmBDx+KHUyZVGOPhrL6EFpIA4EvvUgw==
X-Received: by 2002:a63:b64:: with SMTP id a36mr113099405pgl.215.1564712434076; 
 Thu, 01 Aug 2019 19:20:34 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:33 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 14/34] oradax: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:45 -0700
Message-Id: <20190802022005.5117-15-jhubbard@nvidia.com>
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
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=F6zwcO4LIlIH0MhJxHttCJTdvFyVFQT/4arw8VEiUMf3H4eEoUX+759aMNEB4E5yQk
 Nz2fCbsNakzpI2Ix1oQ23cChuh59P2OEpLwWSX6x9IY/wvMOZe6lEWSb2zFdzp0gprdi
 y9rnyWNc6RyhaZMvzhG8ve4bXMhMFks51tm4rHvgstN2tswx5ZOG0+I0UrLn8K8liKz6
 o59abaE04tV7AfXXxMZta+A8VG8S0kkDg1uyI4tR9b3t+a4fVwe1pYra9FjftWzgoUTS
 x4tLp6R3lAg/evT8dl18ZgG3qJOUMIaQFDribAsCQyGjHMfkpuycFyZQ36o14QJqnxy+
 vrdA==
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
Cc: linux-fbdev@vger.kernel.org, Rob Gardner <rob.gardner@oracle.com>,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Wei Yongjun <weiyongjun1@huawei.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Jonathan Helman <jonathan.helman@oracle.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGF2aWQg
Uy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpDYzogSm9uYXRoYW4gSGVsbWFuIDxqb25h
dGhhbi5oZWxtYW5Ab3JhY2xlLmNvbT4KQ2M6IFJvYiBHYXJkbmVyIDxyb2IuZ2FyZG5lckBvcmFj
bGUuY29tPgpDYzogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgpD
YzogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4KQ2M6IFdlaSBZb25nanVuIDx3ZWl5
b25nanVuMUBodWF3ZWkuY29tPgpDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3Nh
bXN1bmdAa2VybmVsLm9yZz4KQ2M6IHNwYXJjbGludXhAdmdlci5rZXJuZWwub3JnClNpZ25lZC1v
ZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL3Ni
dXMvY2hhci9vcmFkYXguYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2J1cy9jaGFyL29yYWRheC5jIGIv
ZHJpdmVycy9zYnVzL2NoYXIvb3JhZGF4LmMKaW5kZXggOGFmMjE2Mjg3YTg0Li4wMjllNjE5OTky
ZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2J1cy9jaGFyL29yYWRheC5jCisrKyBiL2RyaXZlcnMv
c2J1cy9jaGFyL29yYWRheC5jCkBAIC00MTIsNyArNDEyLDcgQEAgc3RhdGljIHZvaWQgZGF4X3Vu
bG9ja19wYWdlcyhzdHJ1Y3QgZGF4X2N0eCAqY3R4LCBpbnQgY2NiX2luZGV4LCBpbnQgbmVsZW0p
CiAJCQkJZGF4X2RiZygiZnJlZWluZyBwYWdlICVwIiwgcCk7CiAJCQkJaWYgKGogPT0gT1VUKQog
CQkJCQlzZXRfcGFnZV9kaXJ0eShwKTsKLQkJCQlwdXRfcGFnZShwKTsKKwkJCQlwdXRfdXNlcl9w
YWdlKHApOwogCQkJCWN0eC0+cGFnZXNbaV1bal0gPSBOVUxMOwogCQkJfQogCQl9Ci0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
