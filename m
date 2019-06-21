Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544B4EDA0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 19:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90146E901;
	Fri, 21 Jun 2019 17:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B8C6E900
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 17:13:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r12so11088237edo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 10:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=/iXdNNCsvfK8GS32yBYYLoWMf5ndhGGNfb2wxv0m/T4=;
 b=PuPkIBcVI9WnV+5WMDYWN0QyYJMshmCX5qEaZ56aZJyWXH7nSZsaYzfwOkEwVHh7id
 lwsjjt8WiORZplCXigbXjs5wur6XSrB7J4As9L/NVOmG7GSg1lLf8mXVLzu4Qw/JQClb
 bDiK2TPMkL7/3qkD7gK7o+zbelos2jbc6eXDkQEsAq3gpvm4sU9wz1Ndpb9XvfeGz+HA
 cJLmiOMM7ioho8fhZXWiFTRan0nkZX+KAQocfxiXzo4X/M04S+/ttLI+vUFWOVUtsMWR
 eH4B5D2UrvNLnC41g+pMh2ga67sLva5AQRtqDVP44kiHlEvwZuMWAsH82Dl8k/5AV7SM
 J2Tw==
X-Gm-Message-State: APjAAAXy1N9KjoMy5O1tXeMTo+1EqoDOBsqmCLrXhWC+nGGJ7zoSh943
 eRc6REzpcVv5Xp05ZG6NR27lXQ==
X-Google-Smtp-Source: APXvYqwWFDvZu3DGVf8arGAZMDZMxUq7CjCJPhfUdCvhD7zJ/uf/eStjKPxl6RMLensYErNwi2gmIQ==
X-Received: by 2002:a17:907:20db:: with SMTP id
 qq27mr97499220ejb.30.1561137196111; 
 Fri, 21 Jun 2019 10:13:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id r11sm513716ejr.57.2019.06.21.10.13.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 10:13:15 -0700 (PDT)
Date: Fri, 21 Jun 2019 19:13:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/ioctl: Ditch DRM_UNLOCKED except for the legacy
 vblank ioctl
Message-ID: <20190621171308.GK12905@phenom.ffwll.local>
References: <20190529093038.27911-1-daniel.vetter@ffwll.ch>
 <20190605120835.2798-1-daniel.vetter@ffwll.ch>
 <CACvgo51HiCgtQEtRx7kFwQhz+2NyDnbkwGqA=hk-kwKOd0PtWA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51HiCgtQEtRx7kFwQhz+2NyDnbkwGqA=hk-kwKOd0PtWA@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=/iXdNNCsvfK8GS32yBYYLoWMf5ndhGGNfb2wxv0m/T4=;
 b=Sth5WwXZM+sMU0SJDM/JG47yqZVu8x3XvVV0G+RMK+trKbPKy5K+UkTil8tIu+aKOT
 830sOAp5wALGB43PPUVh1FUKnIEnsud98BSPnt7o3QzgfM9UBPGeljxgZkEgwV875f4D
 sRuYfw/8gifRFlA90cXLKsQd03lsO31UBto2g=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMTE6MjQ6MDFBTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIFdlZCwgNSBKdW4gMjAxOSBhdCAxMzowOCwgRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBjb21wbGV0ZXMgRW1pbCdzIHNl
