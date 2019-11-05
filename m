Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F18F0365
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 17:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64106E0BC;
	Tue,  5 Nov 2019 16:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C18E6E0BC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 16:50:57 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Dv4NBosnMKiU07dNahgicg-1; Tue, 05 Nov 2019 11:50:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99D18800C73;
 Tue,  5 Nov 2019 16:50:47 +0000 (UTC)
Received: from gondolin (unknown [10.36.118.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2771608AC;
 Tue,  5 Nov 2019 16:50:27 +0000 (UTC)
Date: Tue, 5 Nov 2019 17:50:25 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V8 3/6] mdev: introduce device specific ops
Message-ID: <20191105175025.1a620844.cohuck@redhat.com>
In-Reply-To: <20191105093240.5135-4-jasowang@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
 <20191105093240.5135-4-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Dv4NBosnMKiU07dNahgicg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572972655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEq/4N6z16D+kibBkGDa/kA9t8KJGrCRdBUQy6uE194=;
 b=aCP80+BpFVXW9q2bKK9XWMdMd4FPzGixMyzL3PJTFsHfjG8BjohepaqUWrP6C9w0BJDSML
 RMhlsHdaXhsf6Anm5JpmpvdJJEQUPrSbB9hW5Kdor3ZMN9yGa6dvnkbzWH1iWI6vwRQbG6
 MHVZ9/q1GZy+k5i8yLyPQ4E6LfUw0xc=
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 mst@redhat.com, airlied@linux.ie, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org, alex.williamson@redhat.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAgNSBOb3YgMjAxOSAxNzozMjozNyArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gQ3VycmVudGx5LCBleGNlcHQgZm9yIHRoZSBjcmVhdGUgYW5k
IHJlbW92ZSwgdGhlIHJlc3Qgb2YKPiBtZGV2X3BhcmVudF9vcHMgaXMgZGVzaWduZWQgZm9yIHZm
aW8tbWRldiBkcml2ZXIgb25seSBhbmQgbWF5IG5vdCBoZWxwCj4gZm9yIGtlcm5lbCBtZGV2IGRy
aXZlci4gV2l0aCB0aGUgaGVscCBvZiBjbGFzcyBpZCwgdGhpcyBwYXRjaAo+IGludHJvZHVjZXMg
ZGV2aWNlIHNwZWNpZmljIGNhbGxiYWNrcyBpbnNpZGUgbWRldl9kZXZpY2UKPiBzdHJ1Y3R1cmUu
IFRoaXMgYWxsb3dzIGRpZmZlcmVudCBzZXQgb2YgY2FsbGJhY2sgdG8gYmUgdXNlZCBieQo+IHZm
aW8tbWRldiBhbmQgdmlydGlvLW1kZXYuCj4gCj4gUmV2aWV3ZWQtYnk6IFBhcmF2IFBhbmRpdCA8
cGFyYXZAbWVsbGFub3guY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5n
QHJlZGhhdC5jb20+Cj4gLS0tCj4gIC4uLi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNl
LnJzdCAgICAgICB8IDM1ICsrKysrKysrKy0tLS0KPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
a3ZtZ3QuYyAgICAgICAgICAgICAgfCAxOCArKysrLS0tCj4gIGRyaXZlcnMvczM5MC9jaW8vdmZp
b19jY3dfb3BzLmMgICAgICAgICAgICAgICB8IDE4ICsrKystLS0KPiAgZHJpdmVycy9zMzkwL2Ny
eXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgIHwgMTQgKysrLS0KPiAgZHJpdmVycy92Zmlv
L21kZXYvbWRldl9jb3JlLmMgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrKystCj4gIGRyaXZl
cnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oICAgICAgICAgICAgICB8ICA1ICsrCj4gIGRyaXZl
cnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAgICAgICAgICAgICAgICB8IDM3ICsrKysrKy0tLS0t
LS0KPiAgaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDMg
KysrKy0tLS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvbWRldl92ZmlvX29wcy5oICAgICAgICAg
ICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJv
Y2hzLmMgICAgICAgICAgICAgICAgICAgIHwgMjAgKysrKy0tLQo+ICBzYW1wbGVzL3ZmaW8tbWRl
di9tZHB5LmMgICAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrLS0tCj4gIHNhbXBsZXMvdmZp
by1tZGV2L210dHkuYyAgICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKystLS0KPiAgMTMgZmls
ZXMgY2hhbmdlZCwgMjA2IGluc2VydGlvbnMoKyksIDk5IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZGV2X3ZmaW9fb3BzLmgKPiAKCiguLi4pCgo+IEBA
IC0xNzIsMTAgKzE2MywzNCBAQCB0aGF0IGEgZHJpdmVyIHNob3VsZCB1c2UgdG8gdW5yZWdpc3Rl
ciBpdHNlbGYgd2l0aCB0aGUgbWRldiBjb3JlIGRyaXZlcjo6Cj4gIAo+ICAJZXh0ZXJuIHZvaWQg
bWRldl91bnJlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ICAKPiAtSXQgaXMg
YWxzbyByZXF1aXJlZCB0byBzcGVjaWZ5IHRoZSBjbGFzc19pZCBpbiBjcmVhdGUoKSBjYWxsYmFj
ayB0aHJvdWdoOjoKPiArQXMgbXVsdGlwbGUgdHlwZXMgb2YgbWVkaWF0ZWQgZGV2aWNlcyBtYXkg
YmUgc3VwcG9ydGVkLCBjbGFzcyBpZCBuZWVkcwo+ICt0byBiZSBzcGVjaWZpZWQgaW4gdGhlIGNy
ZWF0ZSBjYWxsYmFjaygpLiBUaGlzIGNvdWxkIGJlIGRvbmUKClRoZSBicmFja2V0cyBzaG91bGQg
cHJvYmFibHkgZ28gYmVoaW5kICdjcmVhdGUnPwoKPiArZXhwbGljaXRseSBmb3IgdGhlIGRldmlj
ZSB0aGF0IGRvZXMgbm90IHVzZSBvbiBtZGV2IGJ1cyBmb3IgaXRzCgoiZm9yIGRldmljZXMgdGhh
dCBkbyBub3QgdXNlIHRoZSBtZGV2IGJ1cyIgPwoKQnV0IHdoeSB3b3VsZG4ndCB0aGV5PyBJIGZl
ZWwgbGlrZSBJJ3ZlIG1pc3NlZCBzb21lIGRpc2N1c3Npb24gaGVyZSA6LwoKPiArb3BlcmF0aW9u
IHRocm91Z2g6Cj4gIAo+ICAJaW50IG1kZXZfc2V0X2NsYXNzKHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldiwgdTE2IGlkKTsKPiAgCj4gK0ZvciB0aGUgZGV2aWNlIHRoYXQgdXNlcyBvbiB0aGUgbWRl
diBidXMgZm9yIGl0cyBvcGVyYXRpb24sIHRoZSBjbGFzcwoKIkZvciBkZXZpY2VzIHRoYXQgdXNl
IHRoZSBtZGV2IGJ1cy4uLiIKCkJ1dCBzYW1lIGNvbW1lbnQgYXMgYWJvdmUuCgo+ICtzaG91bGQg
cHJvdmlkZSBoZWxwZXIgZnVuY3Rpb24gdG8gc2V0IGNsYXNzIGlkIGFuZCBkZXZpY2Ugc3BlY2lm
aWMKPiArb3BzLiBFLmcgZm9yIHZmaW8tbWRldiBkZXZpY2VzLCB0aGUgZnVuY3Rpb24gdG8gYmUg
Y2FsbGVkIGlzOjoKPiArCj4gKwlpbnQgbWRldl9zZXRfdmZpb19vcHMoc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
bWRldl92ZmlvX2RldmljZV9vcHMgKnZmaW9fb3BzKTsKPiArCj4gK1RoZSBjbGFzcyBpZCAoc2V0
IGJ5IHRoaXMgZnVuY3Rpb24gdG8gTURFVl9DTEFTU19JRF9WRklPKSBpcyB1c2VkIHRvCj4gK21h
dGNoIGEgZGV2aWNlIHdpdGggYW4gbWRldiBkcml2ZXIgdmlhIGl0cyBpZCB0YWJsZS4gVGhlIGRl
dmljZQo+ICtzcGVjaWZpYyBjYWxsYmFja3MgKHNwZWNpZmllZCBpbiAqdmZpb19vcHMpIGFyZSBv
YnRhaW5hYmxlIHZpYQo+ICttZGV2X2dldF92ZmlvX29wcygpIChmb3IgdXNlIGJ5IHRoZSBtZGV2
IGJ1cyBkcml2ZXIpLiBBIHZmaW8tbWRldgo+ICtkZXZpY2UgKGNsYXNzIGlkIE1ERVZfQ0xBU1Nf
SURfVkZJTykgdXNlcyB0aGUgZm9sbG93aW5nCj4gK2RldmljZS1zcGVjaWZpYyBvcHM6Cj4gKwo+
ICsqIG9wZW46IG9wZW4gY2FsbGJhY2sgb2YgdmZpbyBtZWRpYXRlZCBkZXZpY2UKPiArKiBjbG9z
ZTogY2xvc2UgY2FsbGJhY2sgb2YgdmZpbyBtZWRpYXRlZCBkZXZpY2UKPiArKiBpb2N0bDogaW9j
dGwgY2FsbGJhY2sgb2YgdmZpbyBtZWRpYXRlZCBkZXZpY2UKPiArKiByZWFkIDogcmVhZCBlbXVs
YXRpb24gY2FsbGJhY2sKPiArKiB3cml0ZTogd3JpdGUgZW11bGF0aW9uIGNhbGxiYWNrCj4gKyog
bW1hcDogbW1hcCBlbXVsYXRpb24gY2FsbGJhY2sKPiArCj4gIE1lZGlhdGVkIERldmljZSBNYW5h
Z2VtZW50IEludGVyZmFjZSBUaHJvdWdoIHN5c2ZzCj4gID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpPdGhlcndpc2UsIGxvb2tzIGdvb2QuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
