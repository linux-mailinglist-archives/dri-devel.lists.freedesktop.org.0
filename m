Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95EB2031A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 12:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7685989220;
	Thu, 16 May 2019 10:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2A489220
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:05:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m3so2520468wrv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 03:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=rWlpYKtsZeAiwuz8JbaiiCznqguZpBsa8vy3O1rV3So=;
 b=f69oxjCw75nC/tYI0Np5u3SkDD/FKYvgGTbjSdyWVaVmV6y4JZ2xRUd10bjZLfREzK
 oNPtLkan+WqniyKgCxT9I+3WgCr4SlxJ01ppeUVR76nI6JpiIOVeW79sFaBRovwU+RuO
 lRnjD1OW9Z/CZaOowSCIsO2FWrLfwRvaizcnq+wAsmiSHBqg3Y1nynD+zotEEBwOIzxR
 tcJ9v7kG38S3HGAD7WuuvBlVL02VOKE9hbw1e3mBzflRey7Af1kZmH5XBuuN4hivZgZc
 F07+p6Ol+FxMVGjr5J17MV6oy6Y3hs9oGgAA66MbUV19F18PR1iygxBVWz/AhPZP5zNR
 bsuw==
X-Gm-Message-State: APjAAAWcg0LySv4KqycGR3rTx5l8pAmx6SBuKYLhMer9aNbr3E205c/g
 MqkYmZNX69egQm1P0CFLlPo=
X-Google-Smtp-Source: APXvYqxo4VaaQ6ANqCy03R2u/JZ+7mW+QD/w6+4cw7VugW+kmG9Esm31idluocVey2DcUjPAmcl3Lw==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr19292592wrq.202.1558001121160; 
 Thu, 16 May 2019 03:05:21 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l18sm4737347wrv.38.2019.05.16.03.05.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 03:05:20 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm, drm/vmwgfx: Use a configuration option for the
 TTM dma page pool