cmllcyBvZiByZW1vdmluZyBEUk1fVU5MT0NLRUQgZnJvbSBtb2Rlcm4KPiA+IGRyaXZlcnMuIEl0
J3MgZW50aXJlbHkgY2FyZ28tY3VsdGVkIHNpbmNlIHdlIGlnbm9yZSBpdCBvbgo+ID4gbm9uLURS
SVZFUl9MRUdBQ1kgZHJpdmVycyBzaW5jZToKPiA+Cj4gPiBjb21taXQgZWE0ODc4MzVlODg3NmFi
ZjdhZDkwOTYzNmUzMDhjODAxYTJiY2RhNgo+ID4gQXV0aG9yOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gRGF0ZTogICBNb24gU2VwIDI4IDIxOjQyOjQwIDIwMTUg
KzAyMDAKPiA+Cj4gPiAgICAgZHJtOiBFbmZvcmNlIHVubG9ja2VkIGlvY3RsIG9wZXJhdGlvbiBm
b3Iga21zIGRyaXZlciBpb2N0bHMKPiA+Cj4gPiBOb3cganVzdGlmeWluZyB3aHkgd2UgY2FuIGRv
IHRoaXMgZm9yIGxlZ2FjeSBkcml2ZXMgdG9vIChhbmQgaGVuY2UKPiA+IGNsb3NlIHRoZSBzb3Vy
Y2Ugb2YgYWxsIHRoZSBib2d1cyBjb3B5cGFzdGluZykgaXMgYSBiaXQgbW9yZSBpbnZvbHZlZC4K
PiA+IERSTV9VTkxPQ0tFRCB3YXMgaW50cm9kdWNlZCBpbjoKPiA+Cj4gPiBjb21taXQgZWQ4YjY3
MDQwOTY1ZTRmZTY5NWRiMzMzZDU5MTRlMThlYTVmMTQ2Zgo+ID4gQXV0aG9yOiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+ID4gRGF0ZTogICBXZWQgRGVjIDE2IDIyOjE3OjA5IDIwMDkg
KzAwMDAKPiA+Cj4gPiAgICAgZHJtOiBjb252ZXJ0IGRybV9pb2N0bCB0byB1bmxvY2tlZF9pb2N0
bAo+ID4KPiA+IEFzIGEgaW1tZWRpYXRlIGhhY2sgdG8ga2VlcCBpODEwIGhhcHB5LCB3aGljaCB3
b3VsZCBoYXZlIGRlYWRsb2NrZWQKPiA+IHdpdGhvdXQgdGhpcyB0cmlja2VyeS4gVGhlIG9sZCBC
S0wgaXMgYXV0b21hdGljYWxseSBkcm9wcGVkIGluCj4gPiBzY2hlZHVsZSgpLCBhbmQgaGVuY2Ug
dGhlIGk4MTAgdnMuIG1tYXBfc2VtIGRlYWRsb2NrIGRpZG4ndCBhY3R1YWxseQo+ID4gY2F1c2Ug
YSByZWFsIGRlYWRsb2NrLiBCdXQgd2l0aCBhIG11dGV4IGl0IHdvdWxkLiBUaGUgc29sdXRpb24g
d2FzIHRvCj4gPiBhbm5vdGF0ZSB0aGVzZSBhcyBEUk1fVU5MT0NLRUQgYW5kIG1hcmsgaTgxMCB1
bnNhZmUgb24gU01QIG1hY2hpbmVzLgo+ID4KPiA+IFRoaXMgY29udmVyc2lvbiBjYXVzZWQgYSBy
ZWdyZXNzaW9uLCBiZWNhdXNlIHVubGlrZSB0aGUgQktMIGEgbXV0ZXgKPiA+IGlzbid0IGRyb3Bw
ZWQgb3ZlciBzY2hlZHVsZSAodGhhdCB0aGluZyBhZ2FpbiksIHdoaWNoIGNhdXNlZCBhIHZibGFu
awo+ID4gd2FpdCBpbiBvbmUgdGhyZWFkIHRvIGJsb2NrIHRoZSBlbnRpcmUgZGVza3RvcCBhbmQg
YWxsIGl0cyBhcHBzLiBCYWNrCj4gPiB0aGVuIHdlIGRpZCB2Ymxhbmsgc2NoZWR1bGluZyBieSBi
bG9ja2luZyBpbiB0aGUgY2xpZW50LCBhd2Vzb21lIGlzbid0Cj4gPiBpdC4gVGhpcyB3YXMgZml4
ZWQgcXVpY2tseSBpbiAob2sgbm90IHNvIHF1aWNrbHksIHRvb2sgMiB5ZWFycyk6Cj4gPgo+ID4g
Y29tbWl0IDhmNGZmMmIwNmFmY2Q2ZjE1MTg2ODQ3NGE0MzJjNjAzMDU3ZWFmNTYKPiA+IEF1dGhv
cjogSWxpamEgSGFkemljIDxpaGFkemljQHJlc2VhcmNoLmJlbGwtbGFicy5jb20+Cj4gPiBEYXRl
OiAgIE1vbiBPY3QgMzEgMTc6NDY6MTggMjAxMSAtMDQwMAo+ID4KPiA+ICAgICBkcm06IGRvIG5v
dCBzbGVlcCBvbiB2Ymxhbmsgd2hpbGUgaG9sZGluZyBhIG11dGV4Cj4gPgo+ID4gQWxsIHRoZSBv
dGhlciBEUk1fVU5MT0NLRUQgYW5ub3RhdGlvbnMgZm9yIGFsbCB0aGUgY29yZSBpb2N0bHMgd2Fz
Cj4gPiB3b3JrIHRvIHJlYWNoIGZpbmVyLWdyYWluZWQgbG9ja2luZyBmb3IgbW9kZXJuIGRyaXZl
cnMuIFRoaXMgdG9vawo+ID4geWVhcnMsIGFuZCBjdWxtaW5hdGVkIGluOgo+ID4KPiA+IGNvbW1p
dCBmZGQ1Yjg3N2U5ZWJjMjAyOWUxMzczYjRhM2NkMDU3MzI5YTlhYjdhCj4gPiBBdXRob3I6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiBEYXRlOiAgIFNhdCBEZWMg
MTAgMjI6NTI6NTQgMjAxNiArMDEwMAo+ID4KPiA+ICAgICBkcm06IEVuZm9yY2UgQktMLWxlc3Mg
aW9jdGxzIGZvciBtb2Rlcm4gZHJpdmVycwo+ID4KPiA+IERSTV9VTkxPQ0tFRCB3YXMgbmV2ZXIg
cmVxdWlyZWQgYnkgYW55IGxlZ2FjeSBkcml2ZXJzLCBleGNlcHQgZm9yIHRoZQo+ID4gdmJsYW5r
X3dhaXQgSU9DVEwuIFRoZXJlZm9yZSB3ZSB3aWxsIG5vdCByZWdyZXNzIHRoZXNlIG9sZCBkcml2
ZXJzIGJ5Cj4gPiBnb2luZyBiYWNrIHRvIHdoZXJlIHdlJ3ZlIGJlZW4gaW4gMjAxMS4gRm9yIGFs
bCBtb2Rlcm4gZHJpdmVycyBub3RoaW5nCj4gPiB3aWxsIGNoYW5nZS4KPiA+Cj4gPiBUbyBtYWtl
IHRoaXMgcGVyZmVjdGx5IGNsZWFyLCBhbHNvIGFkZCBhIGNvbW1lbnQgdG8gRFJNX1VOTE9DS0VE
Lgo+ID4KPiA+IHYyOiBEb24ndCBmb3JnZXQgYWJvdXQgZHJtX2lvYzMyLmMgKE1pY2hlbCkuIE5v
dCBhIHNvdXJjZSBvZiBjb3B5cGFzdGEKPiA+IG1pc3Rha2VzIHdoZW4gY3JlYXRpbmcgZHJpdmVy
IGlvY3RsIHRhYmxlcywgYnV0IGJldHRlciB0byBiZQo+ID4gY29uc2lzdGVudC4KPiA+Cj4gUGVy
c29uYWxseSBJIHdvdWxkIG9taXQgdGhlICJOb3QgYSBzb3VyY2Ugb2YgY29wdXBhc3RhLi4uIiBu
b3RlLgoKRG9uZS4KCj4gPiBDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4K
PiA+IENjOiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IAo+IERv
dWJsZS1jaGVja2VkIHRoYXQgb25seSB0aGUgVkJMQUNLIGlvY3RsIHJldGFpbmVkIGl0cyBhbm5v
dGF0aW9uIGFuZAo+IGFsbCBvdGhlciBjb3JlIGlvY3RscyBhcmUgRFJNX1VOTE9DS0VEIGZyZWUu
Cj4gVGVjaG5pY2FsbHkgd2l0aCB0aGlzIGNoYW5nZSBVTVMgZHJpdmVycyB3aWxsIHN0YXJ0IHVz
aW5nIGEgbG9jayBvbgo+IHRoZSBsaXN0ZWQgaW9jdGxzLiBJIGRvIG5vdCBleHBlY3QgdGhpcyB0
byBiZSBhIHByb2JsZW0gYW5kIGFkbWl0dGVkbHkKPiBJIGRpZCBub3QgYXVkaXQgZXhpc3Rpbmcg
dXNlcnNwYWNlLgo+IAo+IFRoYXQgc2FpZCwgdGhlIHBhdGNoIGxvb2tzIHJlYXNvbmFibGU6Cj4g
QWNrZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgpBcHBs
aWVkIGFsc28gd2l0aCBNaWNoZWwncyBpcmMgYWNrLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
