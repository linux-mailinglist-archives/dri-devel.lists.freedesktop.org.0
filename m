Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41D4DE441
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 08:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B8A89933;
	Mon, 21 Oct 2019 06:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11C489939
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 06:00:06 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-NR0dB1IIOm-f7cm23buKPw-1; Mon, 21 Oct 2019 02:00:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F351100551E;
 Mon, 21 Oct 2019 05:59:57 +0000 (UTC)
Received: from [10.72.12.209] (ovpn-12-209.pek2.redhat.com [10.72.12.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1919360606;
 Mon, 21 Oct 2019 05:59:23 +0000 (UTC)
Subject: Re: [PATCH V4 5/6] virtio: introduce a mdev based transport
To: Cornelia Huck <cohuck@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-6-jasowang@redhat.com>
 <20191018162007.31631039.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2bb5645b-5c46-9cae-0571-65c302f51cf2@redhat.com>
Date: Mon, 21 Oct 2019 13:59:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018162007.31631039.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: NR0dB1IIOm-f7cm23buKPw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571637605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDGATv3pDDt35nGamPbAiYICPiIcyMTX5D3TlrrxwFE=;
 b=LO2LGnn5bRC+I8oL6PHluwuY2ZZehUCoevjG1bH6OmWvnyj+wt9HPHvILfcfEX03XlLQSd
 YoV/Ki8wD3EZt8gCKH8TZAuKFC9IzydJSZ1w7L8Ih7oBa+3qYGkFtQduDt27T8MzvZWteH
 HfvRSt1CwYSbO7+6/gMxLsj1G1sLypA=
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

Ck9uIDIwMTkvMTAvMTgg5LiL5Y2IMTA6MjAsIENvcm5lbGlhIEh1Y2sgd3JvdGU6Cj4gT24gVGh1
LCAxNyBPY3QgMjAxOSAxODo0ODozNSArMDgwMAo+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBtZGV2IHRyYW5z
cG9ydCBmb3IgdmlydGlvLiBUaGlzIGlzIHVzZWQgdG8KPj4gdXNlIGtlcm5lbCB2aXJ0aW8gZHJp
dmVyIHRvIGRyaXZlIHRoZSBtZWRpYXRlZCBkZXZpY2UgdGhhdCBpcyBjYXBhYmxlCj4+IG9mIHBv
cHVsYXRpbmcgdmlydHF1ZXVlIGRpcmVjdGx5Lgo+Pgo+PiBBIG5ldyB2aXJ0aW8tbWRldiBkcml2
ZXIgd2lsbCBiZSByZWdpc3RlcmVkIHRvIHRoZSBtZGV2IGJ1cywgd2hlbiBhCj4+IG5ldyB2aXJ0
aW8tbWRldiBkZXZpY2UgaXMgcHJvYmVkLCBpdCB3aWxsIHJlZ2lzdGVyIHRoZSBkZXZpY2Ugd2l0
aAo+PiBtZGV2IGJhc2VkIGNvbmZpZyBvcHMuIFRoaXMgbWVhbnMgaXQgaXMgYSBzb2Z0d2FyZSB0
cmFuc3BvcnQgYmV0d2Vlbgo+PiBtZGV2IGRyaXZlciBhbmQgbWRldiBkZXZpY2UuIFRoZSB0cmFu
c3BvcnQgd2FzIGltcGxlbWVudGVkIHRocm91Z2gKPj4gZGV2aWNlIHNwZWNpZmljIG9wcyB3aGlj
aCBpcyBhIHBhcnQgb2YgbWRldl9wYXJlbnRfb3BzIG5vdy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
SmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy92aXJ0
aW8vS2NvbmZpZyAgICAgICB8ICAgNyArCj4+ICAgZHJpdmVycy92aXJ0aW8vTWFrZWZpbGUgICAg
ICB8ICAgMSArCj4+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX21kZXYuYyB8IDQwOSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNDE3IGlu
c2VydGlvbnMoKykKPiAoLi4uKQo+Cj4+ICtzdGF0aWMgaW50IHZpcnRpb19tZGV2X3Byb2JlKHN0
cnVjdCBkZXZpY2UgKmRldikKPj4gK3sKPj4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSBt
ZGV2X2Zyb21fZGV2KGRldik7Cj4+ICsJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9v
cHMgKm9wcyA9IG1kZXZfZ2V0X2Rldl9vcHMobWRldik7Cj4+ICsJc3RydWN0IHZpcnRpb19tZGV2
X2RldmljZSAqdm1fZGV2Owo+PiArCWludCByYzsKPj4gKwo+PiArCXZtX2RldiA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqdm1fZGV2KSwgR0ZQX0tFUk5FTCk7Cj4+ICsJaWYgKCF2bV9kZXYp
Cj4+ICsJCXJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsJdm1fZGV2LT52ZGV2LmRldi5wYXJlbnQg
PSBkZXY7Cj4+ICsJdm1fZGV2LT52ZGV2LmRldi5yZWxlYXNlID0gdmlydGlvX21kZXZfcmVsZWFz
ZV9kZXY7Cj4+ICsJdm1fZGV2LT52ZGV2LmNvbmZpZyA9ICZ2aXJ0aW9fbWRldl9jb25maWdfb3Bz
Owo+PiArCXZtX2Rldi0+bWRldiA9IG1kZXY7Cj4+ICsJSU5JVF9MSVNUX0hFQUQoJnZtX2Rldi0+
dmlydHF1ZXVlcyk7Cj4+ICsJc3Bpbl9sb2NrX2luaXQoJnZtX2Rldi0+bG9jayk7Cj4+ICsKPj4g
Kwl2bV9kZXYtPnZlcnNpb24gPSBvcHMtPmdldF9tZGV2X2ZlYXR1cmVzKG1kZXYpOwo+PiArCWlm
ICh2bV9kZXYtPnZlcnNpb24gIT0gVklSVElPX01ERVZfRl9WRVJTSU9OXzEpIHsKPj4gKwkJZGV2
X2VycihkZXYsICJWSVJUSU9fTURFVl9GX1ZFUlNJT05fMSBpcyBtYW5kYXRvcnlcbiIpOwo+PiAr
CQlyZXR1cm4gLUVOWElPOwo+PiArCX0KPiBIbSwgc28gaG93IGlzIHRoYXQgbWRldiBmZWF0dXJl
cyBpbnRlcmZhY2Ugc3VwcG9zZWQgdG8gd29yaz8gSWYKPiBWSVJUSU9fTURFVl9GX1ZFUlNJT05f
MSBpcyBhIGJpdCwgSSB3b3VsZCBleHBlY3QgdGhpcyBjb2RlIHRvIHRlc3QgZm9yCj4gaXRzIHBy
ZXNlbmNlLCBhbmQgbm90IGZvciBpZGVudGl0eS4KCgpUaGlzIHNob3VsZCBiZSB1c2VkIGJ5IGRy
aXZlciB0byBkZXRlY3QgdGhlIHdoaWNoIHNldHMgb2YgZnVuY3Rpb25zIGFuZCAKdGhlaXIgc2Vt
YW50aWNzIHRoYXQgY291bGQgYmUgcHJvdmlkZWQgYnkgdGhlIGRldmljZS4gRS5nIHdoZW4gZHJp
dmVyIApzdXBwb3J0IGJvdGggdmVyc2lvbiAyIGFuZCB2ZXJzaW9uIDEgYnV0IGRldmljZSBvbmx5
IHN1cHBvcnQgdmVyc2lvbiAxLCAKZHJpdmVyIGNhbiBzd2l0Y2ggdG8gdXNlIHZlcnNpb24gMS4g
QnR3LCBJcyB0aGVyZSBhIGVhc3kgd2F5IGZvciB0byB0ZXN0IAppdHMgcHJlc2VuY2Ugb3IgZG8g
eW91IG1lYW4gZG9pbmcgc2FuaXR5IHRlc3Rpbmcgb24gZXhpc3RlbmNlIG9mIHRoZSAKbWFuZGF0
b3J5IG9wcyB0aGF0IHByb3ZpZGVkIGJ5IHRoZSBkZXZpY2U/CgoKPgo+IFdoYXQgd2lsbCBoYXBw
ZW4gaWYgd2UgY29tZSB1cCB3aXRoIGEgdmVyc2lvbiAyPyBJZiB0aGlzIGlzIGJhY2t3YXJkcwo+
IGNvbXBhdGlibGUsIHdpbGwgYm90aCB2ZXJzaW9uIDIgYW5kIHZlcnNpb24gMSBiZSBzZXQ/CgoK
WWVzLCBJIHRoaW5rIHNvLCBhbmQgdmVyc2lvbiAyIHNob3VsZCBiZSBjb25zaWRlcmVkIGFzIHNv
bWUgZXh0ZW5zaW9ucyAKb2YgdmVyc2lvbiAxLiBJZiBpdCdzIGNvbXBsZXRlbHksIGl0IHNob3Vs
ZCB1c2UgYSBuZXcgY2xhc3MgaWQuCgpUaGFua3MKCgo+Cj4+ICsKPj4gKwl2bV9kZXYtPnZkZXYu
aWQuZGV2aWNlID0gb3BzLT5nZXRfZGV2aWNlX2lkKG1kZXYpOwo+PiArCWlmICh2bV9kZXYtPnZk
ZXYuaWQuZGV2aWNlID09IDApCj4+ICsJCXJldHVybiAtRU5PREVWOwo+PiArCj4+ICsJdm1fZGV2
LT52ZGV2LmlkLnZlbmRvciA9IG9wcy0+Z2V0X3ZlbmRvcl9pZChtZGV2KTsKPj4gKwlyYyA9IHJl
Z2lzdGVyX3ZpcnRpb19kZXZpY2UoJnZtX2Rldi0+dmRldik7Cj4+ICsJaWYgKHJjKQo+PiArCQlw
dXRfZGV2aWNlKGRldik7Cj4+ICsJZWxzZQo+PiArCQlkZXZfc2V0X2RydmRhdGEoZGV2LCB2bV9k
ZXYpOwo+PiArCj4+ICsJcmV0dXJuIHJjOwo+PiArfQo+ICguLi4pCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
