Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CF6F2667
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 05:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94D36E359;
	Thu,  7 Nov 2019 04:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EEA6E34C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 04:12:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-Y7iroPMHNZ6uJ8flJrTieg-1; Wed, 06 Nov 2019 23:12:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 258F9107ACC3;
 Thu,  7 Nov 2019 04:11:59 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 390AD60870;
 Thu,  7 Nov 2019 04:11:33 +0000 (UTC)
Subject: Re: [PATCH V8 0/6] mdev based hardware virtio offloading support
To: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
 <20191105105834.469675f0@x1.home>
 <393f2dc9-8c67-d3c9-6553-640b80c15aaf@redhat.com>
 <20191106120312.77a6a318@x1.home>
 <20191106142449-mutt-send-email-mst@kernel.org>
 <20191106141318.150f3b9b@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1c1126ec-94b8-5d1a-8ef6-616604e5a93f@redhat.com>
Date: Thu, 7 Nov 2019 12:11:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106141318.150f3b9b@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Y7iroPMHNZ6uJ8flJrTieg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573099927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vy7XJKdY7uHiidwzfWnqy3jEytGSp6O8E3wPOjJLQeY=;
 b=bLpu8RsTeegLIijJQ+AtutrfeZok3A+78Uuq1iPl+IxGd9vmj7KipONmHo4HIKKlQ0gJsa
 /Lrs+3KHc08ZgXLcULahn6CtJU5NUbq+hxg5ouDvkEPK+59VzhJgoBbJYvUp+F6uSggSjr
 sIZFT8u7flpmuBFlO/l/hAJbnwubwYY=
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
 airlied@linux.ie, heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvNyDkuIrljYg1OjEzLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gV2Vk
