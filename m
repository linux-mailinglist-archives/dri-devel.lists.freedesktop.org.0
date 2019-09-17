Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3CAB4E92
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 14:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B8B89FED;
	Tue, 17 Sep 2019 12:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CF589FED
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:56:02 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id v38so3214030edm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 05:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=zpgFy1F0cbNqI9fOVZxY6A7+k7ESR/K9yJLqYqmVqAw=;
 b=ZmB+fujgKi4xRZqK96/ki8UqL39OAnDXgiEJB3rTlRtCP7CsFquMZthxElTk4RQB/j
 1WGjtTjdCKlLXbDC6GceT1HOB6vK3UGqwCPEEfJovTNHTOap0lyNfH6dxc3YepiGwGI8
 RwuDjSOFoElintWBKUbjNW8JPB+ojdUnpnvCtnmWjrpCGEYFpDAJYDefoNjDaHcC7Yz4
 7ZCufuusnnyALb44q2gtfADZWn1d0blRuAOEPZvX8ht67+CdOp8bwFS/Mt6rWL5NjYtZ
 dZMpWcGc6ub6lM58sQeBtzzDgN46je3W+cQG697ZwyGb6Im31uaPxxoqVNkwaGfQ34yz
 YRog==
X-Gm-Message-State: APjAAAWzbF1XcxyWvDs3oswa/i3Mh3B9b0n2SvdiH/DS/3gWbiRWkEDv
 XPzyw+YLA5xZpFFjq35S1uk+ex0TtIs=
X-Google-Smtp-Source: APXvYqwm2rIwopZlYOm75nM4DswvCXCmkhY/IJaOnOPVTCNtZBgrRcbtjq45dqxFECuFJIQhHaPgfw==
X-Received: by 2002:a05:6402:184d:: with SMTP id
 v13mr4647435edy.56.1568724960674; 
 Tue, 17 Sep 2019 05:56:00 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id i5sm423206edq.30.2019.09.17.05.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 05:56:00 -0700 (PDT)
