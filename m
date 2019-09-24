Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DFDBC94B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 15:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3E789E65;
	Tue, 24 Sep 2019 13:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4091789E65;
 Tue, 24 Sep 2019 13:54:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7D05A796ED;
 Tue, 24 Sep 2019 13:54:31 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 220B75B6A5;
 Tue, 24 Sep 2019 13:54:09 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V2 1/8] vringh: fix copy direction of vringh_iov_push_kern()
Date: Tue, 24 Sep 2019 21:53:25 +0800
Message-Id: <20190924135332.14160-2-jasowang@redhat.com>
In-Reply-To: <20190924135332.14160-1-jasowang@redhat.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 24 Sep 2019 13:54:31 +0000 (UTC)
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

V2Ugd2FudCB0byBjb3B5IGZyb20gaW92IHRvIGJ1Ziwgc28gdGhlIGRpcmVjdGlvbiB3YXMgd3Jv
bmcuCgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgotLS0K
IGRyaXZlcnMvdmhvc3QvdnJpbmdoLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92
cmluZ2guYyBiL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMKaW5kZXggMDhhZDBkMWYwNDc2Li5hMGEy
ZDc0OTY3ZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMKKysrIGIvZHJpdmVy
cy92aG9zdC92cmluZ2guYwpAQCAtODUyLDYgKzg1MiwxMiBAQCBzdGF0aWMgaW5saW5lIGludCB4
ZmVyX2tlcm4odm9pZCAqc3JjLCB2b2lkICpkc3QsIHNpemVfdCBsZW4pCiAJcmV0dXJuIDA7CiB9
CiAKK3N0YXRpYyBpbmxpbmUgaW50IGtlcm5feGZlcih2b2lkICpkc3QsIHZvaWQgKnNyYywgc2l6
ZV90IGxlbikKK3sKKwltZW1jcHkoZHN0LCBzcmMsIGxlbik7CisJcmV0dXJuIDA7Cit9CisKIC8q
KgogICogdnJpbmdoX2luaXRfa2VybiAtIGluaXRpYWxpemUgYSB2cmluZ2ggZm9yIGEga2VybmVs
c3BhY2UgdnJpbmcuCiAgKiBAdnJoOiB0aGUgdnJpbmdoIHRvIGluaXRpYWxpemUuCkBAIC05NTgs
NyArOTY0LDcgQEAgRVhQT1JUX1NZTUJPTCh2cmluZ2hfaW92X3B1bGxfa2Vybik7CiBzc2l6ZV90
IHZyaW5naF9pb3ZfcHVzaF9rZXJuKHN0cnVjdCB2cmluZ2hfa2lvdiAqd2lvdiwKIAkJCSAgICAg
Y29uc3Qgdm9pZCAqc3JjLCBzaXplX3QgbGVuKQogewotCXJldHVybiB2cmluZ2hfaW92X3hmZXIo
d2lvdiwgKHZvaWQgKilzcmMsIGxlbiwgeGZlcl9rZXJuKTsKKwlyZXR1cm4gdnJpbmdoX2lvdl94
ZmVyKHdpb3YsICh2b2lkICopc3JjLCBsZW4sIGtlcm5feGZlcik7CiB9CiBFWFBPUlRfU1lNQk9M
KHZyaW5naF9pb3ZfcHVzaF9rZXJuKTsKIAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
