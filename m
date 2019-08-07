Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE82845E3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86CD6E66C;
	Wed,  7 Aug 2019 07:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F986E58E;
 Wed,  7 Aug 2019 01:34:12 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r7so42500447pfl.3;
 Tue, 06 Aug 2019 18:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsaN0a6ImilSblrGqgWWjtVL4aaUVqoBD3LMggUShuU=;
 b=LbT87OhU3jrdNm2sW0P6EmL4FrhOPlJx+1M9UqSjN6G9TiK09/Cmgn+OxOyZ6t3rdR
 y4GOKTTmh3qkn+kzOSP/TiQ8bzo7b3ZV4vPRi/2chzRW+z+zdKHPGnuxRaK8Mgwqx+S0
 xn35+4uLr7Vxc7x95xXZiTBKQE0x0JwVOaCpr8vMkCACRC5eNZ7vIlw5Zj0qTW4ZTz2Z
 +AZMRcO8T/QTzJRV8BCGfVVH5JOW01iUBoR6gbUUMsWO51cWx7FSbQiADnDfc/kg1YeQ
 XZKu7W92g2bnPc3lmKikXG1frmor6XIZAUoy79iVVH8A4MRNoy0yUhKJcyYqYw3mUN3X
 u9BQ==
X-Gm-Message-State: APjAAAU8+Ao9mEWLyxJeQ7C1V300gGYT1opjjRMDbWQbRKKbXPOVAWXy
 nvDofQY/CLQvP+61EyBibGg=
X-Google-Smtp-Source: APXvYqxA3xyoDOQ03wz3+MrAsxUgDjCiiP1q/97dVlMDAvCMqLwWlj7LgNPejGHFGrv69vRcUlGBpA==
X-Received: by 2002:a63:3112:: with SMTP id x18mr5571166pgx.385.1565141652072; 
 Tue, 06 Aug 2019 18:34:12 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:11 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 17/41] staging/vc04_services: convert put_page() to
 put_user_page*()
