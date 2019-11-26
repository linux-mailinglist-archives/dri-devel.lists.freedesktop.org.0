Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953310A037
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9826D6E3FC;
	Tue, 26 Nov 2019 14:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4946E3E1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 14:26:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n5so3564362wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 06:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=hDBMx84MNQ4JO1hOAPTWtTE8IwzW6f/UIE56/wZs544=;
 b=gg1s+3Ix1KFWRyDEjTc5WkH98gqvusPcJOc82La0yNKUJsPoMqLTYE0ksV+HVjXh8B
 KJX18osuzK8ra4EE0Gxw8XUaNVHYjjzQt7xw5rDIE+IenchDOjQ93q1Nd1Wl6/4VFoA1
 0AraWMu3Cuzz73qd8lAie5IhqiHMkqQAm0KhwBKoBNJmILBHaEJ0KzRUas6yRcM7UjIW
 E6kXslcRCDukweK1VKb9X/f4i1kA2+XxXFDRvEKVSQf0Mi0H48dWn2e8UoMMsWW3AXFk
 5EiA2oEfmxVdssiDp8RMCF175NbAtBWvajmCPjivdtBmtCqwjznNxm39V/vb6P/RhEd7
 S3dg==
X-Gm-Message-State: APjAAAWcxOAro33xJXGlwIbL9g9yiKDhDXKgaXTGzSLDOEpAhT66keQg
 RjRg/KrDQbok2bNpz5jChPtAUA==
X-Google-Smtp-Source: APXvYqw3mMqV/EKHUOc8n4CFqdLeiNZt0HctyQ9zHZyM94EzbolvWs2Jy8VO1O3B47x0kHSq8nFgKg==
X-Received: by 2002:a1c:ca:: with SMTP id 193mr4532398wma.111.1574778373388;
 Tue, 26 Nov 2019 06:26:13 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j10sm14979375wrx.30.2019.11.26.06.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 06:26:12 -0800 (PST)
Date: Tue, 26 Nov 2019 15:26:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH 01/30] drm: Introduce drm_bridge_init()
Message-ID: <20191126142610.GV29965@phenom.ffwll.local>
Mail-Followup-To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126131541.47393-2-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126131541.47393-2-mihail.atanassov@arm.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hDBMx84MNQ4JO1hOAPTWtTE8IwzW6f/UIE56/wZs544=;
 b=ckigHzDJM2lagyXYX15JNGg4QSX3se9I/QNfqOg+vB//dBNRthqtxEyOZJjEelqAng
 GySlW0UuMvc7r+pIVgtzr83Wsngpci+bO1KR5nFd2PgFsWbcKGZ0TcdLsdTIA9RRBaWs
 hMwjTMprb4aeW3Q/dFVa5lBxDSViMoulM9PV0=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDE6MTU6NTlQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBBIHNpbXBsZSBjb252ZW5pZW5jZSBmdW5jdGlvbiB0byBpbml0aWFsaXplIHRo