Date: Tue, 17 Sep 2019 14:55:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
Message-ID: <20190917125557.GR3958@phenom.ffwll.local>
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-2-tzimmermann@suse.de>
 <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
 <52e8e124-f8e6-d2e6-0102-472b9fa70317@suse.de>
 <1223403a-17a5-638b-49ce-5dba23fe23d5@tronnes.org>
 <52be9b77-51aa-62b6-8de7-cfb1165c1470@suse.de>
 <e6a9e282-b740-c447-bed6-d706787d0feb@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6a9e282-b740-c447-bed6-d706787d0feb@tronnes.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=zpgFy1F0cbNqI9fOVZxY6A7+k7ESR/K9yJLqYqmVqAw=;
 b=QMOen0B0jkdm9rrp+z19Wl1h9Kn4pj9str9vMqz572e4SkuvIQH9/W2sE98UusI/cI
 5NfOZ/4F/cGxaPRPpti0vCJC4miMl2SC0gbZtiFR9aCsbbzRULaLXjxHa3Mgzh548aNZ
 k9jzMNJejtVdBlRQQt9xASmhZv4lJNxexBsME=
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
Cc: feng.tang@intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, ying.huang@intel.com, airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDQ6NTk6NTdQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IAo+IAo+IERlbiAxMC4wOS4yMDE5IDE1LjUxLCBza3JldiBUaG9tYXMgWmltbWVy
bWFubjoKPiA+IEhpCj4gPiAKPiA+IEFtIDEwLjA5LjE5IHVtIDE1OjM0IHNjaHJpZWIgTm9yYWxm
IFRyw7hubmVzOgo+ID4+Cj4gPj4KPiA+PiBEZW4gMTAuMDkuMjAxOSAxNC40OCwgc2tyZXYgVGhv
bWFzIFppbW1lcm1hbm46Cj4gPj4+IEhpCj4gPj4+Cj4gPj4+IEFtIDEwLjA5LjE5IHVtIDEzOjUy
IHNjaHJpZWIgR2VyZCBIb2ZmbWFubjoKPiA+Pj4+IE9uIE1vbiwgU2VwIDA5LCAyMDE5IGF0IDA0
OjA2OjMyUE0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+ID4+Pj4+IEJlZm9yZSB1
cGRhdGluZyB0aGUgZGlzcGxheSBmcm9tIHRoZSBjb25zb2xlJ3Mgc2hhZG93IGJ1ZmZlciwgdGhl
IGRpcnR5Cj4gPj4+Pj4gd29ya2VyIG5vdyB3YWl0cyBmb3IgdmJsYW5rLiBUaGlzIGFsbG93cyBz
ZXZlcmFsIHNjcmVlbiB1cGRhdGVzIHRvIHBpbGUKPiA+Pj4+PiB1cCBhbmQgYWN0cyBhcyBhIHJh
dGUgbGltaXRlci4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4+Pj4+IC0tLQo+ID4+Pj4+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgMTIgKysrKysrKysrKysrCj4gPj4+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4gPj4+Pj4KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVs
cGVyLmMKPiA+Pj4+PiBpbmRleCBhN2JhNWI0OTAyZDYuLjAxN2UyZjZiZDFiOSAxMDA2NDQKPiA+
Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gPj4+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+ID4+Pj4+IEBAIC00MDIsOCArNDAyLDIw
IEBAIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGlydHlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspCj4gPj4+Pj4gIAkJCQkJCSAgICBkaXJ0eV93b3JrKTsKPiA+Pj4+PiAgCXN0cnVj
dCBkcm1fY2xpcF9yZWN0ICpjbGlwID0gJmhlbHBlci0+ZGlydHlfY2xpcDsKPiA+Pj4+PiAgCXN0
cnVjdCBkcm1fY2xpcF9yZWN0IGNsaXBfY29weTsKPiA+Pj4+PiArCXN0cnVjdCBkcm1fY3J0YyAq
Y3J0YzsKPiA+Pj4+PiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPj4+Pj4gIAl2b2lkICp2YWRk
cjsKPiA+Pj4+PiArCWludCByZXQ7Cj4gPj4+Pj4gKwo+ID4+Pj4+ICsJLyogcmF0ZS1saW1pdCB1
cGRhdGUgZnJlcXVlbmN5ICovCj4gPj4+Pj4gKwltdXRleF9sb2NrKCZoZWxwZXItPmxvY2spOwo+
ID4+Pj4+ICsJY3J0YyA9IGhlbHBlci0+Y2xpZW50Lm1vZGVzZXRzWzBdLmNydGM7Cj4gPj4+Pj4g
KwlyZXQgPSBkcm1fY3J0Y192YmxhbmtfZ2V0KGNydGMpOwo+ID4+Pj4+ICsJaWYgKCFyZXQpIHsK
PiA+Pj4+PiArCQlkcm1fY3J0Y193YWl0X29uZV92YmxhbmsoY3J0Yyk7Cj4gPj4+Pj4gKwkJZHJt
X2NydGNfdmJsYW5rX3B1dChjcnRjKTsKPiA+Pj4+PiArCX0KPiA+Pj4+PiArCW11dGV4X3VubG9j
aygmaGVscGVyLT5sb2NrKTsKPiA+Pj4+Cj4gPj4+PiBIbW0sIG5vdCBzdXJlIGl0IGlzIHRoZSBi
ZXN0IHBsYW4gdG8gc2xlZXAgZm9yIGEgd2hpbGUgaW4gdGhlIHdvcmtlciwKPiA+Pj4+IGVzcGVj
aWFsbHkgd2hpbGUgaG9sZGluZyB0aGUgbG9jay4KPiA+Pj4+Cj4gPj4+PiBXaGF0IGRvZXMgdGhl
IGxvY2sgcHJvdGVjdCBhZ2FpbnN0IGhlcmU/ICBBY2Nlc3NpbmcKPiA+Pj4KPiA+Pj4gVGhpcyBs
b2NrIGlzIGhvbGQgYnkgdGhlIGZiZGV2IGNvZGUgZHVyaW5nIG1vZGUtc2V0dGluZyBvcGVyYXRp
b25zIChidXQKPiA+Pj4gbm90IGRyYXdpbmcgb3BlcmF0aW9ucykuIFNvICpjcnRjIG1pZ2h0IGJl
IGdvbmUgaWYgd2UgZG9uJ3QgaG9sZCBpdCBoZXJlLgo+ID4+Pgo+ID4+Pj4gaGVscGVyLT5jbGll
bnQubW9kZXNldHM/ICBJZiBzbyB0aGVuIHlvdSBjYW4gdW5sb2NrIGJlZm9yZSBnb2luZyB0bwo+
ID4+Pj4gc2xlZXAgaW4gZHJtX2NydGNfd2FpdF9vbmVfdmJsYW5rKCkgSSB0aGluay4KPiA+Pj4K
PiA+Pj4gSSBsb29rZWQsIGJ1dCBJIGNhbm5vdCBmaW5kIGFueSBjb2RlIHRoYXQgcHJvdGVjdHMg
Y3J0YyB3aGlsZSB2YmxhbmsgaXMKPiA+Pj4gYWN0aXZlLiBJJ2QgcmF0aGVyIG5vdCBjaGFuZ2Ug
dGhlIGN1cnJlbnQgY29kZSB1bnRpbCBzb21lb25lIGNhbiBjbGFyaWZ5Lgo+ID4+Pgo+ID4+Cj4g
Pj4gVGhlIGNsaWVudC0+bW9kZXNldHMgYXJyYXkgYW5kIHRoZSBjcnRjIHN0cnVjdCBtZW1iZXIg
YXJlIGludmFyaWFudCBvdmVyCj4gPj4gdGhlIGxpZmV0aW1lIG9mIGNsaWVudCAoZHJtX2NsaWVu
dF9tb2Rlc2V0X2NyZWF0ZSgpKS4gTm8gbmVlZCB0byB0YWtlIGEKPiA+PiBsb2NrIGZvciBhY2Nl
c3MuIFNlZSBkcm1fY2xpZW50X21vZGVzZXRfcmVsZWFzZSgpIGZvciB0aGUgdGhpbmdzIHRoYXQK
PiA+PiBfY2FuXyBjaGFuZ2UgYW5kIG5lZWRzIHByb3RlY3Rpb24gKHByb3RlY3RlZCBieSBjbGll
bnQtPm1vZGVzZXRfbXV0ZXgpLgo+ID4gCj4gPiBUaGFua3MgZm9yIHRoZSByZXBseS4gU28gd2Ug
ZG9uJ3QgbmVlZCB0aGUgbG9jaz8gQnV0IHdoeSBkb2VzCj4gPiBkcm1fZmJfaGVscGVyX2lvY3Rs
KCkgdGFrZSBpdD8gaW9jdGwgZXhjbHVzaXZlbmVzcz8KPiA+IAo+IAo+IEJlY2F1c2Ugb2YgZHJt
X21hc3Rlcl9pbnRlcm5hbF9hY3F1aXJlKCkgaXQncyBuZWNlc3NhcnkgdG8gdGFrZSB0aGUgbG9j
awo+IGZpcnN0LiBUaGF0J3MgdGhlIGxvY2tpbmcgcnVsZXMgb2YgZHJtX2ZiX2hlbHBlci4gRmly
c3QgdGFrZSB0aGUgZmIKPiBoZWxwZXIgbG9jaywgdGhlbiB0aGUgZGV2LT5tYXN0ZXJfbXV0ZXgu
IFdlIHN0YXkgYXdheSBpZiB0aGVyZSdzIGEKPiB1c2Vyc3BhY2UgbWFzdGVyIGFuZCBpZiB0aGVy
ZSdzIG5vbmUsIHdlIHByZXZlbnQgdXNlcnNwYWNlIGZyb20gYmVjb21pbmcKPiBtYXN0ZXIgd2hp
bGUgd2UgZG8gc3R1ZmYuCj4gCj4gQnV0IGxvb2tpbmcgYXQgZHJtX2ZiX2hlbHBlcl9pb2N0bCgp
IG5vdywgSSBzZWUgdGhhdCBpdCdzIG5vdCBzdHJpY3RseQo+IG5lY2Vzc2FyeSB0byBkbyB0aGlz
IHNpbmNlIGFsbCB0aGlzIGZ1bmN0aW9uIGNhbiBkbyBpcyB2Ymxhbmsgd2FpdCBhbmQKPiB0aGF0
J3MgZmluZSBldmVuIGlmIHVzZXJzcGFjZSBpcyBtYXN0ZXIuIFRoZSBsb2NraW5nIHdhcyBuZWNl
c3NhcnkKPiBiZWZvcmUgSSByZWZhY3RvcmVkIGFuZCBtb3ZlZCBzdHVmZiB0byBkcm1fY2xpZW50
LCBiZWNhdXNlIGF0IHRoYXQgdGltZQo+IHRoZSBtb2Rlc2V0IGFycmF5IHdhcyBkZWxldGVkIGFu
ZCByZWNyZWF0ZWQgd2hlbiBwcm9iaW5nIGNvbm5lY3RvcnMuCj4gQnV0IGl0IGRvZXNuJ3QgaHVy
dCBlaXRoZXIgaW4gY2FzZSBtb3JlIGZ1bmN0aW9uYWxpdHkgaXMgYWRkZWQgdG8gdGhlCj4gaW9j
dGwuIE9uZSB3b3VsZG4ndCB0aGluayB0aGF0IHdvdWxkIGV2ZXIgaGFwcGVuLCBzaW5jZSBmYmRl
diBpcyBnb2luZwo+IGF3YXkgc29vbiwgYnV0IHN0aWxsIHdlIGtlZXAgcG9saXNoaW5nIGl0IDsp
CgpmYmRldiBkcml2ZXJzIGFyZSBob3BlZnVsbHkgZGlzYXBwZWFyaW5nLCBJIGRvbid0IHRoaW5r
IGZiZGV2IGFzIHRoZSB1YXBpCmludGVyZmFjZSB3aWxsIGRpc2FwcGVhciBzb29uLiBIZW5jZSB3
aHkgaXQncyBzdGlsbCBzb21ld2hhdCByZWFzb25hYmxlIHRvCmtlZXAgcG9saXNoaW5nIGl0IGlt
by4gSXQgc2hvdWxkIGFjdHVhbGx5IGhlbHAgaW4gY29udmluY2luZyBwZW9wbGUgdG8KbW92ZSB0
aGVpciBmYmRldiBkcml2ZXIgb3ZlciB0byBkcm0sIGlmIHRoYXQgZ2l2ZXMgdGhlbSBhIG1vcmUg
cG9saXNoZWQKZmJkZXYgaW1wbGVtZW50YXRpb24gOi0pCi1EYW5pZWwKCj4gCj4gTm9yYWxmLgo+
IAo+ID4+IEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSB3aXRoIHNsZWVwaW5nIGluIHRoZSB3b3JrZXIg
dGhvdWdoLCBidXQgSSBtaWdodAo+ID4+IG1pc3Mgb3V0IG9uIHNvbWV0aGluZy4gQUZBSUNTIGNo
YW5nZXMgd2lsbCBqdXN0IHBpbGUgdXAgaW4gPmRpcnR5X2NsaXAKPiA+PiBhbmQgdGhlIHdvcmtl
ciB3aWxsIGJlIHNjaGVkdWxlZCBmb3IgYSBuZXcgcnVuIHRvIGhhcHBlbiB3aGVuIGl0J3MgZG9u
ZQo+ID4+IHdpdGggdGhlIGN1cnJlbnQgdXBkYXRlLgo+ID4gCj4gPiBZZXMsIHRoYXQncyB0aGUg
aW50ZW50aW9uIG9mIHRoZSBwYXRjaC4gV2UgaG9wZSB0byByZWR1Y2UgdGhlIG51bWJlciBvZgo+
ID4gbWVtY3B5cyBieSBoYW5kbGluZyBzZXZlcmFsIG9mIHRoZW0gYXQgb25jZS4KPiA+IAo+ID4g
QmVzdCByZWdhcmRzCj4gPiBUaG9tYXMKPiA+IAo+ID4+Cj4gPj4gTm9yYWxmLgo+ID4+Cj4gPj4+
IEJlc3QgcmVnYXJkcwo+ID4+PiBUaG9tYXMKPiA+Pj4KPiA+Pj4+Cj4gPj4+PiBjaGVlcnMsCj4g
Pj4+PiAgIEdlcmQKPiA+Pj4+Cj4gPj4+Cj4gPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
