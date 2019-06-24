Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2691152485
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C466E04A;
	Tue, 25 Jun 2019 07:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF11A89DE3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:02:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id v14so15384189wrr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HyibpLykYkiKTwGwDVDE6Jz0uAzR58LFXlNi/YRy3U=;
 b=LZ1cMumjshLCF95FnA0WID7ekWZJu5Z/WNzp58owJRcqufTA2gWCd8v+FJ4qlDI3de
 gdcukTB8TpwSSoGIBWdBH2pm6E//lFPcRut6foXaxBdwTiWDe26NiiqtLk++RllOrxs1
 d1aVlTxC1E0Nfhtoa5pZeZeG+t0HzpOiMy8skZ8+xDo7z+sXUIbFW6W9RMG298nXfc2p
 34isCDYdrfUNfw5In5EWBYLfZNwn3yFYPEsEG/X37/Kag0iL2VYsK84pmy5h92XCkHtx
 kZ37N/W9yT/nOlWgMBbXmyoQmTTI2ceJIm/Tri2/giDzjlseDdotN8j1Y5UyitoDIbDM
 4Viw==
X-Gm-Message-State: APjAAAW15zKYYxAl95G/fcmDKwdv3Pdfh7eBbfBdbrwnaUnxwyreLxZU
 dOlFrRex5o+jkia00V+48kun1w==
X-Google-Smtp-Source: APXvYqxbykTnskxCEk6vJXnhGhJhL+Hc/YVg3s4yNHZO6Rq1Ef69wTB8s8QzzXVmzALZYfvIEAb5sA==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr96903628wrr.282.1561410123670; 
 Mon, 24 Jun 2019 14:02:03 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id x11sm469693wmg.23.2019.06.24.14.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:02:02 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6D-0001Mb-0S; Mon, 24 Jun 2019 18:02:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 08/12] mm/hmm: Use lockdep instead of comments
Date: Mon, 24 Jun 2019 18:01:06 -0300
Message-Id: <20190624210110.5098-9-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
References: <20190624210110.5098-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HyibpLykYkiKTwGwDVDE6Jz0uAzR58LFXlNi/YRy3U=;
 b=o/tFvhN275Le/5WQ2vu2fc7dpnfllCtch7SunXoc0gfrceioMrV84vJNXj3fcaoXjc
 qKdfy6+FErMOpWLLywUqcU/CCvqkzz60BPZVTd/0tIIXWv44kB8+wkXkIP3fIfmQuRfU
 VCtdLewh0B23U6TTG5KtYq7rxUdtI/n6yUmErMCpp/rXPr3h474Gd7GbjYQ+iiDYdpy1
 7shV4eVpmV49XoNejllG2+McGSuy2k7ZkrwJwBNEK6NQF3+JDLsqVqku3k4UUdsaGuab
 CgCCYDDWmuYZ06PXgv5ghP0Ro725vIEY+j0ePamWI4Lrm/GuhZ/Rebt3wxbycRP+uaHI
 i7Cw==
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
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
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
eTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KVGVzdGVkLWJ5OiBQaGlsaXAgWWFuZyA8UGhp
bGlwLllhbmdAYW1kLmNvbT4KLS0tCnYyCi0gRml4IG1pc3NpbmcgJiBpbiBsb2NrZGVwcyAoSmFz
b24pCi0tLQogbW0vaG1tLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRl
eCAxZWRkZGE0NWNlZmFlNy4uNmY1ZGM2ZDU2OGZlYjEgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisr
KyBiL21tL2htbS5jCkBAIC0yNDYsMTEgKzI0NiwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1t
dV9ub3RpZmllcl9vcHMgaG1tX21tdV9ub3RpZmllcl9vcHMgPSB7CiAgKgogICogVG8gc3RhcnQg
bWlycm9yaW5nIGEgcHJvY2VzcyBhZGRyZXNzIHNwYWNlLCB0aGUgZGV2aWNlIGRyaXZlciBtdXN0
IHJlZ2lzdGVyCiAgKiBhbiBITU0gbWlycm9yIHN0cnVjdC4KLSAqCi0gKiBUSEUgbW0tPm1tYXBf
c2VtIE1VU1QgQkUgSEVMRCBJTiBXUklURSBNT0RFICEKICAqLwogaW50IGhtbV9taXJyb3JfcmVn
aXN0ZXIoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiB7
CisJbG9ja2RlcF9hc3NlcnRfaGVsZF9leGNsdXNpdmUoJm1tLT5tbWFwX3NlbSk7CisKIAkvKiBT
YW5pdHkgY2hlY2sgKi8KIAlpZiAoIW1tIHx8ICFtaXJyb3IgfHwgIW1pcnJvci0+b3BzKQogCQly
ZXR1cm4gLUVJTlZBTDsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
