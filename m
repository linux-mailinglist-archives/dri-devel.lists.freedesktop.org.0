Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0027712A0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416C06E14C;
	Tue, 23 Jul 2019 07:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DF3892A0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 22:34:22 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f25so18326627pgv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5rDEOeFRvjrpBGS4dvuQZ6SJfLiKadFXLHgUye++Ig=;
 b=OI8KeoYRxbYKqfXwfSy+NgUrv/jw2h1+t3nvWrUIPIV+p1Id8tjrgRjC2G8SNqBF53
 U5NjSiOQbSE5X2dbeUCRooSGZURGbV6nvoevhGzU4FRApE4n765SpftJwEhaWOHAFkww
 imqJ2ZS8w2r/pxsIPdXLhenRQ8fMjjGdgJ+Xnzd164E0xxkdk1jJzcTOlYLZydIphDUy
 FCf5CfKkTeVf37Pm+xJKTz34k9r5F2GH878BMKHdUjaKoKdExJb7ExRvIXKG/o18IZZl
 scvBW3cUzdSFy0GqzHa23SztaN7202T4dF66BEGHEMDRkhvbFeN9tKrrWA6K+HHnvJVw
 y4Ew==
X-Gm-Message-State: APjAAAVXfUHdrZbCceDjGZhaEIl95me6qUhV3Z6siAu+QyOI7JljSECH
 kYgkRgzWcJjSpd9HBTmULm0=
X-Google-Smtp-Source: APXvYqy5ILwW5Vkz7E3PJko1LlOqyK0nYxF3IsZhHj5oXXw0vxfHVHN4Sbd1j+lEz3Chtbcoljrf1w==
X-Received: by 2002:aa7:8705:: with SMTP id b5mr2598762pfo.27.1563834861925;
 Mon, 22 Jul 2019 15:34:21 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r18sm30597570pfg.77.2019.07.22.15.34.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 15:34:21 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/3] drivers/gpu/drm/via: convert put_page() to
 put_user_page*()
Date: Mon, 22 Jul 2019 15:34:14 -0700
Message-Id: <20190722223415.13269-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722223415.13269-1-jhubbard@nvidia.com>
References: <20190722223415.13269-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H5rDEOeFRvjrpBGS4dvuQZ6SJfLiKadFXLHgUye++Ig=;
 b=Pcs9/tR3DaHZa4DyTRc+V1EBVautcG67Y8Rlu5OVhq9gKq6GUPJQe1wcWgSdEsQ2Kq
 Radfqy6wlFYNzaWH7qZJhs5OiX9krJynNgS9czJHFLw45UEGbEegviTKLi3BYeTqppE6
 wClCxR/cc9fseFTseNMdctyP1DsHiAKbtD3vrFPJ63NuNCU9kcF/wCkCf+3/B3Q0czjq
 ukVZJzmrau8htl9Bla/qPE0ArxviXBYhsjitL4/aZ7mWfpykEpu6jiXE0UB7wdf00smi
 8G8KNFJh7oVyyxUX3OS2FzQaqS9mTboIDnjdqYM5MTevgkbFpW/jwrfFQHv/btHh152l
 vo1Q==
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
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Johannes Thumshirn <jthumshirn@suse.de>, Ilya Dryomov <idryomov@gmail.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ming Lei <ming.lei@redhat.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yan Zheng <zyan@redhat.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpBbHNvIHJldmVy
c2UgdGhlIG9yZGVyIG9mIGEgY29tcGFyaXNvbiwgaW4gb3JkZXIgdG8gcGxhY2F0ZQpjaGVja3Bh
dGNoLnBsLgoKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyB8IDExICsrKy0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS92aWEv
dmlhX2RtYWJsaXQuYwppbmRleCAwNjIwNjc0MzhmMWQuLjc1NGYyYmI5N2Q2MSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS92aWEvdmlhX2RtYWJsaXQuYwpAQCAtMTcxLDcgKzE3MSw2IEBAIHZpYV9tYXBfYmxpdF9mb3Jf
ZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogc3RhdGljIHZvaWQKIHZpYV9mcmVlX3NnX2lu
Zm8oc3RydWN0IHBjaV9kZXYgKnBkZXYsIGRybV92aWFfc2dfaW5mb190ICp2c2cpCiB7Ci0Jc3Ry
dWN0IHBhZ2UgKnBhZ2U7CiAJaW50IGk7CiAKIAlzd2l0Y2ggKHZzZy0+c3RhdGUpIHsKQEAgLTE4
NiwxMyArMTg1LDkgQEAgdmlhX2ZyZWVfc2dfaW5mbyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwgZHJt
X3ZpYV9zZ19pbmZvX3QgKnZzZykKIAkJa2ZyZWUodnNnLT5kZXNjX3BhZ2VzKTsKIAkJLyogZmFs
bCB0aHJvdWdoICovCiAJY2FzZSBkcl92aWFfcGFnZXNfbG9ja2VkOgotCQlmb3IgKGkgPSAwOyBp
IDwgdnNnLT5udW1fcGFnZXM7ICsraSkgewotCQkJaWYgKE5VTEwgIT0gKHBhZ2UgPSB2c2ctPnBh
Z2VzW2ldKSkgewotCQkJCWlmICghUGFnZVJlc2VydmVkKHBhZ2UpICYmIChETUFfRlJPTV9ERVZJ
Q0UgPT0gdnNnLT5kaXJlY3Rpb24pKQotCQkJCQlTZXRQYWdlRGlydHkocGFnZSk7Ci0JCQkJcHV0
X3BhZ2UocGFnZSk7Ci0JCQl9Ci0JCX0KKwkJX19wdXRfdXNlcl9wYWdlcyh2c2ctPnBhZ2VzLCB2
c2ctPm51bV9wYWdlcywKKwkJCQkgKHZzZy0+ZGlyZWN0aW9uID09IERNQV9GUk9NX0RFVklDRSkg
PworCQkJCSBQVVBfRkxBR1NfRElSVFkgOiBQVVBfRkxBR1NfQ0xFQU4pOwogCQkvKiBmYWxsIHRo
cm91Z2ggKi8KIAljYXNlIGRyX3ZpYV9wYWdlc19hbGxvYzoKIAkJdmZyZWUodnNnLT5wYWdlcyk7
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
