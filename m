Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DC8455DF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A8A897F3;
	Fri, 14 Jun 2019 07:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4B8892FA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 00:44:58 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so569122qtk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 17:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dvkFkBeOW+6z/DYza2/ra7fU7bkF8TW6bEZ+9Ch/ZO4=;
 b=JmIx0t3sQ1R8qp2z7HAW5FXEujbhbai27xQNihfsb4JhdRRkfxqkhQGeD066hrLouB
 3nSpb3AyaHRgfe5Iq2+LoO22I3FwvmIXCWUps3W18xMlWGq5ouhbO3qQUx5+svl/GL8Y
 HnTt4L0akTy5NoOpRUgmn+qALTBFsO6TnQzP6K+IxjqeuTLGdJVHnO55toSaQGldmilw
 BHdBwCCe7XiZNKPAtiCRjImtF9xew7PMeHk4ySvmMOFBmuuYiTM8SphLAAF3NXdtMAaS
 Po+xY33ZKc/02G60sMHwgif/c0EW4WBd8FHt7x8va5ND4TPEFMSXVPRxGviLdSoPBV1z
 fyfA==
X-Gm-Message-State: APjAAAUJgfdD2rusIQlmmUtv55oPX/AIFF+4BfuRXgIpCk1paiojaM6a
 xR2yUIxQ4wiTLfQnwv8w4U+bLQ==
X-Google-Smtp-Source: APXvYqwehM/5YZE2rHAarSGtvnt4dD381MX43AFO3OEKYtZwTgDkAYkIX/giHqXAhpmFto1vVdJqMw==
X-Received: by 2002:aed:21ca:: with SMTP id m10mr72204568qtc.97.1560473097656; 
 Thu, 13 Jun 2019 17:44:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id o27sm688657qtf.13.2019.06.13.17.44.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 17:44:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbaKr-0005K8-TQ; Thu, 13 Jun 2019 21:44:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 07/12] mm/hmm: Use lockdep instead of comments
Date: Thu, 13 Jun 2019 21:44:45 -0300
Message-Id: <20190614004450.20252-8-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614004450.20252-1-jgg@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvkFkBeOW+6z/DYza2/ra7fU7bkF8TW6bEZ+9Ch/ZO4=;
 b=eYn88FgunOZPk+YyYFR2JnEf7f2u6p9sflPJ4sT+jetqG8JYSyAB8le6N712NkSohY
 Xwi2VyaEkzxPEqC8yi2d5vTAq6YJehvf3luJZZZ4GvsaI+jdZ2gVqX0uxK3KJG8fUqJN
 3FvqnY5Sb8nnX+WQ++LovwzB8U/d4qUmUyh+DIkLwGIxK2N5g7LSrT+GUNIoWzDFfVad
 ehBIjCCC/XRamOtEckjvwtqZSft++bwMX6ZPisONHj3wc7uPh1GqiR5ueIOcNZHjO+1j
 aWPQ70BMw6QV6bP5mmW+tRl6mOixqkIWqtgj8Ext78+i143gu4SmwIuthYXP1wzIHsDP
 faQA==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKU28gd2UgY2FuIGNoZWNr
IGxvY2tpbmcgYXQgcnVudGltZS4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdn
QG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpS
ZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpBY2tlZC1i
eTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+ClRlc3RlZC1ieTogUGhp
bGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQp2MgotIEZpeCBtaXNzaW5nICYgaW4g
bG9ja2RlcHMgKEphc29uKQotLS0KIG1tL2htbS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIv
bW0vaG1tLmMKaW5kZXggNTg3MTJkNzRlZGQ1ODUuLmMwZjYyMmY4NjIyM2MyIDEwMDY0NAotLS0g
YS9tbS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtMjUzLDExICsyNTMsMTEgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfb3BzIGhtbV9tbXVfbm90aWZpZXJfb3BzID0gewogICoK
ICAqIFRvIHN0YXJ0IG1pcnJvcmluZyBhIHByb2Nlc3MgYWRkcmVzcyBzcGFjZSwgdGhlIGRldmlj
ZSBkcml2ZXIgbXVzdCByZWdpc3RlcgogICogYW4gSE1NIG1pcnJvciBzdHJ1Y3QuCi0gKgotICog
VEhFIG1tLT5tbWFwX3NlbSBNVVNUIEJFIEhFTEQgSU4gV1JJVEUgTU9ERSAhCiAgKi8KIGludCBo
bW1fbWlycm9yX3JlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKQogeworCWxvY2tkZXBfYXNzZXJ0X2hlbGRfZXhjbHVzaXZlKCZtbS0+bW1hcF9z
ZW0pOworCiAJLyogU2FuaXR5IGNoZWNrICovCiAJaWYgKCFtbSB8fCAhbWlycm9yIHx8ICFtaXJy
b3ItPm9wcykKIAkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
