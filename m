Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43071F3175
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 15:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D646EE08;
	Thu,  7 Nov 2019 14:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39286EE08
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 14:31:16 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-SpgoB20dMl6mpmpHXbbyGA-1; Thu, 07 Nov 2019 09:31:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33BB0477;
 Thu,  7 Nov 2019 14:31:06 +0000 (UTC)
Received: from [10.72.12.21] (ovpn-12-21.pek2.redhat.com [10.72.12.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBAAB5D6D8;
 Thu,  7 Nov 2019 14:30:39 +0000 (UTC)
Subject: Re: [PATCH V9 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: Alex Williamson <alex.williamson@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20191106070548.18980-1-jasowang@redhat.com>
 <20191106070548.18980-7-jasowang@redhat.com>
 <88efad07-70aa-3879-31e7-ace4d2ad63a1@infradead.org>
 <20191106155800.0b8418ec@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1b26d298-0223-c5cc-9dd6-c4005139e32a@redhat.com>
Date: Thu, 7 Nov 2019 22:30:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106155800.0b8418ec@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: SpgoB20dMl6mpmpHXbbyGA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573137075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrHdD94AcwG1Ax7bWiCTd//fNTx3IE4kMIx+0uxwiSM=;
 b=jV1JYaW0VsH7Gd4vmhJWhnK8LnielSO2GRGYcm0fak8Qt9+rRQcqVICU3Wa7d/Foh+uvIu
 oEGOlK96X7HQzoGjVyXsw3UtCLY6tVSNHMUf1fxHJea3WWO34FGW3zMHdApN6YuWA3mrlY
 HbGi4sf3B7QNxsic6ZRIlXI0jAexYns=
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
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvNyDkuIrljYg2OjU4LCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gV2Vk
LCA2IE5vdiAyMDE5IDE0OjUwOjMwIC0wODAwCj4gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+IHdyb3RlOgo+Cj4+IE9uIDExLzUvMTkgMTE6MDUgUE0sIEphc29uIFdhbmcgd3Jv
dGU6Cj4+PiBkaWZmIC0tZ2l0IGEvc2FtcGxlcy9LY29uZmlnIGIvc2FtcGxlcy9LY29uZmlnCj4+
PiBpbmRleCBjOGRhY2I0ZGRhODAuLjEzYTI0NDNlMThlMCAxMDA2NDQKPj4+IC0tLSBhL3NhbXBs
ZXMvS2NvbmZpZwo+Pj4gKysrIGIvc2FtcGxlcy9LY29uZmlnCj4+PiBAQCAtMTMxLDYgKzEzMSwx
NiBAQCBjb25maWcgU0FNUExFX1ZGSU9fTURFVl9NRFBZCj4+PiAgIAkgIG1lZGlhdGVkIGRldmlj
ZS4gIEl0IGlzIGEgc2ltcGxlIGZyYW1lYnVmZmVyIGFuZCBzdXBwb3J0cwo+Pj4gICAJICB0aGUg
cmVnaW9uIGRpc3BsYXkgaW50ZXJmYWNlIChWRklPX0dGWF9QTEFORV9UWVBFX1JFR0lPTikuCj4+
PiAgIAo+Pj4gK2NvbmZpZyBTQU1QTEVfVklSVElPX01ERVZfTkVUCj4+PiArCXRyaXN0YXRlICJC
dWlsZCBWSVJUSU8gbmV0IGV4YW1wbGUgbWVkaWF0ZWQgZGV2aWNlIHNhbXBsZSBjb2RlIC0tIGxv
YWRhYmxlIG1vZHVsZXMgb25seSIKPj4+ICsJZGVwZW5kcyBvbiBWSVJUSU9fTURFViAmJiBWSE9T
VF9SSU5HICYmIG0KPj4+ICsJaGVscAo+Pj4gKwkgIEJ1aWxkIGEgbmV0d29ya2luZyBzYW1wbGUg
ZGV2aWNlIGZvciB1c2UgYXMgYSB2aXJ0aW8KPj4+ICsJICBtZWRpYXRlZCBkZXZpY2UuIFRoZSBk
ZXZpY2UgY29vcHJlYXRlcyB3aXRoIHZpcnRpby1tZGV2IGJ1cwo+PiB0eXBvIGhlcmU6Cj4+IAkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb29wZXJhdGVzCj4+Cj4gSSBjYW4gZml4IHRo
aXMgb24gY29tbWl0IHJlbGF0aXZlIHRvIFYxMCBpZiB0aGVyZSBhcmUgbm8gb3RoZXIgaXNzdWVz
Cj4gcmFpc2VkOgo+Cj4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvS2NvbmZpZyBiL3NhbXBsZXMvS2Nv
bmZpZwo+IGluZGV4IDEzYTI0NDNlMThlMC4uYjcxMTZkOTdjYmJlIDEwMDY0NAo+IC0tLSBhL3Nh
bXBsZXMvS2NvbmZpZwo+ICsrKyBiL3NhbXBsZXMvS2NvbmZpZwo+IEBAIC0xMzYsNyArMTM2LDcg
QEAgY29uZmlnIFNBTVBMRV9WSVJUSU9fTURFVl9ORVQKPiAgICAgICAgICBkZXBlbmRzIG9uIFZJ
UlRJT19NREVWICYmIFZIT1NUX1JJTkcgJiYgbQo+ICAgICAgICAgIGhlbHAKPiAgICAgICAgICAg
IEJ1aWxkIGEgbmV0d29ya2luZyBzYW1wbGUgZGV2aWNlIGZvciB1c2UgYXMgYSB2aXJ0aW8KPiAt
ICAgICAgICAgbWVkaWF0ZWQgZGV2aWNlLiBUaGUgZGV2aWNlIGNvb3ByZWF0ZXMgd2l0aCB2aXJ0
aW8tbWRldiBidXMKPiArICAgICAgICAgbWVkaWF0ZWQgZGV2aWNlLiBUaGUgZGV2aWNlIGNvb3Bl
cmF0ZXMgd2l0aCB2aXJ0aW8tbWRldiBidXMKPiAgICAgICAgICAgIGRyaXZlciB0byBwcmVzZW50
IGFuIHZpcnRpbyBldGhlcm5ldCBkcml2ZXIgZm9yCj4gICAgICAgICAgICBrZXJuZWwuIEl0IHNp
bXBseSBsb29wYmFja3MgYWxsIHBhY2tldHMgZnJvbSBpdHMgVFgKPiAgICAgICAgICAgIHZpcnRx
dWV1ZSB0byBpdHMgUlggdmlydHF1ZXVlLgo+Cj4gVGhhbmtzLAo+IEFsZXgKCgpUaGFua3MsIHBl
ciBNaWNoYWVsIHJlcXVlc3QsIEkgd291bGQgcmVuYW1lIG12bmV0IGFuZCBpbmNsdWRlIHRoaXMg
Zml4IAppbiBWMTEuCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