LCA2IE5vdiAyMDE5IDE0OjI1OjIzIC0wNTAwCj4gIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+PiBPbiBXZWQsIE5vdiAwNiwgMjAxOSBhdCAxMjowMzoxMlBN
IC0wNzAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4+PiBPbiBXZWQsIDYgTm92IDIwMTkgMTE6
NTY6NDYgKzA4MDAKPj4+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+
Pj4gICAgCj4+Pj4gT24gMjAxOS8xMS82IOS4iuWNiDE6NTgsIEFsZXggV2lsbGlhbXNvbiB3cm90
ZToKPj4+Pj4gT24gVHVlLCAgNSBOb3YgMjAxOSAxNzozMjozNCArMDgwMAo+Pj4+PiBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPj4+Pj4gICAgIAo+Pj4+Pj4gSGkgYWxs
Ogo+Pj4+Pj4KPj4+Pj4+IFRoZXJlIGFyZSBoYXJkd2FyZXMgdGhhdCBjYW4gZG8gdmlydGlvIGRh
dGFwYXRoIG9mZmxvYWRpbmcgd2hpbGUKPj4+Pj4+IGhhdmluZyBpdHMgb3duIGNvbnRyb2wgcGF0
aC4gVGhpcyBwYXRoIHRyaWVzIHRvIGltcGxlbWVudCBhIG1kZXYgYmFzZWQKPj4+Pj4+IHVuaWZp
ZWQgQVBJIHRvIHN1cHBvcnQgdXNpbmcga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gZHJpdmUgdGhv
c2UKPj4+Pj4+IGRldmljZXMuIFRoaXMgaXMgZG9uZSBieSBpbnRyb2R1Y2luZyBhIG5ldyBtZGV2
IHRyYW5zcG9ydCBmb3IgdmlydGlvCj4+Pj4+PiAodmlydGlvX21kZXYpIGFuZCByZWdpc3RlciBp
dHNlbGYgYXMgYSBuZXcga2luZCBvZiBtZGV2IGRyaXZlci4gVGhlbgo+Pj4+Pj4gaXQgcHJvdmlk
ZXMgYSB1bmlmaWVkIHdheSBmb3Iga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gdGFsayB3aXRoIG1k
ZXYKPj4+Pj4+IGRldmljZSBpbXBsZW1lbnRhdGlvbi4KPj4+Pj4+Cj4+Pj4+PiBUaG91Z2ggdGhl
IHNlcmllcyBvbmx5IGNvbnRhaW5zIGtlcm5lbCBkcml2ZXIgc3VwcG9ydCwgdGhlIGdvYWwgaXMg
dG8KPj4+Pj4+IG1ha2UgdGhlIHRyYW5zcG9ydCBnZW5lcmljIGVub3VnaCB0byBzdXBwb3J0IHVz
ZXJzcGFjZSBkcml2ZXJzLiBUaGlzCj4+Pj4+PiBtZWFucyB2aG9zdC1tZGV2WzFdIGNvdWxkIGJl
IGJ1aWx0IG9uIHRvcCBhcyB3ZWxsIGJ5IHJlc3VpbmcgdGhlCj4+Pj4+PiB0cmFuc3BvcnQuCj4+
Pj4+Pgo+Pj4+Pj4gQSBzYW1wbGUgZHJpdmVyIGlzIGFsc28gaW1wbGVtZW50ZWQgd2hpY2ggc2lt
dWxhdGUgYSB2aXJpdG8tbmV0Cj4+Pj4+PiBsb29wYmFjayBldGhlcm5ldCBkZXZpY2Ugb24gdG9w
IG9mIHZyaW5naCArIHdvcmtxdWV1ZS4gVGhpcyBjb3VsZCBiZQo+Pj4+Pj4gdXNlZCBhcyBhIHJl
ZmVyZW5jZSBpbXBsZW1lbnRhdGlvbiBmb3IgcmVhbCBoYXJkd2FyZSBkcml2ZXIuCj4+Pj4+Pgo+
Pj4+Pj4gQWxzbyBhIHJlYWwgSUNGIFZGIGRyaXZlciB3YXMgYWxzbyBwb3N0ZWQgaGVyZVsyXSB3
aGljaCBpcyBhIGdvb2QKPj4+Pj4+IHJlZmVyZW5jZSBmb3IgdmVuZG9ycyB3aG8gaXMgaW50ZXJl
c3RlZCBpbiB0aGVpciBvd24gdmlydGlvIGRhdGFwYXRoCj4+Pj4+PiBvZmZsb2FkaW5nIHByb2R1
Y3QuCj4+Pj4+Pgo+Pj4+Pj4gQ29uc2lkZXIgbWRldiBmcmFtZXdvcmsgb25seSBzdXBwb3J0IFZG
SU8gZGV2aWNlIGFuZCBkcml2ZXIgcmlnaHQgbm93LAo+Pj4+Pj4gdGhpcyBzZXJpZXMgYWxzbyBl
eHRlbmQgaXQgdG8gc3VwcG9ydCBvdGhlciB0eXBlcy4gVGhpcyBpcyBkb25lCj4+Pj4+PiB0aHJv
dWdoIGludHJvZHVjaW5nIGNsYXNzIGlkIHRvIHRoZSBkZXZpY2UgYW5kIHBhaXJpbmcgaXQgd2l0
aAo+Pj4+Pj4gaWRfdGFsYmUgY2xhaW1lZCBieSB0aGUgZHJpdmVyLiBPbiB0b3AsIHRoaXMgc2Vy
aXMgYWxzbyBkZWNvdXBsZQo+Pj4+Pj4gZGV2aWNlIHNwZWNpZmljIHBhcmVudHMgb3BzIG91dCBv
ZiB0aGUgY29tbW9uIG9uZXMuCj4+Pj4+Pgo+Pj4+Pj4gUGt0Z2VuIHRlc3Qgd2FzIGRvbmUgd2l0
aCB2aXJpdG8tbmV0ICsgbXZuZXQgbG9vcCBiYWNrIGRldmljZS4KPj4+Pj4+Cj4+Pj4+PiBQbGVh
c2UgcmV2aWV3Lgo+Pj4+Pj4KPj4+Pj4+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8x
MC8zMS80NDAKPj4+Pj4+IFsyXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMC8xNS8xMjI2
Cj4+Pj4+Pgo+Pj4+Pj4gQ2hhbmdlcyBmcm9tIFY3Ogo+Pj4+Pj4gLSBkcm9wIHtzZXR8Z2V0fV9t
ZGV2X2ZlYXR1cmVzIGZvciB2aXJ0aW8KPj4+Pj4+IC0gdHlwbyBhbmQgY29tbWVudCBzdHlsZSBm
aXhlcwo+Pj4+PiBTZWVtcyB3ZSdyZSBuZWFybHkgdGhlcmUsIGFsbCB0aGUgcmVtYWluaW5nIGNv
bW1lbnRzIGFyZSByZWxhdGl2ZWx5Cj4+Pj4+IHN1cGVyZmljaWFsLCB0aG91Z2ggSSB3b3VsZCBh
cHByZWNpYXRlIGEgdjkgYWRkcmVzc2luZyB0aGVtIGFzIHdlbGwgYXMKPj4+Pj4gdGhlIGNoZWNr
cGF0Y2ggd2FybmluZ3M6Cj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvNjg5NzcvCj4+Pj4KPj4+PiBXaWxsIGRvLgo+Pj4+Cj4+Pj4gQnR3LCBkbyB5
b3UgcGxhbiB0byBtZXJnZSB2aG9zdC1tZGV2IHBhdGNoIG9uIHRvcD8gT3IgeW91IHByZWZlciBp
dCB0bwo+Pj4+IGdvIHRocm91Z2ggTWljaGFlbCdzIHZob3N0IHRyZWU/Cj4+PiBJIGNhbiBpbmNs
dWRlIGl0IGlmIHlvdSB3aXNoLiAgVGhlIG1kZXYgY2hhbmdlcyBhcmUgaXNvbGF0ZWQgZW5vdWdo
IGluCj4+PiB0aGF0IHBhdGNoIHRoYXQgSSB3b3VsZG4ndCBwcmVzdW1lIGl0LCBidXQgY2xlYXJs
eSBpdCB3b3VsZCByZXF1aXJlCj4+PiBsZXNzIG1lcmdlIGNvb3JkaW5hdGlvbiB0byBkcm9wIGl0
IGluIG15IHRyZWUuICBMZXQgbWUga25vdy4gIFRoYW5rcywKPj4+Cj4+PiBBbGV4Cj4+IEknbSBm
aW5lIHdpdGggbWVyZ2luZyB0aHJvdWdoIHlvdXIgdHJlZS4gSWYgeW91IGRvLCBmZWVsIGZyZWUg
dG8KPj4gaW5jbHVkZQo+Pgo+PiBBY2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT4KPiBBRkFJQ1QsIGl0IGxvb2tzIGxpa2Ugd2UncmUgZXhwZWN0aW5nIGF0IGxlYXN0
IG9uZSBtb3JlIHZlcnNpb24gb2YKPiBUaXdlaSdzIHBhdGNoIGFmdGVyIFY1LCBzbyBpdCdkIHBy
b2JhYmx5IGJlIGJlc3QgdG8gcHJvdmlkZSB0aGUgYWNrIGFuZAo+IGdvLWFoZWFkIG9uIHRoYXQg
bmV4dCB2ZXJzaW9uIHNvIHRoZXJlJ3Mgbm8gY29uZnVzaW9uLiAgVGhhbmtzLAo+Cj4gQWxleAoK
ClllcywgaXQncyBwcm9iYWJseSBuZWVkIGEgVjYuIFdpbGwgZ2l2ZSBhY2sgdGhlcmUuCgpUaGFu
a3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
