Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF9B7D7B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 17:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC286F515;
	Thu, 19 Sep 2019 15:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F6C6F515
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 15:04:03 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id x64so1347705ywg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 08:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y8vAVMHvzbWsdZXn87+UYmHO8hhkPrYpqOnkXz4LuK4=;
 b=ZGxzpGw1pSuDQKj9zyC77uYx4ZGrDKVBUVrDhHjlbJS7Be7RZP9bBAhsdxB4lol9OT
 Xml8u4qQEQHhgVzYWauFA31dTNQks07sgp2HAiIMW0l9TyInp8oDiRNFH0pC8TWXFaeQ
 widDSemjQS7Ho0y95gVZhXQXyHJjQ50Epud876MKmQ1QcMqjkalLK1HfS1whwZ3PyPJw
 HGptz74LBjTC6GMjiD8UrF41HdaueN3DHTWFrsQodku2LlOgMjJFlruU6UJsCwP69Zcp
 FQq6u1iYj0rwQna6wdn8g0L2vMgFEqgz0LVaudhWq/x9dFdBSLm3plYAuqLecGiWAjMx
 E2lw==
X-Gm-Message-State: APjAAAXkN8ieONOjWdHEmXEhkPEMF4YKvQ8ZDaZCJPGLTB2fA/tytnf/
 ElrJkbil6jOuHG+6/cEq2DRBjA==
X-Google-Smtp-Source: APXvYqwx9wl4Q0hspgID6pNeOiMOJiNK3Q7E3XtH1k1AlBb6iwVW+mou23+ZcKZPPoCGDVoNKH2iBQ==
X-Received: by 2002:a81:7dc5:: with SMTP id y188mr7915294ywc.69.1568905442311; 
 Thu, 19 Sep 2019 08:04:02 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d63sm1921007ywe.55.2019.09.19.08.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 08:04:01 -0700 (PDT)
Date: Thu, 19 Sep 2019 11:04:01 -0400
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: damage_helper: Fix race checking plane->state->fb
Message-ID: <20190919150401.GV218215@art_vandelay>
References: <20190904202938.110207-1-sean@poorly.run>
 <CAKMK7uFtcmZd9+wARmYuZwtimUV91fiFXNmr5Nuk4Z65QjHyuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFtcmZd9+wARmYuZwtimUV91fiFXNmr5Nuk4Z65QjHyuA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y8vAVMHvzbWsdZXn87+UYmHO8hhkPrYpqOnkXz4LuK4=;
 b=Jc+Q99J7jDIc8UMXcQDlm6SXih7dlteWgLvH5grEUGae4NVRt4TvQIWgsD3ew8wd8H
 Rk0+EeCuKKC/Qe6EEteFSlaYgu7iz+WshpRtuG1Fh3erqb9ZKUyc9Zp/RHRN5qnIoKV5
 HuIBSgTygqDzLgFUN0/kARz3cOk78VT6ZxrQZGbvWVg0VXXNWRizpbOya3+bZZEY2uO6
 ezY2cFsaEvFpvsntH/WZ5Ep7CKukH+NjSh8eLtJ0teknFJ4ruievQWT1+llnlhmK6+FA
 ZOHgvvvaRGXEXUk1GAqJOskx6dzTUJCA4Nje7xulbHB8kwl3dQhhbUfEMpAlqmrGIO7s
 HJOA==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, stable <stable@vger.kernel.org>,
 Deepak Rawat <drawat@vmware.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMTI6NDE6MjdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDEwOjI5IFBNIFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9t
