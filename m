Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FDD216B6C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 13:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F72689DED;
	Tue,  7 Jul 2020 11:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 968 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jul 2020 11:24:18 UTC
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9F689DED
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 11:24:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21739212-1500050 for multiple; Tue, 07 Jul 2020 12:08:01 +0100
MIME-Version: 1.0
In-Reply-To: <2d933121-4067-e4ce-42d7-ad8a7a0ea274@amd.com>
References: <20200707042100.2550260-1-ytht.net@gmail.com>
 <CAKMK7uHCPZwzh7_3KTm=JhjtYsUd3o7gKALTfSkBLiVt8Y=5bw@mail.gmail.com>
 <2d933121-4067-e4ce-42d7-ad8a7a0ea274@amd.com>
Subject: Re: [RFC] drm/vgem: Don't use get_page in fault handler.
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Christian König <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Lepton Wu <ytht.net@gmail.com>
Date: Tue, 07 Jul 2020 12:07:59 +0100
Message-ID: <159412007969.16814.9730037350128686915@build.alporthouse.com>
User-Agent: alot/0.9
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDIwLTA3LTA3IDExOjU4OjI2KQo+IEFtIDA3LjA3
LjIwIHVtIDEwOjU5IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+IE9uIFR1ZSwgSnVsIDcsIDIw
MjAgYXQgOToyNyBBTSBMZXB0b24gV3UgPHl0aHQubmV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4g
Rm9yIHBhZ2VzIHdoaWNoIGFyZSBhbGxvY2F0ZWQgaW4gdHRtIHdpdGggdHJhbnNwYXJlbnQgaHVn
ZSBwYWdlcywKPiA+PiB0YWlsIHBhZ2VzIGhhdmUgemVybyBhcyByZWZlcmVuY2UgY291bnQuIFRo
ZSBjdXJyZW50IHZnZW0gY29kZSB1c2UKPiA+PiBnZXRfcGFnZSBvbiB0aGVtIGFuZCBpdCB3aWxs
IHRyaWdnZXIgQlVHIHdoZW4gcmVsZWFzZV9wYWdlcyBnZXQgY2FsbGVkCj4gPj4gb24gdGhvc2Ug
cGFnZXMgbGF0ZXIuCj4gPj4KPiA+PiBIZXJlIEkgYXR0YWNoIHRoZSBtaW5pbWFsIGNvZGUgdG8g
dHJpZ2dlciB0aGlzIGJ1ZyBvbiBhIHFlbXUgVk0gd2hpY2gKPiA+PiBlbmFibGVzIHZpcnRpbyBn
cHUgKGNhcmQxKSBhbmQgdmdlbSAoY2FyZDApLiBCVFcsIHNpbmNlIHRoZSB1cHN0cmVhbQo+ID4+
IHZpcnRpbyBncHUgaGFzIGNoYW5nZWQgdG8gdXNlIGRybSBnZW0gYW5kIG1vdmVkIGF3YXkgZnJv
bSB0dG0uIFNvIHdlCj4gPj4gaGF2ZSB0byB1c2UgYW4gb2xkIGtlcm5lbCBsaWtlIDUuNCB0byBy
ZXByb2R1Y2UgaXQuIEJ1dCBJIGd1ZXNzCj4gPj4gc2FtZSB0aGluZyBjb3VsZCBoYXBwZW4gZm9y
IGEgcmVhbCBHUFUgaWYgdGhlIHJlYWwgR1BVIHVzZSBzaW1pbGFyIGNvZGUKPiA+PiBwYXRoIHRv
IGFsbG9jYXRlIHBhZ2VzIGZyb20gdHRtLiBJIGFtIG5vdCBzdXJlIGFib3V0IHR3byB0aGluZ3M6
IGZpcnN0LCBkbyB3ZQo+ID4+IG5lZWQgdG8gZml4IHRoaXM/IHdpbGwgYSByZWFsIEdQVSBoaXQg
dGhpcyBjb2RlIHBhdGg/IFNlY29uZCwgc3VwcG9zZSB0aGlzCj4gPj4gbmVlZCB0byBiZSBmaXhl
ZCwgc2hvdWxkIHRoaXMgYmUgZml4ZWQgaW4gdHRtIHNpZGUgb3IgdmdlbSBzaWRlPyAgSWYgd2Ug
cmVtb3ZlCj4gPj4gImh1Z2VfZmxhZ3MgJj0gfl9fR0ZQX0NPTVAiIGZyb20gdHRtX2dldF9wYWdl
cywgdGhlbiBnZXRfcGFnZSBpbiB2Z2VtIHdvcmtzCj4gPj4gZmluZS4gQnV0IGl0J3MgdGhlcmUg
Zm9yIGZpeCBhbm90aGVyIGJ1ZzoKPiA+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZidWdzLmZyZWVkZXNrdG9wLm9yZyUy
RnNob3dfYnVnLmNnaSUzRmlkJTNEMTAzMTM4JmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4u
a29lbmlnJTQwYW1kLmNvbSU3Q2ZjMDgzMWJlOGZkODQ4YWJmZDg5MDhkODIyNTQyNjZkJTdDM2Rk
ODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzI5NzA5MjExMzIxNjM1
NyZhbXA7c2RhdGE9UyUyQnRMSnlCOG1xeXlFJTJCU0lqYmZITTZGR0Z1RmpyZkk1MHRhaHBhb0oz
d1UlM0QmYW1wO3Jlc2VydmVkPTAKPiA+PiBJdCBjb3VsZCBhbHNvIGJlICJmaXhlZCIgd2l0aCB0
aGlzIHBhdGNoLiBCdXQgSSBhbSByZWFsbHkgbm90IHN1cmUgaWYgdGhpcyBpcwo+ID4+IHRoZSB3
YXkgdG8gZ28uCj4gPiBGb3IgaW1wb3J0ZWQgZG1hLWJ1ZiBvYmplY3RzLCB2Z2VtIHNob3VsZCBu
b3QgaGFuZGxlIHRoaXMgaXRzZWxmLCBidXQKPiA+IGZvcndhcmQgdG8gdGhlIGV4cG9ydGVyIHRo
cm91Z2ggdGhlIGRtYV9idWZfbW1hcCBzdHVmZi4gV2UgaGF2ZQo+ID4gaGVscGVycyBmb3IgdGhp
cyBhbGwgbm93LCBwcm9iYWJseSBqdXN0IG5vdCB3aXJlZCB1cCBjb3JyZWN0bHkuIFRyeWluZwo+
ID4gdG8gZW5zdXJlIHRoYXQgYWxsIGNvbWJpbmF0aW9ucyBvZiBtbWFwIGNvZGUgYWNyb3NzIGFs
bCBkcml2ZXJzIHdvcmsKPiA+IHRoZSBzYW1lIGRvZXNuJ3Qgd29yay4KPiAKPiBZZXMsIERhbmll
bCBpcyByaWdodCB3aGF0IHZnZW0gZG9lcyBoZXJlIGlzIGZ1bmRhbWVudGFsbHkgYnJva2VuIGlu
IG1hbnkgCj4gd2F5cy4KPiAKPiBGaXJzdCBvZiBhbGwgbm9ib2R5IHNob3VsZCBldmVyIGNhbGwg
Z2V0X3BhZ2UoKSBvbiB0aGUgcGFnZXMgVFRNIGhhcyAKPiBhbGxvY2F0ZWQuIFRob3NlIHBhZ2Vz
IGNvbWUgb3V0IG9mIGEgYmxvY2sgYm94IGFuZCBzaG91bGQgbm90IGJlIHRvdWNoZWQgCj4gYnkg
YW55Ym9keS4KCkl0IGRvZXNuJ3QuIEl0J3Mgb25seSB1c2VkIG9uIHRoZSBwYWdlcyB2Z2VtIGFs
bG9jYXRlcyAoZnJvbSBzaG1lbWZzKS4gU28KSSdtIHJlYWxseSBjb25mdXNlZCBhcyB0byBob3cg
dHRtIGdldHMgaW52b2x2ZWQgaGVyZS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
