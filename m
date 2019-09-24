Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 713BFBC9B5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 16:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E04F6EA3E;
	Tue, 24 Sep 2019 14:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B5989E23;
 Tue, 24 Sep 2019 14:04:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A2E420F0;
 Tue, 24 Sep 2019 14:04:22 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6E5960C5E;
 Tue, 24 Sep 2019 14:04:13 +0000 (UTC)
Date: Tue, 24 Sep 2019 08:04:13 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 5/6] vringh: fix copy direction of vringh_iov_push_kern()
Message-ID: <20190924080413.0cc875c5@x1.home>
In-Reply-To: <20190923115930-mutt-send-email-mst@kernel.org>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-6-jasowang@redhat.com>
 <20190923094559.765da494@x1.home>
 <20190923115930-mutt-send-email-mst@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 24 Sep 2019 14:04:22 +0000 (UTC)
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
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

T24gTW9uLCAyMyBTZXAgMjAxOSAxMjowMDo0MSAtMDQwMAoiTWljaGFlbCBTLiBUc2lya2luIiA8
bXN0QHJlZGhhdC5jb20+IHdyb3RlOgoKPiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCAwOTo0NTo1
OUFNIC0wNjAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gPiBPbiBNb24sIDIzIFNlcCAyMDE5
IDIxOjAzOjMwICswODAwCj4gPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90
ZToKPiA+ICAgCj4gPiA+IFdlIHdhbnQgdG8gY29weSBmcm9tIGlvdiB0byBidWYsIHNvIHRoZSBk
aXJlY3Rpb24gd2FzIHdyb25nLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3Zob3N0L3Zy
aW5naC5jIHwgOCArKysrKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKSAgCj4gPiAKPiA+IAo+ID4gV2h5IGlzIHRoaXMgaW5jbHVkZWQgaW4g
dGhlIHNlcmllcz8gIFNlZW1zIGxpa2UgYW4gdW5yZWxhdGVkIGZpeCBiZWluZwo+ID4gaGVsZCB1
cCB3aXRoaW4gYSBwcm9wb3NhbCBmb3IgYSBuZXcgZmVhdHVyZS4gIFRoYW5rcywKPiA+IAo+ID4g
QWxleCAgCj4gCj4gSXQncyBiZXR0ZXIgdG8gaGF2ZSBpdCBhcyBwYXRjaCAxLzYsIGJ1dCBpdCdz
IGEgZGVwZW5kZW5jeSBvZiB0aGUKPiBleGFtcGxlIGRyaXZlciBpbiB0aGUgc2VyaWVzLiBJIGNh
biByZW9yZGVyIHdoZW4gSSBhcHBseS4KCkl0J3MgYSBmaXgsIHBsZWFzZSBzdWJtaXQgaXQgc2Vw
YXJhdGVseSB0aHJvdWdoIHZpcnRpby92aG9zdCBjaGFubmVscywKdGhlbiBpdCB3aWxsIGFscmVh
ZHkgYmUgaW4gdGhlIGJhc2Uga2VybmVsIHdlIHVzZSBmb3IgdGhlIHJlc3Qgb2YgdGhlCnNlcmll
cy4gIFRoZSByZW1haW5kZXIgb2YgdGhlIHNlcmllcyBjZXJ0YWlubHkgc3VnZ2VzdHMgYSB3b3Jr
Zmxvdwp0aHJvdWdoIHRoZSB2ZmlvIHRyZWUgcmF0aGVyIHRoYW4gdmlydGlvL3Zob3N0LiAgVGhh
bmtzLAoKQWxleAoKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMgYi9k
cml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4gPiA+IGluZGV4IDA4YWQwZDFmMDQ3Ni4uYTBhMmQ3NDk2
N2VmIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4gPiA+ICsrKyBi
L2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMKPiA+ID4gQEAgLTg1Miw2ICs4NTIsMTIgQEAgc3RhdGlj
IGlubGluZSBpbnQgeGZlcl9rZXJuKHZvaWQgKnNyYywgdm9pZCAqZHN0LCBzaXplX3QgbGVuKQo+
ID4gPiAgCXJldHVybiAwOwo+ID4gPiAgfQo+ID4gPiAgCj4gPiA+ICtzdGF0aWMgaW5saW5lIGlu
dCBrZXJuX3hmZXIodm9pZCAqZHN0LCB2b2lkICpzcmMsIHNpemVfdCBsZW4pCj4gPiA+ICt7Cj4g
PiA+ICsJbWVtY3B5KGRzdCwgc3JjLCBsZW4pOwo+ID4gPiArCXJldHVybiAwOwo+ID4gPiArfQo+
ID4gPiArCj4gPiA+ICAvKioKPiA+ID4gICAqIHZyaW5naF9pbml0X2tlcm4gLSBpbml0aWFsaXpl
IGEgdnJpbmdoIGZvciBhIGtlcm5lbHNwYWNlIHZyaW5nLgo+ID4gPiAgICogQHZyaDogdGhlIHZy
aW5naCB0byBpbml0aWFsaXplLgo+ID4gPiBAQCAtOTU4LDcgKzk2NCw3IEBAIEVYUE9SVF9TWU1C
T0wodnJpbmdoX2lvdl9wdWxsX2tlcm4pOwo+ID4gPiAgc3NpemVfdCB2cmluZ2hfaW92X3B1c2hf
a2VybihzdHJ1Y3QgdnJpbmdoX2tpb3YgKndpb3YsCj4gPiA+ICAJCQkgICAgIGNvbnN0IHZvaWQg
KnNyYywgc2l6ZV90IGxlbikKPiA+ID4gIHsKPiA+ID4gLQlyZXR1cm4gdnJpbmdoX2lvdl94ZmVy
KHdpb3YsICh2b2lkICopc3JjLCBsZW4sIHhmZXJfa2Vybik7Cj4gPiA+ICsJcmV0dXJuIHZyaW5n
aF9pb3ZfeGZlcih3aW92LCAodm9pZCAqKXNyYywgbGVuLCBrZXJuX3hmZXIpOwo+ID4gPiAgfQo+
ID4gPiAgRVhQT1JUX1NZTUJPTCh2cmluZ2hfaW92X3B1c2hfa2Vybik7Cj4gPiA+ICAgIAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
