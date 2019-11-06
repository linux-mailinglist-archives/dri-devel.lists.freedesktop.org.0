Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8CFF2835
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3576EE9C;
	Thu,  7 Nov 2019 07:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 905 seconds by postgrey-1.36 at gabe;
 Wed, 06 Nov 2019 07:46:45 UTC
Received: from mail-m974.mail.163.com (mail-m974.mail.163.com [123.126.97.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87C226EC2B;
 Wed,  6 Nov 2019 07:46:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [202.112.113.212])
 by smtp4 (Coremail) with SMTP id HNxpCgCXRjG8dsJd0yl7BQ--.263S3;
 Wed, 06 Nov 2019 15:31:26 +0800 (CST)
From: Pan Bian <bianpan2016@163.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/gvt: fix dropping obj reference twice
Date: Wed,  6 Nov 2019 15:31:07 +0800
Message-Id: <1573025467-18278-1-git-send-email-bianpan2016@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: HNxpCgCXRjG8dsJd0yl7BQ--.263S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrW3tr1DXFWxKrWfKw1kGrg_yoWkurbEkr
 WYqF17CrZrKFs09r1jyr9rAas2gF4UZFW8W3y7t34kA342kw1DZFZ5Zr15Zr18uF4UAFZx
 AF1xury3ZFWF9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1xwIPUUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/xtbBUQ5lclaD5JcnsgAAs7
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id; bh=10j9yC2LKZ4Yu8yJAT
 38Az579fi88WXpZdGmSsenJPQ=; b=UeYFaws6OMq6xy765lPDJs+n7oC6z4TtQl
 vbRk9uEz0iZ5qE5YN/NlX6LAaS6zPv86MgtPDw1tUc0aA3+UGA6XpunNBUnojJrF
 09FfMGQxsNFdoFNXRD1fYqiB3jW7aUpe7OYDqcjV3jUpHLrIU5rbsXXXcJ/Aeqzm
 R+rHk2M8c=
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
Cc: Pan Bian <bianpan2016@163.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHJlZmVyZW5jZSBjb3VudCBvZiBvYmogd2lsbCBiZSBkZWNyZW1lbnRlZCB0d2ljZSBpZiBl
cnJvciBvY2N1cnMKaW4gZG1hX2J1Zl9mZCgpLiBBZGRpdGlvbmFsbHksIGF0dGVtcHRpbmcgdG8g
cmVhZCB0aGUgcmVmZXJlbmNlIGNvdW50IG9mCm9iaiBhZnRlciBkcm9wcGluZyByZWZlcmVuY2Ug
bWF5IGxlYWQgdG8gYSB1c2UgYWZ0ZXIgZnJlZSBidWcuIEhlcmUsIHdlCmRyb3Agb2JqJ3MgcmVm
ZXJlbmNlIHVudGlsIGl0IGlzIG5vdCB1c2VkLgoKU2lnbmVkLW9mZi1ieTogUGFuIEJpYW4gPGJp
YW5wYW4yMDE2QDE2My5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwppbmRleCAxMzA0NGMwMjdmMjcuLjRiZmFlZmRm
NTQ4ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwpAQCAtNDk4LDggKzQ5OCw2IEBAIGlu
dCBpbnRlbF92Z3B1X2dldF9kbWFidWYoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVk
IGludCBkbWFidWZfaWQpCiAJCWdvdG8gb3V0X2ZyZWVfZ2VtOwogCX0KIAotCWk5MTVfZ2VtX29i
amVjdF9wdXQob2JqKTsKLQogCXJldCA9IGRtYV9idWZfZmQoZG1hYnVmLCBEUk1fQ0xPRVhFQyB8
IERSTV9SRFdSKTsKIAlpZiAocmV0IDwgMCkgewogCQlndnRfdmdwdV9lcnIoImNyZWF0ZSBkbWEt
YnVmIGZkIGZhaWxlZCByZXQ6JWRcbiIsIHJldCk7CkBAIC01MjQsNiArNTIyLDggQEAgaW50IGlu
dGVsX3ZncHVfZ2V0X2RtYWJ1ZihzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50
IGRtYWJ1Zl9pZCkKIAkJICAgIGZpbGVfY291bnQoZG1hYnVmLT5maWxlKSwKIAkJICAgIGtyZWZf
cmVhZCgmb2JqLT5iYXNlLnJlZmNvdW50KSk7CiAKKwlpOTE1X2dlbV9vYmplY3RfcHV0KG9iaik7
CisKIAlyZXR1cm4gZG1hYnVmX2ZkOwogCiBvdXRfZnJlZV9kbWFidWY6Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
