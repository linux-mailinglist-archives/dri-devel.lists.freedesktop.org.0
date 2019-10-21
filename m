Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 814ACDE928
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 12:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6890C89E19;
	Mon, 21 Oct 2019 10:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFA689E0E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 10:13:42 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-L7NxpIXqPOmlWs4WJm5E6w-1; Mon, 21 Oct 2019 06:13:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE1ED800D49;
 Mon, 21 Oct 2019 10:13:34 +0000 (UTC)
Received: from [10.72.12.22] (ovpn-12-22.pek2.redhat.com [10.72.12.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A0AB5D70E;
 Mon, 21 Oct 2019 10:13:03 +0000 (UTC)
Subject: Re: [PATCH V4 5/6] virtio: introduce a mdev based transport
To: Cornelia Huck <cohuck@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-6-jasowang@redhat.com>
 <20191018162007.31631039.cohuck@redhat.com>
 <2bb5645b-5c46-9cae-0571-65c302f51cf2@redhat.com>
 <20191021113607.16b26d9d.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1aa59fea-cae5-6303-4a94-51493d5748ba@redhat.com>
Date: Mon, 21 Oct 2019 18:13:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191021113607.16b26d9d.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: L7NxpIXqPOmlWs4WJm5E6w-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571652822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X10UFs7tuPUPd3D+40Rh0JtzksdyNoor8tHqygg664s=;
 b=VzqovNX1kVyNEwPu5L4CM2VOP8igO0KlQYVs3lnk4BhYL26zxXUVbVBKMCHB0dLvuwWFGa
 kUjeqO3cT1wqtG86g5HYOt+qxEdBbokRKINfA2KmLI4lTx2ZLEIzF/ozdAnXtlYwyBUUAl
 FFpb4zmKpPfk/X9jNeuCIQVPVcHcAv4=
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

Ck9uIDIwMTkvMTAvMjEg5LiL5Y2INTozNiwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBNb24s
IDIxIE9jdCAyMDE5IDEzOjU5OjIzICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPj4gT24gMjAxOS8xMC8xOCDkuIvljYgxMDoyMCwgQ29ybmVsaWEgSHVj
ayB3cm90ZToKPj4+IE9uIFRodSwgMTcgT2N0IDIwMTkgMTg6NDg6MzUgKzA4MDAKPj4+IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4gICAKPj4+PiBUaGlzIHBhdGNo
IGludHJvZHVjZXMgYSBuZXcgbWRldiB0cmFuc3BvcnQgZm9yIHZpcnRpby4gVGhpcyBpcyB1c2Vk
IHRvCj4+Pj4gdXNlIGtlcm5lbCB2aXJ0aW8gZHJpdmVyIHRvIGRyaXZlIHRoZSBtZWRpYXRlZCBk
ZXZpY2UgdGhhdCBpcyBjYXBhYmxlCj4+Pj4gb2YgcG9wdWxhdGluZyB2aXJ0cXVldWUgZGlyZWN0
bHkuCj4+Pj4KPj4+PiBBIG5ldyB2aXJ0aW8tbWRldiBkcml2ZXIgd2lsbCBiZSByZWdpc3RlcmVk
IHRvIHRoZSBtZGV2IGJ1cywgd2hlbiBhCj4+Pj4gbmV3IHZpcnRpby1tZGV2IGRldmljZSBpcyBw
cm9iZWQsIGl0IHdpbGwgcmVnaXN0ZXIgdGhlIGRldmljZSB3aXRoCj4+Pj4gbWRldiBiYXNlZCBj
b25maWcgb3BzLiBUaGlzIG1lYW5zIGl0IGlzIGEgc29mdHdhcmUgdHJhbnNwb3J0IGJldHdlZW4K
Pj4+PiBtZGV2IGRyaXZlciBhbmQgbWRldiBkZXZpY2UuIFRoZSB0cmFuc3BvcnQgd2FzIGltcGxl
bWVudGVkIHRocm91Z2gKPj4+PiBkZXZpY2Ugc3BlY2lmaWMgb3BzIHdoaWNoIGlzIGEgcGFydCBv
ZiBtZGV2X3BhcmVudF9vcHMgbm93Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL3ZpcnRpby9L
Y29uZmlnICAgICAgIHwgICA3ICsKPj4+PiAgICBkcml2ZXJzL3ZpcnRpby9NYWtlZmlsZSAgICAg
IHwgICAxICsKPj4+PiAgICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRldi5jIHwgNDA5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA0
MTcgaW5zZXJ0aW9ucygrKQo+Pj4gKC4uLikKPj4+ICAgCj4+Pj4gK3N0YXRpYyBpbnQgdmlydGlv
X21kZXZfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQo+Pj4+ICt7Cj4+Pj4gKwlzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYgPSBtZGV2X2Zyb21fZGV2KGRldik7Cj4+Pj4gKwljb25zdCBzdHJ1Y3Qg
dmlydGlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0gbWRldl9nZXRfZGV2X29wcyhtZGV2KTsKPj4+
PiArCXN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2UgKnZtX2RldjsKPj4+PiArCWludCByYzsKPj4+
PiArCj4+Pj4gKwl2bV9kZXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnZtX2RldiksIEdG
UF9LRVJORUwpOwo+Pj4+ICsJaWYgKCF2bV9kZXYpCj4+Pj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+
Pj4gKwo+Pj4+ICsJdm1fZGV2LT52ZGV2LmRldi5wYXJlbnQgPSBkZXY7Cj4+Pj4gKwl2bV9kZXYt
PnZkZXYuZGV2LnJlbGVhc2UgPSB2aXJ0aW9fbWRldl9yZWxlYXNlX2RldjsKPj4+PiArCXZtX2Rl
di0+dmRldi5jb25maWcgPSAmdmlydGlvX21kZXZfY29uZmlnX29wczsKPj4+PiArCXZtX2Rldi0+
bWRldiA9IG1kZXY7Cj4+Pj4gKwlJTklUX0xJU1RfSEVBRCgmdm1fZGV2LT52aXJ0cXVldWVzKTsK
Pj4+PiArCXNwaW5fbG9ja19pbml0KCZ2bV9kZXYtPmxvY2spOwo+Pj4+ICsKPj4+PiArCXZtX2Rl
di0+dmVyc2lvbiA9IG9wcy0+Z2V0X21kZXZfZmVhdHVyZXMobWRldik7Cj4+Pj4gKwlpZiAodm1f
ZGV2LT52ZXJzaW9uICE9IFZJUlRJT19NREVWX0ZfVkVSU0lPTl8xKSB7Cj4+Pj4gKwkJZGV2X2Vy
cihkZXYsICJWSVJUSU9fTURFVl9GX1ZFUlNJT05fMSBpcyBtYW5kYXRvcnlcbiIpOwo+Pj4+ICsJ
CXJldHVybiAtRU5YSU87Cj4+Pj4gKwl9Cj4+PiBIbSwgc28gaG93IGlzIHRoYXQgbWRldiBmZWF0
dXJlcyBpbnRlcmZhY2Ugc3VwcG9zZWQgdG8gd29yaz8gSWYKPj4+IFZJUlRJT19NREVWX0ZfVkVS
U0lPTl8xIGlzIGEgYml0LCBJIHdvdWxkIGV4cGVjdCB0aGlzIGNvZGUgdG8gdGVzdCBmb3IKPj4+
IGl0cyBwcmVzZW5jZSwgYW5kIG5vdCBmb3IgaWRlbnRpdHkuCj4+Cj4+IFRoaXMgc2hvdWxkIGJl
IHVzZWQgYnkgZHJpdmVyIHRvIGRldGVjdCB0aGUgd2hpY2ggc2V0cyBvZiBmdW5jdGlvbnMgYW5k
Cj4+IHRoZWlyIHNlbWFudGljcyB0aGF0IGNvdWxkIGJlIHByb3ZpZGVkIGJ5IHRoZSBkZXZpY2Uu
IEUuZyB3aGVuIGRyaXZlcgo+PiBzdXBwb3J0IGJvdGggdmVyc2lvbiAyIGFuZCB2ZXJzaW9uIDEg
YnV0IGRldmljZSBvbmx5IHN1cHBvcnQgdmVyc2lvbiAxLAo+PiBkcml2ZXIgY2FuIHN3aXRjaCB0
byB1c2UgdmVyc2lvbiAxLiBCdHcsIElzIHRoZXJlIGEgZWFzeSB3YXkgZm9yIHRvIHRlc3QKPj4g
aXRzIHByZXNlbmNlIG9yIGRvIHlvdSBtZWFuIGRvaW5nIHNhbml0eSB0ZXN0aW5nIG9uIGV4aXN0
ZW5jZSBvZiB0aGUKPj4gbWFuZGF0b3J5IG9wcyB0aGF0IHByb3ZpZGVkIGJ5IHRoZSBkZXZpY2U/
Cj4gV2hhdCBJIG1lYW50IHdhcyBzb21ldGhpbmcgbGlrZToKPgo+IGZlYXR1cmVzID0gb3BzLT5n
ZXRfbWRldl9mZWF0dXJlcyhtZGV2KTsKPiBpZiAoZmVhdHVyZXMgJiBWSVJUSU9fTURFVl9GX1ZF
UlNJT05fMSkKPiAJdm1fZGV2LT52ZXJzaW9uID0gMTsKPiBlbHNlCj4gCS8vbW9hbiBhYm91dCBt
aXNzaW5nIHN1cHBvcnQgZm9yIHZlcnNpb24gMQo+Cj4gQ2FuIHRoZXJlIGJlIGNsYXNzIGlkIHNw
ZWNpZmljIGV4dHJhIGZlYXR1cmVzLCBvciBpcyB0aGlzIG9ubHkgZm9yIGNvcmUKPiBmZWF0dXJl
cz8gSWYgdGhlIGxhdHRlciwgbWF5YmUgYWxzbyBkbyBzb21ldGhpbmcgbGlrZQo+Cj4gc3VwcG9y
dGVkX2ZlYXR1cmVzID0gT1JFRF9MSVNUX09GX0ZFQVRVUkVTOwo+IGlmIChmZWF0dXJlcyAmIH5z
dXBwb3J0ZWRfZmVhdHVyZXMpCj4gCS8vbW9hbiBhYm91dCBleHRyYSBmZWF0dXJlIGJpdHMKCgpD
b25zaWRlciBkcml2ZXIgY2FuIGNsYWltIHRvIHN1cHBvcnQgYSBsaXN0IG9mIGlkcywgc28gSSB0
aGlzIGl0J3MgZm9ybWVyLgoKV2lsbCBkbyBhcyB3aGF0IHlvdSBwcm9wb3NlZC4KClRoYW5rcwoK
Cj4KPj4KPj4+IFdoYXQgd2lsbCBoYXBwZW4gaWYgd2UgY29tZSB1cCB3aXRoIGEgdmVyc2lvbiAy
PyBJZiB0aGlzIGlzIGJhY2t3YXJkcwo+Pj4gY29tcGF0aWJsZSwgd2lsbCBib3RoIHZlcnNpb24g
MiBhbmQgdmVyc2lvbiAxIGJlIHNldD8KPj4KPj4gWWVzLCBJIHRoaW5rIHNvLCBhbmQgdmVyc2lv
biAyIHNob3VsZCBiZSBjb25zaWRlcmVkIGFzIHNvbWUgZXh0ZW5zaW9ucwo+PiBvZiB2ZXJzaW9u
IDEuIElmIGl0J3MgY29tcGxldGVseSwgaXQgc2hvdWxkIHVzZSBhIG5ldyBjbGFzcyBpZC4KPiBP
aywgdGhhdCBtYWtlcyBzZW5zZS4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
