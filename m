Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14060113743
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 22:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563F56E95C;
	Wed,  4 Dec 2019 21:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920A26E95C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 21:51:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-rKD_rgg-Nd2FZaXohJCkSg-1; Wed, 04 Dec 2019 16:51:42 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C22D800D54;
 Wed,  4 Dec 2019 21:51:40 +0000 (UTC)
Received: from redhat.com (ovpn-125-178.rdu2.redhat.com [10.10.125.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7FD410013A1;
 Wed,  4 Dec 2019 21:51:38 +0000 (UTC)
Date: Wed, 4 Dec 2019 16:51:36 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Message-ID: <20191204215136.GA4049@redhat.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
 <20191125163327.GA5516@redhat.com>
 <20191126183247.GM7481@mellanox.com>
 <20191203191943.GQ14488@nvishwa1-DESK.sc.intel.com>
MIME-Version: 1.0
In-Reply-To: <20191203191943.GQ14488@nvishwa1-DESK.sc.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: rKD_rgg-Nd2FZaXohJCkSg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575496305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ceD6+ordRSILOCOW1sWSvdHRKAvd6D0NhSOxh4hTC1g=;
 b=NkToxUZ1gcEyhQjz0m2kHWfeJcvfl3EwXuSbvx3kG/eAbKBomTLVpf0hteS9jBCWLJE2Dr
 zzwGhsedt7goreCZp3+OjIBL0SQd27FCEp73qPppzB21A31pB+vXnx0ja6THQ2gG5ZE+Qp
 sm605yRCRPvRCkN5bmfVUj8OIMzeaD4=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMTE6MTk6NDNBTSAtMDgwMCwgTmlyYW5qYW4gVmlzaHdh
bmF0aGFwdXJhIHdyb3RlOgo+IE9uIFR1ZSwgTm92IDI2LCAyMDE5IGF0IDA2OjMyOjUyUE0gKzAw
MDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+IE9uIE1vbiwgTm92IDI1LCAyMDE5IGF0IDEx
OjMzOjI3QU0gLTA1MDAsIEplcm9tZSBHbGlzc2Ugd3JvdGU6Cj4gPiA+IE9uIEZyaSwgTm92IDIy
LCAyMDE5IGF0IDExOjMzOjEyUE0gKzAwMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+ID4g
PiBPbiBGcmksIE5vdiAyMiwgMjAxOSBhdCAxMjo1NzoyN1BNIC0wODAwLCBOaXJhbmphbmEgVmlz
aHdhbmF0aGFwdXJhIHdyb3RlOgo+ID4gPiAKPiA+ID4gWy4uLl0KPiA+ID4gCj4gPiA+ID4gPiAr
c3RhdGljIGludAo+ID4gPiA+ID4gK2k5MTVfcmFuZ2VfZmF1bHQoc3RydWN0IGk5MTVfc3ZtICpz
dm0sIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsJbG9u
ZyByZXQ7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArCXJhbmdlLT5kZWZhdWx0X2ZsYWdzID0gMDsK
PiA+ID4gPiA+ICsJcmFuZ2UtPnBmbl9mbGFnc19tYXNrID0gLTFVTDsKPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICsJcmV0ID0gaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdlLCAmc3ZtLT5taXJyb3IpOwo+
ID4gPiA+ID4gKwlpZiAocmV0KSB7Cj4gPiA+ID4gPiArCQl1cF9yZWFkKCZzdm0tPm1tLT5tbWFw
X3NlbSk7Cj4gPiA+ID4gPiArCQlyZXR1cm4gKGludClyZXQ7Cj4gPiA+ID4gPiArCX0KPiA+ID4g
Pgo+ID4gPiA+Cj4gPiA+ID4gVXNpbmcgYSB0ZW1wb3JhcnkgcmFuZ2UgaXMgdGhlIHBhdHRlcm4g
ZnJvbSBub3V2ZWF1LCBpcyBpdCByZWFsbHkKPiA+ID4gPiBuZWNlc3NhcnkgaW4gdGhpcyBkcml2
ZXI/Cj4gPiA+IAo+ID4gPiBKdXN0IHRvIGNvbW1lbnQgb24gdGhpcywgZm9yIEdQVSB0aGUgdXNh
Z2UgbW9kZWwgaXMgbm90IGFwcGxpY2F0aW9uCj4gPiA+IHJlZ2lzdGVyIHJhbmdlIG9mIHZpcnR1
YWwgYWRkcmVzcyBpdCB3YW50cyB0byB1c2UuIEl0IGlzIEdQVSBjYW4KPiA+ID4gYWNjZXNzIF9h
bnlfIENQVSB2YWxpZCBhZGRyZXNzIGp1c3QgbGlrZSB0aGUgQ1BVIHdvdWxkIChtb2R1bG8gbW1h
cAo+ID4gPiBvZiBkZXZpY2UgZmlsZSkuCj4gPiA+IAo+ID4gPiBUaGlzIGlzIGJlY2F1c2UgdGhl
IEFQSSB5b3Ugd2FudCBpbiB1c2Vyc3BhY2UgaXMgYXBwbGljYXRpb24gcGFzc2luZwo+ID4gPiBy
YW5kb20gcG9pbnRlciB0byB0aGUgR1BVIGFuZCBHUFUgYmVpbmcgYWJsZSB0byBjaGFzZSBkb3du
IGFueSBraW5kCj4gPiA+IG9mIHJhbmRvbSBwb2ludGVyIGNoYWluIChhc3N1bWluZyBhbGwgdmFs
aWQgaWUgcG9pbnRpbmcgdG8gdmFsaWQKPiA+ID4gdmlydHVhbCBhZGRyZXNzIGZvciB0aGUgcHJv
Y2VzcykuCj4gPiA+IAo+ID4gPiBUaGlzIGlzIHVubGlrZSB0aGUgUkRNQSBjYXNlLgo+ID4gCj4g
PiBObywgUkRNQSBoYXMgdGhlIGZ1bGwgYWRkcmVzcyBzcGFjZSBvcHRpb24gYXMgd2VsbCwgaXQg
aXMgY2FsbGVkCj4gPiAnaW1wbGljaXQgT0RQJwo+ID4gCj4gPiBUaGlzIGlzIGltcGxlbWVudGVk
IGJ5IHJlZ2lzdGVyaW5nIHJhbmdlcyBhdCBhIGxldmVsIGluIG91ciBwYWdlCj4gPiB0YWJsZSAo
Y3VycmVudGx5IDUxMkcpIHdoZW5ldmVyIHRoYXQgbGV2ZWwgaGFzIHBvcHVsYXRlZCBwYWdlcyBi
ZWxvdwo+ID4gaXQuCj4gPiAKPiA+IEkgdGhpbmsgaXMgYSBiZXR0ZXIgc3RyYXRlZ3kgdGhhbiB0
ZW1wb3JhcnkgcmFuZ2VzLgoKSE1NIG9yaWdpbmFsIGRlc2lnbiBkaWQgbm90IGhhdmUgcmFuZ2Ug
YW5kIHdhcyB3ZWxsIHN1aXRlZCB0byBub3V2ZWF1LgpSZWNlbnQgY2hhbmdlcyBtYWtlIGl0IG1v
cmUgdGllIHRvIHRoZSByYW5nZSBhbmQgbGVzcyBzdWl0ZWQgdG8gbm91dmVhdS4KSSB3b3VsZCBu
b3QgY29uc2lkZXIgNTEyR0IgaW1wbGljaXQgcmFuZ2UgYXMgZ29vZCB0aGluZy4gUGxhbiBpIGhh
dmUgaXMKdG8gY3JlYXRlIGltcGxpY2l0IHJhbmdlIGFuZCBhbGlnbiB0aGVtIG9uIHZtYS4gSSBk
byBub3Qga25vdyB3aGVuIGkgd2lsbApoYXZlIHRpbWUgdG8gZ2V0IHRvIHRoYXQuCgo+ID4gCj4g
PiBCdXQgb3RoZXIgR1BVIGRyaXZlcnMgbGlrZSBBTUQgYXJlIHVzaW5nIEJPIGFuZCBUVE0gb2Jq
ZWN0cyB3aXRoIGZpeGVkCj4gPiBWQSByYW5nZXMgYW5kIHRoZSByYW5nZSBpcyB0aWVkIHRvIHRo
ZSBCTy9UVE0uCj4gPiAKPiA+IEknbSBub3Qgc3VyZSBpZiB0aGlzIGk5MTUgdXNhZ2UgaXMgY2xv
c2VyIHRvIEFNRCBvciBjbG9zZXIgdG8gbm91dmVhdS4KPiA+IAo+IAo+IEkgZG9uJ3Qga25vdyB0
aGUgZnVsbCBkZXRhaWxzIG9mIHRoZSBITU0gdXNlY2FzZXMgaW4gYW1kIGFuZCBub3V2ZWF1Lgo+
IEFNRCBzZWVtcyB0byBiZSB1c2luZyBpdCBmb3IgdXNycHRyIG9iamVjdHMgd2hpY2ggaXMgdGll
ZCB0byBhIEJPLgo+IEkgYW0gbm90IHN1cmUgaWYgbm91dmVhdSBoYXMgYW55IEJPIHRpZWQgdG8g
dGhlc2UgYWRkcmVzcyByYW5nZXMuCgpJdCBpcyBjbG9zZXIgdG8gbm91dmVhdSwgQU1EIHVzYWdl
IGlzIG9sZCB1c2VycHRyIHVzZWNhc2Ugd2hlcmUgeW91IGhhdmUKYSBCTyB0aWUgdG8gcmFuZ2Uu
IFdoaWxlIFNWTSBtZWFucyBhbnkgdmFsaWQgQ1BVIGFkZHJlc3MgYW5kIHRodXMgaW1wbHkKdGhh
dCB0aGVyZSBpcyBubyBCTyB0aWUgdG8gaXQgKHRoZXJlIGlzIHN0aWxsIEJPIHVzZWNhc2UgdGhh
dCBtdXN0IHN0aWxsCndvcmsgaGVyZSkuCgpDaGVlcnMsCkrDqXLDtG1lCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
