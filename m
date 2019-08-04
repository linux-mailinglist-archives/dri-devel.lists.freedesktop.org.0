Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA48134C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D546E28F;
	Mon,  5 Aug 2019 07:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4CF89DC9
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 21:40:48 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id ay6so35688315plb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 14:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SsIRGkPWeq5HvTZzTxF/TGZYHjIKFiRIBMhKcsnvtic=;
 b=dm1WS4ehwymwjS9ZNouE9XtO3mPKh3hfUdRNx4WAHxUfgvIFjARIatusqZfth0WMnA
 1akbVdzsqJSnW5wPZVIn+63qeXxT0jQoMtmdiowOevzur4r74uKahmJKWqqgHJITUzQV
 T9KINjIQKYuiPJKS98th9eh1SFTj28ehdyEyzGQ/DzxSSskEU7kGjd9tP2k6FutaYquV
 y8rlqMbnv7GCoIPEjf+xYXiTI0XuIF9XCialIoZgsy4vXZi0hfFZoALyPSO43Ff6lKu4
 CRlRzmWffEDp2RYxwHzNwwcVt1ClyW0gze1pMXsRTS5/dRzjml5pbCMuqsfClgVO0dl8
 2RZg==
X-Gm-Message-State: APjAAAUzMqDuPkSJuCv3CMEYXSZs45tMcw1QZfUF0bgl01x+oK3ncJI2
 Hbg8+hQnoK6k1Ov1QpMqkas=
X-Google-Smtp-Source: APXvYqydipLt//yx7Zzw8Y7M/UPDM4z+2keifWIA9ZuDE301mL9AEMh6QPc9OqCc5SJgqPJLA9fETg==
X-Received: by 2002:a17:902:16f:: with SMTP id
 102mr136326006plb.94.1564954848548; 
 Sun, 04 Aug 2019 14:40:48 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 143sm123751024pgc.6.2019.08.04.14.40.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 14:40:47 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 2/3] drivers/gpu/drm/via: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 14:40:41 -0700
Message-Id: <20190804214042.4564-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804214042.4564-1-jhubbard@nvidia.com>
References: <20190804214042.4564-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SsIRGkPWeq5HvTZzTxF/TGZYHjIKFiRIBMhKcsnvtic=;
 b=H+p30VSjG2bf5AhOggB5BMZsW4m9risk1SBKygWZEa4RLF2QVvj46onSB9Iu63cBhz
 /42BdWC1CpQTI/gGo4HQcAmlqUhbQCDZyO1er4CKT+ES4DgPE9pjxTxvrM2Ml2etyUAT
 1Jtn0wq64e1geuJnx4qMRvHAZBG/LKpdwbNiHwhnrbMTIkPJsHZzbHJBHtuUZ+gVzsbV
 zw4cg6zSDS23YxXKB9O6N3MS4xcetMMvqcuy9hwn1XOQsF1ghps+HImfUVntNxOD9trO
 /ykc4DpaFmLktsZjHWpryrOPu7Yfj6Ao/n7wqskKVhmAebiL+EbFEYmmU1Z31P50MkGX
 IaUA==
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
