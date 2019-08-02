Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F087EEEA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD886ED26;
	Fri,  2 Aug 2019 08:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBECF6E860;
 Fri,  2 Aug 2019 02:20:32 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 19so35148275pfa.4;
 Thu, 01 Aug 2019 19:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60C6UutqWDg70MnmR2wOYRHcozVv05mGJual4EWfkd0=;
 b=CPf4HfpmJBfMgYBa6byDlPLPrY+DQ6TjBDi7defx5kRFEMraoJMjO+R/yZIdjkt1QK
 ohFL7LqExTcwrUkWXy8KbRmqgKiNTu+24cbFbhXH1MZ3CEbD7LDISAMzSE3iHserQSdA
 TDjEBO6AlD/fhzZ8K17U6t6k+e1isOF95XZa9nWetg5iz73mDGrgx3vdZGiMHVRWTuq9
 tf2nSY1ZMCl3/cV3TtagKSy8j0EZD3qvsEsCvh0cp1CQ+3rpgGGF0uzBuUqtGSqfXYrw
 mc/mRPOT7JYJzdzHWno6O7oB1BXY+Mt3eq+4XUG0CcyDC//4+gVcUinRq5NtFuD1+guY
 y5Mg==
X-Gm-Message-State: APjAAAURd/AHY8KIbaPixvCH3dmILsi2GKwujZz6dxiZnV+KyGcCdxTL
 TUQW2Vb33+tH/bq9rEVPkjU=
X-Google-Smtp-Source: APXvYqxJWuQ3PRZS25/rGW/r93tu8qJViELHafWX8OhR+SZHdvKx4eGJZdpIEmnFGk4IpVB5b1wjUA==
X-Received: by 2002:a62:d45d:: with SMTP id u29mr56669248pfl.135.1564712432510; 
 Thu, 01 Aug 2019 19:20:32 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:32 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 13/34] rapidio: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:44 -0700
Message-Id: <20190802022005.5117-14-jhubbard@nvidia.com>
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
 bh=60C6UutqWDg70MnmR2wOYRHcozVv05mGJual4EWfkd0=;
 b=OcjBgeGu8UZCjg/O5HE3tZTmbKV/JxG356gcwN7XI4m7laLxmDfYwr2J+xgouxj3fQ
 Co0dhwd0qY47xArJmyB+EhpJv8h8AiGjGK24lKEHkHPsH9RjihM7pMRvNW+41GJgCLyu
 4QfSp0AC2zblPx9c01ipPR4kYld7HwcvdeZgybQdYrqzUfXd232AEHGN5xFwKTyZmR0/
 4nQ8d9yxpivs4/vMxrtO/9Xc8hiQJpvET/VRicWc2zu2qdEUBl4z9cTSyxwtCJdabvcM
 Ei+d8hsTWnZC71PLDlgF5ytQlKruZFkMxa42zlyyGk4z93JPolm9Mu5LN9FxicLHKdhc
 nCzA==
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
 Matt Porter <mporter@kernel.crashing.org>, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 Alexandre Bounine <alex.bou9@gmail.com>, linux-crypto@vger.kernel.org,
 Ioan Nicu <ioan.nicu.ext@nokia.com>, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogTWF0dCBQ
