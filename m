Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB6FF1481
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 12:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BADD6ECD8;
	Wed,  6 Nov 2019 11:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42306ECD2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 11:01:19 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-VRFnvVLZMmetEpaUZg4hvw-1; Wed, 06 Nov 2019 06:01:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A4B1477;
 Wed,  6 Nov 2019 11:01:07 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 484225D6D4;
 Wed,  6 Nov 2019 11:00:49 +0000 (UTC)
Date: Wed, 6 Nov 2019 12:00:47 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V9 5/6] virtio: introduce a mdev based transport
Message-ID: <20191106120047.5bcf49c3.cohuck@redhat.com>
In-Reply-To: <20191106070548.18980-6-jasowang@redhat.com>
References: <20191106070548.18980-1-jasowang@redhat.com>
 <20191106070548.18980-6-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: VRFnvVLZMmetEpaUZg4hvw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573038078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkN/IjzaoU90YgssHGz0WFlm7IPvbJWgcf9sbT5dqA4=;
 b=bST+wYKWEuVTBQB5ZAoyV/VuDWC/FISMa2b2/aMn+bcrrk+lROhQ9WxVMQJisDgG925I50
 LmqN6Y7DbujrAfSe25fDlBD4Kd6WCSPTU5tEdt8wlhXyxypPfCU2UErY49f+WgmzUy9Llb
 VKa2zs55iyLIUDX8m/bznOz1SWGyze0=
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

T24gV2VkLCAgNiBOb3YgMjAxOSAxNTowNTo0NyArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IG1kZXYgdHJh
bnNwb3J0IGZvciB2aXJ0aW8uIFRoaXMgaXMgdXNlZCB0bwo+IHVzZSBrZXJuZWwgdmlydGlvIGRy
aXZlciB0byBkcml2ZSB0aGUgbWVkaWF0ZWQgZGV2aWNlIHRoYXQgaXMgY2FwYWJsZQo+IG9mIHBv
cHVsYXRpbmcgdmlydHF1ZXVlIGRpcmVjdGx5Lgo+IAo+IEEgbmV3IHZpcnRpby1tZGV2IGRyaXZl
ciB3aWxsIGJlIHJlZ2lzdGVyZWQgdG8gdGhlIG1kZXYgYnVzLCB3aGVuIGEKPiBuZXcgdmlydGlv
LW1kZXYgZGV2aWNlIGlzIHByb2JlZCwgaXQgd2lsbCByZWdpc3RlciB0aGUgZGV2aWNlIHdpdGgK
PiBtZGV2IGJhc2VkIGNvbmZpZyBvcHMuIFRoaXMgbWVhbnMgaXQgaXMgYSBzb2Z0d2FyZSB0cmFu
c3BvcnQgYmV0d2Vlbgo+IG1kZXYgZHJpdmVyIGFuZCBtZGV2IGRldmljZS4gVGhlIHRyYW5zcG9y
dCB3YXMgaW1wbGVtZW50ZWQgdGhyb3VnaAo+IGRldmljZSBzcGVjaWZpYyBvcHMgd2hpY2ggaXMg
YSBwYXJ0IG9mIG1kZXZfcGFyZW50X29wcyBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aXJ0aW8vS2NvbmZp
ZyAgICAgICB8ICAxMyArKwo+ICBkcml2ZXJzL3ZpcnRpby9NYWtlZmlsZSAgICAgIHwgICAxICsK
PiAgZHJpdmVycy92aXJ0aW8vdmlydGlvX21kZXYuYyB8IDQwNiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDQyMCBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRldi5jCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL0tjb25maWcgYi9kcml2ZXJzL3ZpcnRpby9LY29uZmln
Cj4gaW5kZXggMDc4NjE1Y2YyYWZjLi41NThhYzYwN2QxMDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92aXJ0aW8vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmlydGlvL0tjb25maWcKPiBAQCAtNDMs
NiArNDMsMTkgQEAgY29uZmlnIFZJUlRJT19QQ0lfTEVHQUNZCj4gIAo+ICAJICBJZiB1bnN1cmUs
IHNheSBZLgo+ICAKPiArY29uZmlnIFZJUlRJT19NREVWCj4gKwl0cmlzdGF0ZSAiTURFViBkcml2
ZXIgZm9yIHZpcnRpbyBkZXZpY2VzIgo+ICsJZGVwZW5kcyBvbiBWRklPX01ERVYgJiYgVklSVElP
Cj4gKwlkZWZhdWx0IG4KPiArCWhlbHAKPiArCSAgVGhpcyBkcml2ZXIgcHJvdmlkZXMgc3VwcG9y
dCBmb3IgdmlydGlvIGJhc2VkIHBhcmF2aXJ0dWFsCj4gKwkgIGRldmljZSBkcml2ZXIgb3ZlciBN
REVWIGJ1cy4gVGhpcyByZXF1aXJlcyB5b3VyIGVudmlyb25lbW50Cj4gKwkgIGhhcyBhcHByb3By
aWF0ZSB2aXJ0aW8gbWRldiBkZXZpY2UgaW1wbGVtZW50YXRpb24gd2hpY2ggbWF5Cj4gKwkgIG9w
ZXJhdGUgb24gdGhlIHBoeXNpY2FsIGRldmljZSB0aGF0IHRoZSBkYXRhcGF0aCBvZiB2aXJ0aW8K
PiArCSAgY291bGQgYmUgb2ZmbG9hZGVkIHRvIGhhcmR3YXJlLgoKVGhhdCBzZW50ZW5jZSBpcyBh
IGJpdCBjb25mdXNpbmcgdG8gbWUuLi4gd2hhdCBhYm91dAoKIkZvciB0aGlzIHRvIGJlIHVzZWZ1
bCwgeW91IG5lZWQgYW4gYXBwcm9wcmlhdGUgdmlydGlvIG1kZXYgZGV2aWNlCmltcGxlbWVudGF0
aW9uIHRoYXQgb3BlcmF0ZXMgb24gYSBwaHlzaWNhbCBkZXZpY2UgdG8gYWxsb3cgdGhlIGRhdGFw
YXRoCm9mIHZpcnRpbyB0byBiZSBvZmZsb2FkZWQgdG8gaGFyZHdhcmUuIgoKPwoKPiArCj4gKwkg
IElmIHVuc3VyZSwgc2F5IE0KCkJ1aWxkaW5nIHRoaXMgYXMgYSBtb2R1bGUgc2hvdWxkIG5vdCBo
dXJ0IChidXQgcGxlYXNlIGFkZCBhIHRyYWlsaW5nCicuJyBoZXJlIDopCgo+ICsKPiAgY29uZmln
IFZJUlRJT19QTUVNCj4gIAl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgdmlydGlvIHBtZW0gZHJpdmVy
Igo+ICAJZGVwZW5kcyBvbiBWSVJUSU8KCldpdGggdGhlIGNoYW5nZXMgYWJvdmUsCgpSZXZpZXdl
ZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
