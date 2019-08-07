Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2A845C0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B716E639;
	Wed,  7 Aug 2019 07:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B7F6E588;
 Wed,  7 Aug 2019 01:34:00 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i18so42544029pgl.11;
 Tue, 06 Aug 2019 18:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51+On65LrNSvXr2lp5EjmvkWwZiof+VzaE7I05DxrV4=;
 b=RtiHmdW8dmighok8smy/NuZbYpKEJqzVuF5DU0EI1g98FdLNpWTupA3p6S+x10vfeM
 U8gT32CYi8aTfb3RdKmnuMxK0cFJ45XopwsKZ9MqWXzhKxecESHO3emkK62INHZkOI3t
 XqRKETvU+WICFi71f0Q5Icu2dx1dUo5PzM/7q6TfVREAT9/6mCcfGanquR371X4tC/jI
 F3v1QMYWR8BRciOGg5rc11kQG6CJhUEEZOqvRysv/Pr1p2CxtAlzWM5MpPdlLF0KMM4H
 SJAcvN3I2/ny4yuRP7txwO8/DOsZC5RlHpg/wmt/OaSU6ynhSkh4sXaLtuxD9jVCR5ou
 R9ww==
X-Gm-Message-State: APjAAAUDjN8pGSY0Usx0okQpoVe54MrPg+Zio18Bpauwv7KPVQ7CGIkX
 +tJtlc1aETfScI+XZ3Hoo1Q=
X-Google-Smtp-Source: APXvYqyf93EQUF5J1TAu6cpDsM1o6JoPpYe+Wwb8uLsZYmcgqFaJy5X85xn6gzZV4mlFfmMiaJJNdA==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr5945834pjv.95.1565141640357; 
 Tue, 06 Aug 2019 18:34:00 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:59 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 10/41] media/ivtv: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:09 -0700
