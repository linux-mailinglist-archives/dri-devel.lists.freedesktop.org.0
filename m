Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DAB2A7A28
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 10:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D216E9F3;
	Thu,  5 Nov 2020 09:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D456EA08
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:11:41 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id k3so759922otp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 01:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lrwMs8oqu1qrdjQfi569xLy0a3yse6a6JcZztrnvVj8=;
 b=d7FHlCyBsEzyqD/YDKgadOAy80Ri9wg2ottFq/7d1SucMmOqQ7097qqNiPJ7uvr9vH
 xAEunxE++j+IROHiQv+qB4mm0k4QR2dYzSOlcnoueUYBjRy4glZXuzjYtB0OGL+uodcJ
 zAWQQ5Qvo6Bs6+HGg8q7AwQYJI3nM6QPiSxao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lrwMs8oqu1qrdjQfi569xLy0a3yse6a6JcZztrnvVj8=;
 b=OyST782zKXJnhohQC+hcMmSQo97l6i09iwPjNwSkOGZcbrhuvarEEXQEH76ufdwpOj
 Wdi5hP3+wH4ON2/fW3ZOI8ELMyRdupo9xT6+oVN47ot3GpoIHZBYz6sLiyDDWfX/Zn1T
 Sp/IzAdorkRhDKRVAE10JV2ej/cEaiVZfwR1gn3byM34zo49AQz0gkJB0okuPzvnqBi6
 YT+0p9hi26FPHvk9pLvAJoZXV6DvbwMgPEVc/CJ0SpOlr8IoFRzc8Oqql+7jhfZ1LhkC
 9w4D8VUsvhkpExo0KRmDpyFuQ78DYp1xZU4eDuhpTZuVtkoo9EQxwNeUc4hhySELxU2Y
 7O1A==
X-Gm-Message-State: AOAM531S3mKOy66/T3cHcRK/CwcNEfrza94lyy/Lv7cWr66MJ/5vqh1V
 G7yE/e8O5+/UzoProtiMEAsWxQr8CewyXyze75Df1A==
X-Google-Smtp-Source: ABdhPJzL4ASdz7dYFP+/uCqw6KEvSuxxufFXyCQerlKJ00yRdQxNf6MWIo5zbfzHtfdnsceOJxBBXCgyoqyuCE9/ny4=
X-Received: by 2002:a9d:3b4:: with SMTP id f49mr1109786otf.188.1604567500823; 
 Thu, 05 Nov 2020 01:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
 <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
