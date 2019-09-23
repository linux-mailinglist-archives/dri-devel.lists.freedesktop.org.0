Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3BBB849
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 17:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1386E957;
	Mon, 23 Sep 2019 15:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31D66E954;
 Mon, 23 Sep 2019 15:46:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EFBF636961;
 Mon, 23 Sep 2019 15:46:02 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8CD5C21E;
 Mon, 23 Sep 2019 15:46:00 +0000 (UTC)
Date: Mon, 23 Sep 2019 09:45:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vringh: fix copy direction of vringh_iov_push_kern()
Message-ID: <20190923094559.765da494@x1.home>
In-Reply-To: <20190923130331.29324-6-jasowang@redhat.com>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-6-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 23 Sep 2019 15:46:03 +0000 (UTC)
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
Cc: kvm@vger.kernel.org, mst@redhat.com, airlied@linux.ie,
 heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMyBTZXAgMjAxOSAyMTowMzozMCArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gV2Ugd2FudCB0byBjb3B5IGZyb20gaW92IHRvIGJ1Ziwgc28g
dGhlIGRpcmVjdGlvbiB3YXMgd3JvbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8
amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aG9zdC92cmluZ2guYyB8IDgg
KysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKCldoeSBpcyB0aGlzIGluY2x1ZGVkIGluIHRoZSBzZXJpZXM/ICBTZWVtcyBsaWtlIGFuIHVu
cmVsYXRlZCBmaXggYmVpbmcKaGVsZCB1cCB3aXRoaW4gYSBwcm9wb3NhbCBmb3IgYSBuZXcgZmVh
dHVyZS4gIFRoYW5rcywKCkFsZXgKIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZyaW5n
aC5jIGIvZHJpdmVycy92aG9zdC92cmluZ2guYwo+IGluZGV4IDA4YWQwZDFmMDQ3Ni4uYTBhMmQ3
NDk2N2VmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMKPiArKysgYi9kcml2
ZXJzL3Zob3N0L3ZyaW5naC5jCj4gQEAgLTg1Miw2ICs4NTIsMTIgQEAgc3RhdGljIGlubGluZSBp
bnQgeGZlcl9rZXJuKHZvaWQgKnNyYywgdm9pZCAqZHN0LCBzaXplX3QgbGVuKQo+ICAJcmV0dXJu
IDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUgaW50IGtlcm5feGZlcih2b2lkICpkc3QsIHZv
aWQgKnNyYywgc2l6ZV90IGxlbikKPiArewo+ICsJbWVtY3B5KGRzdCwgc3JjLCBsZW4pOwo+ICsJ
cmV0dXJuIDA7Cj4gK30KPiArCj4gIC8qKgo+ICAgKiB2cmluZ2hfaW5pdF9rZXJuIC0gaW5pdGlh
bGl6ZSBhIHZyaW5naCBmb3IgYSBrZXJuZWxzcGFjZSB2cmluZy4KPiAgICogQHZyaDogdGhlIHZy
aW5naCB0byBpbml0aWFsaXplLgo+IEBAIC05NTgsNyArOTY0LDcgQEAgRVhQT1JUX1NZTUJPTCh2
cmluZ2hfaW92X3B1bGxfa2Vybik7Cj4gIHNzaXplX3QgdnJpbmdoX2lvdl9wdXNoX2tlcm4oc3Ry
dWN0IHZyaW5naF9raW92ICp3aW92LAo+ICAJCQkgICAgIGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90
IGxlbikKPiAgewo+IC0JcmV0dXJuIHZyaW5naF9pb3ZfeGZlcih3aW92LCAodm9pZCAqKXNyYywg
bGVuLCB4ZmVyX2tlcm4pOwo+ICsJcmV0dXJuIHZyaW5naF9pb3ZfeGZlcih3aW92LCAodm9pZCAq
KXNyYywgbGVuLCBrZXJuX3hmZXIpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0wodnJpbmdoX2lvdl9w
dXNoX2tlcm4pOwo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
