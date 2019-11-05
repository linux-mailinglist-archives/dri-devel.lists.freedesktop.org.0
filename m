Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC4F0492
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 18:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52D86EB3A;
	Tue,  5 Nov 2019 17:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9279F6EB37
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 17:58:57 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-vstKXwaEPzyCzJ10MyBS1A-1; Tue, 05 Nov 2019 12:58:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03AE21800D4A;
 Tue,  5 Nov 2019 17:58:46 +0000 (UTC)
Received: from x1.home (ovpn-116-110.phx2.redhat.com [10.3.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31C85100164D;
 Tue,  5 Nov 2019 17:58:35 +0000 (UTC)
Date: Tue, 5 Nov 2019 10:58:34 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V8 0/6] mdev based hardware virtio offloading support
Message-ID: <20191105105834.469675f0@x1.home>
In-Reply-To: <20191105093240.5135-1-jasowang@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: vstKXwaEPzyCzJ10MyBS1A-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572976736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6tu1v4G9fE/ChX8bRQ38WG0hz1iaA5qDIbKie9vJH4o=;
 b=OGvjmcl+1limUf2GkEkJwjghjeSB80IqjEl1TXQ+9WbunBhMAjbZipFyjfZF63v0EFNEZu
 /Beadxq3H0y5Q+YpXXUCv/ipfijwm0/bL1qwIBMIlWeRsLum3FeDIcvpGRKvaqkvb9+V5E
 Zk4KOVMEqKDBFV0t2fM0LS0k5Fohx/Q=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAgNSBOb3YgMjAxOSAxNzozMjozNCArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
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
bHNvIGEgcmVhbCBJQ0YgVkYgZHJpdmVyIHdhcyBhbHNvIHBvc3RlZCBoZXJlWzJdIHdoaWNoIGlz
IGEgZ29vZAo+IHJlZmVyZW5jZSBmb3IgdmVuZG9ycyB3aG8gaXMgaW50ZXJlc3RlZCBpbiB0aGVp
ciBvd24gdmlydGlvIGRhdGFwYXRoCj4gb2ZmbG9hZGluZyBwcm9kdWN0Lgo+IAo+IENvbnNpZGVy
IG1kZXYgZnJhbWV3b3JrIG9ubHkgc3VwcG9ydCBWRklPIGRldmljZSBhbmQgZHJpdmVyIHJpZ2h0
IG5vdywKPiB0aGlzIHNlcmllcyBhbHNvIGV4dGVuZCBpdCB0byBzdXBwb3J0IG90aGVyIHR5cGVz
LiBUaGlzIGlzIGRvbmUKPiB0aHJvdWdoIGludHJvZHVjaW5nIGNsYXNzIGlkIHRvIHRoZSBkZXZp
Y2UgYW5kIHBhaXJpbmcgaXQgd2l0aAo+IGlkX3RhbGJlIGNsYWltZWQgYnkgdGhlIGRyaXZlci4g
T24gdG9wLCB0aGlzIHNlcmlzIGFsc28gZGVjb3VwbGUKPiBkZXZpY2Ugc3BlY2lmaWMgcGFyZW50
cyBvcHMgb3V0IG9mIHRoZSBjb21tb24gb25lcy4KPiAKPiBQa3RnZW4gdGVzdCB3YXMgZG9uZSB3
aXRoIHZpcml0by1uZXQgKyBtdm5ldCBsb29wIGJhY2sgZGV2aWNlLgo+IAo+IFBsZWFzZSByZXZp
ZXcuCj4gCj4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEwLzMxLzQ0MAo+IFsyXSBo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMC8xNS8xMjI2Cj4gCj4gQ2hhbmdlcyBmcm9tIFY3
Ogo+IC0gZHJvcCB7c2V0fGdldH1fbWRldl9mZWF0dXJlcyBmb3IgdmlydGlvCj4gLSB0eXBvIGFu
ZCBjb21tZW50IHN0eWxlIGZpeGVzCgoKU2VlbXMgd2UncmUgbmVhcmx5IHRoZXJlLCBhbGwgdGhl
IHJlbWFpbmluZyBjb21tZW50cyBhcmUgcmVsYXRpdmVseQpzdXBlcmZpY2lhbCwgdGhvdWdoIEkg
d291bGQgYXBwcmVjaWF0ZSBhIHY5IGFkZHJlc3NpbmcgdGhlbSBhcyB3ZWxsIGFzCnRoZSBjaGVj
a3BhdGNoIHdhcm5pbmdzOgoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy82ODk3Ny8KCkNvbnNpZGVyIHRoaXMgYSBsYXN0IGNhbGwgZm9yIHJldmlld3Mgb3IgYWNrcyAo
b3IgbmFrcykgZnJvbSBhZmZlY3RlZAptZGV2IHZlbmRvciBkcml2ZXJzLCBtZGV2LWNvcmUgc3Vi
LW1haW50YWluZXJzIChIaSBLaXJ0aSksIHZpcnRpbwpzdGFrZWhvbGRlcnMsIGV0Yy4gIFRoYW5r
cywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
