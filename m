Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60618D1FDB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 07:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1E26EA8A;
	Thu, 10 Oct 2019 05:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3CE6E0C0;
 Thu, 10 Oct 2019 05:01:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6C23858;
 Thu, 10 Oct 2019 05:01:23 +0000 (UTC)
Received: from [10.72.12.46] (ovpn-12-46.pek2.redhat.com [10.72.12.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C0D05C22C;
 Thu, 10 Oct 2019 05:01:01 +0000 (UTC)
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
To: Alex Williamson <alex.williamson@redhat.com>,
 Parav Pandit <parav@mellanox.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-7-jasowang@redhat.com>
 <20190924170640.1da03bae@x1.home>
 <AM0PR05MB48662BA1D397D74DF4F5B9AFD1810@AM0PR05MB4866.eurprd05.prod.outlook.com>
 <20190930153601.31e29f7e@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <12280951-52dc-0863-8146-807fc0c71e81@redhat.com>
Date: Thu, 10 Oct 2019 13:00:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930153601.31e29f7e@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 10 Oct 2019 05:01:24 +0000 (UTC)
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMSDkuIrljYg1OjM2LCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gRnJp
LCAyNyBTZXAgMjAxOSAxNjoyNToxMyArMDAwMAo+IFBhcmF2IFBhbmRpdCA8cGFyYXZAbWVsbGFu
b3guY29tPiB3cm90ZToKPgo+PiBIaSBBbGV4LAo+Pgo+Pgo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0KPj4+IEZyb206IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhh
dC5jb20+Cj4+PiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjQsIDIwMTkgNjowNyBQTQo+Pj4g
VG86IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+PiBDYzoga3ZtQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQo+Pj4ga2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtCj4+
PiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsKPj4+IGt3YW5raGVkZUBudmlkaWEuY29tOyBtc3RAcmVkaGF0LmNvbTsgdGl3ZWku
YmllQGludGVsLmNvbTsKPj4+IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOwo+Pj4gY29odWNrQHJlZGhhdC5jb207IG1heGlt
ZS5jb3F1ZWxpbkByZWRoYXQuY29tOwo+Pj4gY3VubWluZy5saWFuZ0BpbnRlbC5jb207IHpoaWhv
bmcud2FuZ0BpbnRlbC5jb207Cj4+PiByb2IubWlsbGVyQGJyb2FkY29tLmNvbTsgeGlhby53Lndh
bmdAaW50ZWwuY29tOwo+Pj4gaGFvdGlhbi53YW5nQHNpZml2ZS5jb207IHpoZW55dXdAbGludXgu
aW50ZWwuY29tOyB6aGkuYS53YW5nQGludGVsLmNvbTsKPj4+IGphbmkubmlrdWxhQGxpbnV4Lmlu
dGVsLmNvbTsgam9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbTsKPj4+IHJvZHJpZ28udml2
aUBpbnRlbC5jb207IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsKPj4+IGZhcm1h
bkBsaW51eC5pYm0uY29tOyBwYXNpY0BsaW51eC5pYm0uY29tOyBzZWJvdHRAbGludXguaWJtLmNv
bTsKPj4+IG9iZXJwYXJAbGludXguaWJtLmNvbTsgaGVpa28uY2Fyc3RlbnNAZGUuaWJtLmNvbTsg
Z29yQGxpbnV4LmlibS5jb207Cj4+PiBib3JudHJhZWdlckBkZS5pYm0uY29tOyBha3Jvd2lha0Bs
aW51eC5pYm0uY29tOyBmcmV1ZGVAbGludXguaWJtLmNvbTsKPj4+IGxpbmdzaGFuLnpodUBpbnRl
bC5jb207IElkbyBTaGFtYXkgPGlkb3NAbWVsbGFub3guY29tPjsKPj4+IGVwZXJlem1hQHJlZGhh
dC5jb207IGx1bHVAcmVkaGF0LmNvbTsgUGFyYXYgUGFuZGl0Cj4+PiA8cGFyYXZAbWVsbGFub3gu
Y29tPjsgY2hyaXN0b3BoZS5kZS5kaW5lY2hpbkBnbWFpbC5jb207Cj4+PiBrZXZpbi50aWFuQGlu
dGVsLmNvbQo+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiA2LzhdIG1kZXY6IGludHJvZHVjZSB2
aXJ0aW8gZGV2aWNlIGFuZCBpdHMgZGV2aWNlIG9wcwo+Pj4KPj4+IE9uIFR1ZSwgMjQgU2VwIDIw
MTkgMjE6NTM6MzAgKzA4MDAKPj4+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdy
b3RlOgo+Pj4gICAgCj4+Pj4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIGJhc2ljIHN1cHBvcnQgZm9y
IG1kZXYgZHJpdmVyIHRoYXQgc3VwcG9ydHMKPj4+PiB2aXJ0aW8gdHJhbnNwb3J0IGZvciBrZXJu
ZWwgdmlydGlvIGRyaXZlci4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gICBpbmNsdWRlL2xpbnV4L21kZXYuaCAg
ICAgICAgfCAgIDIgKwo+Pj4+ICAgaW5jbHVkZS9saW51eC92aXJ0aW9fbWRldi5oIHwgMTQ1Cj4+
Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gICAyIGZpbGVzIGNo
YW5nZWQsIDE0NyBpbnNlcnRpb25zKCspCj4+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9saW51eC92aXJ0aW9fbWRldi5oCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tZGV2LmggYi9pbmNsdWRlL2xpbnV4L21kZXYuaCBpbmRleAo+Pj4+IDM0MTQzMDczMTFmMS4u
NzNhYzI3YjNiODY4IDEwMDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvbWRldi5oCj4+Pj4g
KysrIGIvaW5jbHVkZS9saW51eC9tZGV2LmgKPj4+PiBAQCAtMTI2LDYgKzEyNiw4IEBAIHN0cnVj
dCBtZGV2X2RldmljZSAqbWRldl9mcm9tX2RldihzdHJ1Y3QgZGV2aWNlCj4+Pj4gKmRldik7Cj4+
Pj4KPj4+PiAgIGVudW0gewo+Pj4+ICAgCU1ERVZfSURfVkZJTyA9IDEsCj4+Pj4gKwlNREVWX0lE
X1ZJUlRJTyA9IDIsCj4+Pj4gKwlNREVWX0lEX1ZIT1NUID0gMywKPj4+IE1ERVZfSURfVkhPU1Qg
aXNuJ3QgdXNlZCB5ZXQgaGVyZS4gIEFsc28sIGdpdmVuIHRoZSBzdHJvbmcgaW50ZXJkZXBlbmRl
bmNlCj4+PiBiZXR3ZWVuIHRoZSBjbGFzc19pZCBhbmQgdGhlIG9wcyBzdHJ1Y3R1cmUsIHdlIG1p
Z2h0IHdhbmQgdG8gZGVmaW5lIHRoZW0gaW4KPj4+IHRoZSBzYW1lIHBsYWNlLiAgVGhhbmtzLAo+
Pj4gICAgCj4+IFdoZW4gbWx4NV9jb3JlIGNyZWF0ZXMgbWRldnMgKHBhcmVudC0+b3BzLT5jcmVh
dGUoKSBhbmQgaXQgd2FudHMgdG8KPj4gYmluZCB0byBtbHg1IG1kZXYgZHJpdmVyICh3aGljaCBk
b2VzIG1kZXZfcmVnaXN0ZXJfZHJpdmVyKCkpLCBtbHg1Cj4+IGNvcmUgZHJpdmVyIHdpbGwgcHVi
bGlzaCBNREVWX0lEX01MWDVfTkVUIGRlZmluZWQgaW4gY2VudHJhbCBwbGFjZSBhcwo+PiBpbmNs
dWRlL2xpbnV4L21kZXYuaCB3aXRob3V0IGFueSBvcHMgc3RydWN0dXJlLiBCZWNhdXNlIHN1Y2gg
b3BzIGFyZQo+PiBub3QgcmVsZXZhbnQuIEl0IHVzZXMgdXN1YWwsIHN0YW5kYXJkIG9wcyBwcm9i
ZSgpIHJlbW92ZSgpIG9uIHRoZQo+PiBtZGV2IChzaW1pbGFyIHRvIGEgcmVndWxhciBQQ0kgZGV2
aWNlKS4gU28gZm9yIFZIT1NUIGNhc2Ugb3BzIG1heSBiZQo+PiBjbG9zZWx5IHJlbGF0ZWQgdG8g
SUQsIGJ1dCBub3QgZm9yIG90aGVyIHR5cGUgb2YgSUQuCj4+Cj4+IEp1c3Qgd2FudCB0byBtYWtl
IHN1cmUsIHRoYXQgc2NvcGUgb2YgSUQgY292ZXJzIHRoaXMgY2FzZS4KPiBBSVVJLCB0aGVzZSBk
ZXZpY2Utb3BzIGFyZSBwcmltYXJpbHkgbWVhbnQgdG8gaGF2ZSAxOk4gbXVsdGlwbGV4aW5nIG9m
Cj4gdGhlIG1kZXYgYnVzIGRyaXZlci4gIE9uZSBtZGV2IGJ1cyBkcml2ZXIgc3VwcG9ydHMgTiB2
ZW5kb3IgZHJpdmVycyB2aWEKPiBhIGNvbW1vbiAicHJvdG9jb2wiIGRlZmluZWQgYnkgdGhpcyBz
dHJ1Y3R1cmUuICB2ZmlvLW1kZXYgc3VwcG9ydHMKPiBHVlQtZywgR1JJRCwgYW5kIHNldmVyYWwg
c2FtcGxlIGRyaXZlcnMuICBJIHRoaW5rIEphc29uIGFuZCBUaXdlaSBhcmUKPiBhdHRlbXB0aW5n
IHNvbWV0aGluZyBzaW1pbGFyIGlmIHdlIGhhdmUgbXVsdGlwbGUgdmVuZG9ycyB0aGF0IG1heQo+
IHByb3ZpZGUgdmlydGlvL3Zob3N0IHBhcmVudCBkcml2ZXJzLgoKCkV4YWN0bHkuCgoKPiAgIElm
IHlvdSBoYXZlIGEgMToxIG1vZGVsIHdpdGgKPiBtbHg1IHdoZXJlIHlvdSdyZSBub3QgdHJ5aW5n
IHRvIGFic3RyYWN0IGEgY29tbW9uIGNoYW5uZWwgYmV0d2VlbiB0aGUKPiBtZGV2IGJ1cyBkcml2
ZXIgYW5kIHRoZSBtZGV2IHZlbmRvciBkcml2ZXIsIHRoZW4gSSBzdXBwb3NlIHlvdSBtaWdodAo+
IG5vdCB1c2UgdGhlIGRldmljZS1vcHMgY2FwYWJpbGl0aWVzIG9mIHRoZSBtZGV2LWNvcmUuCgoK
WWVzLCBjdXJyZW50IHByb3Bvc2VkIEFQSSBhbGxvd3MgTlVMTCB0byBiZSBwYXNzZWQgYXMgZGV2
aWNlIG9wcy4KClRoYW5rcwoKCj4gICBEaWQgSSBpbnRlcnByZXQKPiB0aGUgcXVlc3Rpb24gY29y
cmVjdGx5PyAgSSB0aGluayB0aGF0J3MgcHJvYmFibHkgZmluZSwgbWRldi1jb3JlCj4gc2hvdWxk
bid0IGhhdmUgYW55IGRlcGVuZGVuY2llcyBvbiB0aGUgZGV2aWNlLW9wcyBhbmQgd2Ugc2hvdWxk
bid0Cj4gcmVhbGx5IGJlIGRpY3RhdGluZyB0aGUgYnVzL3ZlbmRvciBsaW5rIHRocm91Z2ggbWRl
di4gIFRoYW5rcywKPgo+IEFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
