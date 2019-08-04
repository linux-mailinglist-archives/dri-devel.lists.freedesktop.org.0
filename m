Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4541881388
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACAF6E2D6;
	Mon,  5 Aug 2019 07:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01FA89DE1;
 Sun,  4 Aug 2019 22:50:11 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id f17so34607597pfn.6;
 Sun, 04 Aug 2019 15:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rv0dCo+fqAQ13SgPxACDlFOa16RsKjSPlFe+eBoZNRU=;
 b=K4PlFEe4vzwdIYfi3fRRSYCkkJulCwNfsxZkBHSY7lJIkdURPgssJBPODOogf5WEJG
 +XtJXA2tKSox2A5XF/o/AytIzdOYF3BFGhlU0X7GvMjynC0okzgH/XITnmTLbi8REZ0Z
 6Z2kHL7FYYeY/56Cht7XrPomAnf+N+PFeVtIjzfpnOSYYQ3LSRWEo6HcBJxoFTHUr9A2
 5v4zIlBlY8ZjHJGXUlY6eJiQN8Pvq4TobGz4o5EQm5LfLqXzaUFhlbCGxoS08i+hZQPM
 Nimu/YkTgM5fFf8zIniw23A2QdkGewGcJwlIvkNzd10Sh3i9DY/GC6y/RkFPxZH2+If0
 s/CA==
X-Gm-Message-State: APjAAAVfXHccjpwqRNI1HB7MO5YgzvAGwy9MzflGmUsO4INxkBYZSGrY
 eCLQ0An/9Bpu00REIiQr46c=
X-Google-Smtp-Source: APXvYqxvM1qX7vPDXvngph7SDjRt5A72CS0QHjJHMrDwzL+npYmbY1LXNKjG2Jciqo+k4AO5Wz8/Mw==
X-Received: by 2002:a17:90a:b883:: with SMTP id
 o3mr15076411pjr.50.1564959011569; 
 Sun, 04 Aug 2019 15:50:11 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:11 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 33/34] kernel/events/core.c: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 15:49:14 -0700
Message-Id: <20190804224915.28669-34-jhubbard@nvidia.com>
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
 bh=rv0dCo+fqAQ13SgPxACDlFOa16RsKjSPlFe+eBoZNRU=;
 b=YPOY1YFdr7iX/mwZQqcGNXlBs0EVKoyeBFEUqInEu6rA0ndI8Mif+0ZPJeKKJ5iFwE
 NKOF3uvUa5VJ+UGiH9nbc87NqjJWsSl0scr9GeK88ydFUly3DCHseKqxTpEd0IfXvu5q
 jcaFXkdAdHJL26lkS0kDgmBvj/6IRTs5wSna3kfRs+vwcKzTL9APp6Wsc+o3ppVF+IRl
 wjQCOTSjcDQ7GQjBBXsLdt+Iue6eXN2thWrje4Rt9XoDAoEpWZdNECCtZUxO8cwujSm4
 fowCwuwgU3C+BFfj4zTJJ1Y4PbaxN4OhvtwxUy9pYDnCK6XNpmRXg/q/Jb/Qj5fLadYM
 mSpA==
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
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogUGV0ZXIg
WmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJl
ZGhhdC5jb20+CkNjOiBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gPGFjbWVAa2VybmVsLm9yZz4K
Q2M6IEFsZXhhbmRlciBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVsLmNv
bT4KQ2M6IEppcmkgT2xzYSA8am9sc2FAcmVkaGF0LmNvbT4KQ2M6IE5hbWh5dW5nIEtpbSA8bmFt
aHl1bmdAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGtlcm5lbC9ldmVudHMvY29yZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL2V2
ZW50cy9jb3JlLmMgYi9rZXJuZWwvZXZlbnRzL2NvcmUuYwppbmRleCAwNDYzYzExNTFiYWUuLjdi
ZTUyYmJiZmU4NyAxMDA2NDQKLS0tIGEva2VybmVsL2V2ZW50cy9jb3JlLmMKKysrIGIva2VybmVs
L2V2ZW50cy9jb3JlLmMKQEAgLTY0MjYsNyArNjQyNiw3IEBAIHN0YXRpYyB1NjQgcGVyZl92aXJ0
X3RvX3BoeXModTY0IHZpcnQpCiAJCQlwaHlzX2FkZHIgPSBwYWdlX3RvX3BoeXMocCkgKyB2aXJ0
ICUgUEFHRV9TSVpFOwogCiAJCWlmIChwKQotCQkJcHV0X3BhZ2UocCk7CisJCQlwdXRfdXNlcl9w
YWdlKHApOwogCX0KIAogCXJldHVybiBwaHlzX2FkZHI7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
