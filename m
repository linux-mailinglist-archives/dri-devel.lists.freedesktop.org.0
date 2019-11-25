Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC601091DE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 17:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D9689DB7;
	Mon, 25 Nov 2019 16:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD92789DB7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 16:33:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-NWK7HLQJOSiuyhn-mIP1Jg-1; Mon, 25 Nov 2019 11:33:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16F2E184CAA2;
 Mon, 25 Nov 2019 16:33:31 +0000 (UTC)
Received: from redhat.com (ovpn-120-216.rdu2.redhat.com [10.10.120.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 853B05DA7C;
 Mon, 25 Nov 2019 16:33:29 +0000 (UTC)
Date: Mon, 25 Nov 2019 11:33:27 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Message-ID: <20191125163327.GA5516@redhat.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191122233308.GA7481@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: NWK7HLQJOSiuyhn-mIP1Jg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574699616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMlvwqpsqVu16fnxFbjeerY7/zHcAtyTXy18Hur0IJA=;
 b=U3lGj4BCe1sWgnYRMJdQ89cUnMNKXZDAF7RPgGqmH5ixvQQsswCkUf7qMa4jr+f17Z3R1g
 2tbDQSF65r7g2JT0rllFSwqMayt+AZR3woHAZr2iwmHyyU2aom+gCBJsMjWiMgHmICUUTX
 7nOR/2Ldzc0opE4y0GPoLDwaonMTD08=
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
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6MzM6MTJQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIEZyaSwgTm92IDIyLCAyMDE5IGF0IDEyOjU3OjI3UE0gLTA4MDAsIE5pcmFu
amFuYSBWaXNod2FuYXRoYXB1cmEgd3JvdGU6CgpbLi4uXQoKPiA+ICtzdGF0aWMgaW50Cj4gPiAr
aTkxNV9yYW5nZV9mYXVsdChzdHJ1Y3QgaTkxNV9zdm0gKnN2bSwgc3RydWN0IGhtbV9yYW5nZSAq
cmFuZ2UpCj4gPiArewo+ID4gKwlsb25nIHJldDsKPiA+ICsKPiA+ICsJcmFuZ2UtPmRlZmF1bHRf
ZmxhZ3MgPSAwOwo+ID4gKwlyYW5nZS0+cGZuX2ZsYWdzX21hc2sgPSAtMVVMOwo+ID4gKwo+ID4g
KwlyZXQgPSBobW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsICZzdm0tPm1pcnJvcik7Cj4gPiArCWlm
IChyZXQpIHsKPiA+ICsJCXVwX3JlYWQoJnN2bS0+bW0tPm1tYXBfc2VtKTsKPiA+ICsJCXJldHVy
biAoaW50KXJldDsKPiA+ICsJfQo+IAo+IAo+IFVzaW5nIGEgdGVtcG9yYXJ5IHJhbmdlIGlzIHRo
ZSBwYXR0ZXJuIGZyb20gbm91dmVhdSwgaXMgaXQgcmVhbGx5Cj4gbmVjZXNzYXJ5IGluIHRoaXMg
ZHJpdmVyPwoKSnVzdCB0byBjb21tZW50IG9uIHRoaXMsIGZvciBHUFUgdGhlIHVzYWdlIG1vZGVs
IGlzIG5vdCBhcHBsaWNhdGlvbgpyZWdpc3RlciByYW5nZSBvZiB2aXJ0dWFsIGFkZHJlc3MgaXQg
d2FudHMgdG8gdXNlLiBJdCBpcyBHUFUgY2FuCmFjY2VzcyBfYW55XyBDUFUgdmFsaWQgYWRkcmVz
cyBqdXN0IGxpa2UgdGhlIENQVSB3b3VsZCAobW9kdWxvIG1tYXAKb2YgZGV2aWNlIGZpbGUpLgoK
VGhpcyBpcyBiZWNhdXNlIHRoZSBBUEkgeW91IHdhbnQgaW4gdXNlcnNwYWNlIGlzIGFwcGxpY2F0
aW9uIHBhc3NpbmcKcmFuZG9tIHBvaW50ZXIgdG8gdGhlIEdQVSBhbmQgR1BVIGJlaW5nIGFibGUg
dG8gY2hhc2UgZG93biBhbnkga2luZApvZiByYW5kb20gcG9pbnRlciBjaGFpbiAoYXNzdW1pbmcg
YWxsIHZhbGlkIGllIHBvaW50aW5nIHRvIHZhbGlkCnZpcnR1YWwgYWRkcmVzcyBmb3IgdGhlIHBy
b2Nlc3MpLgoKVGhpcyBpcyB1bmxpa2UgdGhlIFJETUEgY2FzZS4KCgpUaGF0IGJlaW5nIHNhaWQs
IGZvciBiZXN0IHBlcmZvcm1hbmNlIHdlIHN0aWxsIGV4cGVjdCB3ZWxsIGJlaGF2aW5nCmFwcGxp
Y2F0aW9uIHRvIHByb3ZpZGUgaGludCB0byBrZXJuZWwgc28gdGhhdCB3ZSBrbm93IGlmIGEgcmFu
Z2Ugb2YKdmlydHVhbCBhZGRyZXNzIGlzIGxpa2VseSB0byBiZSB1c2UgYnkgdGhlIEdQVSBvciBu
b3QuIEJ1dCB0aGlzIGlzCm5vdCwgYW5kIHNob3VsZCBub3QgYmUgYSByZXF1aXJlbWVudC4KCgpJ
IHBvc3RlZCBwYXRjaHNldCBhbmQgZ2l2ZW4gdGFsa3MgYWJvdXQgdGhpcywgYnV0IGxvbmcgdGVy
bSBpIGJlbGlldmUKd2Ugd2FudCBhIGNvbW1vbiBBUEkgdG8gbWFuYWdlIGhpbnQgcHJvdmlkZWQg
YnkgdXNlcnNwYWNlIChzZWUgbXkKdGFsayBhdCBMUEMgdGhpcyB5ZWFyIGFib3V0IG5ldyBzeXNj
YWxsIHRvIGJpbmQgbWVtb3J5IHRvIGRldmljZSkuCldpdGggc3VjaCB0aGluZyBpbiBwbGFjZSB3
ZSBjb3VsZCBoYW5nIG1tdSBub3RpZmllciByYW5nZSB0byBpdC4gQnV0CnRoZSBkcml2ZXIgd2ls
bCBzdGlsbCBuZWVkIHRvIGJlIGFibGUgdG8gaGFuZGxlIHRoZSBjYXNlIHdoZXJlIHRoZXJlCmlz
IG5vIGhpbnQgcHJvdmlkZWQgYnkgdXNlcnNwYWNlIGFuZCB0aHVzIG5vIGJlZm9yZSBrbm93bGVk
Z2Ugb2Ygd2hhdApWQSBtaWdodCBiZSBhY2Nlc3NlZC4KCkNoZWVycywKSsOpcsO0bWUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
