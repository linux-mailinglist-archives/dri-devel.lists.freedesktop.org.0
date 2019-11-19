Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D0101B24
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2736EC20;
	Tue, 19 Nov 2019 08:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6A16E112;
 Tue, 19 Nov 2019 03:08:59 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::5a22]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWtsh-0007Zo-MQ; Tue, 19 Nov 2019 03:08:43 +0000
Subject: Re: [PATCH V13 1/6] mdev: make mdev bus agnostic
To: Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, kwankhede@nvidia.com,
 alex.williamson@redhat.com, mst@redhat.com, tiwei.bie@intel.com,
 gregkh@linuxfoundation.org, jgg@mellanox.com
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-2-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <61f6a20c-3492-4144-9c7c-f62200718853@infradead.org>
Date: Mon, 18 Nov 2019 19:08:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118105923.7991-2-jasowang@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tfQMF/ImpigZRzGAkXKTeqPCcjxpDrsHo/JYishAbN4=; b=jjK+AcYBafpxdbSm76WElPASc
 5CL9L0xascrqnfvofR66yVADq8Ci80s+J8maSI+Ak8l49pefsLqqMXDUBYjwS3B4VZs+YVHs3BxyH
 JasoWsw0ghlA2XGhw1Pq8hh7suMahQ7N3SJamv3PHLA7t8rRH4eUm+PtMnF+B900N4IILc0DGr2yN
 K2gPxTWEBGydGvq1hQWDlVDkI3x+FaW8tSvnPZYa2CU8/idN3BmT04Kij6nNIvtKqVnN5OLDus47o
 OO79yzaw2GEXUVu5+mpq/MMz0CMASJ9Vr615acYcx8ExboR1jfjxct8BRuSrJyPRGM7/130hGNsgw
 wV30nRGcw==;
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
Cc: jakub.kicinski@netronome.com, christophe.de.dinechin@gmail.com,
 sebott@linux.ibm.com, airlied@linux.ie, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, rob.miller@broadcom.com, hch@infradead.org,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, jeffrey.t.kirsher@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, parav@mellanox.com,
 gor@linux.ibm.com, cunming.liang@intel.com, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, stefanha@redhat.com,
 zhihong.wang@intel.com, akrowiak@linux.ibm.com, jiri@mellanox.com,
 netdev@vger.kernel.org, cohuck@redhat.com, oberpar@linux.ibm.com,
 maxime.coquelin@redhat.com, aadam@redhat.com, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTgvMTkgMjo1OSBBTSwgSmFzb24gV2FuZyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZmlvL21kZXYvS2NvbmZpZyBiL2RyaXZlcnMvdmZpby9tZGV2L0tjb25maWcKPiBpbmRl
eCA1ZGEyN2YyMTAwZjkuLjJlMDdjYTkxNWE5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZmaW8v
bWRldi9LY29uZmlnCj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvS2NvbmZpZwo+IEBAIC0xLDE1
ICsxLDI0IEBACj4gLSMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ICAK
PiAtY29uZmlnIFZGSU9fTURFVgo+ICtjb25maWcgTURFVgo+ICAJdHJpc3RhdGUgIk1lZGlhdGVk
IGRldmljZSBkcml2ZXIgZnJhbWV3b3JrIgo+IC0JZGVwZW5kcyBvbiBWRklPCj4gIAlkZWZhdWx0
IG4KPiAgCWhlbHAKPiAgCSAgUHJvdmlkZXMgYSBmcmFtZXdvcmsgdG8gdmlydHVhbGl6ZSBkZXZp
Y2VzLgo+IC0JICBTZWUgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2
aWNlLnJzdCBmb3IgbW9yZSBkZXRhaWxzLgo+ICAKPiAgCSAgSWYgeW91IGRvbid0IGtub3cgd2hh
dCBkbyBoZXJlLCBzYXkgTi4KPiAgCgpIaSwKCj4gK2NvbmZpZyBWRklPX01ERVYKPiArCXRyaXN0
YXRlICJWRklPIE1lZGlhdGVkIGRldmljZSBkcml2ZXIiCj4gKyAgICAgICAgZGVwZW5kcyBvbiBW
RklPICYmIE1ERVYKPiArICAgICAgICBkZWZhdWx0IG4KClRoZSBkZXBlbmRzIGFuZCBkZWZhdWx0
IGxpbmVzIHNob3VsZCBiZSBpbmRlbnRlZCB3aXRoIHRhYiwgbm90IHNwYWNlcy4KCj4gKwloZWxw
Cj4gKwkgIFByb2l2ZGVzIGEgbWVkaWF0ZWQgQlVTIGZvciB1c2Vyc3BhY2UgZHJpdmVyIHRocm91
Z2ggVkZJTwoKCSAgUHJvdmlkZXMKCj4gKwkgIGZyYW1ld29yay4gU2VlIERvY3VtZW50YXRpb24v
dmZpby1tZWRpYXRlZC1kZXZpY2UudHh0IGZvcgo+ICsJICBtb3JlIGRldGFpbHMuCj4gKwo+ICsJ
ICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IGRvIGhlcmUsIHNheSBOLgo+ICsKPiArCj4gIGNvbmZp
ZyBWRklPX01ERVZfREVWSUNFCj4gIAl0cmlzdGF0ZSAiVkZJTyBkcml2ZXIgZm9yIE1lZGlhdGVk
IGRldmljZXMiCj4gIAlkZXBlbmRzIG9uIFZGSU8gJiYgVkZJT19NREVWCgoKLS0gCn5SYW5keQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
