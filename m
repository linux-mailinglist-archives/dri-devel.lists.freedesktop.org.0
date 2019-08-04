Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966781387
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2441A6E2E2;
	Mon,  5 Aug 2019 07:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304AD89147;
 Sun,  4 Aug 2019 22:50:04 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y8so35696390plr.12;
 Sun, 04 Aug 2019 15:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=FN6O/WTdFmuSI4K/66hmhU88F4IRA1v3sulrvLKyoLM0zSex/Ot7b20CL/C7i2TAw6
 bLEy5yJ4UU7XgRMBg1vv8ZNFvwYK2hKJbj3DbPsoPnYtXhNCsX6hW/rN6krh8Khk4vTQ
 dWQ5rg19PP9XIArj4yA2p0ABOJeZ+Q2sT3jiFveyoLkhoImT1dWVS0I1XJfVUPQgiS9y
 b6XHPxk5Ux/LhKz0Kz4ZwjI9//dzdfIZNhEpsLZ/BoDdFoQOB/4jrDx8hvuC8hroafHH
 1LTZwqe9bzWJN22AtY+eMbREkyUhGv1fxEC843ME8ZAG+Ys6pgKbKmG60rMUwl28hi+g
 RzwQ==
X-Gm-Message-State: APjAAAXvYeMVLHYCzcaabWB3fnR3mB/YeBUHm017ic2WcWG4Ty+p+5xH
 1kTvLB3yhCL9V/Sh31Yr7Sk=
X-Google-Smtp-Source: APXvYqwABL/owZcbuKs02BqFh/fswcnIOGTkP8u9lrE9SbNiB96M9TYbiEw8R+LSl6DRBzA56M1pUA==
X-Received: by 2002:a17:902:bb81:: with SMTP id
 m1mr58194086pls.125.1564959003903; 
 Sun, 04 Aug 2019 15:50:03 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:03 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 28/34] mm/madvise.c: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:09 -0700
Message-Id: <20190804224915.28669-29-jhubbard@nvidia.com>
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
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=n2GzADBCRaGfCHf6HbXgRg+V0C89X4GtWNxkv2j3+LQsrqKpmTUVe0ByTHKQwdeBJn
 2GjNEQhUsYm7dhY4Od2Sd6r20534hykhUqRe4t1VnKwQ4DMvNZ5YhS01Fzzgrjh0SFnz
 cOALy97h5W1lbkzKyPwHr+vFBFBbcXlcy5zpFAQBNWN4n0Cj0kftmPhY24PBwGy3tLN5
 iaVwvJuxvheoQgKbgYArnZAnGqCyndt7VZwBKzGO0BC6OrGMqarpUlPnyV+UVYDmCU/k
 M/mEk0A479arzsza58VY7eIxZdZ0ZSau4HrT6ltuIf1VzdnlaHlbMs8Cfp7zJmoWUVEJ
 eBOw==
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
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Daniel Black <daniel@linux.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBEYW5pZWwgQmxhY2sgPGRhbmll
bEBsaW51eC5pYm0uY29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IErDqXLDtG1l
IEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+CkNjOiBNaWtlIEtyYXZldHogPG1pa2Uua3JhdmV0ekBvcmFjbGUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbW0v
bWFkdmlzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbWFkdmlzZS5jIGIvbW0vbWFkdmlzZS5jCmluZGV4IDk2
OGRmM2FhMDY5Zi4uMWM2ODgxYTc2MWE1IDEwMDY0NAotLS0gYS9tbS9tYWR2aXNlLmMKKysrIGIv
bW0vbWFkdmlzZS5jCkBAIC02NzIsNyArNjcyLDcgQEAgc3RhdGljIGludCBtYWR2aXNlX2luamVj
dF9lcnJvcihpbnQgYmVoYXZpb3IsCiAJCSAqIHJvdXRpbmUgaXMgcmVzcG9uc2libGUgZm9yIHBp
bm5pbmcgdGhlIHBhZ2UgdG8gcHJldmVudCBpdAogCQkgKiBmcm9tIGJlaW5nIHJlbGVhc2VkIGJh
Y2sgdG8gdGhlIHBhZ2UgYWxsb2NhdG9yLgogCQkgKi8KLQkJcHV0X3BhZ2UocGFnZSk7CisJCXB1
dF91c2VyX3BhZ2UocGFnZSk7CiAJCXJldCA9IG1lbW9yeV9mYWlsdXJlKHBmbiwgMCk7CiAJCWlm
IChyZXQpCiAJCQlyZXR1cm4gcmV0OwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
