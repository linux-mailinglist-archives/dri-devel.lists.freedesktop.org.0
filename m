Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D328EE04B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 13:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665436E3A8;
	Mon,  4 Nov 2019 12:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8816E379
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 12:44:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-vRISspVuMJ6kcJukeiQ94w-1; Mon, 04 Nov 2019 07:43:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738DC1005500;
 Mon,  4 Nov 2019 12:43:53 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-65.pek2.redhat.com [10.72.12.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DDB060CD0;
 Mon,  4 Nov 2019 12:43:00 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V7 2/6] modpost: add support for mdev class id
Date: Mon,  4 Nov 2019 20:39:48 +0800
Message-Id: <20191104123952.17276-3-jasowang@redhat.com>
In-Reply-To: <20191104123952.17276-1-jasowang@redhat.com>
References: <20191104123952.17276-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: vRISspVuMJ6kcJukeiQ94w-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572871443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kyIvhY3BXMqZ4TEtR3KTmpEF86AeFHO8xa0fKWzJeAE=;
 b=hQx3J7wwzZYathJFMs1CPLKp1dRrrstUaIudRdC+DnrIXwucqXpAi+Y6Ek/jH2RPqDeUfZ
 MyEzihIjzH5I+gTCnwjoEJ9QwLuGsdfkaf31ajfnv8mj1LB9IbV4ab+9Ph6vsKIRKzx/+z
 WaSzWT6q+c4a31yuuV61/pZvoJfketk=
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
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
 Jason Wang <jasowang@redhat.com>, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, cunming.liang@intel.com, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, stefanha@redhat.com, akrowiak@linux.ibm.com,
 netdev@vger.kernel.org, cohuck@redhat.com, oberpar@linux.ibm.com,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgdG8gcGFyc2UgbWRldiBjbGFzcyBpZCB0YWJsZS4KClJldmlld2VkLWJ5OiBQ
YXJhdiBQYW5kaXQgPHBhcmF2QG1lbGxhbm94LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYu
YyAgICAgfCAgMiArKwogc2NyaXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jIHwgIDMgKysr
CiBzY3JpcHRzL21vZC9maWxlMmFsaWFzLmMgICAgICAgICAgfCAxMSArKysrKysrKysrKwogMyBm
aWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92Zmlv
L21kZXYvdmZpb19tZGV2LmMgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwppbmRleCAz
ODQzMWU5ZWY3ZjUuLmE2NjQxY2Q4YjVhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy92ZmlvL21kZXYv
dmZpb19tZGV2LmMKKysrIGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMKQEAgLTEyNSw2
ICsxMjUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfY2xhc3NfaWQgdmZpb19pZF90YWJs
ZVtdID0gewogCXsgMCB9LAogfTsKIAorTU9EVUxFX0RFVklDRV9UQUJMRShtZGV2LCB2ZmlvX2lk
X3RhYmxlKTsKKwogc3RhdGljIHN0cnVjdCBtZGV2X2RyaXZlciB2ZmlvX21kZXZfZHJpdmVyID0g
ewogCS5uYW1lCT0gInZmaW9fbWRldiIsCiAJLnByb2JlCT0gdmZpb19tZGV2X3Byb2JlLApkaWZm
IC0tZ2l0IGEvc2NyaXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jIGIvc2NyaXB0cy9tb2Qv
ZGV2aWNldGFibGUtb2Zmc2V0cy5jCmluZGV4IDA1NDQwNWI5MGJhNC4uNmNiYjEwNjI0ODhhIDEw
MDY0NAotLS0gYS9zY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMKKysrIGIvc2NyaXB0
cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jCkBAIC0yMzEsNSArMjMxLDggQEAgaW50IG1haW4o
dm9pZCkKIAlERVZJRCh3bWlfZGV2aWNlX2lkKTsKIAlERVZJRF9GSUVMRCh3bWlfZGV2aWNlX2lk
LCBndWlkX3N0cmluZyk7CiAKKwlERVZJRChtZGV2X2NsYXNzX2lkKTsKKwlERVZJRF9GSUVMRCht
ZGV2X2NsYXNzX2lkLCBpZCk7CisKIAlyZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL3NjcmlwdHMv
bW9kL2ZpbGUyYWxpYXMuYyBiL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYwppbmRleCBjOTFlYmE3
NTE4MDQuLjQ1ZjFjMjJmNDliZSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5j
CisrKyBiL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYwpAQCAtMTMzNSw2ICsxMzM1LDE2IEBAIHN0
YXRpYyBpbnQgZG9fd21pX2VudHJ5KGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB2b2lkICpzeW12YWws
IGNoYXIgKmFsaWFzKQogCXJldHVybiAxOwogfQogCisvKiBsb29rcyBsaWtlOiAibWRldjpjTiIg
Ki8KK3N0YXRpYyBpbnQgZG9fbWRldl9lbnRyeShjb25zdCBjaGFyICpmaWxlbmFtZSwgdm9pZCAq
c3ltdmFsLCBjaGFyICphbGlhcykKK3sKKwlERUZfRklFTEQoc3ltdmFsLCBtZGV2X2NsYXNzX2lk
LCBpZCk7CisKKwlzcHJpbnRmKGFsaWFzLCAibWRldjpjJTAyWCIsIGlkKTsKKwlhZGRfd2lsZGNh
cmQoYWxpYXMpOworCXJldHVybiAxOworfQorCiAvKiBEb2VzIG5hbWVsZW4gYnl0ZXMgb2YgbmFt
ZSBleGFjdGx5IG1hdGNoIHRoZSBzeW1ib2w/ICovCiBzdGF0aWMgYm9vbCBzeW1faXMoY29uc3Qg
Y2hhciAqbmFtZSwgdW5zaWduZWQgbmFtZWxlbiwgY29uc3QgY2hhciAqc3ltYm9sKQogewpAQCAt
MTQwNyw2ICsxNDE3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZ0YWJsZSBkZXZ0YWJsZVtd
ID0gewogCXsidHlwZWMiLCBTSVpFX3R5cGVjX2RldmljZV9pZCwgZG9fdHlwZWNfZW50cnl9LAog
CXsidGVlIiwgU0laRV90ZWVfY2xpZW50X2RldmljZV9pZCwgZG9fdGVlX2VudHJ5fSwKIAl7Indt
aSIsIFNJWkVfd21pX2RldmljZV9pZCwgZG9fd21pX2VudHJ5fSwKKwl7Im1kZXYiLCBTSVpFX21k
ZXZfY2xhc3NfaWQsIGRvX21kZXZfZW50cnl9LAogfTsKIAogLyogQ3JlYXRlIE1PRFVMRV9BTElB
UygpIHN0YXRlbWVudHMuCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
