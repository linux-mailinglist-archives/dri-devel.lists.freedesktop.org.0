Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50569845EE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15766E67C;
	Wed,  7 Aug 2019 07:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523536E584;
 Wed,  7 Aug 2019 01:34:47 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id r26so6587505pgl.10;
 Tue, 06 Aug 2019 18:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0Etnn7JHR8H7TocLV05oLauZ77NAi3PGTTr9FTaKTw=;
 b=tr35XRDh7GqLQawxvApqMnussJHtOYwBjEntRLuMbmWxl2thqw3eD8gLi19BiVJxy4
 YwMs37R6Ao+f/wccYmnOIKg+EGSLzZsVtGgDgBDswkCT4OfaM/sbHzGCR7LjfWYX/tmL
 1OcfrARlj6AxFre8zii4k6wEP2siUiWdqXOdtyixMTKq6PsXeOjJrErhoowgevFj3bSo
 Q/fQ/M+RcF4Tl5ogjFJT5+owS8RArxFy0hTCHlE9p4aoDEGp3uKV9ELnFYGFAXl7HBjy
 eDRdgiJze19mFu0dUGJS/MkyfDJeM+cEaXbaIA7O6IBKgsNDclKz6X6EYs3H7llknaai
 4hKQ==
X-Gm-Message-State: APjAAAUsUcv3Z2ct4a3q/YrsgYd1RCuGvj1N6yhJ1R2T/NfQg16vag2y
 wTwcaDJicaII+Hhx3d1gSsk=
X-Google-Smtp-Source: APXvYqzWWP/A0o9J09jCJjajCJWgGO/EPyZUANiBcpDufZXSuOwgzfu98JYNHWmK3CJ1oF9MD+qnUg==
X-Received: by 2002:aa7:8201:: with SMTP id k1mr6559788pfi.97.1565141687010;
 Tue, 06 Aug 2019 18:34:47 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:46 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 39/41] mm/mlock.c: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:38 -0700
Message-Id: <20190807013340.9706-40-jhubbard@nvidia.com>
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
 bh=H0Etnn7JHR8H7TocLV05oLauZ77NAi3PGTTr9FTaKTw=;
 b=eS3YB7ZT4YXwuCcgQbB/xbD+n10dBypw+iZZVQIUwi66vhDfcSIp39QkGkG7an7OJl
 OiukENJvNGRlLtpSvoOFB7XysgcSlBHri3dSlfLLl2JoybffI8wnImTZeHQEdnORxVLa
 EBXGZhIf+YSKbjfkupoovScD765pOoXW+wmQ3q47Y78G67P4azJFj7Z03p0IlFla0TF0
 WGS9epzDu3lNP0Hir82G8T/Dsucq+VMZQ717BtULEmOp/zZ+HeTgTfaZfag+K5X0r5bl
 +CKlJZyT3xTot1t0x6sX+RloIZlzVtbmPtAqvydRbxbh9+Ay6+ppy+Ss6WRVBPk23UrF
 ZgCQ==
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
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Daniel Black <daniel@linux.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBEYW5pZWwgQmxhY2sgPGRhbmll
bEBsaW51eC5pYm0uY29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IErDqXLDtG1l
IEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+CkNjOiBNaWtlIEtyYXZldHogPG1pa2Uua3JhdmV0ekBvcmFjbGUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbW0v
bWxvY2suYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL21sb2NrLmMgYi9tbS9tbG9jay5jCmluZGV4IGE5
MDA5OWRhNGZiNC4uYjk4MGU2MjcwZThhIDEwMDY0NAotLS0gYS9tbS9tbG9jay5jCisrKyBiL21t
L21sb2NrLmMKQEAgLTM0NSw3ICszNDUsNyBAQCBzdGF0aWMgdm9pZCBfX211bmxvY2tfcGFnZXZl
YyhzdHJ1Y3QgcGFnZXZlYyAqcHZlYywgc3RydWN0IHpvbmUgKnpvbmUpCiAJCQkJZ2V0X3BhZ2Uo
cGFnZSk7IC8qIGZvciBwdXRiYWNrX2xydV9wYWdlKCkgKi8KIAkJCQlfX211bmxvY2tfaXNvbGF0
ZWRfcGFnZShwYWdlKTsKIAkJCQl1bmxvY2tfcGFnZShwYWdlKTsKLQkJCQlwdXRfcGFnZShwYWdl
KTsgLyogZnJvbSBmb2xsb3dfcGFnZV9tYXNrKCkgKi8KKwkJCQlwdXRfdXNlcl9wYWdlKHBhZ2Up
OyAvKiBmcm9tIGZvbGxvd19wYWdlX21hc2soKSAqLwogCQkJfQogCQl9CiAJfQpAQCAtNDY3LDcg
KzQ2Nyw3IEBAIHZvaWQgbXVubG9ja192bWFfcGFnZXNfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsCiAJCWlmIChwYWdlICYmICFJU19FUlIocGFnZSkpIHsKIAkJCWlmIChQYWdlVHJh
bnNUYWlsKHBhZ2UpKSB7CiAJCQkJVk1fQlVHX09OX1BBR0UoUGFnZU1sb2NrZWQocGFnZSksIHBh
Z2UpOwotCQkJCXB1dF9wYWdlKHBhZ2UpOyAvKiBmb2xsb3dfcGFnZV9tYXNrKCkgKi8KKwkJCQlw
dXRfdXNlcl9wYWdlKHBhZ2UpOyAvKiBmb2xsb3dfcGFnZV9tYXNrKCkgKi8KIAkJCX0gZWxzZSBp
ZiAoUGFnZVRyYW5zSHVnZShwYWdlKSkgewogCQkJCWxvY2tfcGFnZShwYWdlKTsKIAkJCQkvKgpA
QCAtNDc4LDcgKzQ3OCw3IEBAIHZvaWQgbXVubG9ja192bWFfcGFnZXNfcmFuZ2Uoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsCiAJCQkJICovCiAJCQkJcGFnZV9tYXNrID0gbXVubG9ja192bWFf
cGFnZShwYWdlKTsKIAkJCQl1bmxvY2tfcGFnZShwYWdlKTsKLQkJCQlwdXRfcGFnZShwYWdlKTsg
LyogZm9sbG93X3BhZ2VfbWFzaygpICovCisJCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsgLyogZm9s
bG93X3BhZ2VfbWFzaygpICovCiAJCQl9IGVsc2UgewogCQkJCS8qCiAJCQkJICogTm9uLWh1Z2Ug
cGFnZXMgYXJlIGhhbmRsZWQgaW4gYmF0Y2hlcyB2aWEKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
