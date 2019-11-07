Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E3F3377
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056D06F721;
	Thu,  7 Nov 2019 15:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A66F6F721
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 15:36:50 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-lwzusoTTONmDNFvxeSwQlg-1; Thu, 07 Nov 2019 10:36:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1925107ACC3;
 Thu,  7 Nov 2019 15:36:41 +0000 (UTC)
Received: from gondolin (ovpn-117-222.ams2.redhat.com [10.36.117.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 927595DA76;
 Thu,  7 Nov 2019 15:36:09 +0000 (UTC)
Date: Thu, 7 Nov 2019 16:36:06 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V11 3/6] mdev: introduce device specific ops
Message-ID: <20191107163606.293a4f62.cohuck@redhat.com>
In-Reply-To: <20191107151109.23261-4-jasowang@redhat.com>
References: <20191107151109.23261-1-jasowang@redhat.com>
 <20191107151109.23261-4-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: lwzusoTTONmDNFvxeSwQlg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573141009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAhytQLph68txo2Lut8xXgNzL31NY3OX1jJJVRGMRL8=;
 b=J4yR4iXt7yA0fVEj/iZ6RewQCh0xuYC7Z6rf6em5WY+b4ssJ4kG1VxM4AovXVtdkLW+E4Y
 WtaC31WeBHjX2o4oAhjyiGQ8XwZ/tAREAWHIp0EiuIS0tnxb+jscXmMBPbWX2gdCJC2JcW
 wMEPwWUIqXZbYv7Ela4Ewou2pbT4+jA=
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
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
 airlied@linux.ie, heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 parav@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 alex.williamson@redhat.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAgNyBOb3YgMjAxOSAyMzoxMTowNiArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
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
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZGV2X3ZmaW9fb3BzLmgKCllvdSBkcm9wcGVkIG15
IFItYiA6KCwgaGVyZSBpdCBpcyBhZ2FpbjoKClJldmlld2VkLWJ5OiBDb3JuZWxpYSBIdWNrIDxj
b2h1Y2tAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
