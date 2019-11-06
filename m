Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975B5F207E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 22:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878AE6E328;
	Wed,  6 Nov 2019 21:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BA56E301
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 21:13:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-eZpJXGxRPUGlxMVqCCmNYQ-1; Wed, 06 Nov 2019 16:13:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8E69107ACC3;
 Wed,  6 Nov 2019 21:13:34 +0000 (UTC)
Received: from x1.home (ovpn-116-138.phx2.redhat.com [10.3.116.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B04A61001938;
 Wed,  6 Nov 2019 21:13:18 +0000 (UTC)
Date: Wed, 6 Nov 2019 14:13:18 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V8 0/6] mdev based hardware virtio offloading support
Message-ID: <20191106141318.150f3b9b@x1.home>
In-Reply-To: <20191106142449-mutt-send-email-mst@kernel.org>
References: <20191105093240.5135-1-jasowang@redhat.com>
 <20191105105834.469675f0@x1.home>
 <393f2dc9-8c67-d3c9-6553-640b80c15aaf@redhat.com>
 <20191106120312.77a6a318@x1.home>
 <20191106142449-mutt-send-email-mst@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: eZpJXGxRPUGlxMVqCCmNYQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573074824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QHAakULJ6ctlC4Fo+B5oEGN78VlGbOoTFxrZX89s2Vg=;
 b=H04+1xWtnvUvyVv5yNNYVoZdqKjA0b0IdS+AVJx77XyFtR0EUWiwRxZlOFvyGSn2BxGRx4
 z+ugiC8GSeTis767YTGkbMYOdza0SLIKpAKLcJdKcpZGIvRoQFu0j+PQ0qfJZIN1EXu0Q5
 TsrrGGlUUyzq52Fsc4kL7bUsDfzsV7w=
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
 airlied@linux.ie, Jason Wang <jasowang@redhat.com>, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, cunming.liang@intel.com,
 rodrigo.vivi@intel.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA2IE5vdiAyMDE5IDE0OjI1OjIzIC0wNTAwCiJNaWNoYWVsIFMuIFRzaXJraW4iIDxt
c3RAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDEyOjAzOjEy
UE0gLTA3MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPiA+IE9uIFdlZCwgNiBOb3YgMjAxOSAx
MTo1Njo0NiArMDgwMAo+ID4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gPiAgIAo+ID4gPiBPbiAyMDE5LzExLzYg5LiK5Y2IMTo1OCwgQWxleCBXaWxsaWFtc29uIHdy
b3RlOiAgCj4gPiA+ID4gT24gVHVlLCAgNSBOb3YgMjAxOSAxNzozMjozNCArMDgwMAo+ID4gPiA+
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+ICAgIAo+ID4g
PiA+PiBIaSBhbGw6Cj4gPiA+ID4+Cj4gPiA+ID4+IFRoZXJlIGFyZSBoYXJkd2FyZXMgdGhhdCBj
YW4gZG8gdmlydGlvIGRhdGFwYXRoIG9mZmxvYWRpbmcgd2hpbGUKPiA+ID4gPj4gaGF2aW5nIGl0
cyBvd24gY29udHJvbCBwYXRoLiBUaGlzIHBhdGggdHJpZXMgdG8gaW1wbGVtZW50IGEgbWRldiBi
YXNlZAo+ID4gPiA+PiB1bmlmaWVkIEFQSSB0byBzdXBwb3J0IHVzaW5nIGtlcm5lbCB2aXJ0aW8g
ZHJpdmVyIHRvIGRyaXZlIHRob3NlCj4gPiA+ID4+IGRldmljZXMuIFRoaXMgaXMgZG9uZSBieSBp
bnRyb2R1Y2luZyBhIG5ldyBtZGV2IHRyYW5zcG9ydCBmb3IgdmlydGlvCj4gPiA+ID4+ICh2aXJ0
aW9fbWRldikgYW5kIHJlZ2lzdGVyIGl0c2VsZiBhcyBhIG5ldyBraW5kIG9mIG1kZXYgZHJpdmVy
LiBUaGVuCj4gPiA+ID4+IGl0IHByb3ZpZGVzIGEgdW5pZmllZCB3YXkgZm9yIGtlcm5lbCB2aXJ0
aW8gZHJpdmVyIHRvIHRhbGsgd2l0aCBtZGV2Cj4gPiA+ID4+IGRldmljZSBpbXBsZW1lbnRhdGlv
bi4KPiA+ID4gPj4KPiA+ID4gPj4gVGhvdWdoIHRoZSBzZXJpZXMgb25seSBjb250YWlucyBrZXJu
ZWwgZHJpdmVyIHN1cHBvcnQsIHRoZSBnb2FsIGlzIHRvCj4gPiA+ID4+IG1ha2UgdGhlIHRyYW5z
cG9ydCBnZW5lcmljIGVub3VnaCB0byBzdXBwb3J0IHVzZXJzcGFjZSBkcml2ZXJzLiBUaGlzCj4g
PiA+ID4+IG1lYW5zIHZob3N0LW1kZXZbMV0gY291bGQgYmUgYnVpbHQgb24gdG9wIGFzIHdlbGwg
YnkgcmVzdWluZyB0aGUKPiA+ID4gPj4gdHJhbnNwb3J0Lgo+ID4gPiA+Pgo+ID4gPiA+PiBBIHNh
bXBsZSBkcml2ZXIgaXMgYWxzbyBpbXBsZW1lbnRlZCB3aGljaCBzaW11bGF0ZSBhIHZpcml0by1u
ZXQKPiA+ID4gPj4gbG9vcGJhY2sgZXRoZXJuZXQgZGV2aWNlIG9uIHRvcCBvZiB2cmluZ2ggKyB3
b3JrcXVldWUuIFRoaXMgY291bGQgYmUKPiA+ID4gPj4gdXNlZCBhcyBhIHJlZmVyZW5jZSBpbXBs
ZW1lbnRhdGlvbiBmb3IgcmVhbCBoYXJkd2FyZSBkcml2ZXIuCj4gPiA+ID4+Cj4gPiA+ID4+IEFs
c28gYSByZWFsIElDRiBWRiBkcml2ZXIgd2FzIGFsc28gcG9zdGVkIGhlcmVbMl0gd2hpY2ggaXMg
YSBnb29kCj4gPiA+ID4+IHJlZmVyZW5jZSBmb3IgdmVuZG9ycyB3aG8gaXMgaW50ZXJlc3RlZCBp
biB0aGVpciBvd24gdmlydGlvIGRhdGFwYXRoCj4gPiA+ID4+IG9mZmxvYWRpbmcgcHJvZHVjdC4K
PiA+ID4gPj4KPiA+ID4gPj4gQ29uc2lkZXIgbWRldiBmcmFtZXdvcmsgb25seSBzdXBwb3J0IFZG
SU8gZGV2aWNlIGFuZCBkcml2ZXIgcmlnaHQgbm93LAo+ID4gPiA+PiB0aGlzIHNlcmllcyBhbHNv
IGV4dGVuZCBpdCB0byBzdXBwb3J0IG90aGVyIHR5cGVzLiBUaGlzIGlzIGRvbmUKPiA+ID4gPj4g
dGhyb3VnaCBpbnRyb2R1Y2luZyBjbGFzcyBpZCB0byB0aGUgZGV2aWNlIGFuZCBwYWlyaW5nIGl0
IHdpdGgKPiA+ID4gPj4gaWRfdGFsYmUgY2xhaW1lZCBieSB0aGUgZHJpdmVyLiBPbiB0b3AsIHRo
aXMgc2VyaXMgYWxzbyBkZWNvdXBsZQo+ID4gPiA+PiBkZXZpY2Ugc3BlY2lmaWMgcGFyZW50cyBv
cHMgb3V0IG9mIHRoZSBjb21tb24gb25lcy4KPiA+ID4gPj4KPiA+ID4gPj4gUGt0Z2VuIHRlc3Qg
d2FzIGRvbmUgd2l0aCB2aXJpdG8tbmV0ICsgbXZuZXQgbG9vcCBiYWNrIGRldmljZS4KPiA+ID4g
Pj4KPiA+ID4gPj4gUGxlYXNlIHJldmlldy4KPiA+ID4gPj4KPiA+ID4gPj4gWzFdIGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDE5LzEwLzMxLzQ0MAo+ID4gPiA+PiBbMl0gaHR0cHM6Ly9sa21sLm9y
Zy9sa21sLzIwMTkvMTAvMTUvMTIyNgo+ID4gPiA+Pgo+ID4gPiA+PiBDaGFuZ2VzIGZyb20gVjc6
Cj4gPiA+ID4+IC0gZHJvcCB7c2V0fGdldH1fbWRldl9mZWF0dXJlcyBmb3IgdmlydGlvCj4gPiA+
ID4+IC0gdHlwbyBhbmQgY29tbWVudCBzdHlsZSBmaXhlcyAgICAKPiA+ID4gPgo+ID4gPiA+IFNl
ZW1zIHdlJ3JlIG5lYXJseSB0aGVyZSwgYWxsIHRoZSByZW1haW5pbmcgY29tbWVudHMgYXJlIHJl
bGF0aXZlbHkKPiA+ID4gPiBzdXBlcmZpY2lhbCwgdGhvdWdoIEkgd291bGQgYXBwcmVjaWF0ZSBh
IHY5IGFkZHJlc3NpbmcgdGhlbSBhcyB3ZWxsIGFzCj4gPiA+ID4gdGhlIGNoZWNrcGF0Y2ggd2Fy
bmluZ3M6Cj4gPiA+ID4KPiA+ID4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzY4OTc3LyAgICAKPiA+ID4gCj4gPiA+IAo+ID4gPiBXaWxsIGRvLgo+ID4gPiAKPiA+
ID4gQnR3LCBkbyB5b3UgcGxhbiB0byBtZXJnZSB2aG9zdC1tZGV2IHBhdGNoIG9uIHRvcD8gT3Ig
eW91IHByZWZlciBpdCB0byAKPiA+ID4gZ28gdGhyb3VnaCBNaWNoYWVsJ3Mgdmhvc3QgdHJlZT8g
IAo+ID4gCj4gPiBJIGNhbiBpbmNsdWRlIGl0IGlmIHlvdSB3aXNoLiAgVGhlIG1kZXYgY2hhbmdl
cyBhcmUgaXNvbGF0ZWQgZW5vdWdoIGluCj4gPiB0aGF0IHBhdGNoIHRoYXQgSSB3b3VsZG4ndCBw
cmVzdW1lIGl0LCBidXQgY2xlYXJseSBpdCB3b3VsZCByZXF1aXJlCj4gPiBsZXNzIG1lcmdlIGNv
b3JkaW5hdGlvbiB0byBkcm9wIGl0IGluIG15IHRyZWUuICBMZXQgbWUga25vdy4gIFRoYW5rcywK
PiA+IAo+ID4gQWxleCAgCj4gCj4gSSdtIGZpbmUgd2l0aCBtZXJnaW5nIHRocm91Z2ggeW91ciB0
cmVlLiBJZiB5b3UgZG8sIGZlZWwgZnJlZSB0bwo+IGluY2x1ZGUKPiAKPiBBY2tlZC1ieTogTWlj
aGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KCkFGQUlDVCwgaXQgbG9va3MgbGlrZSB3
ZSdyZSBleHBlY3RpbmcgYXQgbGVhc3Qgb25lIG1vcmUgdmVyc2lvbiBvZgpUaXdlaSdzIHBhdGNo
IGFmdGVyIFY1LCBzbyBpdCdkIHByb2JhYmx5IGJlIGJlc3QgdG8gcHJvdmlkZSB0aGUgYWNrIGFu
ZApnby1haGVhZCBvbiB0aGF0IG5leHQgdmVyc2lvbiBzbyB0aGVyZSdzIG5vIGNvbmZ1c2lvbi4g
IFRoYW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
