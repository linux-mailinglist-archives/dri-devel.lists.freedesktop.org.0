Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F759D8BA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 23:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270D86E30C;
	Mon, 26 Aug 2019 21:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864A66E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 21:51:29 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EFC3B2A09C1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 21:51:28 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id l17so18862159qtk.16
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=7c4qKqMTWkLz+rdogljBCIaDURVz1u9UaTlZ6kcFhXI=;
 b=EyeZuxLmGW6BUOD01oE6+gUUmyAfy1vKrsRgghTJmTbgfTA2W7Jm0Tv8J7jIxqTlrC
 tm4TIjW8RX4w9fRBugj1s7qpx2Y9URNC0CvWyosFo98mcVCuGwVY0gr/KyAOT1rMbd79
 qE/nAhvuEsx+0hMPFR803nU6BpN2ZX6kp11Gk4RHJA+QD3F+oUaLmpB9qv0TkSFcfBk8
 22QP+QV+kVIzKWW6DNFJ6hwAqtPcfUszgblLS7vGZODuW0Gjp82BIbnf4xQy7ZSzYM6s
 jUXN1x3/ZxoxpmIo/pMKhVJEVfpo4J5SINkNOxTIlLVpboPrH+p6LWaTpNIy72+mYfFy
 xbfQ==
X-Gm-Message-State: APjAAAX1gBU28kvI7k3D+Bl02g4VIKpGqdLDyLp8MnCmBAiu3Uk+Asrp
 ZuC0ypjGMptYezIsguQnZQpWsweX0IrhyIyrim2zfcwlI5dRWyLB2dV5//qr+vyMYkJONFPKmFW
 DdgQ2UYr6n22azv1MKBQGGNN9qSwU
X-Received: by 2002:ac8:3435:: with SMTP id u50mr19481723qtb.310.1566856288258; 
 Mon, 26 Aug 2019 14:51:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBARvIoeY8BGIy+x1QgkncpM4AedhRZJ7eEuv8IqaZIxRiqXtf6O+p8vU4UbABKuVNDzD8ag==
X-Received: by 2002:ac8:3435:: with SMTP id u50mr19481700qtb.310.1566856287989; 
 Mon, 26 Aug 2019 14:51:27 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id w126sm7524273qkd.68.2019.08.26.14.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 14:51:27 -0700 (PDT)
Message-ID: <5d44346ecb6ab13d9f01142f33d4ff1029054067.camel@redhat.com>
Subject: Re: [PATCH 01/26] drm/dp_mst: Move link address dumping into a
 function
From: Lyude Paul <lyude@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 26 Aug 2019 17:51:26 -0400
In-Reply-To: <20190808195318.GQ7444@phenom.ffwll.local>
References: <20190718014329.8107-1-lyude@redhat.com>
 <20190718014329.8107-2-lyude@redhat.com>
 <20190808195318.GQ7444@phenom.ffwll.local>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KnNpZ2gqIGZpbmFsbHkgaGF2ZSBzb21lIHRpbWUgdG8gZ28gdGhyb3VnaCB0aGVzZSByZXZpZXdz
