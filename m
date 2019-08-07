Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2087845FC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583F16E692;
	Wed,  7 Aug 2019 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968DE6E58A;
 Wed,  7 Aug 2019 01:34:23 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t14so38560918plr.11;
 Tue, 06 Aug 2019 18:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=CjzEvuJB2OTANXUmXl8YC8UySEbkJRV/pyRhRYBUXYJ/dPC2PXAW+/XiwbKjql9XhC
 sRyYF84R0VZ5u0rSqolkyX1nChL2sbYwMn/sQgqOIIG1qT2Q479rMf1x4jsXmJMFqE4E
 U9caQLOddiNKc61VaOyH6uIQzIKidR8vXQPu4uofjNnpzi21F84k+F7QQwBazhBcgnOe
 iOrwG7ZY1buV8Tyg55ZzWvcXjbFwhK1DlC6vhJEukpPIZq90zZ0ahN2wGwZbDMTLWpTm
 zeudfO5DuVnxHTtczhnOeB/2jZAm/UriLxIDIPwviVwU6xuwXU3tn/48Xce938yOXnmb
 ideQ==
X-Gm-Message-State: APjAAAWD8JACpPzDAhyonlTMNLwXdexQrZEog00Um+jv09mjm96bdtLd
 eeo57wr3JXO1xOlTYoxo7z0=
X-Google-Smtp-Source: APXvYqw776L+7/s1i5+0uj4rHYr4XOYwzb6gLf8HmDykG/CGNwoS9owiEzaUd2cmiWPaV4acbHnsQA==
X-Received: by 2002:a17:902:4683:: with SMTP id
 p3mr5420824pld.31.1565141663334; 
 Tue, 06 Aug 2019 18:34:23 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:22 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 24/41] orangefs: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:23 -0700
Message-Id: <20190807013340.9706-25-jhubbard@nvidia.com>
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
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=L/mKoqNBpvGTGBp3epVJp9Jwmcabm5Zof/TP6cMpNTp5QyY/bNS8ra/phjhs5sRAaN
 E5tTttcEItcQL3b5Zem0k5qJxKcKktTUshMTiNWzGKXLywBoBoQ5bitV/RkFpPMu2On5
 4WHRSoAhmad+Sq/Uze+Lrqj/EHMra+wpLWdL/I1wMa19gtn+2FmmEpJ2BiwYWrwVtu4s
 ErDZEb/zzGVZaJO6WBAU6eZcAtQlFXpJrdCTpwcNxdnIPyz2Lta4bzP9L9aVvEMuLhxO
 FtQSTpdSuYFA1RpMOlExoKqI8fe7oDB8Q9BkX/iI0jL+EMoGr57KcyP7PRTXBQFgsK3f
 6S2w==
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
