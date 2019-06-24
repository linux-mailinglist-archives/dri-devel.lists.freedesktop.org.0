Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011705245B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4646A89F55;
	Tue, 25 Jun 2019 07:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2571C89DAB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:02:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so691754wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7+HSfyIPKIyVRlHiPSUTXfMPMA2cBMnzwF3/BJJWoM=;
 b=W5v3VNg6r++GOL1G2GflGCukax+4kCZD6CjTdI8KYGt+I+In62OiHZeJgKIm4N0pD9
 cU3sBS2XBg0pHVgYld/+EdKNf/KO5m5v+lDF2DRtrP0z9qWmr+eyCvOi91SQevm7m6ly
 KmXzVgJxckKifYhOwBklG5DirC0hsdlfePcF9PpHOOPrStxC0WtG6P6wniADzh3Saz4Y
 GFWgqlrxumnmMvRFIWmkeGItoX1cnjQRcNjPq2vkBffu7RSSKA4mBL0O+PKWMZVTG67U
 ErR4JGiwtpA1uR4QtYTZpbiZDLpkZ3PnmCVad2L0LFFq4A8Kao1vxF1LuXdn6b32pQFB
 fuMg==
X-Gm-Message-State: APjAAAXLbrFwcArZSh1jllDO7pOfWYJ1aTe060S7iEefyc2C1wh4R9ND
 EoBpL7rI2P05JCj4YjBjwVLlvQ==
X-Google-Smtp-Source: APXvYqxYsEWfPj+ojP/Pdo0/oemDCD+9/xSgl5N/QS6OZzqvHa256HMQOw+3zV/4M5gAiwA2ZCoPBA==
X-Received: by 2002:a1c:228b:: with SMTP id
 i133mr17321325wmi.140.1561410126760; 
 Mon, 24 Jun 2019 14:02:06 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id k125sm600943wmf.41.2019.06.24.14.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:02:02 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6D-0001Mv-3O; Mon, 24 Jun 2019 18:02:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 10/12] mm/hmm: Poison hmm_range during unregister
Date: Mon, 24 Jun 2019 18:01:08 -0300
Message-Id: <20190624210110.5098-11-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
References: <20190624210110.5098-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7+HSfyIPKIyVRlHiPSUTXfMPMA2cBMnzwF3/BJJWoM=;
 b=i+h5jdKODrJM6HAgihfib7r1p3HTIoXotHgwp0BCzd39jXyo1BGTDGN5CpLNMF70TR
 V6PVWeRW3fvAO6anYPbAasncAm2gfDig99onMjq8DGbcxmOsbdJoUx+UOv3Ew172buN4
 Vpsbiiy/5q+1oRn8UdTlfhMTuBnx4G1ji+wcVIaoYK5Nbt5H8mqxT5v/JzerbsooORD5
 HimcJCbD82rblSOa3TsdNlNx3R6AxGDFuxuK+lEyTuOggfGhT5ua5kBPNLimVjJkqu5U
 RIddsbNK0RH7LIGRspoDR8r0YYISQuOycZZHVH/0xfxFXODjXkabiQ3hMa0QYuximxJ6
 o2Mg==
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVHJ5aW5nIHRvIG1pc3Vz
ZSBhIHJhbmdlIG91dHNpZGUgaXRzIGxpZmV0aW1lIGlzIGEga2VybmVsIGJ1Zy4gVXNlIHBvaXNv
bgpieXRlcyB0byBoZWxwIGRldGVjdCB0aGlzIGNvbmRpdGlvbi4gRG91YmxlIHVucmVnaXN0ZXIg
d2lsbCByZWxpYWJseSBjcmFzaC4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdn
QG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpB
Y2tlZC1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+ClJldmlld2Vk
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBJ
cmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClRlc3RlZC1ieTogUGhpbGlwIFlhbmcgPFBo
aWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQp2MgotIEtlZXAgcmFuZ2Ugc3RhcnQvZW5kIHZhbGlkIGFm
dGVyIHVucmVnaXN0cmF0aW9uIChKZXJvbWUpCnYzCi0gUmV2aXNlIHNvbWUgY29tbWVudHMgKEpv
aG4pCi0gUmVtb3ZlIHN0YXJ0L2VuZCBXQVJOX09OIChTb3VwdGljaykKdjQKLSBGaXggdGFicyB2
cyBzcGFjZXMgaW4gY29tbWVudCAoQ2hyaXN0b3BoKQotLS0KIG1tL2htbS5jIHwgMTQgKysrKysr
KystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCAyZWYxNGIyYjU1MDVmNi4u
YzMwYWE5NDAzZGJlNGQgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC05
MjUsMTkgKzkyNSwyMSBAQCB2b2lkIGhtbV9yYW5nZV91bnJlZ2lzdGVyKHN0cnVjdCBobW1fcmFu
Z2UgKnJhbmdlKQogewogCXN0cnVjdCBobW0gKmhtbSA9IHJhbmdlLT5obW07CiAKLQkvKiBTYW5p
dHkgY2hlY2sgdGhpcyByZWFsbHkgc2hvdWxkIG5vdCBoYXBwZW4uICovCi0JaWYgKGhtbSA9PSBO
VUxMIHx8IHJhbmdlLT5lbmQgPD0gcmFuZ2UtPnN0YXJ0KQotCQlyZXR1cm47Ci0KIAltdXRleF9s
b2NrKCZobW0tPmxvY2spOwogCWxpc3RfZGVsX2luaXQoJnJhbmdlLT5saXN0KTsKIAltdXRleF91
bmxvY2soJmhtbS0+bG9jayk7CiAKIAkvKiBEcm9wIHJlZmVyZW5jZSB0YWtlbiBieSBobW1fcmFu
Z2VfcmVnaXN0ZXIoKSAqLwotCXJhbmdlLT52YWxpZCA9IGZhbHNlOwogCW1tcHV0KGhtbS0+bW0p
OwogCWhtbV9wdXQoaG1tKTsKLQlyYW5nZS0+aG1tID0gTlVMTDsKKworCS8qCisJICogVGhlIHJh
bmdlIGlzIG5vdyBpbnZhbGlkIGFuZCB0aGUgcmVmIG9uIHRoZSBobW0gaXMgZHJvcHBlZCwgc28K
KwkgKiBwb2lzb24gdGhlIHBvaW50ZXIuICBMZWF2ZSBvdGhlciBmaWVsZHMgaW4gcGxhY2UsIGZv
ciB0aGUgY2FsbGVyJ3MKKwkgKiB1c2UuCisJICovCisJcmFuZ2UtPnZhbGlkID0gZmFsc2U7CisJ
bWVtc2V0KCZyYW5nZS0+aG1tLCBQT0lTT05fSU5VU0UsIHNpemVvZihyYW5nZS0+aG1tKSk7CiB9
CiBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV91bnJlZ2lzdGVyKTsKIAotLSAKMi4yMi4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
