Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B17F16C7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 14:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312DB6ED31;
	Wed,  6 Nov 2019 13:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0EF6ED32
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 13:12:16 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-zNgOzN6XN_Wyyhw7iMVyjw-1; Wed, 06 Nov 2019 08:12:12 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B0E68017E0;
 Wed,  6 Nov 2019 13:12:08 +0000 (UTC)
Received: from [10.72.12.193] (ovpn-12-193.pek2.redhat.com [10.72.12.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452135D9CD;
 Wed,  6 Nov 2019 13:11:21 +0000 (UTC)
Subject: Re: [PATCH V9 5/6] virtio: introduce a mdev based transport
To: Cornelia Huck <cohuck@redhat.com>
References: <20191106070548.18980-1-jasowang@redhat.com>
 <20191106070548.18980-6-jasowang@redhat.com>
 <20191106120047.5bcf49c3.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <46df7afa-7543-ce19-7ede-9041907e2730@redhat.com>
Date: Wed, 6 Nov 2019 21:11:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106120047.5bcf49c3.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: zNgOzN6XN_Wyyhw7iMVyjw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573045935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdTny3tr4ABNNp/+zCwTPKTknb73JdloNxApkDn3UmA=;
 b=K490SRJWkOW5mndEW2546x8Wl0YDTcA0kSmp5RT6qlTzEnQwJ/MU/9+6kAPrfYnrxM54Lr
 g+qmRwvOW89oX3kwmaJ5+x8D7mNI5RUYqg0C7+F2S8yQMsWZALC/EWxcpU+R+rFXybtwR7
 kwweT1O5J+jex77DCFuWG9+GlgKWFJM=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvNiDkuIvljYg3OjAwLCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+IE9uIFdlZCwg
IDYgTm92IDIwMTkgMTU6MDU6NDcgKzA4MDAKPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPiB3cm90ZToKPgo+PiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBuZXcgbWRldiB0cmFuc3Bv
cnQgZm9yIHZpcnRpby4gVGhpcyBpcyB1c2VkIHRvCj4+IHVzZSBrZXJuZWwgdmlydGlvIGRyaXZl
ciB0byBkcml2ZSB0aGUgbWVkaWF0ZWQgZGV2aWNlIHRoYXQgaXMgY2FwYWJsZQo+PiBvZiBwb3B1
bGF0aW5nIHZpcnRxdWV1ZSBkaXJlY3RseS4KPj4KPj4gQSBuZXcgdmlydGlvLW1kZXYgZHJpdmVy
IHdpbGwgYmUgcmVnaXN0ZXJlZCB0byB0aGUgbWRldiBidXMsIHdoZW4gYQo+PiBuZXcgdmlydGlv
LW1kZXYgZGV2aWNlIGlzIHByb2JlZCwgaXQgd2lsbCByZWdpc3RlciB0aGUgZGV2aWNlIHdpdGgK
Pj4gbWRldiBiYXNlZCBjb25maWcgb3BzLiBUaGlzIG1lYW5zIGl0IGlzIGEgc29mdHdhcmUgdHJh
bnNwb3J0IGJldHdlZW4KPj4gbWRldiBkcml2ZXIgYW5kIG1kZXYgZGV2aWNlLiBUaGUgdHJhbnNw
b3J0IHdhcyBpbXBsZW1lbnRlZCB0aHJvdWdoCj4+IGRldmljZSBzcGVjaWZpYyBvcHMgd2hpY2gg
aXMgYSBwYXJ0IG9mIG1kZXZfcGFyZW50X29wcyBub3cuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvdmlydGlv
L0tjb25maWcgICAgICAgfCAgMTMgKysKPj4gICBkcml2ZXJzL3ZpcnRpby9NYWtlZmlsZSAgICAg
IHwgICAxICsKPj4gICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRldi5jIHwgNDA2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0MjAgaW5z
ZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnRpby92aXJ0aW9f
bWRldi5jCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby9LY29uZmlnIGIvZHJpdmVy
cy92aXJ0aW8vS2NvbmZpZwo+PiBpbmRleCAwNzg2MTVjZjJhZmMuLjU1OGFjNjA3ZDEwNyAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3ZpcnRp
by9LY29uZmlnCj4+IEBAIC00Myw2ICs0MywxOSBAQCBjb25maWcgVklSVElPX1BDSV9MRUdBQ1kK
Pj4gICAKPj4gICAJICBJZiB1bnN1cmUsIHNheSBZLgo+PiAgIAo+PiArY29uZmlnIFZJUlRJT19N
REVWCj4+ICsJdHJpc3RhdGUgIk1ERVYgZHJpdmVyIGZvciB2aXJ0aW8gZGV2aWNlcyIKPj4gKwlk
ZXBlbmRzIG9uIFZGSU9fTURFViAmJiBWSVJUSU8KPj4gKwlkZWZhdWx0IG4KPj4gKwloZWxwCj4+
ICsJICBUaGlzIGRyaXZlciBwcm92aWRlcyBzdXBwb3J0IGZvciB2aXJ0aW8gYmFzZWQgcGFyYXZp
cnR1YWwKPj4gKwkgIGRldmljZSBkcml2ZXIgb3ZlciBNREVWIGJ1cy4gVGhpcyByZXF1aXJlcyB5
b3VyIGVudmlyb25lbW50Cj4+ICsJICBoYXMgYXBwcm9wcmlhdGUgdmlydGlvIG1kZXYgZGV2aWNl
IGltcGxlbWVudGF0aW9uIHdoaWNoIG1heQo+PiArCSAgb3BlcmF0ZSBvbiB0aGUgcGh5c2ljYWwg
ZGV2aWNlIHRoYXQgdGhlIGRhdGFwYXRoIG9mIHZpcnRpbwo+PiArCSAgY291bGQgYmUgb2ZmbG9h
ZGVkIHRvIGhhcmR3YXJlLgo+IFRoYXQgc2VudGVuY2UgaXMgYSBiaXQgY29uZnVzaW5nIHRvIG1l
Li4uIHdoYXQgYWJvdXQKPgo+ICJGb3IgdGhpcyB0byBiZSB1c2VmdWwsIHlvdSBuZWVkIGFuIGFw
cHJvcHJpYXRlIHZpcnRpbyBtZGV2IGRldmljZQo+IGltcGxlbWVudGF0aW9uIHRoYXQgb3BlcmF0
ZXMgb24gYSBwaHlzaWNhbCBkZXZpY2UgdG8gYWxsb3cgdGhlIGRhdGFwYXRoCj4gb2YgdmlydGlv
IHRvIGJlIG9mZmxvYWRlZCB0byBoYXJkd2FyZS4iCj4KPiA/Cj4KPj4gKwo+PiArCSAgSWYgdW5z
dXJlLCBzYXkgTQo+IEJ1aWxkaW5nIHRoaXMgYXMgYSBtb2R1bGUgc2hvdWxkIG5vdCBodXJ0IChi
dXQgcGxlYXNlIGFkZCBhIHRyYWlsaW5nCj4gJy4nIGhlcmUgOikKPgo+PiArCj4+ICAgY29uZmln
IFZJUlRJT19QTUVNCj4+ICAgCXRyaXN0YXRlICJTdXBwb3J0IGZvciB2aXJ0aW8gcG1lbSBkcml2
ZXIiCj4+ICAgCWRlcGVuZHMgb24gVklSVElPCj4gV2l0aCB0aGUgY2hhbmdlcyBhYm92ZSwKPgo+
IFJldmlld2VkLWJ5OiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4KPgoKV2lsbCBw
b3N0IFYxMC4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
