Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04635DE831
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 11:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8060989D8A;
	Mon, 21 Oct 2019 09:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCEC89D8A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 09:36:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-gGQdN0OCO4edN38FnITm1A-1; Mon, 21 Oct 2019 05:36:33 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E66A780183E;
 Mon, 21 Oct 2019 09:36:25 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 499036012C;
 Mon, 21 Oct 2019 09:36:09 +0000 (UTC)
Date: Mon, 21 Oct 2019 11:36:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 5/6] virtio: introduce a mdev based transport
Message-ID: <20191021113607.16b26d9d.cohuck@redhat.com>
In-Reply-To: <2bb5645b-5c46-9cae-0571-65c302f51cf2@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-6-jasowang@redhat.com>
 <20191018162007.31631039.cohuck@redhat.com>
 <2bb5645b-5c46-9cae-0571-65c302f51cf2@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: gGQdN0OCO4edN38FnITm1A-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571650596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpZdScR+KHI00mbq34flCWHyvKtJnKCqm7Yan1K0IeI=;
 b=CfmF4STpp9cTMmDyreZvb4bwNhCtuC97bnNllvBwIXN7QAijTFl9W49fvfqIjIQy7nj7Ge
 hUw5vJWg2T4Hzp5KQ/HMGX7qXer6ZTud8yIK1UvZMAzIeHbWLw9lJabJ16yXSvwvsp6+C0
 sXEfM8LYMMZlnn2UhzCNkhuOQMRv3IA=
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