To: Thomas Hellstrom <thellstrom@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190516092251.39351-1-thellstrom@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <26006f21-6ef9-2002-21bf-4ff3d3f8a361@gmail.com>
Date: Thu, 16 May 2019 12:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516092251.39351-1-thellstrom@vmware.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rWlpYKtsZeAiwuz8JbaiiCznqguZpBsa8vy3O1rV3So=;
 b=k+V5ADbrft2i6bvam1XxW/FQHevNbn8dRupXOX6TnhH7p74Elp2TH291Bce1qDnWR6
 E6+v3sp9yQDVugQi9BEAvm69o2MKyB/vK7NRWr9WskMaa+ZuC41FQXcAbQjc+niVldf/
 eBxDBPgXE/nrlq3Em40u2Ncls4I7/SKKCcib31lkAWhiNVzt0x61/WDHydAOrqwHcVyJ
 6cXRz+z9TP1yuRgxe1i7OAeLI4emtVcCQlmgKsvJekb4CisvEpi1SmBifD52idWTAdN2
 /zUTPERWqOg32yATgyLCrEPzk7oOCRaNqTVP3KYvB9IM4SDHdeKcEAgZlnyGQunuTUa5
 CC2A==
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
Reply-To: christian.koenig@amd.com
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDUuMTkgdW0gMTE6MjMgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOgo+IERyaXZlcnMg
bGlrZSB2bXdnZnggbWF5IHdhbnQgdG8gdGVzdCB3aGV0aGVyIHRoZSBkbWEgcGFnZSBwb29sIGlz
IHByZXNlbnQKPiBvciBub3QuIFNpbmNlIGl0J3MgYWN0aXZhdGVkIGJ5IGRlZmF1bHQgYnkgVFRN
IGlmIGNvbXBpbGVkLWluLCBkZWZpbmUgYQo+IGhpZGRlbiBjb25maWd1cmF0aW9uIG9wdGlvbiB0
aGF0IHRoZSBkcml2ZXIgY2FuIHRlc3QgZm9yLgo+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9t
IDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+CgpUaGVyZSBhcmUgYXQgbGVhc3QgYWxzbyBvY2Nhc2lv
bnMgb2YgdGhpcyBpbiByYWRlb24gYW5kIGFtZGdwdSwgYnV0IAp0aG9zZSBjYW4gYmUgY2xlYW5l
ZCB1cCBsYXRlciBvbi4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+IGZvciBub3cuCgpXaGljaCB0cmVlIHNob3VsZCB3ZSB1c2UgZm9yIG1l
cmdpbmc/CgpUaGFua3MsCkNocmlzdGlhbi4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vS2Nv
bmZpZyAgICAgICAgICAgICAgICAgIHwgNSArKysrKwo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS9N
YWtlZmlsZSAgICAgICAgICAgICB8IDQgKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cGFnZV9hbGxvY19kbWEuYyB8IDMgLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuYyAgICAgIHwgMyArLS0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5o
ICAgICAgICAgfCAyICstCj4gICA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2Ry
aXZlcnMvZ3B1L2RybS9LY29uZmlnCj4gaW5kZXggMjI2N2U4NGQ1Y2I0Li5mNzMzYTkyNzNiM2Yg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZwo+IEBAIC0xNjAsNiArMTYwLDExIEBAIGNvbmZpZyBEUk1fVFRNCj4gICAJ
ICBHUFUgbWVtb3J5IHR5cGVzLiBXaWxsIGJlIGVuYWJsZWQgYXV0b21hdGljYWxseSBpZiBhIGRl
dmljZSBkcml2ZXIKPiAgIAkgIHVzZXMgaXQuCj4gICAKPiArY29uZmlnIERSTV9UVE1fRE1BX1BB
R0VfUE9PTAo+ICsgICAgICAgIGJvb2wKPiArCWRlcGVuZHMgb24gRFJNX1RUTSAmJiAoU1dJT1RM
QiB8fCBJTlRFTF9JT01NVSkKPiArCWRlZmF1bHQgeQo+ICsKPiAgIGNvbmZpZyBEUk1fR0VNX0NN
QV9IRUxQRVIKPiAgIAlib29sCj4gICAJZGVwZW5kcyBvbiBEUk0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3R0bS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS90dG0vTWFrZWZpbGUK
PiBpbmRleCAwMWZjNjcwY2U3YTIuLmNhZWEyYTA5OTQ5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS9NYWtlZmls
ZQo+IEBAIC00LDggKzQsOCBAQAo+ICAgCj4gICB0dG0teSA6PSB0dG1fbWVtb3J5Lm8gdHRtX3R0
Lm8gdHRtX2JvLm8gXAo+ICAgCXR0bV9ib191dGlsLm8gdHRtX2JvX3ZtLm8gdHRtX21vZHVsZS5v
IFwKPiAtCXR0bV9leGVjYnVmX3V0aWwubyB0dG1fcGFnZV9hbGxvYy5vIHR0bV9ib19tYW5hZ2Vy
Lm8gXAo+IC0JdHRtX3BhZ2VfYWxsb2NfZG1hLm8KPiArCXR0bV9leGVjYnVmX3V0aWwubyB0dG1f
cGFnZV9hbGxvYy5vIHR0bV9ib19tYW5hZ2VyLm8KPiAgIHR0bS0kKENPTkZJR19BR1ApICs9IHR0
bV9hZ3BfYmFja2VuZC5vCj4gK3R0bS0kKENPTkZJR19EUk1fVFRNX0RNQV9QQUdFX1BPT0wpICs9
IHR0bV9wYWdlX2FsbG9jX2RtYS5vCj4gICAKPiAgIG9iai0kKENPTkZJR19EUk1fVFRNKSArPSB0
dG0ubwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2Rt
YS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYwo+IGluZGV4IGQ1
OTRmNzUyMGI3Yi4uOThkMTAwZmQxNTk5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9w
YWdlX2FsbG9jX2RtYS5jCj4gQEAgLTMzLDcgKzMzLDYgQEAKPiAgICAqICAgd2hlbiBmcmVlZCku
Cj4gICAgKi8KPiAgIAo+IC0jaWYgZGVmaW5lZChDT05GSUdfU1dJT1RMQikgfHwgZGVmaW5lZChD
T05GSUdfSU5URUxfSU9NTVUpCj4gICAjZGVmaW5lIHByX2ZtdChmbXQpICJbVFRNXSAiIGZtdAo+
ICAgCj4gICAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiBAQCAtMTIzNCw1ICsxMjMz
LDMgQEAgaW50IHR0bV9kbWFfcGFnZV9hbGxvY19kZWJ1Z2ZzKHN0cnVjdCBzZXFfZmlsZSAqbSwg
dm9pZCAqZGF0YSkKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKHR0
bV9kbWFfcGFnZV9hbGxvY19kZWJ1Z2ZzKTsKPiAtCj4gLSNlbmRpZgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5jCj4gaW5kZXggZDU5YzQ3NGJlMzhlLi5iYzI1OWQ0ZGYxY2IgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwo+IEBAIC01NzIsOCArNTcyLDcgQEAgc3Rh
dGljIGludCB2bXdfZG1hX3NlbGVjdF9tb2RlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYp
Cj4gICAJZWxzZQo+ICAgCQlkZXZfcHJpdi0+bWFwX21vZGUgPSB2bXdfZG1hX21hcF9wb3B1bGF0
ZTsKPiAgIAo+IC0JLyogTm8gVFRNIGNvaGVyZW50IHBhZ2UgcG9vbD8gRklYTUU6IEFzayBUVE0g
aW5zdGVhZCEgKi8KPiAtICAgICAgICBpZiAoIShJU19FTkFCTEVEKENPTkZJR19TV0lPVExCKSB8
fCBJU19FTkFCTEVEKENPTkZJR19JTlRFTF9JT01NVSkpICYmCj4gKyAgICAgICAgaWYgKCFJU19F
TkFCTEVEKENPTkZJR19EUk1fVFRNX0RNQV9QQUdFX1BPT0wpICYmCj4gICAJICAgIChkZXZfcHJp
di0+bWFwX21vZGUgPT0gdm13X2RtYV9hbGxvY19jb2hlcmVudCkpCj4gICAJCXJldHVybiAtRUlO
VkFMOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5o
IGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmgKPiBpbmRleCA0ZDliMDE5ZDI1M2Mu
LmE2YjZlZjVmOWJmNCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX3BhZ2VfYWxs
b2MuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5oCj4gQEAgLTc0LDcg
Kzc0LDcgQEAgdm9pZCB0dG1fdW5tYXBfYW5kX3VucG9wdWxhdGVfcGFnZXMoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgdHRtX2RtYV90dCAqdHQpOwo+ICAgICovCj4gICBpbnQgdHRtX3BhZ2Vf
YWxsb2NfZGVidWdmcyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpOwo+ICAgCj4gLSNp
ZiBkZWZpbmVkKENPTkZJR19TV0lPVExCKSB8fCBkZWZpbmVkKENPTkZJR19JTlRFTF9JT01NVSkK
PiArI2lmIGRlZmluZWQoQ09ORklHX0RSTV9UVE1fRE1BX1BBR0VfUE9PTCkKPiAgIC8qKgo+ICAg
ICogSW5pdGlhbGl6ZSBwb29sIGFsbG9jYXRvci4KPiAgICAqLwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
