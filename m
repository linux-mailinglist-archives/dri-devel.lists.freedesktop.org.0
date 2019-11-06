Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A341F283B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9396EE9A;
	Thu,  7 Nov 2019 07:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD7C6E25D;
 Wed,  6 Nov 2019 22:50:38 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::4ba1]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSU8G-0006ML-Gr; Wed, 06 Nov 2019 22:50:32 +0000
Subject: Re: [PATCH V9 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, kwankhede@nvidia.com,
 alex.williamson@redhat.com, mst@redhat.com, tiwei.bie@intel.com
References: <20191106070548.18980-1-jasowang@redhat.com>
 <20191106070548.18980-7-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <88efad07-70aa-3879-31e7-ace4d2ad63a1@infradead.org>
Date: Wed, 6 Nov 2019 14:50:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106070548.18980-7-jasowang@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S+NDVwxnw7pUxx3P5o8f+I/8HtJJXwHD+rPflie4cnM=; b=pMQRdpKIQCx3SN9Vl5hh63a0q
 NN9hM0Rdx0FKjbRc5iGGjxbdKBzcS60ZVcKZX3pcxvoMr4KualdndEDr47JlzlgcGEmw70yQfewI1
 T7bj38nguBRwOjJHbfR5kz1aDqZ015cYLHqHBgeIMUOqld6zyuIA3N5V6zdW6x9UObSW4us0x+Qz4
 kUgZP3BVbKCZ2SoXTdv7WaUdAelz4i/YSG84yCv78On6N1pDStA1x/uK/u+lwrYTKCzIhLfi3J9bi
 +8mALHWxYMUbvB1tFVeq03G484MQcFQavQi2yCJuwxOzS9J58eV4AgmbpLY2iffnv5aR7Yu8gdBt7
 g9cvCQqnA==;
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
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
 cunming.liang@intel.com, rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, parav@mellanox.com, zhihong.wang@intel.com,
 stefanha@redhat.com, akrowiak@linux.ibm.com, netdev@vger.kernel.org,
 cohuck@redhat.com, oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvNS8xOSAxMTowNSBQTSwgSmFzb24gV2FuZyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvc2Ft
cGxlcy9LY29uZmlnIGIvc2FtcGxlcy9LY29uZmlnCj4gaW5kZXggYzhkYWNiNGRkYTgwLi4xM2Ey
NDQzZTE4ZTAgMTAwNjQ0Cj4gLS0tIGEvc2FtcGxlcy9LY29uZmlnCj4gKysrIGIvc2FtcGxlcy9L
Y29uZmlnCj4gQEAgLTEzMSw2ICsxMzEsMTYgQEAgY29uZmlnIFNBTVBMRV9WRklPX01ERVZfTURQ
WQo+ICAJICBtZWRpYXRlZCBkZXZpY2UuICBJdCBpcyBhIHNpbXBsZSBmcmFtZWJ1ZmZlciBhbmQg
c3VwcG9ydHMKPiAgCSAgdGhlIHJlZ2lvbiBkaXNwbGF5IGludGVyZmFjZSAoVkZJT19HRlhfUExB
TkVfVFlQRV9SRUdJT04pLgo+ICAKPiArY29uZmlnIFNBTVBMRV9WSVJUSU9fTURFVl9ORVQKPiAr
CXRyaXN0YXRlICJCdWlsZCBWSVJUSU8gbmV0IGV4YW1wbGUgbWVkaWF0ZWQgZGV2aWNlIHNhbXBs
ZSBjb2RlIC0tIGxvYWRhYmxlIG1vZHVsZXMgb25seSIKPiArCWRlcGVuZHMgb24gVklSVElPX01E
RVYgJiYgVkhPU1RfUklORyAmJiBtCj4gKwloZWxwCj4gKwkgIEJ1aWxkIGEgbmV0d29ya2luZyBz
YW1wbGUgZGV2aWNlIGZvciB1c2UgYXMgYSB2aXJ0aW8KPiArCSAgbWVkaWF0ZWQgZGV2aWNlLiBU
aGUgZGV2aWNlIGNvb3ByZWF0ZXMgd2l0aCB2aXJ0aW8tbWRldiBidXMKCnR5cG8gaGVyZToKCSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvb3BlcmF0ZXMKCj4gKwkgIGRyaXZlciB0byBw
cmVzZW50IGFuIHZpcnRpbyBldGhlcm5ldCBkcml2ZXIgZm9yCj4gKwkgIGtlcm5lbC4gSXQgc2lt
cGx5IGxvb3BiYWNrcyBhbGwgcGFja2V0cyBmcm9tIGl0cyBUWAo+ICsJICB2aXJ0cXVldWUgdG8g
aXRzIFJYIHZpcnRxdWV1ZS4KPiArCj4gIGNvbmZpZyBTQU1QTEVfVkZJT19NREVWX01EUFlfRkIK
PiAgCXRyaXN0YXRlICJCdWlsZCBWRklPIG1kcHkgZXhhbXBsZSBndWVzdCBmYmRldiBkcml2ZXIg
LS0gbG9hZGFibGUgbW9kdWxlIG9ubHkiCj4gIAlkZXBlbmRzIG9uIEZCICYmIG0KCmNpYW8uCi0t
IAp+UmFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