T24gTW9uLCAyMSBPY3QgMjAxOSAxMzo1OToyMyArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gT24gMjAxOS8xMC8xOCDkuIvljYgxMDoyMCwgQ29ybmVsaWEg
SHVjayB3cm90ZToKPiA+IE9uIFRodSwgMTcgT2N0IDIwMTkgMTg6NDg6MzUgKzA4MDAKPiA+IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gIAo+ID4+IFRoaXMgcGF0
Y2ggaW50cm9kdWNlcyBhIG5ldyBtZGV2IHRyYW5zcG9ydCBmb3IgdmlydGlvLiBUaGlzIGlzIHVz
ZWQgdG8KPiA+PiB1c2Uga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gZHJpdmUgdGhlIG1lZGlhdGVk
IGRldmljZSB0aGF0IGlzIGNhcGFibGUKPiA+PiBvZiBwb3B1bGF0aW5nIHZpcnRxdWV1ZSBkaXJl
Y3RseS4KPiA+Pgo+ID4+IEEgbmV3IHZpcnRpby1tZGV2IGRyaXZlciB3aWxsIGJlIHJlZ2lzdGVy
ZWQgdG8gdGhlIG1kZXYgYnVzLCB3aGVuIGEKPiA+PiBuZXcgdmlydGlvLW1kZXYgZGV2aWNlIGlz
IHByb2JlZCwgaXQgd2lsbCByZWdpc3RlciB0aGUgZGV2aWNlIHdpdGgKPiA+PiBtZGV2IGJhc2Vk
IGNvbmZpZyBvcHMuIFRoaXMgbWVhbnMgaXQgaXMgYSBzb2Z0d2FyZSB0cmFuc3BvcnQgYmV0d2Vl
bgo+ID4+IG1kZXYgZHJpdmVyIGFuZCBtZGV2IGRldmljZS4gVGhlIHRyYW5zcG9ydCB3YXMgaW1w
bGVtZW50ZWQgdGhyb3VnaAo+ID4+IGRldmljZSBzcGVjaWZpYyBvcHMgd2hpY2ggaXMgYSBwYXJ0
IG9mIG1kZXZfcGFyZW50X29wcyBub3cuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy92aXJ0aW8v
S2NvbmZpZyAgICAgICB8ICAgNyArCj4gPj4gICBkcml2ZXJzL3ZpcnRpby9NYWtlZmlsZSAgICAg
IHwgICAxICsKPiA+PiAgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tZGV2LmMgfCA0MDkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNDE3
IGluc2VydGlvbnMoKykgIAo+ID4gKC4uLikKPiA+ICAKPiA+PiArc3RhdGljIGludCB2aXJ0aW9f
bWRldl9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPj4gK3sKPiA+PiArCXN0cnVjdCBtZGV2
X2RldmljZSAqbWRldiA9IG1kZXZfZnJvbV9kZXYoZGV2KTsKPiA+PiArCWNvbnN0IHN0cnVjdCB2
aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF9kZXZfb3BzKG1kZXYpOwo+ID4+
ICsJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAqdm1fZGV2Owo+ID4+ICsJaW50IHJjOwo+ID4+
ICsKPiA+PiArCXZtX2RldiA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqdm1fZGV2KSwgR0ZQ
X0tFUk5FTCk7Cj4gPj4gKwlpZiAoIXZtX2RldikKPiA+PiArCQlyZXR1cm4gLUVOT01FTTsKPiA+
PiArCj4gPj4gKwl2bV9kZXYtPnZkZXYuZGV2LnBhcmVudCA9IGRldjsKPiA+PiArCXZtX2Rldi0+
dmRldi5kZXYucmVsZWFzZSA9IHZpcnRpb19tZGV2X3JlbGVhc2VfZGV2Owo+ID4+ICsJdm1fZGV2
LT52ZGV2LmNvbmZpZyA9ICZ2aXJ0aW9fbWRldl9jb25maWdfb3BzOwo+ID4+ICsJdm1fZGV2LT5t
ZGV2ID0gbWRldjsKPiA+PiArCUlOSVRfTElTVF9IRUFEKCZ2bV9kZXYtPnZpcnRxdWV1ZXMpOwo+
ID4+ICsJc3Bpbl9sb2NrX2luaXQoJnZtX2Rldi0+bG9jayk7Cj4gPj4gKwo+ID4+ICsJdm1fZGV2
LT52ZXJzaW9uID0gb3BzLT5nZXRfbWRldl9mZWF0dXJlcyhtZGV2KTsKPiA+PiArCWlmICh2bV9k
ZXYtPnZlcnNpb24gIT0gVklSVElPX01ERVZfRl9WRVJTSU9OXzEpIHsKPiA+PiArCQlkZXZfZXJy
KGRldiwgIlZJUlRJT19NREVWX0ZfVkVSU0lPTl8xIGlzIG1hbmRhdG9yeVxuIik7Cj4gPj4gKwkJ
cmV0dXJuIC1FTlhJTzsKPiA+PiArCX0gIAo+ID4gSG0sIHNvIGhvdyBpcyB0aGF0IG1kZXYgZmVh
dHVyZXMgaW50ZXJmYWNlIHN1cHBvc2VkIHRvIHdvcms/IElmCj4gPiBWSVJUSU9fTURFVl9GX1ZF
UlNJT05fMSBpcyBhIGJpdCwgSSB3b3VsZCBleHBlY3QgdGhpcyBjb2RlIHRvIHRlc3QgZm9yCj4g
PiBpdHMgcHJlc2VuY2UsIGFuZCBub3QgZm9yIGlkZW50aXR5LiAgCj4gCj4gCj4gVGhpcyBzaG91
bGQgYmUgdXNlZCBieSBkcml2ZXIgdG8gZGV0ZWN0IHRoZSB3aGljaCBzZXRzIG9mIGZ1bmN0aW9u
cyBhbmQgCj4gdGhlaXIgc2VtYW50aWNzIHRoYXQgY291bGQgYmUgcHJvdmlkZWQgYnkgdGhlIGRl
dmljZS4gRS5nIHdoZW4gZHJpdmVyIAo+IHN1cHBvcnQgYm90aCB2ZXJzaW9uIDIgYW5kIHZlcnNp
b24gMSBidXQgZGV2aWNlIG9ubHkgc3VwcG9ydCB2ZXJzaW9uIDEsIAo+IGRyaXZlciBjYW4gc3dp
dGNoIHRvIHVzZSB2ZXJzaW9uIDEuIEJ0dywgSXMgdGhlcmUgYSBlYXN5IHdheSBmb3IgdG8gdGVz
dCAKPiBpdHMgcHJlc2VuY2Ugb3IgZG8geW91IG1lYW4gZG9pbmcgc2FuaXR5IHRlc3Rpbmcgb24g
ZXhpc3RlbmNlIG9mIHRoZSAKPiBtYW5kYXRvcnkgb3BzIHRoYXQgcHJvdmlkZWQgYnkgdGhlIGRl
dmljZT8KCldoYXQgSSBtZWFudCB3YXMgc29tZXRoaW5nIGxpa2U6CgpmZWF0dXJlcyA9IG9wcy0+
Z2V0X21kZXZfZmVhdHVyZXMobWRldik7CmlmIChmZWF0dXJlcyAmIFZJUlRJT19NREVWX0ZfVkVS
U0lPTl8xKQoJdm1fZGV2LT52ZXJzaW9uID0gMTsKZWxzZQoJLy9tb2FuIGFib3V0IG1pc3Npbmcg
c3VwcG9ydCBmb3IgdmVyc2lvbiAxCgpDYW4gdGhlcmUgYmUgY2xhc3MgaWQgc3BlY2lmaWMgZXh0
cmEgZmVhdHVyZXMsIG9yIGlzIHRoaXMgb25seSBmb3IgY29yZQpmZWF0dXJlcz8gSWYgdGhlIGxh
dHRlciwgbWF5YmUgYWxzbyBkbyBzb21ldGhpbmcgbGlrZQoKc3VwcG9ydGVkX2ZlYXR1cmVzID0g
T1JFRF9MSVNUX09GX0ZFQVRVUkVTOwppZiAoZmVhdHVyZXMgJiB+c3VwcG9ydGVkX2ZlYXR1cmVz
KQoJLy9tb2FuIGFib3V0IGV4dHJhIGZlYXR1cmUgYml0cwoKPiAKPiAKPiA+Cj4gPiBXaGF0IHdp
bGwgaGFwcGVuIGlmIHdlIGNvbWUgdXAgd2l0aCBhIHZlcnNpb24gMj8gSWYgdGhpcyBpcyBiYWNr
d2FyZHMKPiA+IGNvbXBhdGlibGUsIHdpbGwgYm90aCB2ZXJzaW9uIDIgYW5kIHZlcnNpb24gMSBi
ZSBzZXQ/ICAKPiAKPiAKPiBZZXMsIEkgdGhpbmsgc28sIGFuZCB2ZXJzaW9uIDIgc2hvdWxkIGJl
IGNvbnNpZGVyZWQgYXMgc29tZSBleHRlbnNpb25zIAo+IG9mIHZlcnNpb24gMS4gSWYgaXQncyBj
b21wbGV0ZWx5LCBpdCBzaG91bGQgdXNlIGEgbmV3IGNsYXNzIGlkLgoKT2ssIHRoYXQgbWFrZXMg
c2Vuc2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