ZSBzdHJ1Y3QgZHJtX2JyaWRnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292
IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+CgpUaGUgY29tbWl0IG1lc3NhZ2UgaGVyZSBsZWF2
ZXMgZmlndXJpbmcgb3V0IHdoeSB3ZSBuZWVkIHRoaXMgdG8gdGhlCnJlYWRlci4gUmVhZGluZyBh
aGVhZCB0aGUgcmVhc29ucyBzZWVtcyB0byBiZSB0byByb2xsIG91dCBicmlkZ2UtPmRldgpzZXR0
aW5nIGZvciBldmVyeW9uZSwgc28gdGhhdCB3ZSBjYW4gc2V0IHRoZSBkZXZpY2VfbGluay4gUGxl
YXNlIGV4cGxhaW4KdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugc28gdGhlIHBhdGNoIGlzIHBy
b3Blcmx5IG1vdGl2YXRlZC4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMg
fCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2RybS9kcm1fYnJp
ZGdlLmggICAgIHwgIDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYnJpZGdlLmMKPiBpbmRleCBjYmE1MzdjOTllNDMuLmNiZTY4MGFhNmVhYyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+IEBAIC04OSw2ICs4OSwzNSBAQCB2b2lkIGRybV9icmlk
Z2VfcmVtb3ZlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIH0KPiAgRVhQT1JUX1NZTUJP
TChkcm1fYnJpZGdlX3JlbW92ZSk7Cj4gIAo+ICsvKioKPiArICogZHJtX2JyaWRnZV9pbml0IC0g
aW5pdGlhbGlzZSBhIGRybV9icmlkZ2Ugc3RydWN0dXJlCj4gKyAqCj4gKyAqIEBicmlkZ2U6IGJy
aWRnZSBjb250cm9sIHN0cnVjdHVyZQo+ICsgKiBAZnVuY3M6IGNvbnRyb2wgZnVuY3Rpb25zCj4g
KyAqIEBkZXY6IGRldmljZQo+ICsgKiBAdGltaW5nczogdGltaW5nIHNwZWNpZmljYXRpb24gZm9y
IHRoZSBicmlkZ2U7IG9wdGlvbmFsIChtYXkgYmUgTlVMTCkKPiArICogQGRyaXZlcl9wcml2YXRl
OiBwb2ludGVyIHRvIHRoZSBicmlkZ2UgZHJpdmVyIGludGVybmFsIGNvbnRleHQgKG1heSBiZSBO
VUxMKQoKUGxlYXNlIGFsc28gc3ByaW5rbGUgc29tZSBsaW5rcyB0byB0aGlzIG5ldyBmdW5jdGlv
biB0byByZWxldmFudCBwbGFjZXMsCkknZCBhZGQgYXQgbGVhc3Q6CgoiRHJpdmVycyBzaG91bGQg
Y2FsbCBkcm1fYnJpZGdlX2luaXQoKSBmaXJzdC4iIHRvIHRoZSBrZXJuZWxkb2MgZm9yCmRybV9i
cmlkZ2VfYWRkLiBkcm1fYnJpZGdlX2FkZCBzaG91bGQgYWxzbyBtZW50aW9uIGRybV9icmlkZ2Vf
cmVtb3ZlIGFzCnRoZSB1bmRvIGZ1bmN0aW9uLgoKQW5kIHBlcmhhcHMgYSBsb25nZXIgcGFyYWdy
YXBoIHRvICZzdHJ1Y3QgZHJtX2JyaWRnZToKCiJCcmlkZ2UgZHJpdmVycyBzaG91bGQgY2FsbCBk
cm1fYnJpZGdlX2luaXQoKSB0byBpbml0aWFsaXplZCBhIGJyaWRnZQpkcml2ZXIsIGFuZCB0aGVu
IHJlZ2lzdGVyIGl0IHdpdGggZHJtX2JyaWRnZV9hZGQoKS4KCiJVc2VycyBvZiBicmlkZ2VzIGxp
bmsgYSBicmlkZ2UgZHJpdmVyIGludG8gdGhlaXIgb3ZlcmFsbCBkaXNwbGF5IG91dHB1dApwaXBl
bGluZSBieSBjYWxsaW5nIGRybV9icmlkZ2VfYXR0YWNoKCkuIgoKPiArICovCj4gK3ZvaWQgZHJt
X2JyaWRnZV9pbml0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsIHN0cnVjdCBkZXZpY2UgKmRl
diwKPiArCQkgICAgIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzICpmdW5jcywKPiArCQkg
ICAgIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3MgKnRpbWluZ3MsCj4gKwkJICAgICB2
b2lkICpkcml2ZXJfcHJpdmF0ZSkKPiArewo+ICsJV0FSTl9PTighZnVuY3MpOwo+ICsKPiArCWJy
aWRnZS0+ZGV2ID0gTlVMTDsKCkdpdmVuIHRoYXQgdGhlIGdvYWwgaGVyZSBpcyB0byBnZXQgYnJp
ZGdlLT5kZXYgc2V0IHVwLCB3aHkgbm90CgoJV0FSTl9PTighZGV2KTsKCWJyaWRnZS0+ZGV2ID0g
ZGV2OwoKVGhhdCBzaG91bGQgaGVscCB1cyB0byByZWFsbHkgbW92ZSBmb3J3YXJkIHdpdGggYWxs
IHRoaXMuCi1EYW5pZWwKCj4gKwlicmlkZ2UtPmVuY29kZXIgPSBOVUxMOwo+ICsJYnJpZGdlLT5u
ZXh0ID0gTlVMTDsKPiArCj4gKyNpZmRlZiBDT05GSUdfT0YKPiArCWJyaWRnZS0+b2Zfbm9kZSA9
IGRldi0+b2Zfbm9kZTsKPiArI2VuZGlmCj4gKwlicmlkZ2UtPnRpbWluZ3MgPSB0aW1pbmdzOwo+
ICsJYnJpZGdlLT5mdW5jcyA9IGZ1bmNzOwo+ICsJYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZSA9IGRy
aXZlcl9wcml2YXRlOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtX2JyaWRnZV9pbml0KTsKPiAr
Cj4gIC8qKgo+ICAgKiBkcm1fYnJpZGdlX2F0dGFjaCAtIGF0dGFjaCB0aGUgYnJpZGdlIHRvIGFu
IGVuY29kZXIncyBjaGFpbgo+ICAgKgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYnJp
ZGdlLmggYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiBpbmRleCBjMGEyMjg2YTgxZTkuLmQ2
ZDlkNTMwMTU1MSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiBAQCAtNDAyLDYgKzQwMiwxMCBAQCBzdHJ1Y3Qg
ZHJtX2JyaWRnZSB7Cj4gIAo+ICB2b2lkIGRybV9icmlkZ2VfYWRkKHN0cnVjdCBkcm1fYnJpZGdl
ICpicmlkZ2UpOwo+ICB2b2lkIGRybV9icmlkZ2VfcmVtb3ZlKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UpOwo+ICt2b2lkIGRybV9icmlkZ2VfaW5pdChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
LCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJICAgICBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9m
dW5jcyAqZnVuY3MsCj4gKwkJICAgICBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV90aW1pbmdzICp0
aW1pbmdzLAo+ICsJCSAgICAgdm9pZCAqZHJpdmVyX3ByaXZhdGUpOwo+ICBzdHJ1Y3QgZHJtX2Jy
aWRnZSAqb2ZfZHJtX2ZpbmRfYnJpZGdlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOwo+ICBpbnQg
ZHJtX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBzdHJ1Y3QgZHJt
X2JyaWRnZSAqYnJpZGdlLAo+ICAJCSAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpwcmV2aW91cyk7
Cj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
