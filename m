Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C87289F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAF789FEA;
	Wed, 24 Jul 2019 06:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C32C6E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:26:13 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id u14so20040932pfn.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 18:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SsIRGkPWeq5HvTZzTxF/TGZYHjIKFiRIBMhKcsnvtic=;
 b=YxfSoocFO1zajrr2ZUKtQ2C9w8ZS4N1aH76/j9wqnxteSTZzX1Egb1QSG2rnsf/i9k
 0cXhBnvm4hpiV7qN+mR96StwNt8kwiNiby7SV7LX/gaBLTsPA2APWMsALsLL4/ddd511
 4YaDL1xNX5HvoeqIARSEbM++txm0HIm2fk5uz5Q/zDCHqu+mO5KB+co/5dFAG7gXPMed
 xKMDS1TGUJ9ZZgMbqb9y7LblIdT6DedMM0RYeJHKZ23W33pUOiggzuI4sGYrsbbMrkHf
 YtP+Ua8sj2+XhoB+jVuMGdGzVd3kyczJdrv0wV4xKxPWQ/hjc0rp3UhYYzK6R2/FLqcY
 CFZA==
X-Gm-Message-State: APjAAAXzeGqnLFAJVf5i4KJ4EUv/PwwnnFOGCkytGcTJTUxr+XT2JKbO
 tUIPrdeevRu4IofLOvq1xBM=
X-Google-Smtp-Source: APXvYqwiARTqBX+BzXGVMSiMYY2ywuebKHgAP9ok+GCLfuKMFIizwJOl34+Vo9ygsJn6Z3ecH0s+Ow==
X-Received: by 2002:a63:490a:: with SMTP id w10mr77642193pga.6.1563931572866; 
 Tue, 23 Jul 2019 18:26:12 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 k36sm45950119pgl.42.2019.07.23.18.26.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 18:26:12 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 2/3] drivers/gpu/drm/via: convert put_page() to
 put_user_page*()
Date: Tue, 23 Jul 2019 18:26:05 -0700
Message-Id: <20190724012606.25844-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724012606.25844-1-jhubbard@nvidia.com>
References: <20190724012606.25844-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SsIRGkPWeq5HvTZzTxF/TGZYHjIKFiRIBMhKcsnvtic=;
 b=OWgPLaU3grtQYfYlP989m4hDqCY0ebI6/NdlbTukxlvyq11BxlHjkqN3hD9v30eXop
 EG5XcRymjdkeuqUefZiFos4WvvjABKFpbsNii0SJgJLYNmAuW/FgFPitHO+2/3McUV+7
 gf56g8I7oolPT/XjyQlyJvxXGT9o0Tu+Faj3GJRN83dbqyEdOZuIUG6zQmH21j9c8JN1
 CA/rkJKw8eGWS4zO87DNqwXtLIaNHKrSMu5zMWSkni8YHEGOTZRgi0t/AK2jYfN3o74B
 SwC/fjv0b2UQOsULLgn4oGhZFx9tErfDTI6/TzoSyDwqgD9ppDPsMbY1I5zyCPDekHFd
 ripQ==
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
IGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyB8IDEwICsrLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpYS92
aWFfZG1hYmxpdC5jCmluZGV4IDA2MjA2NzQzOGYxZC4uYjViNWJmMGJhNjVlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZpYS92aWFfZG1hYmxpdC5jCkBAIC0xNzEsNyArMTcxLDYgQEAgdmlhX21hcF9ibGl0X2Zvcl9k
ZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiBzdGF0aWMgdm9pZAogdmlhX2ZyZWVfc2dfaW5m
byhzdHJ1Y3QgcGNpX2RldiAqcGRldiwgZHJtX3ZpYV9zZ19pbmZvX3QgKnZzZykKIHsKLQlzdHJ1
Y3QgcGFnZSAqcGFnZTsKIAlpbnQgaTsKIAogCXN3aXRjaCAodnNnLT5zdGF0ZSkgewpAQCAtMTg2
LDEzICsxODUsOCBAQCB2aWFfZnJlZV9zZ19pbmZvKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBkcm1f
dmlhX3NnX2luZm9fdCAqdnNnKQogCQlrZnJlZSh2c2ctPmRlc2NfcGFnZXMpOwogCQkvKiBmYWxs
IHRocm91Z2ggKi8KIAljYXNlIGRyX3ZpYV9wYWdlc19sb2NrZWQ6Ci0JCWZvciAoaSA9IDA7IGkg
PCB2c2ctPm51bV9wYWdlczsgKytpKSB7Ci0JCQlpZiAoTlVMTCAhPSAocGFnZSA9IHZzZy0+cGFn
ZXNbaV0pKSB7Ci0JCQkJaWYgKCFQYWdlUmVzZXJ2ZWQocGFnZSkgJiYgKERNQV9GUk9NX0RFVklD
RSA9PSB2c2ctPmRpcmVjdGlvbikpCi0JCQkJCVNldFBhZ2VEaXJ0eShwYWdlKTsKLQkJCQlwdXRf
cGFnZShwYWdlKTsKLQkJCX0KLQkJfQorCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHZzZy0+
cGFnZXMsIHZzZy0+bnVtX3BhZ2VzLAorCQkJCQkgICh2c2ctPmRpcmVjdGlvbiA9PSBETUFfRlJP
TV9ERVZJQ0UpKTsKIAkJLyogZmFsbCB0aHJvdWdoICovCiAJY2FzZSBkcl92aWFfcGFnZXNfYWxs
b2M6CiAJCXZmcmVlKHZzZy0+cGFnZXMpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