aXVtLm9yZz4KPiA+Cj4gPiBTaW5jZSB0aGUgZGlydHlmYiBpb2N0bCBkb2Vzbid0IGdpdmUgdXMg
YW55IGhpbnRzIGFzIHRvIHdoaWNoIHBsYW5lIGlzCj4gPiBzY2FubmluZyBvdXQgdGhlIGZiIGl0
J3MgbWFya2luZyBhcyBkYW1hZ2VkLCB3ZSBuZWVkIHRvIGxvb3AgdGhyb3VnaAo+ID4gcGxhbmVz
IHRvIGZpbmQgaXQuCj4gPgo+ID4gQ3VycmVudGx5IHdlIGp1c3QgcmVhY2ggaW50byBwbGFuZSBz
dGF0ZSBhbmQgY2hlY2ssIGJ1dCB0aGF0IGNhbiByYWNlCj4gPiB3aXRoIGFub3RoZXIgY29tbWl0
IGNoYW5naW5nIHRoZSBmYiBvdXQgZnJvbSB1bmRlciB1cy4gVGhpcyBwYXRjaCBsb2Nrcwo+ID4g
dGhlIHBsYW5lIGJlZm9yZSBjaGVja2luZyB0aGUgZmIgYW5kIHdpbGwgcmVsZWFzZSB0aGUgbG9j
ayBpZiB0aGUgcGxhbmUKPiA+IGlzIG5vdCBkaXNwbGF5aW5nIHRoZSBkaXJ0eSBmYi4KPiA+Cj4g
PiBGaXhlczogYjlmYzVlMDFkMWNlICgiZHJtOiBBZGQgaGVscGVyIHRvIGltcGxlbWVudCBsZWdh
Y3kgZGlydHlmYiIpCj4gPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+ID4g
Q2M6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+Cj4gPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVs
bHN0cm9tQHZtd2FyZS5jb20+Cj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPgo+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+ID4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjArCj4gPiBSZXBvcnRlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gU2lnbmVkLW9mZi1ieTogU2Vh
biBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RhbWFnZV9oZWxwZXIuYyB8IDggKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1h
Z2VfaGVscGVyLmMKPiA+IGluZGV4IDgyMzBkYWMwMWE4OS4uM2E0MTI2ZGMyNTIwIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jCj4gPiBAQCAtMjEyLDggKzIxMiwxNCBA
QCBpbnQgZHJtX2F0b21pY19oZWxwZXJfZGlydHlmYihzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpm
YiwKPiA+ICAgICAgICAgZHJtX2Zvcl9lYWNoX3BsYW5lKHBsYW5lLCBmYi0+ZGV2KSB7Cj4gPiAg
ICAgICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGU7Cj4gPgo+
ID4gLSAgICAgICAgICAgICAgIGlmIChwbGFuZS0+c3RhdGUtPmZiICE9IGZiKQo+ID4gKyAgICAg
ICAgICAgICAgIHJldCA9IGRybV9tb2Rlc2V0X2xvY2soJnBsYW5lLT5tdXRleCwgc3RhdGUtPmFj
cXVpcmVfY3R4KTsKPiA+ICsgICAgICAgICAgICAgICBpZiAocmV0KQo+IAo+IEkgdGhpbmsgZm9y
IHBhcmFub2lkIHNhZmV0eSB3ZSBzaG91bGQgaGF2ZSBhIFdBUk5fT04ocmV0ID09IC1FQUxSRUFE
WSkKPiBoZXJlLiBJdCBzaG91bGQgYmUgaW1wb3NzaWJsZSwgYnV0IGlmIGl0J3Mgbm90IGZvciBz
b21lIG9kZGJhbGwKPiByZWFzb24sIHdlJ2xsIGJsb3cgdXAuCgpkcm1fbW9kZXNldF9sb2NrIGVh
dHMgRUFMUkVBRFkgYW5kIHJldHVybnMgMCBmb3IgdGhhdCBjYXNlLCBzbyBJIGd1ZXNzIGl0CmRl
cGVuZHMgX2hvd18gcGFyYW5vaWQgeW91IHdhbnQgdG8gYmUgaGVyZSA6LSkKCj4gCj4gV2l0aCB0
aGF0OiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IAo+IEJ1
dCBwbGVhc2UgZ2l2ZSB0aGlzIGEgc3BpbiB3aXRoIHNvbWUgd29ya2xvYWRzIGFuZCB0aGUgd3df
bXV0ZXgKPiBzbG93cGF0aCBkZWJ1Z2dpbmcgZW5hYmxlZCwganVzdCB0byBtYWtyZSBzdXJlLgoK
T2ssIGhhZCBhIGNoYW5jZSB0byBydW4gdGhyb3VnaCBzb21lIHRlc3RzIHRoaXMgbW9ybmluZyB3
aXRoCkNPTkZJR19ERUJVR19XV19NVVRFWF9TTE9XUEFUSCBhbmQgdGhpbmdzIGxndG0KClNlYW4K
Cj4gLURhbmllbAo+IAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgaWYgKHBsYW5lLT5zdGF0ZS0+ZmIgIT0gZmIpIHsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGRybV9tb2Rlc2V0X3VubG9jaygmcGxhbmUtPm11dGV4KTsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKyAgICAgICAgICAgICAg
IH0KPiA+Cj4gPiAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9w
bGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOwo+ID4gICAgICAgICAgICAgICAgIGlmIChJU19FUlIo
cGxhbmVfc3RhdGUpKSB7Cj4gPiAtLQo+ID4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwg
R29vZ2xlIC8gQ2hyb21pdW0gT1MKPiA+Cj4gCj4gCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVy
LCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
