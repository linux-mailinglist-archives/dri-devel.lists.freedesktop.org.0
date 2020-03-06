Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C0317C19E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 16:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDDC6ED3B;
	Fri,  6 Mar 2020 15:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227596ED3B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 15:22:38 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id b3so2759999otp.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 07:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bCjzKZ7+I6+x4//xv/nN4+O6KAQFADMaGG+Rt99rveQ=;
 b=lj/G8xYc45fHZ/MB7s+2i7AtkLX/4MDNzUlLjEFTHnZDDLO+JZ0ivg9L02OAdwHLL2
 ZelUaYqNLowNNi517mRldZnf0eCcNsIRrC8C1tF5UuOyEFCXg6Zr40gfU437g7sYM0qj
 c/6C6u75E9wuPpKVT6SjiWEWiWE5pOLd7MLa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bCjzKZ7+I6+x4//xv/nN4+O6KAQFADMaGG+Rt99rveQ=;
 b=UiYp3OumkYRTN/lgcQO7ipK7JKfZfiMX54cVV1lN8FlZhjjwzaFIsxZbXwWqtAmblF
 As3hI/8m7dIlsDPeFVilJagl5+lLzs/HgzBrkvp4tRTN+KOc4HkvkhtLEj75QqhlUhZx
 67opwTe8GopZmUHj7wpjeU6YF3kxCDhSMbJWMd1LzKUNKiT+m79+Pxmq4O6+vfEANQhe
 W8pTnfh2V5DEm5fA94LnJHrRzUZILCn8DreWTO08huE7ybbE2Bh2vnodUQ6HsGcENBa3
 KK2Gg5aNl/lsnsY/HGBLCBppjKkecQi+lbbrIQTx0FtxL/DOO9AwiPSCnLNeuK6199Qs
 yqNg==
X-Gm-Message-State: ANhLgQ0hZxDNu1EfOce7b2rcwBUoHNmvNCmYvAlsZDeUKQmH1erT+kAG
 qvPa09tGh72f37GW2Yru3hKUaMXohPvILABrnNtP5VNb
X-Google-Smtp-Source: ADFU+vuIPLhut/Y0lPRXkhZmCKEZkVu+ZgLer/55/2fOfZpsIdZzC+43LDZg+K/h0GccfvjZn2Z6CGZOfcViVyXC0rY=
X-Received: by 2002:a9d:6256:: with SMTP id i22mr2928636otk.106.1583508156988; 
 Fri, 06 Mar 2020 07:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20180619155011.11721-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20180619155011.11721-1-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 6 Mar 2020 16:22:26 +0100
