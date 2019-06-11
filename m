Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E823D0D8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 17:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2DA89217;
	Tue, 11 Jun 2019 15:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7955A89217
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 15:33:13 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id d17so12296181oth.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HAVT6/fAzsawb1ZyE2RFcrwT1x+GWrft5doOmRPjupg=;
 b=kO3qEJLNr13IJdeWaXB64ivXpQGrazYQztCEsqS72ikAy8kRzgVrhEI++KCNX9A4mG
 3t++vCK0Kx/H/ss47uytOZkDGvIz1EPdu/A1JR0TVXoRuZTf53STlVGU2cYNUn3n/+Zd
 H5g/7OZvv62HQMXnsGdfDZeJlUB8QYZJDI2+x33Q6TIqaL5b1XfwcBVbDT0c3V7aeR0m
 Ic4WlEKWEB4XDvzlQ6BpSDSP25ce3OLIn0Birzl4fFi8Plx2pg/5x+xx0sqWcEchXn/Z
 hTqg5KTPUiaq1h+tJbEcBdK73CCuTK+2WYm3qbWXXZgQHnObQryVnZQ766Uri7aRcjaF
 hhzw==
X-Gm-Message-State: APjAAAU7zz9VgZl+k+WuzVkn7hOLy6zRWm6M91dL7XEBvM1eSiikqMQZ
 ESUItviwP0bdf67FPniMB0/fk5CEPJnKlhvsZ3Axdw==
X-Google-Smtp-Source: APXvYqxpkE8vHyw4HEeC59CODxd29nLuoxDqm6RP1woLeordXgB/6U4RWypY4TAKbL85TrC52kqGJXbKDhtEFICYzmY=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr16950624oto.188.1560267192714; 
 Tue, 11 Jun 2019 08:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-7-tzimmermann@suse.de>
 <20190605095817.ijhq3z7oaptd3wff@sirius.home.kraxel.org>
 <81937cd8-1b1f-007b-97e3-18a3b586b87f@suse.de>
In-Reply-To: <81937cd8-1b1f-007b-97e3-18a3b586b87f@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 11 Jun 2019 17:33:01 +0200
Message-ID: <CAKMK7uEwoCFWxtD-ktZSxjhS2TyOEoRovBX18gk3doGyCCrS2Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/mgag200: Rewrite cursor handling
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HAVT6/fAzsawb1ZyE2RFcrwT1x+GWrft5doOmRPjupg=;
 b=PTk6PMXzxytYpmnwymJ39L4eR7NZwG43w64tYxX6OWkU08CKWBEnDWPFYP8WLbvUQn
 WFZuEAnsHKhfR9oamrXoGVXgnlvT0bLLSo1OQsjRC8IuWwVQuclHQxLdsCUpgtzOPWgf
 /0z6UaZ35G8h6HzDTGFMT4AMVY8vhpFDkRs5k=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMjozMiBQTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaQo+Cj4gQW0gMDUuMDYuMTkgdW0gMTE6NTggc2No
