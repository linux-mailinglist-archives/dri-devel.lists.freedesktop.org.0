Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF6216C9F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 14:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F67E89D73;
	Tue,  7 Jul 2020 12:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDBF89D73
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 12:15:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21740084-1500050 for multiple; Tue, 07 Jul 2020 13:15:25 +0100
MIME-Version: 1.0
In-Reply-To: <a0f8e299-da40-ddc9-3c97-a348a56d3408@shipmail.org>
References: <20200707042100.2550260-1-ytht.net@gmail.com>
 <CAKMK7uHCPZwzh7_3KTm=JhjtYsUd3o7gKALTfSkBLiVt8Y=5bw@mail.gmail.com>
 <2d933121-4067-e4ce-42d7-ad8a7a0ea274@amd.com>
 <159412007969.16814.9730037350128686915@build.alporthouse.com>
 <a0f8e299-da40-ddc9-3c97-a348a56d3408@shipmail.org>
Subject: Re: [RFC] drm/vgem: Don't use get_page in fault handler.
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Christian König <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Lepton Wu <ytht.net@gmail.com>, Thomas Hellström (Intel) <thomas_os@shipmail.org>
Date: Tue, 07 Jul 2020 13:15:23 +0100
Message-ID: <159412412367.16814.3927708554192487643@build.alporthouse.com>
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

UXVvdGluZyBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpICgyMDIwLTA3LTA3IDEzOjA1OjMxKQo+
IAo+IE9uIDcvNy8yMCAxOjA3IFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIENo
cmlzdGlhbiBLw7ZuaWcgKDIwMjAtMDctMDcgMTE6NTg6MjYpCj4gPj4gQW0gMDcuMDcuMjAgdW0g
MTA6NTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4+PiBPbiBUdWUsIEp1bCA3LCAyMDIwIGF0
IDk6MjcgQU0gTGVwdG9uIFd1IDx5dGh0Lm5ldEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Pj4gRm9y
IHBhZ2VzIHdoaWNoIGFyZSBhbGxvY2F0ZWQgaW4gdHRtIHdpdGggdHJhbnNwYXJlbnQgaHVnZSBw
YWdlcywKPiA+Pj4+IHRhaWwgcGFnZXMgaGF2ZSB6ZXJvIGFzIHJlZmVyZW5jZSBjb3VudC4gVGhl
IGN1cnJlbnQgdmdlbSBjb2RlIHVzZQo+ID4+Pj4gZ2V0X3BhZ2Ugb24gdGhlbSBhbmQgaXQgd2ls
bCB0cmlnZ2VyIEJVRyB3aGVuIHJlbGVhc2VfcGFnZXMgZ2V0IGNhbGxlZAo+ID4+Pj4gb24gdGhv
c2UgcGFnZXMgbGF0ZXIuCj4gPj4+Pgo+ID4+Pj4gSGVyZSBJIGF0dGFjaCB0aGUgbWluaW1hbCBj
b2RlIHRvIHRyaWdnZXIgdGhpcyBidWcgb24gYSBxZW11IFZNIHdoaWNoCj4gPj4+PiBlbmFibGVz
IHZpcnRpbyBncHUgKGNhcmQxKSBhbmQgdmdlbSAoY2FyZDApLiBCVFcsIHNpbmNlIHRoZSB1cHN0
cmVhbQo+ID4+Pj4gdmlydGlvIGdwdSBoYXMgY2hhbmdlZCB0byB1c2UgZHJtIGdlbSBhbmQgbW92
ZWQgYXdheSBmcm9tIHR0bS4gU28gd2UKPiA+Pj4+IGhhdmUgdG8gdXNlIGFuIG9sZCBrZXJuZWwg
bGlrZSA1LjQgdG8gcmVwcm9kdWNlIGl0LiBCdXQgSSBndWVzcwo+ID4+Pj4gc2FtZSB0aGluZyBj
b3VsZCBoYXBwZW4gZm9yIGEgcmVhbCBHUFUgaWYgdGhlIHJlYWwgR1BVIHVzZSBzaW1pbGFyIGNv
ZGUKPiA+Pj4+IHBhdGggdG8gYWxsb2NhdGUgcGFnZXMgZnJvbSB0dG0uIEkgYW0gbm90IHN1cmUg
YWJvdXQgdHdvIHRoaW5nczogZmlyc3QsIGRvIHdlCj4gPj4+PiBuZWVkIHRvIGZpeCB0aGlzPyB3
aWxsIGEgcmVhbCBHUFUgaGl0IHRoaXMgY29kZSBwYXRoPyBTZWNvbmQsIHN1cHBvc2UgdGhpcwo+
ID4+Pj4gbmVlZCB0byBiZSBmaXhlZCwgc2hvdWxkIHRoaXMgYmUgZml4ZWQgaW4gdHRtIHNpZGUg
b3IgdmdlbSBzaWRlPyAgSWYgd2UgcmVtb3ZlCj4gPj4+PiAiaHVnZV9mbGFncyAmPSB+X19HRlBf
Q09NUCIgZnJvbSB0dG1fZ2V0X3BhZ2VzLCB0aGVuIGdldF9wYWdlIGluIHZnZW0gd29ya3MKPiA+
Pj4+IGZpbmUuIEJ1dCBpdCdzIHRoZXJlIGZvciBmaXggYW5vdGhlciBidWc6Cj4gPj4+PiBodHRw
czovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZidWdzLmZyZWVkZXNrdG9wLm9yZyUyRnNob3dfYnVnLmNnaSUzRmlkJTNEMTAzMTM4JmFt
cDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2ZjMDgzMWJlOGZk
ODQ4YWJmZDg5MDhkODIyNTQyNjZkJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2Ql
N0MwJTdDMCU3QzYzNzI5NzA5MjExMzIxNjM1NyZhbXA7c2RhdGE9UyUyQnRMSnlCOG1xeXlFJTJC
U0lqYmZITTZGR0Z1RmpyZkk1MHRhaHBhb0ozd1UlM0QmYW1wO3Jlc2VydmVkPTAKPiA+Pj4+IEl0
IGNvdWxkIGFsc28gYmUgImZpeGVkIiB3aXRoIHRoaXMgcGF0Y2guIEJ1dCBJIGFtIHJlYWxseSBu
b3Qgc3VyZSBpZiB0aGlzIGlzCj4gPj4+PiB0aGUgd2F5IHRvIGdvLgo+ID4+PiBGb3IgaW1wb3J0
ZWQgZG1hLWJ1ZiBvYmplY3RzLCB2Z2VtIHNob3VsZCBub3QgaGFuZGxlIHRoaXMgaXRzZWxmLCBi
dXQKPiA+Pj4gZm9yd2FyZCB0byB0aGUgZXhwb3J0ZXIgdGhyb3VnaCB0aGUgZG1hX2J1Zl9tbWFw
IHN0dWZmLiBXZSBoYXZlCj4gPj4+IGhlbHBlcnMgZm9yIHRoaXMgYWxsIG5vdywgcHJvYmFibHkg
anVzdCBub3Qgd2lyZWQgdXAgY29ycmVjdGx5LiBUcnlpbmcKPiA+Pj4gdG8gZW5zdXJlIHRoYXQg
YWxsIGNvbWJpbmF0aW9ucyBvZiBtbWFwIGNvZGUgYWNyb3NzIGFsbCBkcml2ZXJzIHdvcmsKPiA+
Pj4gdGhlIHNhbWUgZG9lc24ndCB3b3JrLgo+ID4+IFllcywgRGFuaWVsIGlzIHJpZ2h0IHdoYXQg
dmdlbSBkb2VzIGhlcmUgaXMgZnVuZGFtZW50YWxseSBicm9rZW4gaW4gbWFueQo+ID4+IHdheXMu
Cj4gPj4KPiA+PiBGaXJzdCBvZiBhbGwgbm9ib2R5IHNob3VsZCBldmVyIGNhbGwgZ2V0X3BhZ2Uo
KSBvbiB0aGUgcGFnZXMgVFRNIGhhcwo+ID4+IGFsbG9jYXRlZC4gVGhvc2UgcGFnZXMgY29tZSBv
dXQgb2YgYSBibG9jayBib3ggYW5kIHNob3VsZCBub3QgYmUgdG91Y2hlZAo+ID4+IGJ5IGFueWJv
ZHkuCj4gPiBJdCBkb2Vzbid0LiBJdCdzIG9ubHkgdXNlZCBvbiB0aGUgcGFnZXMgdmdlbSBhbGxv
Y2F0ZXMgKGZyb20gc2htZW1mcykuIFNvCj4gPiBJJ20gcmVhbGx5IGNvbmZ1c2VkIGFzIHRvIGhv
dyB0dG0gZ2V0cyBpbnZvbHZlZCBoZXJlLgo+ID4gLUNocmlzCj4gCj4gU291bmRzIGxpa2Ugdmdl
bSBpcyBhbGxvd2luZyBtbWFwIG9mIGltcG9ydGVkIGRtYS1idWZzPwoKSXQgaGFzIHZnZW1fcHJp
bWVfbW1hcCgpOiBpZiAoIW9iai0+ZmlscCkgcmV0dXJuIC1FTk9ERVY7CgpBaCwgdmdlbV9wcmlt
ZV9pbXBvcnRfc2dfdGFibGUgaXMgd2hlcmUgdGhlIHdpcmVzIGdldCBjcm9zc2VkLgpPaCBteSwg
YW5kIHRoYXQgZXZlbiBjYWxscyBfX3ZnZW1fZ2VtX2NyZWF0ZSgpIHNvIGl0IGVuZHMgdXAgd2l0
aCBhCmR1bW15IG9iai0+ZmlscCBmcm9tIGRybV9nZW1fb2JqZWN0X2luaXQuCi1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
