Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56618D42
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 17:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4E789DE1;
	Thu,  9 May 2019 15:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD0189DDD;
 Thu,  9 May 2019 15:44:34 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id s4so1727556vsl.2;
 Thu, 09 May 2019 08:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RcBYHFb2VRl+G/ml3PE5KyX4Y2ArNtemhuBC2yVI+N8=;
 b=dtWmshVAdg/7HEhT/m76BQkvoBhrUaZYjhxQwKXA6ohLw9VrzY82kAqZSu5Wvq4oOH
 d9MtrJMyEK+9NBZ1WvaHTQXb9TypSzCa5CIzecLvlksFddlNVFF5xexy4gwVqIznd+bP
 AFK1mxh9JO6dd2AOA3Lu4T2mYfDlAH/2nGiLrqDSMFep5KrvUctt6Mykc/I1MB7T5wXR
 VTQb9R2Sog+xFg5FtVzjTY4fBpPO+4g0vqLbnx8KHLLp0YjMK+jEFe9KGJw5hiaE82wJ
 9Rl/YjGtFoE0mfzGq8IlivQi3O/0hj3e1SQiE+hbKTloLrAabixxh5XGfNEQ29xlfF+g
 XU5Q==
X-Gm-Message-State: APjAAAVyRzhvDncI/asF9Hmw3QWB5NzqAHG9KpRo+GynF2ouxz+b0JRg
 zWsq/FBvB0eEpiu4Pn5Fjt8JsLX52GWs08rJ0ic=
X-Google-Smtp-Source: APXvYqyIfckGvSZPt6GVquhDgP/SJhQm82pPsCtjomPTm9avhaGajfjptH9iuJX9amyLt9fy4EOTmVkwFbBf+wDb/jw=
X-Received: by 2002:a67:f554:: with SMTP id z20mr2829383vsn.143.1557416673764; 
 Thu, 09 May 2019 08:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
 <1557256691-25798-3-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1557256691-25798-3-git-send-email-jcrouse@codeaurora.org>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Thu, 9 May 2019 08:44:22 -0700
Message-ID: <CAOeoa-dcVkFRHztX6NxPPJ6=By55sgM=q3qOEjNKfP2wrsq2tA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: Avoid a null de-ref while
 recovering from kms init fail
To: Jordan Crouse <jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RcBYHFb2VRl+G/ml3PE5KyX4Y2ArNtemhuBC2yVI+N8=;
 b=RW/mabvtJSrLmVv7PlmehAyIlrBPBIydXThWjcE6PW3sRVyZXnekJeThvK/zKSbX43
 MTX+2eTp3PTZM07EToj4KsL8E+ZEOyKoK5W70/JSULDmSC8bbGKorllbGLWQptjDXBKt
 OtDrJGML3ikOjypowx+vxxAaTMKbTuhZhu/zHn0ncY/fexcF4tI3YVqqDXQxCXXIRROu
 g0lDSIhtYmC9eI5B+5tKysq1Y+RwPNRvPVS+U+wFoo4k0uSNoJJ9jUOfTTl+0ncSICU+
 vPwyLpExPqKtxs8eOczTPdOMGMxg94LVG9J8iYjL0UUJTayOrgIa3xMtRpn5rfcYCFrB
 2Qrw==
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Bruce Wang <bzwang@chromium.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgNywgMjAxOSBhdCAxMjoxOCBQTSBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+IEluIHRoZSBmYWlsdXJlIHBhdGggZm9yIGRwdV9rbXNf
aW5pdCgpIGl0IGlzIHBvc3NpYmxlIHRvIGdldCB0byB0aGUgTU1VCj4gZGVzdHJveSBmdW5jdGlv
biB3aXRoIHVuaW5pdGlhbGl6ZWQgTU1VIHN0cnVjdHMuIENoZWNrIGZvciBOVUxsIGFuZCBza2lw
CgpzL05VTGwvTlVMTAoKPiBpZiBuZWVkZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3Jv
dXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgoKUmV2aWV3ZWQtYnk6IEtyaXN0aWFuIEguIEty
aXN0ZW5zZW4gPGhvZWdzYmVyZ0Bnb29nbGUuY29tPgoKPiAtLS0KPgo+ICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgfCA5ICsrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9rbXMuYwo+IGluZGV4IDg4NWJmODguLjFiZWFmMjkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCj4gQEAgLTU2LDcgKzU2LDcgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKiBjb25zdCBpb21tdV9wb3J0c1tdID0gewo+ICAjZGVmaW5lIERQVV9E
RUJVR0ZTX0hXTUFTS05BTUUgImh3X2xvZ19tYXNrIgo+Cj4gIHN0YXRpYyBpbnQgZHB1X2ttc19o
d19pbml0KHN0cnVjdCBtc21fa21zICprbXMpOwo+IC1zdGF0aWMgaW50IF9kcHVfa21zX21tdV9k
ZXN0cm95KHN0cnVjdCBkcHVfa21zICpkcHVfa21zKTsKPiArc3RhdGljIHZvaWQgX2RwdV9rbXNf
bW11X2Rlc3Ryb3koc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMpOwo+Cj4gIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIGRwdV9pb21hcF9zaXplKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSkKPiBAQCAt
NzI1LDE3ICs3MjUsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fa21zX2Z1bmNzIGttc19m
dW5jcyA9IHsKPiAgI2VuZGlmCj4gIH07Cj4KPiAtc3RhdGljIGludCBfZHB1X2ttc19tbXVfZGVz
dHJveShzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcykKPiArc3RhdGljIHZvaWQgX2RwdV9rbXNfbW11
X2Rlc3Ryb3koc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBt
c21fbW11ICptbXU7Cj4KPiArICAgICAgIGlmICghZHB1X2ttcy0+YmFzZS5hc3BhY2UpCj4gKyAg
ICAgICAgICAgICAgIHJldHVybjsKPiArCj4gICAgICAgICBtbXUgPSBkcHVfa21zLT5iYXNlLmFz
cGFjZS0+bW11Owo+Cj4gICAgICAgICBtbXUtPmZ1bmNzLT5kZXRhY2gobW11LCAoY29uc3QgY2hh
ciAqKilpb21tdV9wb3J0cywKPiAgICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKGlv
bW11X3BvcnRzKSk7Cj4gICAgICAgICBtc21fZ2VtX2FkZHJlc3Nfc3BhY2VfcHV0KGRwdV9rbXMt
PmJhc2UuYXNwYWNlKTsKPgo+IC0gICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICBkcHVfa21zLT5i
YXNlLmFzcGFjZSA9IE5VTEw7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IF9kcHVfa21zX21tdV9pbml0
KHN0cnVjdCBkcHVfa21zICpkcHVfa21zKQo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJlZWRyZW5vIG1haWxpbmcgbGlz
dAo+IEZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
