Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E281348
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1676E245;
	Mon,  5 Aug 2019 07:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A9289CDE;
 Sun,  4 Aug 2019 22:50:02 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n190so3535975pgn.0;
 Sun, 04 Aug 2019 15:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAYBkmVoEF3i3+udFKn42Z4HyLG0jAAiACtL32v96bk=;
 b=TBA5sh+w/5lKbE3J+Fg0QwawrP6B8g7PNPMqnazvXuY36cSY5eIT+WptUAjhpp4P0U
 cIm+SB39Gt1Smkc7nksq4sl9w/t8K99LaguQMZXuyEsS0+89/K2SWEt97h6v+MZELzuv
 r8pV4kw7DC6BilRZn7CGIifyWVTCZW6e1nlhgdOw9kDnqYRBXkftAFpuRV30Bcnw+HYa
 45St47h1QVM/F2rjgDu61K+wwRTurT1VBaBpGVDBG6ZbFxIU1FyxS45LvxtJa0x4yFbS
 Lj2ieisbRjv2JoGIIB0WyQOH8EiaMY5xrDclJxmDk4ImDmnIgw+DvRo6EYo45+WA2zhx
 BRmQ==
X-Gm-Message-State: APjAAAWgwl9AkL+T8AyVtxtmfghnFDEau95qQ5i8LK7uC6DXEQajITaX
 FepYjDOr0NdGEtrkQPTgRhM=
X-Google-Smtp-Source: APXvYqxnFD3/8kVar2adJXY1j7ibwpw3u4EZRA3KMnmY1X8dVMpcbjzWPVU1wzddWPe9+8PMCheF4A==
X-Received: by 2002:a63:8dc9:: with SMTP id
 z192mr78564615pgd.151.1564959002300; 
 Sun, 04 Aug 2019 15:50:02 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:01 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 27/34] mm/memory.c: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:08 -0700
Message-Id: <20190804224915.28669-28-jhubbard@nvidia.com>
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
 bh=GAYBkmVoEF3i3+udFKn42Z4HyLG0jAAiACtL32v96bk=;
 b=AhiTy6BwwPX512pCtOjXzDhtmzbgOoiJS/+TVyOQOpgZBJJ3KH2MvMlT06wgQ0OyIE
 yRj5vh0m/7nueGoCFtjCaur9BEfURX9GzhTYKWy0B3aTXsLWtG8nWNwdvuLJmmVnPrhP
 95nQuVNILOT8/qwgmNMhZUxktGIeWYoKF4s7BnIeiizbkSEamO5uEElN38AxJ2A5eBFh
 hUZ0Kt1okRjv7luJmtlo0FzBe+9ghVWNnXfTbLZh+WnsUeeUMycJgCWu3dSBNK1w3TM4
 /0kY40aJkh8f8jXxTbX8I9Uw2iPPUnqs4M2MJ05zm7QPLg8alWzs50lrMgIbZfArqyLV
 LbSg==
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
Cc: linux-fbdev@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Huang Ying <ying.huang@intel.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Souptick Joarder <jrdr.linux@gmail.com>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQW5lZXNo
IEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+CkNjOiBIdWFuZyBZaW5nIDx5
aW5nLmh1YW5nQGludGVsLmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBNaWNoYWwg
SG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFk
ZWFkLm9yZz4KQ2M6IFJpayB2YW4gUmllbCA8cmllbEBzdXJyaWVsLmNvbT4KQ2M6IFNvdXB0aWNr
IEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgpDYzogV2lsbCBEZWFjb24gPHdpbGwuZGVh
Y29uQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KLS0tCiBtbS9tZW1vcnkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21tL21lbW9yeS5jIGIvbW0vbWVtb3J5
LmMKaW5kZXggZTJiYjUxYjYyNDJlLi44ODcwOTY4NDk2ZWEgMTAwNjQ0Ci0tLSBhL21tL21lbW9y
eS5jCisrKyBiL21tL21lbW9yeS5jCkBAIC00MzM3LDcgKzQzMzcsNyBAQCBpbnQgX19hY2Nlc3Nf
cmVtb3RlX3ZtKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwK
IAkJCQkJCSAgICBidWYsIG1hZGRyICsgb2Zmc2V0LCBieXRlcyk7CiAJCQl9CiAJCQlrdW5tYXAo
cGFnZSk7Ci0JCQlwdXRfcGFnZShwYWdlKTsKKwkJCXB1dF91c2VyX3BhZ2UocGFnZSk7CiAJCX0K
IAkJbGVuIC09IGJ5dGVzOwogCQlidWYgKz0gYnl0ZXM7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
