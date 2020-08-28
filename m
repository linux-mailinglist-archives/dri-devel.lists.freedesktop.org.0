Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC9256667
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135176EC18;
	Sat, 29 Aug 2020 09:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EBD6E4B3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 12:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1598619084; bh=N9amwtbHh9BlB74+6QxsJWuhe5/JoCauR4xTJEk0UA0=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=BPsdoeADRZs+yB6e9Gp4IQIZOL9VVePGL0NPeK6769CkWS0kvp+/ee5CbcphvNK2k
 oCk0AfbKWRHIJn7mLBVUB/vEl1eMb0c49boJXaH3DSNIcfIHpC/gtUF9ZCrKrQ9P12
 R1neKfZhDV+wCqMqiFdQj+XZPu5aqlWd9UVjHhlQ=
Date: Fri, 28 Aug 2020 14:51:24 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [linux-sunxi] [PATCH] drm/sun4i: Fix dsi dcs long write function
Message-ID: <20200828125124.mgqforbmrjjee7gj@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi@googlegroups.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200828112444.916455-1-megous@megous.com>
 <1872601.C7yQfbK89F@jernej-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1872601.C7yQfbK89F@jernej-laptop>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 linux-sunxi@googlegroups.com,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjgsIDIwMjAgYXQgMDI6MzU6MjZQTSArMDIwMCwgSmVybmVqIMWga3JhYmVj
IHdyb3RlOgo+IERuZSBwZXRlaywgMjguIGF2Z3VzdCAyMDIwIG9iIDEzOjI0OjQ0IENFU1QgamUg
T25kcmVqIEppcm1hbiBuYXBpc2FsKGEpOgo+ID4gSXQncyB3cml0aW5nIHRvbyBtdWNoIGRhdGEu
IHJlZ21hcF9idWxrX3dyaXRlIGV4cGVjdHMgbnVtYmVyIG9mCj4gPiByZWdpc3RlciBzaXplZCBj
aHVua3MgdG8gd3JpdGUsIG5vdCBhIGJ5dGUgc2l6ZWQgbGVuZ3RoIG9mIHRoZQo+ID4gYm91bmNl
IGJ1ZmZlci4gQm91bmNlIGJ1ZmZlciBuZWVkcyB0byBiZSBwYWRkZWQgdG9vLCBzbyB0aGF0Cj4g
PiByZWdtYXBfYnVsa193cml0ZSB3aWxsIG5vdCByZWFkIHBhc3QgdGhlIGVuZCBvZiB0aGUgYnVm
ZmVyLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3Vz
LmNvbT4KPiAKPiBGaXhlczogMTMzYWRkNWI1YWQ0ICgiZHJtL3N1bjRpOiBBZGQgQWxsd2lubmVy
IEEzMSBNSVBJLURTSSBjb250cm9sbGVyIAo+IHN1cHBvcnQiKQoKSXQgZG9lc24ndCByZWFsbHkg
Zml4IGFueXRoaW5nIHVzZXIgdmlzaWJsZSB0aG91Z2gsIGFuZCB3aWxsIG5vdCBoZWxwCnRoZSBz
dGFibGUgYnJhbmNoIGluIGFueSB3YXkuIEl0IGp1c3QgbWFrZXMgdGhlIGNvZGUgbW9yZSBjb3Jy
ZWN0LgoKVGhvdWdoIG5vdyB0aGF0IHlvdSBjYW1lIHVwIHdpdGggdGhlIHRhZywgY29weXBhc3Rp
bmcgaXQgaXMgbm90IHRoYXQgbXVjaAp3b3JrLiA7KSBTbyBJIGFkZGVkIGl0LgoKPiBzaG91bGQg
YmUgYWRkZWQuIEZpeCB3aWxsIGJlIHRoZW4gYXV0b21hdGljYWxseSBwaWNrZWQgaW50byBzdGFi
bGUgcmVsZWFzZXMuCj4gCj4gU21hbGwgbml0IGJlbG93Lgo+IAo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgaW5kZXggN2YxM2Y0ZDcxNWJmLi44NDBmYWQx
YjY4ZGQKPiA+IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21p
cGlfZHNpLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5j
Cj4gPiBAQCAtODg5LDcgKzg4OSw3IEBAIHN0YXRpYyBpbnQgc3VuNmlfZHNpX2Rjc193cml0ZV9s
b25nKHN0cnVjdCBzdW42aV9kc2kKPiA+ICpkc2ksIHJlZ21hcF93cml0ZShkc2ktPnJlZ3MsIFNV
TjZJX0RTSV9DTURfVFhfUkVHKDApLAo+ID4gIAkJICAgICBzdW42aV9kc2lfZGNzX2J1aWxkX3Br
dF9oZHIoZHNpLCBtc2cpKTsKPiA+IAo+ID4gLQlib3VuY2UgPSBremFsbG9jKG1zZy0+dHhfbGVu
ICsgc2l6ZW9mKGNyYyksIEdGUF9LRVJORUwpOwo+ID4gKwlib3VuY2UgPSBremFsbG9jKG1zZy0+
dHhfbGVuICsgc2l6ZW9mKGNyYykgKyAzLCBHRlBfS0VSTkVMKTsKPiAKPiBJdCB3b3VsZCBiZSBu
aWNlciB0byB1c2UgQUxJR04oKSBtYWNybywgYnV0IEknbSBmaW5lIGVpdGhlciB3YXkuCgpOaWNl
IGlkZWEuCgo+IFJldmlld2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lv
bC5uZXQ+CgpUaGFua3MuIDopCgpyZWdhcmRzLAoJby4KCj4gQmVzdCByZWdhcmRzLAo+IEplcm5l
ago+IAo+ID4gIAlpZiAoIWJvdW5jZSkKPiA+ICAJCXJldHVybiAtRU5PTUVNOwo+ID4gCj4gPiBA
QCAtOTAwLDcgKzkwMCw3IEBAIHN0YXRpYyBpbnQgc3VuNmlfZHNpX2Rjc193cml0ZV9sb25nKHN0
cnVjdCBzdW42aV9kc2kKPiA+ICpkc2ksIG1lbWNweSgodTggKilib3VuY2UgKyBtc2ctPnR4X2xl
biwgJmNyYywgc2l6ZW9mKGNyYykpOwo+ID4gIAlsZW4gKz0gc2l6ZW9mKGNyYyk7Cj4gPiAKPiA+
IC0JcmVnbWFwX2J1bGtfd3JpdGUoZHNpLT5yZWdzLCBTVU42SV9EU0lfQ01EX1RYX1JFRygxKSwg
Ym91bmNlLCAKPiBsZW4pOwo+ID4gKwlyZWdtYXBfYnVsa193cml0ZShkc2ktPnJlZ3MsIFNVTjZJ
X0RTSV9DTURfVFhfUkVHKDEpLCBib3VuY2UsCj4gPiBESVZfUk9VTkRfVVAobGVuLCA0KSk7IHJl
Z21hcF93cml0ZShkc2ktPnJlZ3MsIFNVTjZJX0RTSV9DTURfQ1RMX1JFRywgbGVuICsKPiA+IDQg
LSAxKTsKPiA+ICAJa2ZyZWUoYm91bmNlKTsKPiAKPiAKPiAKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
