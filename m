Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCA84578E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 10:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F6889349;
	Fri, 14 Jun 2019 08:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3404789349
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:32:39 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r12so151605edo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 01:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=CXuTJX2Tu0FWoW9TRe6upWELUnjuP4VynW51q1e22Bc=;
 b=paAXhEpQQyZsXtmzZVQlRvkT9AajPbm2vcFxhQSb3NJ4tg8zx8p7s93tDYFdeNG7dP
 5M2fQG59xQ166wCoM37wfTBD43GdTQOeVLhlBE7Sq3gmFMpmTmUF01LV7AHfbBA3xuot
 vLiLPuOt1lU4hg/ppMY9mYHKXDxA6RmjuKpSPM+j1QClGdtxO66AM3R/swN/ZoykhJNb
 L+8aGjYFmu0fVXKZIjZvA5rMQWBbn/agqo9XR9o1PqFkkWoe3m00JPuWvJq74PKvNm7S
 +ZnoAbRWtzwjZd6PBd+aZhpbHYj/S0LDbPWIjR44KzYAXAfLCH6Yc0x/1qsSmpfAKNbO
 1/IQ==
X-Gm-Message-State: APjAAAXJAe93gxs8a5JDxejCrj9o9j6yBZevzakHpVNVcUpzPgdj5hkU
 vPpjw172FPmvF+tJLRfGX1mtog==
X-Google-Smtp-Source: APXvYqwFmK0FQJN7SjMIIjU8xeebrCUf3pEa87UasPdQtRju3+SblF7r8V8YrxmvHBQJXUlGdg67Yg==
X-Received: by 2002:a50:a56d:: with SMTP id z42mr79151554edb.241.1560501157810; 
 Fri, 14 Jun 2019 01:32:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j25sm656252edq.68.2019.06.14.01.32.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 01:32:36 -0700 (PDT)
Date: Fri, 14 Jun 2019 10:32:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/ioctl: Ditch DRM_UNLOCKED except for the legacy
 vblank ioctl
Message-ID: <20190614083234.GV23020@phenom.ffwll.local>
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
 bh=CXuTJX2Tu0FWoW9TRe6upWELUnjuP4VynW51q1e22Bc=;
 b=ffcSSembtzSQF4uZVTzvnJ2Ulo+Q0ykomh9D356+dkWiqn8gZWaki1pX6XlVyf3thj
 NjlOhnwZR3ujjTJrw5k8k51PrYqMteafYOqO0mgSTGmr2RKqKAb1suDV1CYzNTBhJU65
 5wH02Xm0KD+nkb32ADk/w0mNyNIH53amhb7Q0=
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
b3RlLgo+IAo+ID4gQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+Cj4gPiBD
YzogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAKPiBEb3VibGUt
Y2hlY2tlZCB0aGF0IG9ubHkgdGhlIFZCTEFDSyBpb2N0bCByZXRhaW5lZCBpdHMgYW5ub3RhdGlv
biBhbmQKPiBhbGwgb3RoZXIgY29yZSBpb2N0bHMgYXJlIERSTV9VTkxPQ0tFRCBmcmVlLgo+IFRl
Y2huaWNhbGx5IHdpdGggdGhpcyBjaGFuZ2UgVU1TIGRyaXZlcnMgd2lsbCBzdGFydCB1c2luZyBh
IGxvY2sgb24KPiB0aGUgbGlzdGVkIGlvY3Rscy4gSSBkbyBub3QgZXhwZWN0IHRoaXMgdG8gYmUg
YSBwcm9ibGVtIGFuZCBhZG1pdHRlZGx5Cj4gSSBkaWQgbm90IGF1ZGl0IGV4aXN0aW5nIHVzZXJz
cGFjZS4KPiAKPiBUaGF0IHNhaWQsIHRoZSBwYXRjaCBsb29rcyByZWFzb25hYmxlOgo+IEFja2Vk
LWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKQW55b25lIGVs
c2UgdXAgZm9yIGFja3MvcmV2aWV3cz8KCj4gRGFuaWVsLCBjYW4geW91IGFwcGx5IGFueSBvdXRz
dGFuZGluZyBEUk1fVU5MT0NLRUQgcGF0Y2hlcyBmcm9tIG15IHNlcmllcz8KCllvdSBoYXZlIGRy
bS1taXNjIGNvbW1pdCByaWdodHMsIHNvIEknbSBhc3N1bWluZyB5b3UnbGwgcHVzaCB0aGVtCnlv
dXJzZWxmLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
