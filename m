Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7904845D3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617B56E642;
	Wed,  7 Aug 2019 07:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45936E589;
 Wed,  7 Aug 2019 01:33:57 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id p184so42492033pfp.7;
 Tue, 06 Aug 2019 18:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDBAQLU7S2U/jcsuraEitExVA8qAggFNDXffEk4LOSU=;
 b=h9Fr8Qr+9Z7W6XfDcbnSWKEH/czNdyhZiSlNaA3ahrqw5b7c6LstU/i+DfRk5am6ve
 C7syOia9IZISrCRk/sf6ZipNe+PpS3LSsUb1tkzBRUQwj1BSE5Ah83D2BH+u9ETTn0FV
 jEFD2Fmbfm3KMTsx8aUDelp9nAHSbQk4m8NbneeKGN0GsU1n9rbpexfM4rPLtiyUUjEI
 TmCMLy2/YGLDVGqJ1ZHAGdu+ai72CrTh/YInEsj7OYv6ZJzxOdZh0WSVHzVh+xgq35/X
 T+Aec4sjH1Vk/7O2LsGB8XX8QD0pWPUH03PznWEh7s+xXYHLYtDQ3dgsZKjYW5uNo18D
 MrAg==
X-Gm-Message-State: APjAAAVGqErCQn/tE31lCdTV4rAfhNB+mNWjs0M+ZyLjW3kKoBgU15yh
 XCSUOCyOJTQuVCwjF4+t2FY=
X-Google-Smtp-Source: APXvYqxowmB5KY9x5+3VpBUz7AtpjaBcc2B1U6EZUCl5VRWjmEE9hilm+u0BPGPiavOiCOJ108uPDQ==
X-Received: by 2002:a17:90a:30cf:: with SMTP id
 h73mr6096915pjb.42.1565141637378; 
 Tue, 06 Aug 2019 18:33:57 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:56 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 08/41] drm/i915: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:07 -0700
Message-Id: <20190807013340.9706-9-jhubbard@nvidia.com>
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
 bh=YDBAQLU7S2U/jcsuraEitExVA8qAggFNDXffEk4LOSU=;
 b=fH35navam8Lh5O3/qNrV94jl6iS2d0GfzCxk/u0RVGSb5dvr8ME5vr6Nrz7RbT0FzH
 b+0bwfj6a40pZ7ZDEBSPteuD+EtCdatETgtIbhA4HjNGhTvq4/6/8Hfd0cWzD4ACfYbW
 rgRW0nwu/E9vCWm7L7kW1f14dc8w0gfs4RZvtHi6Oflt61RfXIS6VkmL4oCieKfyzE0K
 4m3Xz2o0LiyRj0Y9KXj50L4atLA3dDsoGvMpdRLog6j+z0Lu9QLqi3MvwrgBmW5y8MHT
 21A4qIppa4JRGq/2QNHN+lrWM1Z/51ATanglohKPJpBhZfdY/rs/WBKjHemXIrn3RGac
 3taQ==
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGlzIGEg
bWVyZ2UtYWJsZSB2ZXJzaW9uIG9mIHRoZSBmaXgsIGJlY2F1c2UgaXQgcmVzdHJpY3RzCml0c2Vs
ZiB0byBwdXRfdXNlcl9wYWdlKCkgYW5kIHB1dF91c2VyX3BhZ2VzKCksIGJvdGggb2Ygd2hpY2gK
aGF2ZSBub3QgY2hhbmdlZCB0aGVpciBBUElzLiBMYXRlciwgaTkxNV9nZW1fdXNlcnB0cl9wdXRf
cGFnZXMoKQpjYW4gYmUgc2ltcGxpZmllZCB0byB1c2UgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9j
aygpLgoKQWNrZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KCkNj
OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgpDYzogSm9vbmFzIExh
aHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX3VzZXJwdHIuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV91c2VycHRyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fdXNlcnB0ci5jCmluZGV4IDJjYWE1OTQzMjJiYy4uNzZkZGEyOTIzY2YxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKQEAgLTUyNyw3ICs1MjcsNyBA
QCBfX2k5MTVfZ2VtX3VzZXJwdHJfZ2V0X3BhZ2VzX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
Kl93b3JrKQogCX0KIAltdXRleF91bmxvY2soJm9iai0+bW0ubG9jayk7CiAKLQlyZWxlYXNlX3Bh
Z2VzKHB2ZWMsIHBpbm5lZCk7CisJcHV0X3VzZXJfcGFnZXMocHZlYywgcGlubmVkKTsKIAlrdmZy
ZWUocHZlYyk7CiAKIAlpOTE1X2dlbV9vYmplY3RfcHV0KG9iaik7CkBAIC02NDAsNyArNjQwLDcg
QEAgc3RhdGljIGludCBpOTE1X2dlbV91c2VycHRyX2dldF9wYWdlcyhzdHJ1Y3QgZHJtX2k5MTVf
Z2VtX29iamVjdCAqb2JqKQogCQlfX2k5MTVfZ2VtX3VzZXJwdHJfc2V0X2FjdGl2ZShvYmosIHRy
dWUpOwogCiAJaWYgKElTX0VSUihwYWdlcykpCi0JCXJlbGVhc2VfcGFnZXMocHZlYywgcGlubmVk
KTsKKwkJcHV0X3VzZXJfcGFnZXMocHZlYywgcGlubmVkKTsKIAlrdmZyZWUocHZlYyk7CiAKIAly
ZXR1cm4gUFRSX0VSUl9PUl9aRVJPKHBhZ2VzKTsKQEAgLTY3NSw3ICs2NzUsNyBAQCBpOTE1X2dl
bV91c2VycHRyX3B1dF9wYWdlcyhzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqLAogCQkJ
c2V0X3BhZ2VfZGlydHlfbG9jayhwYWdlKTsKIAogCQltYXJrX3BhZ2VfYWNjZXNzZWQocGFnZSk7
Ci0JCXB1dF9wYWdlKHBhZ2UpOworCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwogCX0KIAlvYmotPm1t
LmRpcnR5ID0gZmFsc2U7CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
