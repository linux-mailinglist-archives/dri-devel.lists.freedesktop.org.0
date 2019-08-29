Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E8A1AFC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 15:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFA96E0F8;
	Thu, 29 Aug 2019 13:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15625898F3;
 Thu, 29 Aug 2019 13:09:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 10so3647027wmp.3;
 Thu, 29 Aug 2019 06:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9c6nSPeDpmBqlBlu+lGqztNaehDXHi5mee3Gc5yRgUY=;
 b=D7jH8qAuMUpRvNJJvCui9w21tv/difL7Q8qy+HkEGWJb94tptcfwALfusEw6qQqL5u
 OB3mJjQ9zQDYwrFXPv2yYq6t/IhX4hxGBufO+CqB99dTD3gDF5mC7aLTM2mlQJBUZrlC
 JwLsOyZOR1qC4JM3eGNB0EciVc5hrhs11Qa2raLjNTJBMDIcO0snJ0vKoTGI1oYMhV5E
 pjLIrfoX7qtAxDTY+wNHX2eFEg6+YcdIvjvPH92qYAchHMjKPCdYPichpydwfJ2PUIbA
 nQhML+GRi3uOsXMZNxEii0+KHFki7CCKBOtOKoFOBNFS+vn8f7i5nlcUrsn1sCvFHaw/
 6GzQ==
X-Gm-Message-State: APjAAAW2Wn4uL8gN2pzF9dmIP+3tjZ1jhKzx9RYthmDw3kvQG3vSZ+iV
 bJM5NckoLZyMOHY/5zhyhlz+EuHOIr4LZMunNidLmQ==
X-Google-Smtp-Source: APXvYqxBM6rseXoqZcQqA9H/79ai0hE5ZTb9VvxiupW46wrEXcE/c+5yqcOHobfk1MTbBVI8SesqL34ttP24qLtVArk=
X-Received: by 2002:a1c:c1cd:: with SMTP id
 r196mr12017142wmf.127.1567084165643; 
 Thu, 29 Aug 2019 06:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190826132216.2823-5-oleg.vasilev@intel.com>
 <20190828142725.GC7482@intel.com>
In-Reply-To: <20190828142725.GC7482@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Aug 2019 09:09:14 -0400
Message-ID: <CADnq5_Omgu7J+3rZjqeQicPbVA0Zopx1mufOb5arLxDNtHnHrg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drm/i915: utilize subconnector property for DP
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9c6nSPeDpmBqlBlu+lGqztNaehDXHi5mee3Gc5yRgUY=;
 b=DsnqYTR1X7pKnep+huDU4smYSbDPFGIo9FVPECtmY3eRzM1AERYuBRy1Uyp4uWT+OT
 M8vRIRhOeBavn1gNi1JSBhwKyROl6fMVI7/18qsYIfYanoYPEIUjAulg6szRfB+uJEoR
 ukgLWw5l55z5tDEP0YoNGNBSULlMCk1SwBhx/XGvPJOSoD4tAwbAZWXtbYA551zMtrG6
 9pRPlXJOv7qvQuI7o7EnNMDkhb2KWQBI67x6m/I8OYVosxKuKoWw07O9HM13ex4IAG5b
 SYGDiwZuOMfMO+U63UhMapCRKswCKdstHePWudos5Bxv1TuDxFPg+y4KF7Lg3y/DsUYn
 EesA==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6MjcgQU0gVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAyNiwgMjAxOSBh
dCAwNDoyMjoxM1BNICswMzAwLCBPbGVnIFZhc2lsZXYgd3JvdGU6Cj4gPiBTaW5jZSBEUC1zcGVj
aWZpYyBpbmZvcm1hdGlvbiBpcyBzdG9yZWQgaW4gZHJpdmVyJ3Mgc3RydWN0dXJlcywgZXZlcnkK
PiA+IGRyaXZlciBuZWVkcyB0byBpbXBsZW1lbnQgc3ViY29ubmVjdG9yIHByb3BlcnR5IGJ5IGl0
c2VsZi4KPiA+Cj4gPiB2MjogdXBkYXRlcyB0byBtYXRjaCBwcmV2aW91cyBjb21taXQgY2hhbmdl
cwo+ID4KPiA+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJv
cmEuY29tPgo+ID4gVGVzdGVkLWJ5OiBPbGVnIFZhc2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBPbGVnIFZhc2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5j
b20+Cj4gPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KPiA+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCA2ICsrKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jCj4gPiBpbmRleCA2ZGE2YTQ4NTlmMDYuLjljOTdlY2U4MDNlYiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4gPiBAQCAt
NTQzNCw2ICs1NDM0LDEwIEBAIGludGVsX2RwX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLAo+ID4gICAgICAgaWYgKHN0YXR1cyAhPSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5l
Y3RlZCAmJiAhaW50ZWxfZHAtPmlzX21zdCkKPiA+ICAgICAgICAgICAgICAgaW50ZWxfZHBfdW5z
ZXRfZWRpZChpbnRlbF9kcCk7Cj4gPgo+ID4gKyAgICAgZHJtX2RwX3NldF9zdWJjb25uZWN0b3Jf
cHJvcGVydHkoY29ubmVjdG9yLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RhdHVzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50ZWxfZHAtPmRwY2QsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnRlbF9kcC0+ZG93bnN0cmVhbV9wb3J0cyk7Cj4gPiAgICAgICByZXR1cm4gc3RhdHVzOwo+
ID4gIH0KPiA+Cj4gPiBAQCAtNjMzMiw2ICs2MzM2LDggQEAgaW50ZWxfZHBfYWRkX3Byb3BlcnRp
ZXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3QKPiA+ICAgICAgIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUo
Y29ubmVjdG9yLT5kZXYpOwo+ID4gICAgICAgZW51bSBwb3J0IHBvcnQgPSBkcF90b19kaWdfcG9y
dChpbnRlbF9kcCktPmJhc2UucG9ydDsKPiA+Cj4gPiArICAgICBkcm1fbW9kZV9hZGRfZHBfc3Vi
Y29ubmVjdG9yX3Byb3BlcnR5KGNvbm5lY3Rvcik7Cj4KPiBNYXliZSBza2lwIHRoaXMgZm9yIGVE
UD8KCk5vdCBzdXJlIGlmIHlvdSBoYXZlIHNvbWV0aGluZyBzaW1pbGFyLCBidXQgdGhlcmUgYXJl
IEFNRCBwbGF0Zm9ybXMKdGhhdCBjb250YWluIGVEUCB0byBMVkRTIGJyaWRnZXMuICBUaGVuIGFn
YWluLCBwcm9iYWJseSBub3QgYSBiaWcgZGVhbApmb3IgdGhlIGxhcHRvcCBwYW5lbC4KCkFsZXgK
Cj4KPiA+ICsKPiA+ICAgICAgIGlmICghSVNfRzRYKGRldl9wcml2KSAmJiBwb3J0ICE9IFBPUlRf
QSkKPiA+ICAgICAgICAgICAgICAgaW50ZWxfYXR0YWNoX2ZvcmNlX2F1ZGlvX3Byb3BlcnR5KGNv
bm5lY3Rvcik7Cj4gPgo+ID4gLS0KPiA+IDIuMjMuMAo+Cj4gLS0KPiBWaWxsZSBTeXJqw6Rsw6QK
PiBJbnRlbAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
