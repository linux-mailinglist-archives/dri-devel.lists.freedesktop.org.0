Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565DEB26CE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 22:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7D26F45F;
	Fri, 13 Sep 2019 20:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4617D6F45F;
 Fri, 13 Sep 2019 20:46:25 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r17so2668742wme.0;
 Fri, 13 Sep 2019 13:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1naGLqCqgdtfdyuJUQJQeSWIGpqB3wRyICj2L5yhDlc=;
 b=GJQeaxJcsz7SFCtR+zrCo0jnEXisFam+1lD1wnTRoxvmuRr9fW6EtuPUwo15PlQIL6
 qtIkp3wS33e2lhwedSy5HmhLqpgLFS1T7K2DcdmKNIebAXd6TuIPNiSy4sDERB9A72jq
 3utfAOLQTi8C8vUKSoA57I2jslQuRhs5Eqb4tcouIP4ZrawgRzFU5G4U3M0jDe4xkC3n
 fmHwitv7nIelBNTWBKTd1BQxeWjHa8KIupari4wiM+x8c1/C4168gASXqnYi69KXzx6J
 LhLNok/Y8Am3VCdgNRbncMfofQxFsDdrRF4+cZdijOdyBPXqXiMxKsTorpQ8p8T91Xi+
 dTcg==
X-Gm-Message-State: APjAAAV9j9xjUe5QXZ2UmhtLqUbQEB/AFIlwuxPx88WcfeAsp1isI1LU
 W4tXrGw9j1hTb3UZICFU8BQ2O/Ls6LDQuS8czW0=
X-Google-Smtp-Source: APXvYqwPDJV3BeybpjpeUW/+FQgCUxp6vErxBChp+BRvrIIWuAY5KAYz2RaPlyIzXkNf0e5VQyrmt2juX/xx6GLlflY=
X-Received: by 2002:a1c:ca0f:: with SMTP id a15mr4870663wmg.102.1568407583804; 
 Fri, 13 Sep 2019 13:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-25-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-25-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Sep 2019 16:46:12 -0400
Message-ID: <CADnq5_NNdGxtpF477Lu3nTMmHJ+EtYJ1bU2vEzaeQLfJjzQjmg@mail.gmail.com>
Subject: Re: [PATCH v2 24/27] drm/amdgpu/dm: Resume short HPD IRQs before
 resuming MST topology
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1naGLqCqgdtfdyuJUQJQeSWIGpqB3wRyICj2L5yhDlc=;
 b=DARbWgGWgYQsaat8eaGaRkAn/auPVWPlTFGGxHsdk9t4WWY+AZ0cL14vZzlkIH4v29
 Q6mn9AGKuPxQMk8JYsya8ud38ltOoYUPhYgm+98lsX/QWLdosseJhlPlZfqsUEMI4uAv
 2131Q/0e0lgx3k4zMHZYMQxNDBAiS6tpwEhfvVJzbJL15PJ38bZWEuLIpaWQV7XhrNdp
 EwBYystF5m8ailktdEQDsymMn84PyXe/WvYqol+/QoxXoNM92sht6DCntyd+uBkCiTG4
 UPBSQx+amuvMgVZYGP2XAce1UmtkCBGC+q0kDzbMkbI0JgcYtLHeTrJUYxQD06zuOsCp
 mbEw==
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
Cc: Leo Li <sunpeng.li@amd.com>, nouveau <nouveau@lists.freedesktop.org>,
 David Francis <David.Francis@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harry Wentland <hwentlan@amd.com>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCA0OjQ5IFBNIEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+IHdyb3RlOgo+Cj4gU2luY2Ugd2UncmUgZ29pbmcgdG8gYmUgcmVwcm9iaW5nIHRoZSBlbnRp
cmUgdG9wb2xvZ3kgc3RhdGUgb24gcmVzdW1lCj4gbm93IHVzaW5nIHNpZGViYW5kIHRyYW5zYWN0
aW9ucywgd2UgbmVlZCB0byBlbnN1cmUgdGhhdCB3ZSBhY3R1YWxseSBoYXZlCj4gc2hvcnQgSFBE
IGlycXMgZW5hYmxlZCBiZWZvcmUgY2FsbGluZyBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9yZXN1
bWUoKS4KPiBTbywgZG8gdGhhdC4KPgo+IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5j
b20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSGFycnkgV2VudGxh
bmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
CkFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwg
NiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwo+IGluZGV4IDczNjMwZTI5NDBkNC4uNGQzYzhiZmY3N2RhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAg
LTExODUsMTUgKzExODUsMTUgQEAgc3RhdGljIGludCBkbV9yZXN1bWUodm9pZCAqaGFuZGxlKQo+
ICAgICAgICAgLyogcHJvZ3JhbSBIUEQgZmlsdGVyICovCj4gICAgICAgICBkY19yZXN1bWUoZG0t
PmRjKTsKPgo+IC0gICAgICAgLyogT24gcmVzdW1lIHdlIG5lZWQgdG8gIHJld3JpdGUgdGhlIE1T
VE0gY29udHJvbCBiaXRzIHRvIGVuYW1ibGUgTVNUKi8KPiAtICAgICAgIHMzX2hhbmRsZV9tc3Qo
ZGRldiwgZmFsc2UpOwo+IC0KPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBlYXJseSBlbmFibGUg
SFBEIFJ4IElSUSwgc2hvdWxkIGJlIGRvbmUgYmVmb3JlIHNldCBtb2RlIGFzIHNob3J0Cj4gICAg
ICAgICAgKiBwdWxzZSBpbnRlcnJ1cHRzIGFyZSB1c2VkIGZvciBNU1QKPiAgICAgICAgICAqLwo+
ICAgICAgICAgYW1kZ3B1X2RtX2lycV9yZXN1bWVfZWFybHkoYWRldik7Cj4KPiArICAgICAgIC8q
IE9uIHJlc3VtZSB3ZSBuZWVkIHRvICByZXdyaXRlIHRoZSBNU1RNIGNvbnRyb2wgYml0cyB0byBl
bmFtYmxlIE1TVCovCj4gKyAgICAgICBzM19oYW5kbGVfbXN0KGRkZXYsIGZhbHNlKTsKPiArCj4g
ICAgICAgICAvKiBEbyBkZXRlY3Rpb24qLwo+ICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9saXN0X2l0
ZXJfYmVnaW4oZGRldiwgJml0ZXIpOwo+ICAgICAgICAgZHJtX2Zvcl9lYWNoX2Nvbm5lY3Rvcl9p
dGVyKGNvbm5lY3RvciwgJml0ZXIpIHsKPiAtLQo+IDIuMjEuMAo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
