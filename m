Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B30845AC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEB36E620;
	Wed,  7 Aug 2019 07:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5CE6E588;
 Wed,  7 Aug 2019 01:34:17 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id x15so32193018pgg.8;
 Tue, 06 Aug 2019 18:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=MXsHelic/cBM6EiUm5aI6+Ptdg1OJYhiel9uve14/e7s19zPAymT7dzHp+ggmywHRo
 nGx6V8RsnP4E/VPVPeUdk3n0ry5jJrCdgw68Td9zgUVCbhCORg93I1BHAj6eb2+8o3ue
 LfWItOAGCnAt93bQYE6Ba/cHcU1h1IH8XPhRtv+BRAwK6PJPrCXZKrj8KHC+n1HADp0I
 WHLynwnusSV6JPtnkRA5dUjeklIwc9w7Ii0CWx86aqL1OsVI/Rm1bsCj7xMxnuxmwslz
 09lbYRqN+CDW5m6qiaUQicHAx/i8D01ak7wNGZ2Ls1yyJdOq13/gsYyM/ps74lHp2Ajy
 TMhw==
X-Gm-Message-State: APjAAAU+ju3piLEq8VXCnjhqXtOd+Xs/E5wIo98St3tx6KIWQgqm+j4H
 MYeykoCdDPsFBh8dy8696/o=
X-Google-Smtp-Source: APXvYqzgZPQySecfl1w9rbSdSUoujeX96j23T70OrIYhDcbszTpXzwBQIEpy9+PmeMFp8KmBYei+SA==
X-Received: by 2002:a63:dd17:: with SMTP id t23mr4918609pgg.295.1565141656992; 
 Tue, 06 Aug 2019 18:34:16 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:16 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 20/41] fbdev/pvr2fb: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:19 -0700
Message-Id: <20190807013340.9706-21-jhubbard@nvidia.com>
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
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=SC6fy0nJ+5PJ+uzUodkQNgZrF01XL4oLeLC56OFBk8WNdVXJEhXdfnbycjiEGLb0We
 Iu9ehQr2XuhNar0+cOOcnuWTDzgnJQOZf2nhFq9SkSbfMVKKQlgbBbr/DzgGJpA2zgNE
 SH9LdtGtZEDMK2ObSXiKnb7p35+i1ZPY62UTf23m8h6lM8RDSVmojjsKFFq6AHV0Kg7N
 l0Mr0PozM18bgs6gsyipPgOwh2HesyAFpZqdTaDseaeVgz0a/Wn16vsKh7i90SBwvo7N
 ssA83RPwWAs18iPpiVevS9yzToDMKktmsaAXU8RmgcEKrZ1Ps1HBX3IeUwmveghlYyG8
 ruRQ==
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
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Arvind Yadav <arvind.yadav.cs@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Bhumika Goyal <bhumirks@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQmFydGxv
bWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogS2VlcyBD
b29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4
Lm9yZy51az4KQ2M6IEJodW1pa2EgR295YWwgPGJodW1pcmtzQGdtYWlsLmNvbT4KQ2M6IEFydmlu
ZCBZYWRhdiA8YXJ2aW5kLnlhZGF2LmNzQGdtYWlsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2Zm
LWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy92aWRl
by9mYmRldi9wdnIyZmIuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIu
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZiLmMKaW5kZXggN2ZmNGI2Yjg0MjgyLi4wZTRm
OWFhNjQ0NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZiLmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYwpAQCAtNzAwLDggKzcwMCw3IEBAIHN0YXRpYyBz
c2l6ZV90IHB2cjJmYl93cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29uc3QgY2hhciAqYnVm
LAogCXJldCA9IGNvdW50OwogCiBvdXRfdW5tYXA6Ci0JZm9yIChpID0gMDsgaSA8IG5yX3BhZ2Vz
OyBpKyspCi0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKKwlwdXRfdXNlcl9wYWdlcyhwYWdlcywgbnJf
cGFnZXMpOwogCiAJa2ZyZWUocGFnZXMpOwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
