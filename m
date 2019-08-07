Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B8C845F5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAAF6E688;
	Wed,  7 Aug 2019 07:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC6F6E589;
 Wed,  7 Aug 2019 01:34:10 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id c2so38564448plz.13;
 Tue, 06 Aug 2019 18:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=edb+3MNllr0fPksAT1jxCF4w6bTDy7ORcXTf/teyZpC2Q48IOx1gxptMHncl+MLnsv
 N3UKSnQzFyv2PVgT2H/ELLmJvqcRbSIdXGyfldVgnF88CuJ90MnTXVil6t6gprW8+DXO
 fHQhVg513rklOYgO2QGCAHYqT5iTf/PWq/tPtyy1LgW5U1uIrj3Fr0zNBkvlyW6PYojV
 u6SSslh+K2Sjq5Cu0Ihy4dcrFMeEBOwLE7BJE47eQFidYvZcyAUEYo5QQtYJ2VOgrThi
 zgSWkF9fRyDMqXeFHwgo6hfgPw8kdACQWNU6tOC0XG262fGr1pC9Y3Agj+YM9PnQODIO
 lMEw==
X-Gm-Message-State: APjAAAVyQz1Oi4jYhJ6URnokbKpJdQ4cCCn0wucJVop7FKVT01NwLSaV
 fCsGO6yr3jqAB3bvEbXoi8U=
X-Google-Smtp-Source: APXvYqwoNo1PQmUv0ey0ILQvIwCoxxeyMFQeV7g8XASyN0XYGLEtQs3kplEx5vqWyqtJhS4NAvKAHg==
X-Received: by 2002:a17:902:20e5:: with SMTP id
 v34mr2979392plg.136.1565141650096; 
 Tue, 06 Aug 2019 18:34:10 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:09 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 16/41] oradax: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:15 -0700
Message-Id: <20190807013340.9706-17-jhubbard@nvidia.com>
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
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=EFr+1Ao3qBWmnJE02e7LcpB6YUVuRVbr9fx2rTH0O8yhq0D77M0YGPm0P+jSp6Jtuq
 2YlUZC321Nw3VSKn/00GLAANBgeiSrRJFaGZRoVjMnZ04FL9NLT6sKwnd0vV7JxKBdum
 Sqd0ag8jbhm9lcgz/XGxcy282zyTuU0Inaax4Btd/pAUlY3wTglSAc2wTFu9hSsedu/U
 Ux8BLgDEL4leQ7GXOOnEQmGonJeNt4nNmRZIhNi+Q94mV14xLfJWcwz4/pgXWu55VGQ6
 7Ogfd27qokaRQiNc+s9HO/wimpOVcSkVDqUWnVlQuzAm83PkUtGh2xlJDzKo+0GLPz99
 7D+w==
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
