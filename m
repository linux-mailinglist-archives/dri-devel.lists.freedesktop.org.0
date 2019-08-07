Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB93845E1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215D56E689;
	Wed,  7 Aug 2019 07:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0073B6E58F;
 Wed,  7 Aug 2019 01:34:18 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w10so42542348pgj.7;
 Tue, 06 Aug 2019 18:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=aXsJPt6aWLGkiMQ+l7KC2DpP+lkk3FZG5d0YLIazWLljrLRu3NwfFNQ2K/wKAypGtK
 NA5GgYDF37+OxUyivZiarPUYUqxps64N3Mf37BL3fLNiyfkkneHywrq91artgPPb7bFq
 UuU1qMT3j0fsljIIkBCwQxG71JHGBaadDVJBathOCP/w7UHDZZH5kiFWJ6bw2Bq4ENPj
 EanmMMmm0Dy36PsYmVT5WJARQl+ub+wHvu/01sSFXP1Osvk1zbqxCCAcTRRnnSfoBIDy
 BnlEaNqXoJqr5gEV1TTMRtJzlGDlkUL9jdPefSEnnj/6zANgmq/SWDnzDRNsl0Bn/hiq
 ypfA==
X-Gm-Message-State: APjAAAVNba5sg1msssPl1/njHDae4RKs9sIi/6ZJSwfxlDBzGduYnXo4
 8bPy42XYiklfaNfilaeLGEY=
X-Google-Smtp-Source: APXvYqzEjGdQT4zwHkPHC3zuchqcBixfKdrLByyRaCgYuUpeMBSsZZqsbT+G0enkm62MLPirbgVZ8A==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr5782148pjb.138.1565141658674; 
 Tue, 06 Aug 2019 18:34:18 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:18 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 21/41] fsl_hypervisor: convert put_page() to
 put_user_page*()
Date: Tue,  6 Aug 2019 18:33:20 -0700
Message-Id: <20190807013340.9706-22-jhubbard@nvidia.com>
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
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=iMIf7vv1OqjXs/pb2O80RbThn+V5BnR0qPinv0FzH0+g7xzprGLZVDhHDxqDtetcXv
 SaFnJoqNzRoFcPTVGSdSF8TWmFRSDY6HyI/xKEnGPkkBlyCLQ6e2r6EYWiPfaVK2Vmzt
 JZbyLYWCDWgBCgJU9imVgUMeONuNrElpVb025PXYsw4Ce7zDMpi0HqX5tsCmiW5ztLIV
 YDzIY1y6BpKbNCZAoclL3hg7itbVU1NhtHk3aXipSm7TKgtN0MS2OckyNUh0niZVwB8z
 njr19wA60AtVpgYuy80idYiGH3Z0ffMXU+t6KgBLR+IFYvULEDog7RhMgjNZybcJ+5TY
 bmmA==
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGNoYW5n
ZXMgdGhlIHJlbGVhc2UgY29kZSBzbGlnaHRseSwgYmVjYXVzZSBlYWNoIHBhZ2Ugc2xvdCBpbiB0
aGUKcGFnZV9saXN0W10gYXJyYXkgaXMgbm8gbG9uZ2VyIGNoZWNrZWQgZm9yIE5VTEwuIEhvd2V2
ZXIsIHRoYXQgY2hlY2sKd2FzIHdyb25nIGFueXdheSwgYmVjYXVzZSB0aGUgZ2V0X3VzZXJfcGFn
ZXMoKSBwYXR0ZXJuIG9mIHVzYWdlIGhlcmUKbmV2ZXIgYWxsb3dlZCBmb3IgTlVMTCBlbnRyaWVz
IHdpdGhpbiBhIHJhbmdlIG9mIHBpbm5lZCBwYWdlcy4KCkNjOiBBbCBWaXJvIDx2aXJvQHplbml2
LmxpbnV4Lm9yZy51az4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpDYzog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5j
IHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jIGIvZHJpdmVy
cy92aXJ0L2ZzbF9oeXBlcnZpc29yLmMKaW5kZXggOTNkNWJlYmY5NTcyLi5hOGY3OGQ1NzJjNDUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jCisrKyBiL2RyaXZlcnMv
dmlydC9mc2xfaHlwZXJ2aXNvci5jCkBAIC0yOTIsMTEgKzI5Miw4IEBAIHN0YXRpYyBsb25nIGlv
Y3RsX21lbWNweShzdHJ1Y3QgZnNsX2h2X2lvY3RsX21lbWNweSBfX3VzZXIgKnApCiAJCXZpcnRf
dG9fcGh5cyhzZ19saXN0KSwgbnVtX3BhZ2VzKTsKIAogZXhpdDoKLQlpZiAocGFnZXMpIHsKLQkJ
Zm9yIChpID0gMDsgaSA8IG51bV9wYWdlczsgaSsrKQotCQkJaWYgKHBhZ2VzW2ldKQotCQkJCXB1
dF9wYWdlKHBhZ2VzW2ldKTsKLQl9CisJaWYgKHBhZ2VzKQorCQlwdXRfdXNlcl9wYWdlcyhwYWdl
cywgbnVtX3BhZ2VzKTsKIAogCWtmcmVlKHNnX2xpc3RfdW5hbGlnbmVkKTsKIAlrZnJlZShwYWdl
cyk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