In-Reply-To: <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 5 Nov 2020 10:11:29 +0100
Message-ID: <CAKMK7uGA3URvu3BUzs617sGS_TchHDhpzzgsMGrVVJtwBpD+Vw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 Thomas Hellstrom <thellstrom@vmware.com>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgNSwgMjAyMCBhdCA5OjAwIEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBbSAwNC4xMS4yMCB1bSAxNzo1MCBzY2hyaWVi
IERhbmllbCBWZXR0ZXI6Cj4gPiBSYW5kb20gb2JzZXJ2YXRpb24gd2hpbGUgdHJ5aW5nIHRvIHJl
dmlldyBDaHJpc3RpYW4ncyBwYXRjaCBzZXJpZXMgdG8KPiA+IHN0b3AgbG9va2luZyBhdCBzdHJ1
Y3QgcGFnZSBmb3IgZG1hLWJ1ZiBpbXBvcnRzLgo+ID4KPiA+IFRoaXMgd2FzIG9yaWdpbmFsbHkg
YWRkZWQgaW4KPiA+Cj4gPiBjb21taXQgNThhYTY2MjJkMzJhZjdkMmMwOGQ0NTA4NWY0NGM1NDU1
NGExNmVkNwo+ID4gQXV0aG9yOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5j
b20+Cj4gPiBEYXRlOiAgIEZyaSBKYW4gMyAxMTo0NzoyMyAyMDE0ICswMTAwCj4gPgo+ID4gICAg
ICBkcm0vdHRtOiBDb3JyZWN0bHkgc2V0IHBhZ2UgbWFwcGluZyBhbmQgLWluZGV4IG1lbWJlcnMK
PiA+Cj4gPiAgICAgIE5lZWRlZCBmb3Igc29tZSB2bSBvcGVyYXRpb25zOyBtb3N0IG5vdGFibHkg
dW5tYXBfbWFwcGluZ19yYW5nZSgpIHdpdGgKPiA+ICAgICAgZXZlbl9jb3dzID0gMC4KPiA+Cj4g
PiAgICAgIFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJl
LmNvbT4KPiA+ICAgICAgUmV2aWV3ZWQtYnk6IEJyaWFuIFBhdWwgPGJyaWFucEB2bXdhcmUuY29t
Pgo+ID4KPiA+IGJ1dCB3ZSBkbyBub3QgaGF2ZSBhIHNpbmdsZSBjYWxsZXIgb2YgdW5tYXBfbWFw
cGluZ19yYW5nZSB3aXRoCj4gPiBldmVuX2Nvd3MgPT0gMC4gQW5kIGFsbCB0aGUgZ2VtIGRyaXZl
cnMgZG9uJ3QgZG8gdGhpcywgc28gYW5vdGhlcgo+ID4gc21hbGwgdGhpbmcgd2UgY291bGQgc3Rh
bmRhcmRpemUgYmV0d2VlbiBkcm0gYW5kIHR0bSBkcml2ZXJzLgo+ID4KPiA+IFBsdXMgSSBkb24n
dCByZWFsbHkgc2VlIGEgbmVlZCBmb3IgdW5hbXBfbWFwcGluZ19yYW5nZSB3aGVyZSB3ZSBkb24n
dAo+ID4gd2FudCB0byBpbmRpc2NyaW1pbmF0ZWx5IHNob290IGRvd24gYWxsIHB0ZXMuCj4KPiBO
QUssIHdlIHVzZSB0aGlzIHRvIGRldGVybWluZSBpZiBhIHBhZ2VzIGJlbG9uZ3MgdG8gdGhlIGRy
aXZlciBvciBub3QgaW4KPiBhbWRncHUgZm9yIGV4YW1wbGUuCj4KPiBNb3N0bHkgdXNlZCBmb3Ig
ZGVidWdnaW5nLCBidXQgSSB3b3VsZCByZWFsbHkgbGlrZSB0byBrZWVwIHRoYXQuCgpDYW4geW91
IHBscyBwb2ludCBtZSBhdCB0aGF0IGNvZGU/IEEgcXVpY2sgZ3JlcCBoYXNuJ3QgcmVhbGx5IGZv
dW5kIG11Y2ggYXQgYWxsLgotRGFuaWVsCgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gPgo+ID4gQ2M6IFRo
b21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiA+IENjOiBCcmlhbiBQYXVs
IDxicmlhbnBAdm13YXJlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiA+IENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+
ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgfCAxMiAtLS0tLS0tLS0t
LS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fdHQuYwo+ID4gaW5kZXggODg2MWE3NGFjMzM1Li40MzhlYTQzZmQ4YzEgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV90dC5jCj4gPiBAQCAtMjkxLDE3ICsyOTEsNiBAQCBpbnQgdHRtX3R0X3N3YXBv
dXQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQgKnR0bSkKPiA+ICAg
ICAgIHJldHVybiByZXQ7Cj4gPiAgIH0KPiA+Cj4gPiAtc3RhdGljIHZvaWQgdHRtX3R0X2FkZF9t
YXBwaW5nKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dG0pCj4g
PiAtewo+ID4gLSAgICAgcGdvZmZfdCBpOwo+ID4gLQo+ID4gLSAgICAgaWYgKHR0bS0+cGFnZV9m
bGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpCj4gPiAtICAgICAgICAgICAgIHJldHVybjsKPiA+IC0K
PiA+IC0gICAgIGZvciAoaSA9IDA7IGkgPCB0dG0tPm51bV9wYWdlczsgKytpKQo+ID4gLSAgICAg
ICAgICAgICB0dG0tPnBhZ2VzW2ldLT5tYXBwaW5nID0gYmRldi0+ZGV2X21hcHBpbmc7Cj4gPiAt
fQo+ID4gLQo+ID4gICBpbnQgdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LAo+ID4gICAgICAgICAgICAgICAgICAgc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRt
X29wZXJhdGlvbl9jdHggKmN0eCkKPiA+ICAgewo+ID4gQEAgLTMyMCw3ICszMDksNiBAQCBpbnQg
dHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ID4gICAgICAgaWYg
KHJldCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Cj4gPiAtICAgICB0dG1fdHRf
YWRkX21hcHBpbmcoYmRldiwgdHRtKTsKPiA+ICAgICAgIHR0bS0+cGFnZV9mbGFncyB8PSBUVE1f
UEFHRV9GTEFHX1BSSVZfUE9QVUxBVEVEOwo+ID4gICAgICAgaWYgKHVubGlrZWx5KHR0bS0+cGFn
ZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCkpIHsKPiA+ICAgICAgICAgICAgICAgcmV0
ID0gdHRtX3R0X3N3YXBpbih0dG0pOwo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
