Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A697EEC9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447606ED0C;
	Fri,  2 Aug 2019 08:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AA66E863;
 Fri,  2 Aug 2019 02:20:46 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id t16so35122752pfe.11;
 Thu, 01 Aug 2019 19:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=OK/VZkcIMzMH1o4qM1gJO3VQ4ysq8jB/Y5+3C5VfjAM3fNmuaJX7UUKJY1kQBN7coo
 n6qRNXYpAUytueIBecBZ9gZFJDyYqeZ9xs7uZO5XWUm3yee95YFUBR7OCwKuiap2dQdA
 Cm071h9WftSFIO3u0LhbarK9dthVqsWFegnPyPr2ff/R41fmk8PVyDfY2dJXaEqODaSx
 p8nsWh18MDaNAjdYjSxap82GNY6fxiVxNUREAEE6JFenHPeKU1LjRr6/4D30htFqlsOR
 SkdRqAIsSGZ9XR4CRFdWBX/orB+vIHK29q0qZyCdWxME0V2jgf1r2QUUvC1RW5ncnD6v
 jbIg==
X-Gm-Message-State: APjAAAVuPJG94b/SByV4wuFf9UA6NOgn7tvcuyArzx4e04MaoMntS+fD
 96vfVfj4D0ExQEMkpotKdPk=
X-Google-Smtp-Source: APXvYqxR/U1dL3txs9pGjSe+FwW9uMtR0k4KNaBNNpf6pbzUbZzBuQi9NPNfHMjGx+8Bx8bZmFuKIw==
X-Received: by 2002:a17:90a:8c18:: with SMTP id
 a24mr1817929pjo.111.1564712446323; 
 Thu, 01 Aug 2019 19:20:46 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:45 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 22/34] orangefs: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:53 -0700
Message-Id: <20190802022005.5117-23-jhubbard@nvidia.com>
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
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=bFa24Z5mQSzxC4eOzJ4+7AblweRywqOmLHClqtb5KdjCAjd1PUSEw/ZsQSQOyWjUsC
 1nWyBkhFn3Be02SULNTaYtTCG2J6o3/uRCn091UpjmhLyF7xPQy8wXw/xt4PRY9wiXXM
 V1nMLk4YhEUMXleXPkZw51V9rlN393l9K+gVXIZUF6ECoqP/Y8CZfCnooK6DgUB0tUD4
 eFt7VWtlBH1sk6kipujvSPJHkQR53+eHLV2iAcuMnAVCEWZM24hHRYthkAG8xQ/D08vi
 iFZfyGckqNCA5JtaUEszagJMdsqH6lCds+G1LZm6Cvnsgs6SuhZpo2MKRXwMzsClRxnN
 IVug==
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
Cc: Martin Brandenburg <martin@omnibond.com>, linux-fbdev@vger.kernel.org,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogTWlrZSBN
YXJzaGFsbCA8aHViY2FwQG9tbmlib25kLmNvbT4KQ2M6IE1hcnRpbiBCcmFuZGVuYnVyZyA8bWFy
dGluQG9tbmlib25kLmNvbT4KQ2M6IGRldmVsQGxpc3RzLm9yYW5nZWZzLm9yZwpTaWduZWQtb2Zm
LWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZnMvb3JhbmdlZnMv
b3JhbmdlZnMtYnVmbWFwLmMgfCA3ICsrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvb3JhbmdlZnMvb3JhbmdlZnMt
YnVmbWFwLmMgYi9mcy9vcmFuZ2Vmcy9vcmFuZ2Vmcy1idWZtYXAuYwppbmRleCAyYmI5MTZkNjg1
NzYuLmYyZjMzYTE2ZDYwNCAxMDA2NDQKLS0tIGEvZnMvb3JhbmdlZnMvb3JhbmdlZnMtYnVmbWFw
LmMKKysrIGIvZnMvb3JhbmdlZnMvb3JhbmdlZnMtYnVmbWFwLmMKQEAgLTE2OCwxMCArMTY4LDcg
QEAgc3RhdGljIERFRklORV9TUElOTE9DSyhvcmFuZ2Vmc19idWZtYXBfbG9jayk7CiBzdGF0aWMg
dm9pZAogb3JhbmdlZnNfYnVmbWFwX3VubWFwKHN0cnVjdCBvcmFuZ2Vmc19idWZtYXAgKmJ1Zm1h
cCkKIHsKLQlpbnQgaTsKLQotCWZvciAoaSA9IDA7IGkgPCBidWZtYXAtPnBhZ2VfY291bnQ7IGkr
KykKLQkJcHV0X3BhZ2UoYnVmbWFwLT5wYWdlX2FycmF5W2ldKTsKKwlwdXRfdXNlcl9wYWdlcyhi
dWZtYXAtPnBhZ2VfYXJyYXksIGJ1Zm1hcC0+cGFnZV9jb3VudCk7CiB9CiAKIHN0YXRpYyB2b2lk
CkBAIC0yODAsNyArMjc3LDcgQEAgb3JhbmdlZnNfYnVmbWFwX21hcChzdHJ1Y3Qgb3JhbmdlZnNf
YnVmbWFwICpidWZtYXAsCiAKIAkJZm9yIChpID0gMDsgaSA8IHJldDsgaSsrKSB7CiAJCQlTZXRQ
YWdlRXJyb3IoYnVmbWFwLT5wYWdlX2FycmF5W2ldKTsKLQkJCXB1dF9wYWdlKGJ1Zm1hcC0+cGFn
ZV9hcnJheVtpXSk7CisJCQlwdXRfdXNlcl9wYWdlKGJ1Zm1hcC0+cGFnZV9hcnJheVtpXSk7CiAJ
CX0KIAkJcmV0dXJuIC1FTk9NRU07CiAJfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
