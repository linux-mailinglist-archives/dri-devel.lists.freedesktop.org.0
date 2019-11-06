Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B47BFF0D74
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 04:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9196EBE1;
	Wed,  6 Nov 2019 03:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10F96EBE4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 03:58:57 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-vwBxFsjROy-3Zo-U4aD9YA-1; Tue, 05 Nov 2019 22:58:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97EBA8017DE;
 Wed,  6 Nov 2019 03:58:40 +0000 (UTC)
Received: from [10.72.12.193] (ovpn-12-193.pek2.redhat.com [10.72.12.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8514210013D9;
 Wed,  6 Nov 2019 03:57:01 +0000 (UTC)
Subject: Re: [PATCH V8 0/6] mdev based hardware virtio offloading support
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
 <20191105105834.469675f0@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <393f2dc9-8c67-d3c9-6553-640b80c15aaf@redhat.com>
Date: Wed, 6 Nov 2019 11:56:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105105834.469675f0@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: vwBxFsjROy-3Zo-U4aD9YA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573012736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gr71+XtimEL2u6AzLjyEgsguFtJGvEEF2xUegKTV/h0=;
 b=RmEZ2Vcw2Q2kzKBffi9HI2KPBlaXMQTF1kwnDBjvHBUxvtIKREIjR1bYjX5313CRwGKj2O
 dfOI8SGOOCe5uf8nEiM6PQE/zjCPcvpDiuvbq+wd1t+mIeTTLF5+HfpEAswf/nW7zxYEgv
 6HOieXO8oSJN5Oh0scrxX7ZLdlF+wbQ=
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

Ck9uIDIwMTkvMTEvNiDkuIrljYgxOjU4LCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gVHVl
LCAgNSBOb3YgMjAxOSAxNzozMjozNCArMDgwMAo+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4+IEhpIGFsbDoKPj4KPj4gVGhlcmUgYXJlIGhhcmR3YXJlcyB0aGF0
IGNhbiBkbyB2aXJ0aW8gZGF0YXBhdGggb2ZmbG9hZGluZyB3aGlsZQo+PiBoYXZpbmcgaXRzIG93
biBjb250cm9sIHBhdGguIFRoaXMgcGF0aCB0cmllcyB0byBpbXBsZW1lbnQgYSBtZGV2IGJhc2Vk
Cj4+IHVuaWZpZWQgQVBJIHRvIHN1cHBvcnQgdXNpbmcga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8g
ZHJpdmUgdGhvc2UKPj4gZGV2aWNlcy4gVGhpcyBpcyBkb25lIGJ5IGludHJvZHVjaW5nIGEgbmV3
IG1kZXYgdHJhbnNwb3J0IGZvciB2aXJ0aW8KPj4gKHZpcnRpb19tZGV2KSBhbmQgcmVnaXN0ZXIg
aXRzZWxmIGFzIGEgbmV3IGtpbmQgb2YgbWRldiBkcml2ZXIuIFRoZW4KPj4gaXQgcHJvdmlkZXMg
YSB1bmlmaWVkIHdheSBmb3Iga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gdGFsayB3aXRoIG1kZXYK
Pj4gZGV2aWNlIGltcGxlbWVudGF0aW9uLgo+Pgo+PiBUaG91Z2ggdGhlIHNlcmllcyBvbmx5IGNv
bnRhaW5zIGtlcm5lbCBkcml2ZXIgc3VwcG9ydCwgdGhlIGdvYWwgaXMgdG8KPj4gbWFrZSB0aGUg
dHJhbnNwb3J0IGdlbmVyaWMgZW5vdWdoIHRvIHN1cHBvcnQgdXNlcnNwYWNlIGRyaXZlcnMuIFRo
aXMKPj4gbWVhbnMgdmhvc3QtbWRldlsxXSBjb3VsZCBiZSBidWlsdCBvbiB0b3AgYXMgd2VsbCBi
eSByZXN1aW5nIHRoZQo+PiB0cmFuc3BvcnQuCj4+Cj4+IEEgc2FtcGxlIGRyaXZlciBpcyBhbHNv
IGltcGxlbWVudGVkIHdoaWNoIHNpbXVsYXRlIGEgdmlyaXRvLW5ldAo+PiBsb29wYmFjayBldGhl
cm5ldCBkZXZpY2Ugb24gdG9wIG9mIHZyaW5naCArIHdvcmtxdWV1ZS4gVGhpcyBjb3VsZCBiZQo+
PiB1c2VkIGFzIGEgcmVmZXJlbmNlIGltcGxlbWVudGF0aW9uIGZvciByZWFsIGhhcmR3YXJlIGRy
aXZlci4KPj4KPj4gQWxzbyBhIHJlYWwgSUNGIFZGIGRyaXZlciB3YXMgYWxzbyBwb3N0ZWQgaGVy
ZVsyXSB3aGljaCBpcyBhIGdvb2QKPj4gcmVmZXJlbmNlIGZvciB2ZW5kb3JzIHdobyBpcyBpbnRl
cmVzdGVkIGluIHRoZWlyIG93biB2aXJ0aW8gZGF0YXBhdGgKPj4gb2ZmbG9hZGluZyBwcm9kdWN0
Lgo+Pgo+PiBDb25zaWRlciBtZGV2IGZyYW1ld29yayBvbmx5IHN1cHBvcnQgVkZJTyBkZXZpY2Ug
YW5kIGRyaXZlciByaWdodCBub3csCj4+IHRoaXMgc2VyaWVzIGFsc28gZXh0ZW5kIGl0IHRvIHN1
cHBvcnQgb3RoZXIgdHlwZXMuIFRoaXMgaXMgZG9uZQo+PiB0aHJvdWdoIGludHJvZHVjaW5nIGNs
YXNzIGlkIHRvIHRoZSBkZXZpY2UgYW5kIHBhaXJpbmcgaXQgd2l0aAo+PiBpZF90YWxiZSBjbGFp
bWVkIGJ5IHRoZSBkcml2ZXIuIE9uIHRvcCwgdGhpcyBzZXJpcyBhbHNvIGRlY291cGxlCj4+IGRl
dmljZSBzcGVjaWZpYyBwYXJlbnRzIG9wcyBvdXQgb2YgdGhlIGNvbW1vbiBvbmVzLgo+Pgo+PiBQ
a3RnZW4gdGVzdCB3YXMgZG9uZSB3aXRoIHZpcml0by1uZXQgKyBtdm5ldCBsb29wIGJhY2sgZGV2
aWNlLgo+Pgo+PiBQbGVhc2UgcmV2aWV3Lgo+Pgo+PiBbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMTkvMTAvMzEvNDQwCj4+IFsyXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMC8xNS8x
MjI2Cj4+Cj4+IENoYW5nZXMgZnJvbSBWNzoKPj4gLSBkcm9wIHtzZXR8Z2V0fV9tZGV2X2ZlYXR1
cmVzIGZvciB2aXJ0aW8KPj4gLSB0eXBvIGFuZCBjb21tZW50IHN0eWxlIGZpeGVzCj4KPiBTZWVt
cyB3ZSdyZSBuZWFybHkgdGhlcmUsIGFsbCB0aGUgcmVtYWluaW5nIGNvbW1lbnRzIGFyZSByZWxh
dGl2ZWx5Cj4gc3VwZXJmaWNpYWwsIHRob3VnaCBJIHdvdWxkIGFwcHJlY2lhdGUgYSB2OSBhZGRy
ZXNzaW5nIHRoZW0gYXMgd2VsbCBhcwo+IHRoZSBjaGVja3BhdGNoIHdhcm5pbmdzOgo+Cj4gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82ODk3Ny8KCgpXaWxsIGRvLgoK
QnR3LCBkbyB5b3UgcGxhbiB0byBtZXJnZSB2aG9zdC1tZGV2IHBhdGNoIG9uIHRvcD8gT3IgeW91
IHByZWZlciBpdCB0byAKZ28gdGhyb3VnaCBNaWNoYWVsJ3Mgdmhvc3QgdHJlZT8KClRoYW5rcwoK
Cj4KPiBDb25zaWRlciB0aGlzIGEgbGFzdCBjYWxsIGZvciByZXZpZXdzIG9yIGFja3MgKG9yIG5h
a3MpIGZyb20gYWZmZWN0ZWQKPiBtZGV2IHZlbmRvciBkcml2ZXJzLCBtZGV2LWNvcmUgc3ViLW1h
aW50YWluZXJzIChIaSBLaXJ0aSksIHZpcnRpbwo+IHN0YWtlaG9sZGVycywgZXRjLiAgVGhhbmtz
LAo+Cj4gQWxleAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
