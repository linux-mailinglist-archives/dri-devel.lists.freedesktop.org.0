Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD552BC95A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 15:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA826EA35;
	Tue, 24 Sep 2019 13:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76DA89D8E;
 Tue, 24 Sep 2019 13:55:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 299BB18C8914;
 Tue, 24 Sep 2019 13:55:18 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 098F15B6A5;
 Tue, 24 Sep 2019 13:54:56 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V2 3/8] mdev: bus uevent support
Date: Tue, 24 Sep 2019 21:53:27 +0800
Message-Id: <20190924135332.14160-4-jasowang@redhat.com>
In-Reply-To: <20190924135332.14160-1-jasowang@redhat.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 24 Sep 2019 13:55:18 +0000 (UTC)
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
 zhihong.wang@intel.com, akrowiak@linux.ibm.com, netdev@vger.kernel.org,
 cohuck@redhat.com, oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGJ1cyB1ZXZlbnQgc3VwcG9ydCBmb3IgbWRldiBidXMgaW4gb3JkZXIg
dG8gYWxsb3cKY29vcGVyYXRpb24gd2l0aCB1c2Vyc3BhY2UuCgpTaWduZWQtb2ZmLWJ5OiBKYXNv
biBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvdmZpby9tZGV2L21kZXZf
ZHJpdmVyLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyBiL2RyaXZlcnMvdmZp
by9tZGV2L21kZXZfZHJpdmVyLmMKaW5kZXggYjdjNDBjZTg2ZWUzLi4zMTlkODg2ZmZhZjcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMKKysrIGIvZHJpdmVycy92
ZmlvL21kZXYvbWRldl9kcml2ZXIuYwpAQCAtODIsOSArODIsMTcgQEAgc3RhdGljIGludCBtZGV2
X21hdGNoKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9kcml2ZXIgKmRydikKIAly
ZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBtZGV2X3VldmVudChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBrb2JqX3VldmVudF9lbnYgKmVudikKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYgPSB0b19tZGV2X2RldmljZShkZXYpOworCisJcmV0dXJuIGFkZF91ZXZlbnRfdmFyKGVudiwg
Ik1PREFMSUFTPW1kZXY6YyUwMlgiLCBtZGV2LT5jbGFzc19pZCk7Cit9CisKIHN0cnVjdCBidXNf
dHlwZSBtZGV2X2J1c190eXBlID0gewogCS5uYW1lCQk9ICJtZGV2IiwKIAkubWF0Y2gJCT0gbWRl
dl9tYXRjaCwKKwkudWV2ZW50CQk9IG1kZXZfdWV2ZW50LAogCS5wcm9iZQkJPSBtZGV2X3Byb2Jl
LAogCS5yZW1vdmUJCT0gbWRldl9yZW1vdmUsCiB9OwotLSAKMi4xOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
