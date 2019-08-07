Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466AE845C7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDBB6E648;
	Wed,  7 Aug 2019 07:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23106E589;
 Wed,  7 Aug 2019 01:34:08 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i18so42544209pgl.11;
 Tue, 06 Aug 2019 18:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60C6UutqWDg70MnmR2wOYRHcozVv05mGJual4EWfkd0=;
 b=ppZ7Ywfb1NoTMjr/vzLNTr/DPw3tes+QwRk245aJ/ENG7fZf/Hl7oE7JsGO6LLPJhx
 UEY7LKmLMF/J3ThbLYfpATmmAgx7U8pIlS0+mX8klFftIyDwoF3ZLk/v4mwwiXNfpKJP
 /zsByx1v4Og14Onz11re5LeVOOo7lHgoMDDZHmtTtnddEmeMwk/bc3CwPipmd+gIUj/n
 CB+DJl9Pnum3QmDbgGgKWGHF/HdYpxuwtS4pgR4ibgQTDuxYffkLn5ABZZ/+zwKMlwJ4
 OVB18OYLy9wFwlyrlmxgRre559LOqh0Du8fqzGWy2UskiNEEiZ/eIYOh6DnnrzAsigUB
 Ayug==
X-Gm-Message-State: APjAAAURTA4CWNPUZwKgQi8vmCpE8jK3+y3DEM9OZdPkAnGBr//jVD+P
 NAEzDeOgS0m3BoVKFIW8RVI=
X-Google-Smtp-Source: APXvYqzZ9ri0aFEivC8E1vtnTLu0Xt+gGlbh6d5zu26K18i0vLRAS3fRLqoUWVmE7o4ev8ojfCHrHg==
X-Received: by 2002:a17:90a:ad41:: with SMTP id
 w1mr5931335pjv.52.1565141648506; 
 Tue, 06 Aug 2019 18:34:08 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:08 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 15/41] rapidio: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:14 -0700
Message-Id: <20190807013340.9706-16-jhubbard@nvidia.com>
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
 bh=60C6UutqWDg70MnmR2wOYRHcozVv05mGJual4EWfkd0=;
 b=a57ErTytVAxkauYkEPzZRHeGlc0u/A4U5ejAgWPi4ESjwpiFFk6hlPoBGFaPNr39C+
 Kh0xSgXuJrsK4KZTKR2yEzoaLeUoioeGoUgaErqheNBeKc06PHRqwui84Q8EBbD2l+tL
 nX9d4d0RSUpPYxjPCjQnBkDN0+Zv6eOTSEhKauRBsgQJexRHp+YFYc3bVaLsL+EpeITh
 /oPeL3Ga9GujoFOOg6Eq3QUGMLurJ7MLYFEtSSTI2Z3ruqYxpiTRqopLyKlPWxV9WtYJ
 j/nNcaVxSU6fzyomhmIYzgCq04OEkW1OTZBrVWiS6qgJ9uqJ806PfvtCbg/QGSrKMhpY
 gQvw==
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