Message-Id: <20190807013340.9706-11-jhubbard@nvidia.com>
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
 bh=51+On65LrNSvXr2lp5EjmvkWwZiof+VzaE7I05DxrV4=;
 b=HS5hgHLQTuHN2Sn9FeJ7Ry9Shi37CsQ8JBuMgzW+QMGy5IXf/RFsCZt6S1x06XBeQi
 DnjGCaTAaZsljEKwzFgSKCv3YKZyY9LJk5C71dTnu0TTqdIkluqZnGH65tZnImTYNKAd
 2pWlz2fyn5+MKPzhhgK7Nc+MXto5LZw4BYu52Kq3r1UDWXa+Eo9UCDH4MczS5x/pQmnw
 VRUedCXK07PgrjjNVT2/ovRym41o4od9NHcnmASHKSTmbkxw8flhZPB1nOgA8m/sENwh
 Lvo4EfzFR3bHyNsXSJiKXO3OmKyrCfkmolY0a3G9Y5UDT+HZQc4MDN5LW5udmGwvXApo
 r3dA==
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
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Andy Walls <awalls@md.metrocast.net>, netdev@vger.kernel.org,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQW5keSBX
YWxscyA8YXdhbGxzQG1kLm1ldHJvY2FzdC5uZXQ+CkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWJAa2VybmVsLm9yZz4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVy
cy9tZWRpYS9wY2kvaXZ0di9pdnR2LXVkbWEuYyB8IDE0ICsrKystLS0tLS0tLS0tCiBkcml2ZXJz
L21lZGlhL3BjaS9pdnR2L2l2dHYteXV2LmMgIHwgMTEgKysrLS0tLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHYtdWRtYS5jIGIvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9p
dnR2LXVkbWEuYwppbmRleCA1Zjg4ODMwMzFjOWMuLjdjN2YzM2MyNDEyYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LXVkbWEuYworKysgYi9kcml2ZXJzL21lZGlhL3Bj
aS9pdnR2L2l2dHYtdWRtYS5jCkBAIC05Miw3ICs5Miw3IEBAIGludCBpdnR2X3VkbWFfc2V0dXAo
c3RydWN0IGl2dHYgKml0diwgdW5zaWduZWQgbG9uZyBpdnR2X2Rlc3RfYWRkciwKIHsKIAlzdHJ1
Y3QgaXZ0dl9kbWFfcGFnZV9pbmZvIHVzZXJfZG1hOwogCXN0cnVjdCBpdnR2X3VzZXJfZG1hICpk
bWEgPSAmaXR2LT51ZG1hOwotCWludCBpLCBlcnI7CisJaW50IGVycjsKIAogCUlWVFZfREVCVUdf
RE1BKCJpdnR2X3VkbWFfc2V0dXAsIGRzdDogMHglMDh4XG4iLCAodW5zaWduZWQgaW50KWl2dHZf
ZGVzdF9hZGRyKTsKIApAQCAtMTE5LDggKzExOSw3IEBAIGludCBpdnR2X3VkbWFfc2V0dXAoc3Ry
dWN0IGl2dHYgKml0diwgdW5zaWduZWQgbG9uZyBpdnR2X2Rlc3RfYWRkciwKIAkJSVZUVl9ERUJV
R19XQVJOKCJmYWlsZWQgdG8gbWFwIHVzZXIgcGFnZXMsIHJldHVybmVkICVkIGluc3RlYWQgb2Yg
JWRcbiIsCiAJCQkgICBlcnIsIHVzZXJfZG1hLnBhZ2VfY291bnQpOwogCQlpZiAoZXJyID49IDAp
IHsKLQkJCWZvciAoaSA9IDA7IGkgPCBlcnI7IGkrKykKLQkJCQlwdXRfcGFnZShkbWEtPm1hcFtp
XSk7CisJCQlwdXRfdXNlcl9wYWdlcyhkbWEtPm1hcCwgZXJyKTsKIAkJCXJldHVybiAtRUlOVkFM
OwogCQl9CiAJCXJldHVybiBlcnI7CkBAIC0xMzAsOSArMTI5LDcgQEAgaW50IGl2dHZfdWRtYV9z
ZXR1cChzdHJ1Y3QgaXZ0diAqaXR2LCB1bnNpZ25lZCBsb25nIGl2dHZfZGVzdF9hZGRyLAogCiAJ
LyogRmlsbCBTRyBMaXN0IHdpdGggbmV3IHZhbHVlcyAqLwogCWlmIChpdnR2X3VkbWFfZmlsbF9z
Z19saXN0KGRtYSwgJnVzZXJfZG1hLCAwKSA8IDApIHsKLQkJZm9yIChpID0gMDsgaSA8IGRtYS0+
cGFnZV9jb3VudDsgaSsrKSB7Ci0JCQlwdXRfcGFnZShkbWEtPm1hcFtpXSk7Ci0JCX0KKwkJcHV0
X3VzZXJfcGFnZXMoZG1hLT5tYXAsIGRtYS0+cGFnZV9jb3VudCk7CiAJCWRtYS0+cGFnZV9jb3Vu
dCA9IDA7CiAJCXJldHVybiAtRU5PTUVNOwogCX0KQEAgLTE1Myw3ICsxNTAsNiBAQCBpbnQgaXZ0
dl91ZG1hX3NldHVwKHN0cnVjdCBpdnR2ICppdHYsIHVuc2lnbmVkIGxvbmcgaXZ0dl9kZXN0X2Fk
ZHIsCiB2b2lkIGl2dHZfdWRtYV91bm1hcChzdHJ1Y3QgaXZ0diAqaXR2KQogewogCXN0cnVjdCBp
dnR2X3VzZXJfZG1hICpkbWEgPSAmaXR2LT51ZG1hOwotCWludCBpOwogCiAJSVZUVl9ERUJVR19J
TkZPKCJpdnR2X3VubWFwX3VzZXJfZG1hXG4iKTsKIApAQCAtMTcwLDkgKzE2Niw3IEBAIHZvaWQg
aXZ0dl91ZG1hX3VubWFwKHN0cnVjdCBpdnR2ICppdHYpCiAJaXZ0dl91ZG1hX3N5bmNfZm9yX2Nw
dShpdHYpOwogCiAJLyogUmVsZWFzZSBVc2VyIFBhZ2VzICovCi0JZm9yIChpID0gMDsgaSA8IGRt
YS0+cGFnZV9jb3VudDsgaSsrKSB7Ci0JCXB1dF9wYWdlKGRtYS0+bWFwW2ldKTsKLQl9CisJcHV0
X3VzZXJfcGFnZXMoZG1hLT5tYXAsIGRtYS0+cGFnZV9jb3VudCk7CiAJZG1hLT5wYWdlX2NvdW50
ID0gMDsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LXl1di5j
IGIvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LXl1di5jCmluZGV4IGNkMmZlMmQ0NDRjMC4u
MmM2MWExMWQzOTFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHYteXV2
LmMKKysrIGIvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LXl1di5jCkBAIC0zMCw3ICszMCw2
IEBAIHN0YXRpYyBpbnQgaXZ0dl95dXZfcHJlcF91c2VyX2RtYShzdHJ1Y3QgaXZ0diAqaXR2LCBz
dHJ1Y3QgaXZ0dl91c2VyX2RtYSAqZG1hLAogCXN0cnVjdCB5dXZfcGxheWJhY2tfaW5mbyAqeWkg
PSAmaXR2LT55dXZfaW5mbzsKIAl1OCBmcmFtZSA9IHlpLT5kcmF3X2ZyYW1lOwogCXN0cnVjdCB5
dXZfZnJhbWVfaW5mbyAqZiA9ICZ5aS0+bmV3X2ZyYW1lX2luZm9bZnJhbWVdOwotCWludCBpOwog
CWludCB5X3BhZ2VzLCB1dl9wYWdlczsKIAl1bnNpZ25lZCBsb25nIHlfYnVmZmVyX29mZnNldCwg
dXZfYnVmZmVyX29mZnNldDsKIAlpbnQgeV9kZWNvZGVfaGVpZ2h0LCB1dl9kZWNvZGVfaGVpZ2h0
LCB5X3NpemU7CkBAIC04MSw4ICs4MCw3IEBAIHN0YXRpYyBpbnQgaXZ0dl95dXZfcHJlcF91c2Vy
X2RtYShzdHJ1Y3QgaXZ0diAqaXR2LCBzdHJ1Y3QgaXZ0dl91c2VyX2RtYSAqZG1hLAogCQkJCSB1
dl9wYWdlcywgdXZfZG1hLnBhZ2VfY291bnQpOwogCiAJCQlpZiAodXZfcGFnZXMgPj0gMCkgewot
CQkJCWZvciAoaSA9IDA7IGkgPCB1dl9wYWdlczsgaSsrKQotCQkJCQlwdXRfcGFnZShkbWEtPm1h
cFt5X3BhZ2VzICsgaV0pOworCQkJCXB1dF91c2VyX3BhZ2VzKCZkbWEtPm1hcFt5X3BhZ2VzXSwg
dXZfcGFnZXMpOwogCQkJCXJjID0gLUVGQVVMVDsKIAkJCX0gZWxzZSB7CiAJCQkJcmMgPSB1dl9w
YWdlczsKQEAgLTkzLDggKzkxLDcgQEAgc3RhdGljIGludCBpdnR2X3l1dl9wcmVwX3VzZXJfZG1h
KHN0cnVjdCBpdnR2ICppdHYsIHN0cnVjdCBpdnR2X3VzZXJfZG1hICpkbWEsCiAJCQkJIHlfcGFn
ZXMsIHlfZG1hLnBhZ2VfY291bnQpOwogCQl9CiAJCWlmICh5X3BhZ2VzID49IDApIHsKLQkJCWZv
ciAoaSA9IDA7IGkgPCB5X3BhZ2VzOyBpKyspCi0JCQkJcHV0X3BhZ2UoZG1hLT5tYXBbaV0pOwor
CQkJcHV0X3VzZXJfcGFnZXMoZG1hLT5tYXAsIHlfcGFnZXMpOwogCQkJLyoKIAkJCSAqIEluaGVy
aXQgdGhlIC1FRkFVTFQgZnJvbSByYydzCiAJCQkgKiBpbml0aWFsaXphdGlvbiwgYnV0IGFsbG93
IGl0IHRvIGJlCkBAIC0xMTIsOSArMTA5LDcgQEAgc3RhdGljIGludCBpdnR2X3l1dl9wcmVwX3Vz
ZXJfZG1hKHN0cnVjdCBpdnR2ICppdHYsIHN0cnVjdCBpdnR2X3VzZXJfZG1hICpkbWEsCiAJLyog
RmlsbCAmIG1hcCBTRyBMaXN0ICovCiAJaWYgKGl2dHZfdWRtYV9maWxsX3NnX2xpc3QgKGRtYSwg
JnV2X2RtYSwgaXZ0dl91ZG1hX2ZpbGxfc2dfbGlzdCAoZG1hLCAmeV9kbWEsIDApKSA8IDApIHsK
IAkJSVZUVl9ERUJVR19XQVJOKCJjb3VsZCBub3QgYWxsb2NhdGUgYm91bmNlIGJ1ZmZlcnMgZm9y
IGhpZ2htZW0gdXNlcnNwYWNlIGJ1ZmZlcnNcbiIpOwotCQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5w
YWdlX2NvdW50OyBpKyspIHsKLQkJCXB1dF9wYWdlKGRtYS0+bWFwW2ldKTsKLQkJfQorCQlwdXRf
dXNlcl9wYWdlcyhkbWEtPm1hcCwgZG1hLT5wYWdlX2NvdW50KTsKIAkJZG1hLT5wYWdlX2NvdW50
ID0gMDsKIAkJcmV0dXJuIC1FTk9NRU07CiAJfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
