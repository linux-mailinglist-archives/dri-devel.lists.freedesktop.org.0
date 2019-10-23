Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C2E1C19
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 15:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE8D6EA9E;
	Wed, 23 Oct 2019 13:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991376EA9E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 13:16:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-n84wmhJgPQC0N_OluIU2Vg-1; Wed, 23 Oct 2019 09:16:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C10C1800D79;
 Wed, 23 Oct 2019 13:16:36 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-126.pek2.redhat.com [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9997D60126;
 Wed, 23 Oct 2019 13:14:25 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V5 2/6] modpost: add support for mdev class id
Date: Wed, 23 Oct 2019 21:07:48 +0800
Message-Id: <20191023130752.18980-3-jasowang@redhat.com>
In-Reply-To: <20191023130752.18980-1-jasowang@redhat.com>
References: <20191023130752.18980-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: n84wmhJgPQC0N_OluIU2Vg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571836605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxbE8MLVaAhRio1mtblUongS1uhU/Uw7VV6nAO/hf6k=;
 b=NWFhLywum5ifGt1mQNHm8Syc1MFKRnlmjwnhdOlt66dlbrv8CmblZU3Vk4+0yRTmS1tiKb
 C3QzhCWdwxLb1tmEH3x3I7+IjTZ1mex3ukAEkGGUbjH6gzs4igdCD1ERJpYHStDQo21Kum
 4tafyr3KU5c48ml11Jt2kYW/rWI6XBM=
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
CiBzY3JpcHRzL21vZC9maWxlMmFsaWFzLmMgICAgICAgICAgfCAxMCArKysrKysrKysrCiAzIGZp
bGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8v
bWRldi92ZmlvX21kZXYuYyBiL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jCmluZGV4IDdi
MjRlZTljYjhkZC4uY2I3MDFjZDY0NmYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi92
ZmlvX21kZXYuYworKysgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwpAQCAtMTI1LDYg
KzEyNSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9jbGFzc19pZCBpZF90YWJsZVtdID0g
ewogCXsgMCB9LAogfTsKIAorTU9EVUxFX0RFVklDRV9UQUJMRShtZGV2LCBpZF90YWJsZSk7CisK
IHN0YXRpYyBzdHJ1Y3QgbWRldl9kcml2ZXIgdmZpb19tZGV2X2RyaXZlciA9IHsKIAkubmFtZQk9
ICJ2ZmlvX21kZXYiLAogCS5wcm9iZQk9IHZmaW9fbWRldl9wcm9iZSwKZGlmZiAtLWdpdCBhL3Nj
cmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYyBiL3NjcmlwdHMvbW9kL2RldmljZXRhYmxl
LW9mZnNldHMuYwppbmRleCAwNTQ0MDViOTBiYTQuLjZjYmIxMDYyNDg4YSAxMDA2NDQKLS0tIGEv
c2NyaXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jCisrKyBiL3NjcmlwdHMvbW9kL2Rldmlj
ZXRhYmxlLW9mZnNldHMuYwpAQCAtMjMxLDUgKzIzMSw4IEBAIGludCBtYWluKHZvaWQpCiAJREVW
SUQod21pX2RldmljZV9pZCk7CiAJREVWSURfRklFTEQod21pX2RldmljZV9pZCwgZ3VpZF9zdHJp
bmcpOwogCisJREVWSUQobWRldl9jbGFzc19pZCk7CisJREVWSURfRklFTEQobWRldl9jbGFzc19p
ZCwgaWQpOworCiAJcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS9zY3JpcHRzL21vZC9maWxlMmFs
aWFzLmMgYi9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMKaW5kZXggYzkxZWJhNzUxODA0Li5kMzY1
ZGZlN2M3MTggMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYworKysgYi9zY3Jp
cHRzL21vZC9maWxlMmFsaWFzLmMKQEAgLTEzMzUsNiArMTMzNSwxNSBAQCBzdGF0aWMgaW50IGRv
X3dtaV9lbnRyeShjb25zdCBjaGFyICpmaWxlbmFtZSwgdm9pZCAqc3ltdmFsLCBjaGFyICphbGlh
cykKIAlyZXR1cm4gMTsKIH0KIAorLyogbG9va3MgbGlrZTogIm1kZXY6Y04iICovCitzdGF0aWMg
aW50IGRvX21kZXZfZW50cnkoY29uc3QgY2hhciAqZmlsZW5hbWUsIHZvaWQgKnN5bXZhbCwgY2hh
ciAqYWxpYXMpCit7CisJREVGX0ZJRUxEKHN5bXZhbCwgbWRldl9jbGFzc19pZCwgaWQpOworCisJ
c3ByaW50ZihhbGlhcywgIm1kZXY6YyUwMlgiLCBpZCk7CisJcmV0dXJuIDE7Cit9CisKIC8qIERv
ZXMgbmFtZWxlbiBieXRlcyBvZiBuYW1lIGV4YWN0bHkgbWF0Y2ggdGhlIHN5bWJvbD8gKi8KIHN0
YXRpYyBib29sIHN5bV9pcyhjb25zdCBjaGFyICpuYW1lLCB1bnNpZ25lZCBuYW1lbGVuLCBjb25z
dCBjaGFyICpzeW1ib2wpCiB7CkBAIC0xNDA3LDYgKzE0MTYsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRldnRhYmxlIGRldnRhYmxlW10gPSB7CiAJeyJ0eXBlYyIsIFNJWkVfdHlwZWNfZGV2aWNl
X2lkLCBkb190eXBlY19lbnRyeX0sCiAJeyJ0ZWUiLCBTSVpFX3RlZV9jbGllbnRfZGV2aWNlX2lk
LCBkb190ZWVfZW50cnl9LAogCXsid21pIiwgU0laRV93bWlfZGV2aWNlX2lkLCBkb193bWlfZW50
cnl9LAorCXsibWRldiIsIFNJWkVfbWRldl9jbGFzc19pZCwgZG9fbWRldl9lbnRyeX0sCiB9Owog
CiAvKiBDcmVhdGUgTU9EVUxFX0FMSUFTKCkgc3RhdGVtZW50cy4KLS0gCjIuMTkuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
