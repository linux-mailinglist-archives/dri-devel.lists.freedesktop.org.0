Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B9F3269
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FE86E4A1;
	Thu,  7 Nov 2019 15:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8644B6E4A1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 15:12:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-VKWI9kqOMVicuoMUXExOJg-1; Thu, 07 Nov 2019 10:12:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 550B18017E0;
 Thu,  7 Nov 2019 15:12:45 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-21.pek2.redhat.com [10.72.12.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54707600D1;
 Thu,  7 Nov 2019 15:12:17 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V11 2/6] modpost: add support for mdev class id
Date: Thu,  7 Nov 2019 23:11:05 +0800
Message-Id: <20191107151109.23261-3-jasowang@redhat.com>
In-Reply-To: <20191107151109.23261-1-jasowang@redhat.com>
References: <20191107151109.23261-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: VKWI9kqOMVicuoMUXExOJg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573139572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jYHNi5/Z7oowUoL78rMhKZ6a5a5wDzQX/xErsA9Orw=;
 b=CqeICrWVlw9Qnw8m8xe/EBn+vbaJnf00SiACpZu2+RbJK1AFDC4FgYSKakGY6G7OXjwGm9
 MsIVLfjLN60uog/jroLttAj5HCsvcWRpGl8Bbni933Su4aN13Xci8TcIUwFQq4Z9ITtr8H
 B1RnApU3zVvjmWIm04xNGZbk/5FVLCo=
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
Cc: rdunlap@infradead.org, christophe.de.dinechin@gmail.com,
 sebott@linux.ibm.com, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, parav@mellanox.com, gor@linux.ibm.com,
 cunming.liang@intel.com, rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, stefanha@redhat.com, zhihong.wang@intel.com,
 akrowiak@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
 oberpar@linux.ibm.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgdG8gcGFyc2UgbWRldiBjbGFzcyBpZCB0YWJsZS4KClJldmlld2VkLWJ5OiBQ
YXJhdiBQYW5kaXQgPHBhcmF2QG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IENvcm5lbGlhIEh1
Y2sgPGNvaHVja0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAgICB8ICAy
ICsrCiBzY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMgfCAgMyArKysKIHNjcmlwdHMv
bW9kL2ZpbGUyYWxpYXMuYyAgICAgICAgICB8IDExICsrKysrKysrKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vbWRldi92Zmlv
X21kZXYuYyBiL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jCmluZGV4IDM4NDMxZTllZjdm
NS4uYTY2NDFjZDhiNWEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYu
YworKysgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwpAQCAtMTI1LDYgKzEyNSw4IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9jbGFzc19pZCB2ZmlvX2lkX3RhYmxlW10gPSB7CiAJ
eyAwIH0sCiB9OwogCitNT0RVTEVfREVWSUNFX1RBQkxFKG1kZXYsIHZmaW9faWRfdGFibGUpOwor
CiBzdGF0aWMgc3RydWN0IG1kZXZfZHJpdmVyIHZmaW9fbWRldl9kcml2ZXIgPSB7CiAJLm5hbWUJ
PSAidmZpb19tZGV2IiwKIAkucHJvYmUJPSB2ZmlvX21kZXZfcHJvYmUsCmRpZmYgLS1naXQgYS9z
Y3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMgYi9zY3JpcHRzL21vZC9kZXZpY2V0YWJs
ZS1vZmZzZXRzLmMKaW5kZXggMDU0NDA1YjkwYmE0Li42Y2JiMTA2MjQ4OGEgMTAwNjQ0Ci0tLSBh
L3NjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYworKysgYi9zY3JpcHRzL21vZC9kZXZp
Y2V0YWJsZS1vZmZzZXRzLmMKQEAgLTIzMSw1ICsyMzEsOCBAQCBpbnQgbWFpbih2b2lkKQogCURF
VklEKHdtaV9kZXZpY2VfaWQpOwogCURFVklEX0ZJRUxEKHdtaV9kZXZpY2VfaWQsIGd1aWRfc3Ry
aW5nKTsKIAorCURFVklEKG1kZXZfY2xhc3NfaWQpOworCURFVklEX0ZJRUxEKG1kZXZfY2xhc3Nf
aWQsIGlkKTsKKwogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2QvZmlsZTJh
bGlhcy5jIGIvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jCmluZGV4IGM5MWViYTc1MTgwNC4uNDVm
MWMyMmY0OWJlIDEwMDY0NAotLS0gYS9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMKKysrIGIvc2Ny
aXB0cy9tb2QvZmlsZTJhbGlhcy5jCkBAIC0xMzM1LDYgKzEzMzUsMTYgQEAgc3RhdGljIGludCBk
b193bWlfZW50cnkoY29uc3QgY2hhciAqZmlsZW5hbWUsIHZvaWQgKnN5bXZhbCwgY2hhciAqYWxp
YXMpCiAJcmV0dXJuIDE7CiB9CiAKKy8qIGxvb2tzIGxpa2U6ICJtZGV2OmNOIiAqLworc3RhdGlj
IGludCBkb19tZGV2X2VudHJ5KGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB2b2lkICpzeW12YWwsIGNo
YXIgKmFsaWFzKQoreworCURFRl9GSUVMRChzeW12YWwsIG1kZXZfY2xhc3NfaWQsIGlkKTsKKwor
CXNwcmludGYoYWxpYXMsICJtZGV2OmMlMDJYIiwgaWQpOworCWFkZF93aWxkY2FyZChhbGlhcyk7
CisJcmV0dXJuIDE7Cit9CisKIC8qIERvZXMgbmFtZWxlbiBieXRlcyBvZiBuYW1lIGV4YWN0bHkg
bWF0Y2ggdGhlIHN5bWJvbD8gKi8KIHN0YXRpYyBib29sIHN5bV9pcyhjb25zdCBjaGFyICpuYW1l
LCB1bnNpZ25lZCBuYW1lbGVuLCBjb25zdCBjaGFyICpzeW1ib2wpCiB7CkBAIC0xNDA3LDYgKzE0
MTcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldnRhYmxlIGRldnRhYmxlW10gPSB7CiAJeyJ0
eXBlYyIsIFNJWkVfdHlwZWNfZGV2aWNlX2lkLCBkb190eXBlY19lbnRyeX0sCiAJeyJ0ZWUiLCBT
SVpFX3RlZV9jbGllbnRfZGV2aWNlX2lkLCBkb190ZWVfZW50cnl9LAogCXsid21pIiwgU0laRV93
bWlfZGV2aWNlX2lkLCBkb193bWlfZW50cnl9LAorCXsibWRldiIsIFNJWkVfbWRldl9jbGFzc19p
ZCwgZG9fbWRldl9lbnRyeX0sCiB9OwogCiAvKiBDcmVhdGUgTU9EVUxFX0FMSUFTKCkgc3RhdGVt
ZW50cy4KLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