Date: Tue,  6 Aug 2019 18:33:16 -0700
Message-Id: <20190807013340.9706-18-jhubbard@nvidia.com>
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
 bh=JsaN0a6ImilSblrGqgWWjtVL4aaUVqoBD3LMggUShuU=;
 b=GqUNc3X3RUD+fMQ/tQov0eVptsX6vtpAZn07Fz7EwuEqRFmPs6eCUIqWfymN9U5tJQ
 Hp7GWk6oPhSKnPDc9mTSSc0b1ETtX6WZgNyVT9i/ZAc9DVX2wgidQTYQD678snuo6Uld
 OC0AxpA2rwU9kzsgxg4J7222NtI9nwWIQ3kKBxRvKJz1x31XBYs72NYIFgvDtQhOtH6x
 c30ljXQcc0npojtfiU8d5Zil2HhFRjkicdzBOPLsXrn4hkS7yUXDhahjzIOv/1HcFIxR
 8vAP8M1yLlIpgKytXt/GLUCaDmX+n+gX0JAtjCLQsjpUrzEN6iMEgLfOxOdX4VT9I1MD
 gqwg==
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
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Suniel Mahesh <sunil.m@techveda.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mihaela Muraru <mihaela.muraru21@gmail.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Kishore KP <kishore.p@techveda.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Sidong Yang <realwakka@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpBY2tlZC1ieTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KCkNjOiBFcmlj
IEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogU3RlZmFuIFdhaHJlbiA8c3RlZmFuLndhaHJl
bkBpMnNlLmNvbT4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CkNjOiBNaWhhZWxhIE11cmFydSA8bWloYWVsYS5tdXJhcnUyMUBnbWFpbC5jb20+CkNj
OiBTdW5pZWwgTWFoZXNoIDxzdW5pbC5tQHRlY2h2ZWRhLm9yZz4KQ2M6IEFsIFZpcm8gPHZpcm9A
emVuaXYubGludXgub3JnLnVrPgpDYzogU2lkb25nIFlhbmcgPHJlYWx3YWtrYUBnbWFpbC5jb20+
CkNjOiBLaXNob3JlIEtQIDxraXNob3JlLnBAdGVjaHZlZGEub3JnPgpDYzogbGludXgtcnBpLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKQ2M6IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wub3JnClNpZ25lZC1vZmYtYnk6IEpv
aG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiAuLi4vdmMwNF9zZXJ2aWNlcy9p
bnRlcmZhY2UvdmNoaXFfYXJtL3ZjaGlxXzI4MzVfYXJtLmMgfCAxMCArKy0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2VzL2ludGVyZmFjZS92Y2hpcV9hcm0vdmNoaXFf
MjgzNV9hcm0uYyBiL2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2VzL2ludGVyZmFjZS92Y2hp
cV9hcm0vdmNoaXFfMjgzNV9hcm0uYwppbmRleCA2MWM2OWYzNTNjZGIuLmVjOTJiNGM1MGU5NSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3ZjMDRfc2VydmljZXMvaW50ZXJmYWNlL3ZjaGlx
X2FybS92Y2hpcV8yODM1X2FybS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2Vz
L2ludGVyZmFjZS92Y2hpcV9hcm0vdmNoaXFfMjgzNV9hcm0uYwpAQCAtMzM2LDEwICszMzYsNyBA
QCBjbGVhbnVwX3BhZ2VsaXN0aW5mbyhzdHJ1Y3QgdmNoaXFfcGFnZWxpc3RfaW5mbyAqcGFnZWxp
c3RpbmZvKQogCX0KIAogCWlmIChwYWdlbGlzdGluZm8tPnBhZ2VzX25lZWRfcmVsZWFzZSkgewot
CQl1bnNpZ25lZCBpbnQgaTsKLQotCQlmb3IgKGkgPSAwOyBpIDwgcGFnZWxpc3RpbmZvLT5udW1f
cGFnZXM7IGkrKykKLQkJCXB1dF9wYWdlKHBhZ2VsaXN0aW5mby0+cGFnZXNbaV0pOworCQlwdXRf
dXNlcl9wYWdlcyhwYWdlbGlzdGluZm8tPnBhZ2VzLCBwYWdlbGlzdGluZm8tPm51bV9wYWdlcyk7
CiAJfQogCiAJZG1hX2ZyZWVfY29oZXJlbnQoZ19kZXYsIHBhZ2VsaXN0aW5mby0+cGFnZWxpc3Rf
YnVmZmVyX3NpemUsCkBAIC00NTQsMTAgKzQ1MSw3IEBAIGNyZWF0ZV9wYWdlbGlzdChjaGFyIF9f
dXNlciAqYnVmLCBzaXplX3QgY291bnQsIHVuc2lnbmVkIHNob3J0IHR5cGUpCiAJCQkJICAgICAg
IF9fZnVuY19fLCBhY3R1YWxfcGFnZXMsIG51bV9wYWdlcyk7CiAKIAkJCS8qIFRoaXMgaXMgcHJv
YmFibHkgZHVlIHRvIHRoZSBwcm9jZXNzIGJlaW5nIGtpbGxlZCAqLwotCQkJd2hpbGUgKGFjdHVh
bF9wYWdlcyA+IDApIHsKLQkJCQlhY3R1YWxfcGFnZXMtLTsKLQkJCQlwdXRfcGFnZShwYWdlc1th
Y3R1YWxfcGFnZXNdKTsKLQkJCX0KKwkJCXB1dF91c2VyX3BhZ2VzKHBhZ2VzLCBhY3R1YWxfcGFn
ZXMpOwogCQkJY2xlYW51cF9wYWdlbGlzdGluZm8ocGFnZWxpc3RpbmZvKTsKIAkJCXJldHVybiBO
VUxMOwogCQl9Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
