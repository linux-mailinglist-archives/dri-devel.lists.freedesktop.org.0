Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885647EECF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46CB6ED16;
	Fri,  2 Aug 2019 08:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC986E860;
 Fri,  2 Aug 2019 02:20:45 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t132so35228304pgb.9;
 Thu, 01 Aug 2019 19:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=uMLRfGPQeAVjbVrZk7efejxioMktUyqFlTHsMkVGcufUV0jqXXlowq5rTSQTNvfbZ1
 urcZScPIk52HBHZ051RDo+XxQ4dmaPHcZBkhKMXuNF5cIT6kBoahpVxBcLbThG8VaEyp
 GwspryWSHtygZeFtYKIN7j/kohOXuf5PFfV8zaSvUyKyXRs94sYo1OeXbwTelRP4qJ8y
 cofINQNejQn2Zj/827xFueFZDgQ1VztARJ7GNcVuf8iaSKEfcjzpgBKBtlS0SwM/pgc1
 e09uzeZtAXH8OvVI9FFf8e60JvD9EHD+FINK2UQfLtqDpGEKDIOCO2rDLYwTlx3/I6W4
 KNaA==
X-Gm-Message-State: APjAAAWRVOEeQ7DBiRcqvqq7qZ5KE3u71Uc9yT7JzViy6NQid3eXIzwY
 HtqI+Ii2zAvi2vF4MMokk4ltUJ1U
X-Google-Smtp-Source: APXvYqyrk8OHD0K9x3jg/zl4sLls8epCiHibtZqTP4ohZ230SxHbnF+YASroUXHGf8XghjTINYs0fA==
X-Received: by 2002:a17:90a:b394:: with SMTP id
 e20mr1897367pjr.76.1564712444816; 
 Thu, 01 Aug 2019 19:20:44 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:44 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 21/34] fs/exec.c: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:52 -0700
Message-Id: <20190802022005.5117-22-jhubbard@nvidia.com>
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
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=p2jdLnF+o2jszv2jswOdGKVlOI6oap0/O8UoWJ6UXd1vWJ7ZTNuGXBJzfbZP+U3/qi
 otCtgNo0FYJGbVJMagQHVxCjJNv9DsL+tAgpbtcseuLRjx2D2oJRJvb8QUEovItoJ4yu
 tqM1+sKVNJqdRAOn+U29/OmuIVN0dCZaqyMULYrLeNzvWGSINvgRw2ctCEPTtpJHvG4Y
 9Lt1J9Pu4o6vmxc1Dlj1+fWckvxFMkS2v0xzgYEyRXbpmL6oLpAd8HeumDihMK2pn/qS
 boIjYLobOad+m+G9IYsoBFXJgOFcyiWgGfoj3yVWjcIkFyKdq3aTzC8VwLjAVimMrt3Q
 7cZw==
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
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQWxleGFu
ZGVyIFZpcm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPgpDYzogbGludXgtZnNkZXZlbEB2Z2Vy
Lmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEu
Y29tPgotLS0KIGZzL2V4ZWMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2ZzL2V4ZWMuYyBiL2ZzL2V4ZWMuYwppbmRl
eCBmN2Y2YTE0MDg1NmEuLmVlNDQyMTUxNTgyZiAxMDA2NDQKLS0tIGEvZnMvZXhlYy5jCisrKyBi
L2ZzL2V4ZWMuYwpAQCAtMjI3LDcgKzIyNyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqZ2V0X2Fy
Z19wYWdlKHN0cnVjdCBsaW51eF9iaW5wcm0gKmJwcm0sIHVuc2lnbmVkIGxvbmcgcG9zLAogCiBz
dGF0aWMgdm9pZCBwdXRfYXJnX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7Ci0JcHV0X3BhZ2Uo
cGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKIH0KIAogc3RhdGljIHZvaWQgZnJlZV9hcmdf
cGFnZXMoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSkKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
