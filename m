Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF03853D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBC989A1A;
	Fri,  7 Jun 2019 07:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E9889709
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:51 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id s57so3891518qte.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W85iZVgjurkkiB2a7Xxec+qLci2n6gFQqX8RW+I6lJo=;
 b=pjWbB4e3kLKIKfX5KObx5YSY1yMJRyqF9xZRc9SaZbmvAygRt4E4fvh/4DXm/nw75N
 WyjjOVm4zHMh1m/srFt87lCDo4BmmkD0S4DMjlzUZt1qnHKMtKqc3CiaEWbG94wQTwfn
 R6xuoqnzB9MMM6Q5Q7nAzoU7f//uN0GYSQGrwrf7Ut4XSC5kzmA4NLRaDBHRzM2/Ptsj
 g2CMh56wHy4lvcie/d0pnB8gUVrqgFoLD7rfuTGXoOkmliLbKz53vnoQBLpPyvb6jL7R
 +T9uHRmaQIeyk0X2Rk7YqONQNPp+7KoueBgLcj1wOaXmURapLNbP+3Y6cGT5EcfzD2fq
 /K/w==
X-Gm-Message-State: APjAAAUJ9jKKbbukvYZLnbAWC5NE2Q8VcoYTD7AVHmLYCbMAGbtRMLyf
 dW1bFo/W4OWv0CZNalcXhPTG5A==
X-Google-Smtp-Source: APXvYqwcFvSukVvOu/ecnBzPeUt++yQE3oiNuMCzOwlWEIQcAIcfXxOQH4AMIgicmlTTSzjQ5g0HvQ==
X-Received: by 2002:a0c:989d:: with SMTP id f29mr21429512qvd.209.1559846690185; 
 Thu, 06 Jun 2019 11:44:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id p37sm1643204qtc.35.2019.06.06.11.44.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008Il-PR; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 08/11] mm/hmm: Remove racy protection against
 double-unregistration
Date: Thu,  6 Jun 2019 15:44:35 -0300
Message-Id: <20190606184438.31646-9-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W85iZVgjurkkiB2a7Xxec+qLci2n6gFQqX8RW+I6lJo=;
 b=EIOU+fw3tMulwBY+jl6o/Pd7uN1ahiKKDLJKphj0SFrY3mGFeHTn1W2VV4oFCcXr7j
 cWmZ0gDNudc595ZVgI5l/RmqYCimcWM0wl22l9mGjVDztbCe051fJtkZna0E33TmapUB
 sttvDBWVXq87dQ+6H75k5wM3twYt5qFdBFS/o7++FbtFqaun0Q5YuEHy1UH3O9BInXzS
 pIETiNwzZOWJnzWU1GfKDiH4km5IjkASxVzt5h0rLlByvN4VwKEz5TKRl7R8CRCPPHgC
 iZGZpOcpwV/Xe9ToHHJdY4NMDuY9EmTPikVd4pQhwsuT6b7FpmiV8btfYq7kPkezkCcc
 rh8A==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKTm8gb3RoZXIgcmVnaXN0
ZXIvdW5yZWdpc3RlciBrZXJuZWwgQVBJIGF0dGVtcHRzIHRvIHByb3ZpZGUgdGhpcyBraW5kIG9m
CnByb3RlY3Rpb24gYXMgaXQgaXMgaW5oZXJlbnRseSByYWN5LCBzbyBqdXN0IGRyb3AgaXQuCgpD
YWxsZXJzIHNob3VsZCBwcm92aWRlIHRoZWlyIG93biBwcm90ZWN0aW9uLCBpdCBhcHBlYXJzIG5v
dXZlYXUgYWxyZWFkeQpkb2VzLCBidXQganVzdCBpbiBjYXNlIGRyb3AgYSBkZWJ1Z2dpbmcgUE9J
U09OLgoKU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpS
ZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Ci0tLQogbW0v
aG1tLmMgfCA5ICsrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IGM3MDJj
ZDcyNjUxYjUzLi42ODAyZGU3MDgwZDE3MiAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0v
aG1tLmMKQEAgLTI4NCwxOCArMjg0LDEzIEBAIEVYUE9SVF9TWU1CT0woaG1tX21pcnJvcl9yZWdp
c3Rlcik7CiAgKi8KIHZvaWQgaG1tX21pcnJvcl91bnJlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9y
ICptaXJyb3IpCiB7Ci0Jc3RydWN0IGhtbSAqaG1tID0gUkVBRF9PTkNFKG1pcnJvci0+aG1tKTsK
LQotCWlmIChobW0gPT0gTlVMTCkKLQkJcmV0dXJuOworCXN0cnVjdCBobW0gKmhtbSA9IG1pcnJv
ci0+aG1tOwogCiAJZG93bl93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7CiAJbGlzdF9kZWxfaW5p
dCgmbWlycm9yLT5saXN0KTsKLQkvKiBUbyBwcm90ZWN0IHVzIGFnYWluc3QgZG91YmxlIHVucmVn
aXN0ZXIgLi4uICovCi0JbWlycm9yLT5obW0gPSBOVUxMOwogCXVwX3dyaXRlKCZobW0tPm1pcnJv
cnNfc2VtKTsKLQogCWhtbV9wdXQoaG1tKTsKKwltZW1zZXQoJm1pcnJvci0+aG1tLCBQT0lTT05f
SU5VU0UsIHNpemVvZihtaXJyb3ItPmhtbSkpOwogfQogRVhQT1JUX1NZTUJPTChobW1fbWlycm9y
X3VucmVnaXN0ZXIpOwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
