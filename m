Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1FE101AEE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E846EAA3;
	Tue, 19 Nov 2019 08:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2146E112;
 Tue, 19 Nov 2019 03:11:36 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::5a22]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWtvM-0000Up-M6; Tue, 19 Nov 2019 03:11:28 +0000
Subject: Re: [PATCH V13 3/6] mdev: move to drivers/
To: Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, kwankhede@nvidia.com,
 alex.williamson@redhat.com, mst@redhat.com, tiwei.bie@intel.com,
 gregkh@linuxfoundation.org, jgg@mellanox.com
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-4-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <195f2686-752c-67f0-0dba-04178a6f5dda@infradead.org>
Date: Mon, 18 Nov 2019 19:11:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118105923.7991-4-jasowang@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v9f8BYCrMCJuV+Nhkx2R4CSxZOsMU8pABJUkn54/Xi8=; b=LvxH8Xuq2c0IZyx+D3Ts/Ytrd
 eZHESIkCIkIb6PpPUCUnXL0/MCj1EuD/F2wi1+J92H3qroHmkbdG0q+t+YwikmEaWgDswZrg6C+lD
 yRTwjvgyRWFiQksHIPH0NcVHm7+CzkeNIiTWBtOnSIqf/cen/E2GpMvo6dojXO3wQ4/Z93V8XyLeN
 1J1ksqNT2tpapUuOQY7Hi0yKa7N7Qy9aI0/WKH6r+Fb964rn+81KBAGvBuIF3NnzuEuYmIsAzcaJg
 gJ1p+xQ/dHPAr6O7bCW/A3ipd7pZ9Hdso3M0+13Cl5VWZh2ZTo7PlYrcePxbrdtrJyy7ioORMNki/
 3lym4fq7A==;
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
dmVycy9tZGV2L0tjb25maWcgYi9kcml2ZXJzL21kZXYvS2NvbmZpZwo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi40NTYxZjJkNDE3OGYKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvZHJpdmVycy9tZGV2L0tjb25maWcKPiBAQCAtMCwwICsxLDE5IEBACj4gKwo+ICtj
b25maWcgTURFVgo+ICsJdHJpc3RhdGUgIk1lZGlhdGVkIGRldmljZSBkcml2ZXIgZnJhbWV3b3Jr
Igo+ICsJZGVmYXVsdCBuCj4gKwloZWxwCj4gKwkgIFByb3ZpZGVzIGEgZnJhbWV3b3JrIHRvIHZp
cnR1YWxpemUgZGV2aWNlcy4KPiArCj4gKwkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgZG8gaGVy
ZSwgc2F5IE4uCj4gKwo+ICtjb25maWcgVkZJT19NREVWCj4gKwl0cmlzdGF0ZSAiVkZJTyBNZWRp
YXRlZCBkZXZpY2UgZHJpdmVyIgo+ICsgICAgICAgIGRlcGVuZHMgb24gVkZJTyAmJiBNREVWCj4g
KyAgICAgICAgZGVmYXVsdCBuCgpVc2UgdGFiIG9uIHRoZSAyIGxpbmVzIGFib3ZlLCBub3Qgc3Bh
Y2VzLgoKPiArCWhlbHAKPiArCSAgUHJvaXZkZXMgYSBtZWRpYXRlZCBCVVMgZm9yIHVzZXJzcGFj
ZSBkcml2ZXIgdGhyb3VnaCBWRklPCgoJICBQcm92aWRlcwoKPiArCSAgZnJhbWV3b3JrLiBTZWUg
RG9jdW1lbnRhdGlvbi92ZmlvLW1lZGlhdGVkLWRldmljZS50eHQgZm9yCj4gKwkgIG1vcmUgZGV0
YWlscy4KPiArCj4gKwkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgZG8gaGVyZSwgc2F5IE4uCgoK
LS0gCn5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
