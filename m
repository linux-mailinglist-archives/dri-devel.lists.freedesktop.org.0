Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7228137F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25576E2D2;
	Mon,  5 Aug 2019 07:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E4889CDF;
 Sun,  4 Aug 2019 22:50:08 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id r7so38601552pfl.3;
 Sun, 04 Aug 2019 15:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sx0x91HVjVXCVkLMMHrdncyqT4rW2sU28Vf+3l+oloA=;
 b=SL8ErKNqwzKROnR0GFi4gQNU8t7Dwhx8H+wSfCjFGy7t2nW24VlPoczkBqLGg8ICa6
 GNblI+pO1qSWI12g2+ZpU95Yuo7NF5o07iWTX7rs3AnRv2WUJGZE5og0HF7pCBBpf2J3
 r1Ptr+y4275NM9BtNHHxPiTam83cBsjPr5WAFgJVbDlw5gFnXTt1ZQxwGM+HeEE7gyDe
 YaRAFHS5g4B3d/EyTPDF8lOW2emNzryP1NGBhGsBCV503rp2W/aP9uBO+ERxPnhjwoUS
 20wJu3er4DRPhU332YYq6G4GgAzX/lmmlOvjL8NwP5BV0j6RTDXaOQv1hbUM7Td+xadx
 n0LA==
X-Gm-Message-State: APjAAAWwpcvweCV+OFp27GZq9EcE+yotoGwTNmqEH5vZetGE4zGaLkPj
 b3mIz+N2Rp2DV0n7VRMNUuGZD6YE
X-Google-Smtp-Source: APXvYqzdBAOi64WyR4vf0DFOxQNVALmaSa46GoCIBIpjxflBtAErOscOmlieUmCz4Qhdah1mimse2w==
X-Received: by 2002:a63:7358:: with SMTP id
 d24mr133542074pgn.224.1564959008549; 
 Sun, 04 Aug 2019 15:50:08 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:08 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 31/34] fs/nfs: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:12 -0700
Message-Id: <20190804224915.28669-32-jhubbard@nvidia.com>
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
 bh=Sx0x91HVjVXCVkLMMHrdncyqT4rW2sU28Vf+3l+oloA=;
 b=M7iDvAmPBRpGJcJpcoqgvaoi3nLFkyQK4dkSIj4ojX3FvseJtfjnZyfckr18kI2oDa
 LHzSPof56TngxWHSp0ym44XehwQNp0Dvit6wm4Dt65OPXwL2baR6+4zLMuIAexRHFzmx
 ZFMgjeYMSC1sErMdOV/WNMAc2Iu4rRWK81eLPAWfZwZdfeXx16tZd5680zs185LTKzUq
 VYv2LHkMnMPv4yg/Pui3fxt3Z+TxPOd1GexxLj8LbBhnNpT3XVb8jW9mQwG5C5+4ClkN
 g/MAUKuZK56HuoBkHT35BiifdFKR3pPYOWepAjU+8QcCzdVYmtG3jMaPBQTkt/nS1dsZ
 WZ9Q==
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
Cc: Calum Mackay <calum.mackay@oracle.com>, linux-fbdev@vger.kernel.org,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQ2FsdW0g
TWFja2F5IDxjYWx1bS5tYWNrYXlAb3JhY2xlLmNvbT4KQ2M6IFRyb25kIE15a2xlYnVzdCA8dHJv
bmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbT4KQ2M6IEFubmEgU2NodW1ha2VyIDxhbm5hLnNj
aHVtYWtlckBuZXRhcHAuY29tPgpDYzogbGludXgtbmZzQHZnZXIua2VybmVsLm9yZwpTaWduZWQt
b2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZnMvbmZzL2Rp
cmVjdC5jIHwgMTEgKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvbmZzL2RpcmVjdC5jIGIvZnMvbmZzL2Rp
cmVjdC5jCmluZGV4IDBjYjQ0MjQwNjE2OC4uYzBjMWI5ZjJjMDY5IDEwMDY0NAotLS0gYS9mcy9u
ZnMvZGlyZWN0LmMKKysrIGIvZnMvbmZzL2RpcmVjdC5jCkBAIC0yNzYsMTMgKzI3Niw2IEBAIHNz
aXplX3QgbmZzX2RpcmVjdF9JTyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAq
aXRlcikKIAlyZXR1cm4gbmZzX2ZpbGVfZGlyZWN0X3dyaXRlKGlvY2IsIGl0ZXIpOwogfQogCi1z
dGF0aWMgdm9pZCBuZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdlcywg
dW5zaWduZWQgaW50IG5wYWdlcykKLXsKLQl1bnNpZ25lZCBpbnQgaTsKLQlmb3IgKGkgPSAwOyBp
IDwgbnBhZ2VzOyBpKyspCi0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKLX0KLQogdm9pZCBuZnNfaW5p
dF9jaW5mb19mcm9tX2RyZXEoc3RydWN0IG5mc19jb21taXRfaW5mbyAqY2luZm8sCiAJCQkgICAg
ICBzdHJ1Y3QgbmZzX2RpcmVjdF9yZXEgKmRyZXEpCiB7CkBAIC01MTIsNyArNTA1LDcgQEAgc3Rh
dGljIHNzaXplX3QgbmZzX2RpcmVjdF9yZWFkX3NjaGVkdWxlX2lvdmVjKHN0cnVjdCBuZnNfZGly
ZWN0X3JlcSAqZHJlcSwKIAkJCXBvcyArPSByZXFfbGVuOwogCQkJZHJlcS0+Ynl0ZXNfbGVmdCAt
PSByZXFfbGVuOwogCQl9Ci0JCW5mc19kaXJlY3RfcmVsZWFzZV9wYWdlcyhwYWdldmVjLCBucGFn
ZXMpOworCQlwdXRfdXNlcl9wYWdlcyhwYWdldmVjLCBucGFnZXMpOwogCQlrdmZyZWUocGFnZXZl
Yyk7CiAJCWlmIChyZXN1bHQgPCAwKQogCQkJYnJlYWs7CkBAIC05MzUsNyArOTI4LDcgQEAgc3Rh
dGljIHNzaXplX3QgbmZzX2RpcmVjdF93cml0ZV9zY2hlZHVsZV9pb3ZlYyhzdHJ1Y3QgbmZzX2Rp
cmVjdF9yZXEgKmRyZXEsCiAJCQlwb3MgKz0gcmVxX2xlbjsKIAkJCWRyZXEtPmJ5dGVzX2xlZnQg
LT0gcmVxX2xlbjsKIAkJfQotCQluZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMocGFnZXZlYywgbnBh
Z2VzKTsKKwkJcHV0X3VzZXJfcGFnZXMocGFnZXZlYywgbnBhZ2VzKTsKIAkJa3ZmcmVlKHBhZ2V2
ZWMpOwogCQlpZiAocmVzdWx0IDwgMCkKIAkJCWJyZWFrOwotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