CgpqZnlpOiBJIHJlYWxpemVkIGFmdGVyIGxvb2tpbmcgb3ZlciB0aGlzIHBhdGNoIHRoYXQgaXQn
cyBub3QgYWN0dWFsbHkgbmVlZGVkIC0KSSBoYWQgYmVlbiBwbGFubmluZyBvbiB1c2luZyBkcm1f
ZHBfZHVtcF9saW5rX2FkZHJlc3MoKSBmb3Igb3RoZXIgdGhpbmdzLCBidXQKZW5kZWQgdXAgZGVj
aWRpbmcgdG8gbWFrZSB0aGUgZmluYWwgcGxhbiB0byB1c2Ugc29tZXRoaW5nIHRoYXQgZHVtcHMg
aW50byBhCmZvcm1hdCB0aGF0J3MgaWRlbnRpY2FsIHRvIHRoZSBvbmUgd2UncmUgdXNpbmcgZm9y
IGR1bXBpbmcgRE9XTiByZXF1ZXN0cy4gSU1ITwp0aG91Z2gsIHRoaXMgcGF0Y2ggZG9lcyBtYWtl
IHRoaW5ncyBsb29rIG5pY2VyIHNvIEknbGwgcHJvYmFibHkga2VlcCBpdC4KCkFzc3VtaW5nIEkg
Y2FuIHN0aWxsIGNvdW50IHlvdXIgci1iIGFzIHZhbGlkIHdpdGggYSBjaGFuZ2UgdG8gdGhlIGNv
bW1pdApkZXNjcmlwdGlvbj8KCk9uIFRodSwgMjAxOS0wOC0wOCBhdCAyMTo1MyArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCAwOTo0MjoyNFBNIC0w
NDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4gU2luY2Ugd2UncmUgYWJvdXQgdG8gYmUgY2FsbGlu
ZyB0aGlzIGZyb20gbXVsdGlwbGUgcGxhY2VzLiBBbHNvIGl0IG1ha2VzCj4gPiB0aGluZ3MgZWFz
aWVyIHRvIHJlYWQhCj4gPiAKPiA+IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+
Cj4gPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+ID4gQ2M6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogSGFycnkgV2Vu
dGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxs
eXVkZUByZWRoYXQuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYyB8IDM1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gaW5kZXggMDk4NGI5YTM0ZDU1
Li45OTgwODFiOWIyMDUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCj4gPiBAQCAtMjAxMyw2ICsyMDEzLDI4IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9xdWV1ZV9k
b3duX3R4KHN0cnVjdAo+ID4gZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiA+ICAJbXV0
ZXhfdW5sb2NrKCZtZ3ItPnFsb2NrKTsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIHZvaWQKPiA+
ICtkcm1fZHBfZHVtcF9saW5rX2FkZHJlc3Moc3RydWN0IGRybV9kcF9saW5rX2FkZHJlc3NfYWNr
X3JlcGx5ICpyZXBseSkKPiA+ICt7Cj4gPiArCXN0cnVjdCBkcm1fZHBfbGlua19hZGRyX3JlcGx5
X3BvcnQgKnBvcnRfcmVwbHk7Cj4gPiArCWludCBpOwo+ID4gKwo+ID4gKwlmb3IgKGkgPSAwOyBp
IDwgcmVwbHktPm5wb3J0czsgaSsrKSB7Cj4gPiArCQlwb3J0X3JlcGx5ID0gJnJlcGx5LT5wb3J0
c1tpXTsKPiA+ICsJCURSTV9ERUJVR19LTVMoInBvcnQgJWQ6IGlucHV0ICVkLCBwZHQ6ICVkLCBw
bjogJWQsIGRwY2RfcmV2Ogo+ID4gJTAyeCwgbWNzOiAlZCwgZGRwczogJWQsIGxkcHMgJWQsIHNk
cCAlZC8lZFxuIiwKPiA+ICsJCQkgICAgICBpLAo+ID4gKwkJCSAgICAgIHBvcnRfcmVwbHktPmlu
cHV0X3BvcnQsCj4gPiArCQkJICAgICAgcG9ydF9yZXBseS0+cGVlcl9kZXZpY2VfdHlwZSwKPiA+
ICsJCQkgICAgICBwb3J0X3JlcGx5LT5wb3J0X251bWJlciwKPiA+ICsJCQkgICAgICBwb3J0X3Jl
cGx5LT5kcGNkX3JldmlzaW9uLAo+ID4gKwkJCSAgICAgIHBvcnRfcmVwbHktPm1jcywKPiA+ICsJ
CQkgICAgICBwb3J0X3JlcGx5LT5kZHBzLAo+ID4gKwkJCSAgICAgIHBvcnRfcmVwbHktPmxlZ2Fj
eV9kZXZpY2VfcGx1Z19zdGF0dXMsCj4gPiArCQkJICAgICAgcG9ydF9yZXBseS0+bnVtX3NkcF9z
dHJlYW1zLAo+ID4gKwkJCSAgICAgIHBvcnRfcmVwbHktPm51bV9zZHBfc3RyZWFtX3NpbmtzKTsK
PiA+ICsJfQo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgdm9pZCBkcm1fZHBfc2VuZF9saW5rX2Fk
ZHJlc3Moc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gPiAgCQkJCSAgICAg
c3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiKQo+ID4gIHsKPiA+IEBAIC0yMDM4LDE4ICsy
MDYwLDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX3NlbmRfbGlua19hZGRyZXNzKHN0cnVjdAo+ID4g
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiA+ICAJCQlEUk1fREVCVUdfS01TKCJsaW5r
IGFkZHJlc3MgbmFrIHJlY2VpdmVkXG4iKTsKPiA+ICAJCX0gZWxzZSB7Cj4gPiAgCQkJRFJNX0RF
QlVHX0tNUygibGluayBhZGRyZXNzIHJlcGx5OiAlZFxuIiwgdHhtc2ctCj4gPiA+cmVwbHkudS5s
aW5rX2FkZHIubnBvcnRzKTsKPiA+IC0JCQlmb3IgKGkgPSAwOyBpIDwgdHhtc2ctPnJlcGx5LnUu
bGlua19hZGRyLm5wb3J0czsgaSsrKQo+ID4gewo+ID4gLQkJCQlEUk1fREVCVUdfS01TKCJwb3J0
ICVkOiBpbnB1dCAlZCwgcGR0OiAlZCwgcG46Cj4gPiAlZCwgZHBjZF9yZXY6ICUwMngsIG1jczog
JWQsIGRkcHM6ICVkLCBsZHBzICVkLCBzZHAgJWQvJWRcbiIsIGksCj4gPiAtCQkJCSAgICAgICB0
eG1zZy0KPiA+ID5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5pbnB1dF9wb3J0LAo+ID4gLQkJ
CQkgICAgICAgdHhtc2ctCj4gPiA+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0ucGVlcl9kZXZp
Y2VfdHlwZSwKPiA+IC0JCQkJICAgICAgIHR4bXNnLQo+ID4gPnJlcGx5LnUubGlua19hZGRyLnBv
cnRzW2ldLnBvcnRfbnVtYmVyLAo+ID4gLQkJCQkgICAgICAgdHhtc2ctCj4gPiA+cmVwbHkudS5s
aW5rX2FkZHIucG9ydHNbaV0uZHBjZF9yZXZpc2lvbiwKPiA+IC0JCQkJICAgICAgIHR4bXNnLT5y
ZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5tY3MsCj4gPiAtCQkJCSAgICAgICB0eG1zZy0+cmVw
bHkudS5saW5rX2FkZHIucG9ydHNbaV0uZGRwcywKPiA+IC0JCQkJICAgICAgIHR4bXNnLQo+ID4g
PnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldLmxlZ2FjeV9kZXZpY2VfcGx1Z19zdGF0dXMsCj4g
PiAtCQkJCSAgICAgICB0eG1zZy0KPiA+ID5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5udW1f
c2RwX3N0cmVhbXMsCj4gPiAtCQkJCSAgICAgICB0eG1zZy0KPiA+ID5yZXBseS51LmxpbmtfYWRk
ci5wb3J0c1tpXS5udW1fc2RwX3N0cmVhbV9zaW5rcyk7Cj4gPiAtCQkJfQo+ID4gKwkJCWRybV9k
cF9kdW1wX2xpbmtfYWRkcmVzcygmdHhtc2ctPnJlcGx5LnUubGlua19hZGRyKTsKPiA+ICAKPiA+
ICAJCQlkcm1fZHBfY2hlY2tfbXN0Yl9ndWlkKG1zdGIsIHR4bXNnLQo+ID4gPnJlcGx5LnUubGlu
a19hZGRyLmd1aWQpOwo+ID4gIAo+ID4gLS0gCj4gPiAyLjIxLjAKPiA+IAotLSAKQ2hlZXJzLAoJ
THl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