b3J0ZXIgPG1wb3J0ZXJAa2VybmVsLmNyYXNoaW5nLm9yZz4KQ2M6IEFsZXhhbmRyZSBCb3VuaW5l
IDxhbGV4LmJvdTlAZ21haWwuY29tPgpDYzogQWwgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcu
dWs+CkNjOiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+CkNjOiBDaHJpc3Rv
cGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgpDYzogSW9hbiBOaWN1
IDxpb2FuLm5pY3UuZXh0QG5va2lhLmNvbT4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPgpDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KU2ln
bmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZl
cnMvcmFwaWRpby9kZXZpY2VzL3Jpb19tcG9ydF9jZGV2LmMgfCA5ICsrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3JhcGlkaW8vZGV2aWNlcy9yaW9fbXBvcnRfY2Rldi5jIGIvZHJpdmVycy9yYXBpZGlv
L2RldmljZXMvcmlvX21wb3J0X2NkZXYuYwppbmRleCA4MTU1ZjU5ZWNlMzguLjBlOGVhMGU1YTg5
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9yYXBpZGlvL2RldmljZXMvcmlvX21wb3J0X2NkZXYuYwor
KysgYi9kcml2ZXJzL3JhcGlkaW8vZGV2aWNlcy9yaW9fbXBvcnRfY2Rldi5jCkBAIC01NzIsMTQg
KzU3MiwxMiBAQCBzdGF0aWMgdm9pZCBkbWFfcmVxX2ZyZWUoc3RydWN0IGtyZWYgKnJlZikKIAlz
dHJ1Y3QgbXBvcnRfZG1hX3JlcSAqcmVxID0gY29udGFpbmVyX29mKHJlZiwgc3RydWN0IG1wb3J0
X2RtYV9yZXEsCiAJCQlyZWZjb3VudCk7CiAJc3RydWN0IG1wb3J0X2NkZXZfcHJpdiAqcHJpdiA9
IHJlcS0+cHJpdjsKLQl1bnNpZ25lZCBpbnQgaTsKIAogCWRtYV91bm1hcF9zZyhyZXEtPmRtYWNo
LT5kZXZpY2UtPmRldiwKIAkJICAgICByZXEtPnNndC5zZ2wsIHJlcS0+c2d0Lm5lbnRzLCByZXEt
PmRpcik7CiAJc2dfZnJlZV90YWJsZSgmcmVxLT5zZ3QpOwogCWlmIChyZXEtPnBhZ2VfbGlzdCkg
ewotCQlmb3IgKGkgPSAwOyBpIDwgcmVxLT5ucl9wYWdlczsgaSsrKQotCQkJcHV0X3BhZ2UocmVx
LT5wYWdlX2xpc3RbaV0pOworCQlwdXRfdXNlcl9wYWdlcyhyZXEtPnBhZ2VfbGlzdCwgcmVxLT5u
cl9wYWdlcyk7CiAJCWtmcmVlKHJlcS0+cGFnZV9saXN0KTsKIAl9CiAKQEAgLTgxNSw3ICs4MTMs
NyBAQCByaW9fZG1hX3RyYW5zZmVyKHN0cnVjdCBmaWxlICpmaWxwLCB1MzIgdHJhbnNmZXJfbW9k
ZSwKIAlzdHJ1Y3QgbXBvcnRfZG1hX3JlcSAqcmVxOwogCXN0cnVjdCBtcG9ydF9kZXYgKm1kID0g
cHJpdi0+bWQ7CiAJc3RydWN0IGRtYV9jaGFuICpjaGFuOwotCWludCBpLCByZXQ7CisJaW50IHJl
dDsKIAlpbnQgbmVudHM7CiAKIAlpZiAoeGZlci0+bGVuZ3RoID09IDApCkBAIC05NDYsOCArOTQ0
LDcgQEAgcmlvX2RtYV90cmFuc2ZlcihzdHJ1Y3QgZmlsZSAqZmlscCwgdTMyIHRyYW5zZmVyX21v
ZGUsCiAKIGVycl9wZzoKIAlpZiAoIXJlcS0+cGFnZV9saXN0KSB7Ci0JCWZvciAoaSA9IDA7IGkg
PCBucl9wYWdlczsgaSsrKQotCQkJcHV0X3BhZ2UocGFnZV9saXN0W2ldKTsKKwkJcHV0X3VzZXJf
cGFnZXMocGFnZV9saXN0LCBucl9wYWdlcyk7CiAJCWtmcmVlKHBhZ2VfbGlzdCk7CiAJfQogZXJy
X3JlcToKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
