Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3D4F1846
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 15:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7656ED62;
	Wed,  6 Nov 2019 14:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C6A6ED74
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 14:17:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-I-KaKfnbOz6RjNvb_LV7Ig-1; Wed, 06 Nov 2019 09:16:59 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A78B3477;
 Wed,  6 Nov 2019 14:16:55 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD5815D70D;
 Wed,  6 Nov 2019 14:16:37 +0000 (UTC)
Date: Wed, 6 Nov 2019 15:16:35 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V10 0/6] mdev based hardware virtio offloading support
Message-ID: <20191106151635.0d1cb3bc.cohuck@redhat.com>
In-Reply-To: <20191106133531.693-1-jasowang@redhat.com>
References: <20191106133531.693-1-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: I-KaKfnbOz6RjNvb_LV7Ig-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573049823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ER/WquWBpU7PunGVOI/swL9aOZ32qLf8hTv9Vd0HUN0=;
 b=K5C8nkI56OkAcoj9twh1LjAQV4fRlomAPzQEvTMAkaZJMTjsIC3gGXhwOERomTqWE9zDd4
 2fYmRhI6Kb/dAWuaHtBlrkqUvXaxiPxvAttKWCLkDpaH1sNEQx8nVltqBrUdej2IO+3/zK
 lhJF7todK2to4K7dbs5zChnSCptTpGc=
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

T24gV2VkLCAgNiBOb3YgMjAxOSAyMTozNToyNSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gSGkgYWxsOgo+IAo+IFRoZXJlIGFyZSBoYXJkd2FyZXMgdGhh
dCBjYW4gZG8gdmlydGlvIGRhdGFwYXRoIG9mZmxvYWRpbmcgd2hpbGUKPiBoYXZpbmcgaXRzIG93
biBjb250cm9sIHBhdGguIFRoaXMgcGF0aCB0cmllcyB0byBpbXBsZW1lbnQgYSBtZGV2IGJhc2Vk
Cj4gdW5pZmllZCBBUEkgdG8gc3VwcG9ydCB1c2luZyBrZXJuZWwgdmlydGlvIGRyaXZlciB0byBk
cml2ZSB0aG9zZQo+IGRldmljZXMuIFRoaXMgaXMgZG9uZSBieSBpbnRyb2R1Y2luZyBhIG5ldyBt
ZGV2IHRyYW5zcG9ydCBmb3IgdmlydGlvCj4gKHZpcnRpb19tZGV2KSBhbmQgcmVnaXN0ZXIgaXRz
ZWxmIGFzIGEgbmV3IGtpbmQgb2YgbWRldiBkcml2ZXIuIFRoZW4KPiBpdCBwcm92aWRlcyBhIHVu
aWZpZWQgd2F5IGZvciBrZXJuZWwgdmlydGlvIGRyaXZlciB0byB0YWxrIHdpdGggbWRldgo+IGRl
dmljZSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBUaG91Z2ggdGhlIHNlcmllcyBvbmx5IGNvbnRhaW5z
IGtlcm5lbCBkcml2ZXIgc3VwcG9ydCwgdGhlIGdvYWwgaXMgdG8KPiBtYWtlIHRoZSB0cmFuc3Bv
cnQgZ2VuZXJpYyBlbm91Z2ggdG8gc3VwcG9ydCB1c2Vyc3BhY2UgZHJpdmVycy4gVGhpcwo+IG1l
YW5zIHZob3N0LW1kZXZbMV0gY291bGQgYmUgYnVpbHQgb24gdG9wIGFzIHdlbGwgYnkgcmVzdWlu
ZyB0aGUKPiB0cmFuc3BvcnQuCj4gCj4gQSBzYW1wbGUgZHJpdmVyIGlzIGFsc28gaW1wbGVtZW50
ZWQgd2hpY2ggc2ltdWxhdGUgYSB2aXJpdG8tbmV0Cj4gbG9vcGJhY2sgZXRoZXJuZXQgZGV2aWNl
IG9uIHRvcCBvZiB2cmluZ2ggKyB3b3JrcXVldWUuIFRoaXMgY291bGQgYmUKPiB1c2VkIGFzIGEg
cmVmZXJlbmNlIGltcGxlbWVudGF0aW9uIGZvciByZWFsIGhhcmR3YXJlIGRyaXZlci4KPiAKPiBB
bHNvIGEgcmVhbCBJRkMgVkYgZHJpdmVyIHdhcyBhbHNvIHBvc3RlZCBoZXJlWzJdIHdoaWNoIGlz
IGEgZ29vZAo+IHJlZmVyZW5jZSBmb3IgdmVuZG9ycyB3aG8gaXMgaW50ZXJlc3RlZCBpbiB0aGVp
ciBvd24gdmlydGlvIGRhdGFwYXRoCj4gb2ZmbG9hZGluZyBwcm9kdWN0Lgo+IAo+IENvbnNpZGVy
IG1kZXYgZnJhbWV3b3JrIG9ubHkgc3VwcG9ydCBWRklPIGRldmljZSBhbmQgZHJpdmVyIHJpZ2h0
IG5vdywKPiB0aGlzIHNlcmllcyBhbHNvIGV4dGVuZCBpdCB0byBzdXBwb3J0IG90aGVyIHR5cGVz
LiBUaGlzIGlzIGRvbmUKPiB0aHJvdWdoIGludHJvZHVjaW5nIGNsYXNzIGlkIHRvIHRoZSBkZXZp
Y2UgYW5kIHBhaXJpbmcgaXQgd2l0aAo+IGlkX3RhbGJlIGNsYWltZWQgYnkgdGhlIGRyaXZlci4g
T24gdG9wLCB0aGlzIHNlcmlzIGFsc28gZGVjb3VwbGUKPiBkZXZpY2Ugc3BlY2lmaWMgb3BzIG91
dCBvZiB0aGUgY29tbW9uIG9uZXMgZm9yIGltcGxlbWVudGluZyBjbGFzcwo+IHNwZWNpZmljIG9w
ZXJhdGlvbnMgb3ZlciBtZGV2IGJ1cy4KPiAKPiBQa3RnZW4gdGVzdCB3YXMgZG9uZSB3aXRoIHZp
cml0by1uZXQgKyBtdm5ldCBsb29wIGJhY2sgZGV2aWNlLgo+IAo+IFBsZWFzZSByZXZpZXcuCgpB
bGwgbG9va2luZyBnb29kIHRvIG1lIG5vdy4KCj4gCj4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGtt
bC8yMDE5LzExLzUvNDI0Cj4gWzJdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzExLzUvMjI3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