Message-ID: <CAKMK7uGSmurEuUJ4DGo3qiDMWgOCnBBrFDciyjjCqUbJrG-iGQ@mail.gmail.com>
Subject: Re: [PATCH] RFC: drm/atomic-helpers: remove legacy_cursor_update hacks
To: DRI Development <dri-devel@lists.freedesktop.org>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, mikita.lipski@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTksIDIwMTggYXQgNTo1MCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IFRoZSBzdHVmZiBuZXZlciByZWFsbHkgd29ya2VkLCBh
bmQgbGVhZHMgdG8gbG90cyBvZiBmdW4gYmVjYXVzZSBpdAo+IG91dC1vZi1vcmRlciBmcmVlcyBh
dG9taWMgc3RhdGVzLiBXaGljaCB1cHNldHMgS0FTQU4sIGFtb25nIG90aGVyCj4gdGhpbmdzLgo+
Cj4gRm9yIGFzeW5jIHVwZGF0ZXMgd2Ugbm93IGhhdmUgYSBtb3JlIHNvbGlkIHNvbHV0aW9uIHdp
dGggdGhlCj4gLT5hdG9taWNfYXN5bmNfY2hlY2sgYW5kIC0+YXRvbWljX2FzeW5jX2NvbW1pdCBo
b29rcy4gU3VwcG9ydCBmb3IgdGhhdAo+IGZvciBtc20gYW5kIHZjNCBsYW5kZWQuIG5vdXZlYXUg
YW5kIGk5MTUgaGF2ZSB0aGVpciBvd24gY29tbWl0Cj4gcm91dGluZXMsIGRvaW5nIHNvbWV0aGlu
ZyBzaW1pbGFyLgo+Cj4gRm9yIGV2ZXJ5b25lIGVsc2UgaXQncyBwcm9iYWJseSBiZXR0ZXIgdG8g
cmVtb3ZlIHRoZSB1c2UtYWZ0ZXItZnJlZQo+IGJ1ZywgYW5kIGVuY291cmFnZSBmb2xrcyB0byB1
c2UgdGhlIGFzeW5jIHN1cHBvcnQgaW5zdGVhZC4gVGhlCj4gYWZmZWN0ZWQgZHJpdmVycyB3aGlj
aCByZWdpc3RlciBhIGxlZ2FjeSBjdXJzb3IgcGxhbmUgYW5kIGRvbid0IGVpdGhlcgo+IHVzZSB0
aGUgbmV3IGFzeW5jIHN0dWZmIG9yIHRoZWlyIG93biBjb21taXQgcm91dGluZSBhcmU6IGFtZGdw
dSwKPiBhdG1lbCwgbWVkaWF0ZWssIHF4bCwgcm9ja2NoaXAsIHN0aSwgc3VuNGksIHRlZ3JhLCB2
aXJ0aW8sIGFuZCB2bXdnZnguCj4KPiBJbnNwaXJlZCBieSBhbiBhbWRncHUgYnVnIHJlcG9ydC4K
Pgo+IFJlZmVyZW5jZXM6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MTk5NDI1Cj4gQ2M6IG1pa2l0YS5saXBza2lAYW1kLmNvbQo+IENjOiBNaWNoZWwgRMOkbnpl
ciA8bWljaGVsQGRhZW56ZXIubmV0Pgo+IENjOiBoYXJyeS53ZW50bGFuZEBhbWQuY29tCj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpBbnkg
Y29tbWVudHMgb24gdGhpcyBmcm9tIGFtZCdzIHNpZGU/Ci1EYW5pZWwKCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jIHwgMTMgLS0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxw
ZXIuYwo+IGluZGV4IDEzMGRhNTE5NWYzYi4uNWE1NzZjZGYyNmRkIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWNfaGVscGVyLmMKPiBAQCAtMTMzMCwxMyArMTMzMCw2IEBAIGRybV9hdG9taWNf
aGVscGVyX3dhaXRfZm9yX3ZibGFua3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgICAgICAg
IGludCBpLCByZXQ7Cj4gICAgICAgICB1bnNpZ25lZCBjcnRjX21hc2sgPSAwOwo+Cj4gLSAgICAg
ICAgLyoKPiAtICAgICAgICAgKiBMZWdhY3kgY3Vyc29yIGlvY3RscyBhcmUgY29tcGxldGVseSB1
bnN5bmNlZCwgYW5kIHVzZXJzcGFjZQo+IC0gICAgICAgICAqIHJlbGllcyBvbiB0aGF0IChieSBk
b2luZyB0b25zIG9mIGN1cnNvciB1cGRhdGVzKS4KPiAtICAgICAgICAgKi8KPiAtICAgICAgIGlm
IChvbGRfc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlKQo+IC0gICAgICAgICAgICAgICByZXR1
cm47Cj4gLQo+ICAgICAgICAgZm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3RhdGUob2xkX3N0YXRl
LCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwgbmV3X2NydGNfc3RhdGUsIGkpIHsKPiAgICAgICAgICAg
ICAgICAgaWYgKCFuZXdfY3J0Y19zdGF0ZS0+YWN0aXZlKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwo+IEBAIC0xODg0LDEyICsxODc3LDYgQEAgaW50IGRybV9hdG9taWNfaGVs
cGVyX3NldHVwX2NvbW1pdChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gICAgICAgICAgICAgICAgIH0KPgo+IC0gICAg
ICAgICAgICAgICAvKiBMZWdhY3kgY3Vyc29yIHVwZGF0ZXMgYXJlIGZ1bGx5IHVuc3luY2VkLiAq
Lwo+IC0gICAgICAgICAgICAgICBpZiAoc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlKSB7Cj4g
LSAgICAgICAgICAgICAgICAgICAgICAgY29tcGxldGVfYWxsKCZjb21taXQtPmZsaXBfZG9uZSk7
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gLSAgICAgICAgICAgICAgIH0K
PiAtCj4gICAgICAgICAgICAgICAgIGlmICghbmV3X2NydGNfc3RhdGUtPmV2ZW50KSB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgY29tbWl0LT5ldmVudCA9IGt6YWxsb2Moc2l6ZW9mKCpjb21t
aXQtPmV2ZW50KSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBHRlBfS0VSTkVMKTsKPiAtLQo+IDIuMTguMC5yYzIKPgoKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0
OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