cmllYiBHZXJkIEhvZmZtYW5uOgo+ID4gT24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDU6NDE6NTlQ
TSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gPj4gVGhlIGN1cnNvciBoYW5kbGlu
ZyBpbiBtZ2FnMjAwIGlzIGNvbXBsaWNhdGVkIHRvIHVuZGVyc3RhbmQuIEl0IHRvdWNoZXMgYQo+
ID4+IG51bWJlciBvZiBkaWZmZXJlbnQgQk9zLCBidXQgZG9lc24ndCByZWFsbHkgdXNlIGFsbCBv
ZiB0aGVtLgo+ID4+Cj4gPj4gUmV3cml0aW5nIHRoZSBjdXJzb3IgdXBkYXRlIHJlZHVjZXMgdGhl
IGFtb3VudCBvZiBjdXJzb3Igc3RhdGUuIFRoZXJlIGFyZQo+ID4+IHR3byBCT3MgZm9yIGRvdWJs
ZS1idWZmZXJlZCBIVyB1cGRhdGVzLiBUaGUgc291cmNlIEJPIHVwZGF0ZXMgdGhlIG9uZSB0aGF0
Cj4gPj4gaXMgY3VycmVudGx5IG5vdCBkaXNwbGF5ZWQgYW5kIHRoZW4gc3dpdGNoZXMgYnVmZmVy
cy4gRXhwbGljaXQgQk8gbG9ja2luZwo+ID4+IGhhcyBiZWVuIHJlbW92ZWQgZnJvbSB0aGUgY29k
ZS4gQk9zIGFyZSBzaW1wbHkgcGlubmVkIGFuZCB1bnBpbm5lZCBpbiB2aWRlbwo+ID4+IFJBTS4K
PiA+Cj4gPiBDdXJzb3JzIGFyZSBub3QgdGhhdCBiaWcgYWZ0ZXIgYWxsLCBzbyBtYXliZSBwaW4g
dGhlIHR3byBCT3MgZm9yCj4gPiBkb3VibGUtYnVmZmVyaW5nIHBlcm1hbmVudGx5IGluIHZyYW0g
dG8gc2ltcGxpZnkgdGhpbmdzIGZ1cnRoZXI/Cj4gPgo+ID4gQWxzbyBmYWN0b3Jpbmcgb3V0IHRo
ZSBjb2RlIHdoaWNoIHVwZGF0ZXMgdGhlIHR3byBCT3MgdG8gYSBzZXBhcmF0ZQo+ID4gZnVuY3Rp
b24gc2hvdWxkIGhlbHAgbWFraW5nIHRoZSBjb2RlIG1vcmUgcmVhZGFibGUuCj4KPiBUaGUgY3Vy
c29yIGhhbmRsaW5nIGluIHRoZSBhc3QgZHJpdmVyIGlzIHNpbWlsYXIsIGJ1dCB1c2VzIG9uZSBz
aW5nbGUgQk8KPiB0byBob2xkIGJvdGggY3Vyc29yIGJ1ZmZlcnMuIEknbSB0aGlua2luZyBhYm91
dCBob3cgdG8gdHVybiBib3RoCj4gaW1wbGVtZW50YXRpb25zIGludG8gYSBnZW5lcmljIGhlbHBl
ciBmb3IgbGVnYWN5IGN1cnNvcnMgKGkuZS4sIGxvdwo+IG51bWJlciBvZiBjb2xvcnMgb3IgcGFs
ZXR0ZSkuIFRoaXMgd291bGQgYWxzbyBiZSBoZWxwZnVsIGZvciBteSB3b3JrIG9uCj4gZmJkZXYg
cG9ydGluZy4KPgo+IE9uZSBpZGVhIGlzIHRvIGFkYXB0IGRlZmVycmVkIEkvTy4gRFJNIHdvdWxk
IGV4cG9zZSBhbiBBUkdCIHNoYWRvdwo+IGJ1ZmZlciB0byB1c2Vyc3BhY2UgYW5kIGxldCB0aGUg
bW1hcCBpbXBsZW1lbnRhdGlvbiB1cGRhdGUgdGhlIEhXCj4gYnVmZmVycyAoaW5jbHVkaW5nIGRp
dGhlcmluZywgcGFsZXR0ZSBzZXR1cCwgZXRjLikuCgpObyBtbWFwIGdhbWVzIG5lZWRlZCB3aXRo
IGttcywgd2UgZXhwZWN0IHVzZXJzcGFjZSB0byBnaXZlIHVzIGFuIGlvY3RsCmNhbGwgaW4gYWxs
IGNhc2VzLiBmYmRldiBpcyB0aGUgbGVnYWN5IGhvcnJvcnMgdGhhdCB3b3JrcyBkaWZmZXJlbnRs
eS4KClNvIGZvciBjdXJzb3JzLCBhc3N1bWluZyB5b3UgaGF2ZSB1bml2ZXJzYWwgY3Vyc29ycywg
eW91IGp1c3QgbmVlZCB0bwp1cGRhdGUgdGhlIHNoYWRvd2VkIGNvcHkgaW4gdGhlIHByZXBhcmVf
ZmIgcGxhbmUgaG9vay4gRm9yCm5vbi11bml2ZXJzYWwgcGxhbmUgZHJpdmVycyB5b3UgbmVlZCB0
byBkbyB0aGF0IHNvbWV3aGVyZSBpbiB5b3VyCnNldC9tb3ZlX2N1cnNvciBob29rcyAoSSB0aGlu
ayBib3RoIG9mIHRoZW0pLiBBc2lkZTogRm9yIG5vbi1jdXJzb3JzCnRoZXJlJ3MgYWxzbyB0aGUg
ZGlydHlmYiBpb2N0bCwgd2hpY2ggc2VydmVzIHRoZSBzYW1lIHB1cnBvc2UuCgpDaGVlcnMsIERh
bmllbAoKPgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4gPiBCdXQgZXZlbiBhcy1pcyB0aGUg
cGF0Y2ggaXMgYSBzdGVwIGludG8gdGhlIHJpZ2h0IGRpcmVjdGlvbi4KPiA+Cj4gPiBBY2tlZC1i
eTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gPgo+ID4gY2hlZXJzLAo+ID4g
ICBHZXJkCj4gPgo+Cj4gLS0KPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXIKPiBTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRzdHJhc3NlIDUsIDkwNDA5IE51ZXJu
YmVyZywgR2VybWFueQo+IEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkgSGlnZ2lucywgU3Jp
IFJhc2lhaAo+IEhSQiAyMTI4NCAoQUcgTsO8cm5iZXJnKQo+CgoKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
