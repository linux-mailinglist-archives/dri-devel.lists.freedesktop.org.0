Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0635B228
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 23:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAD289C99;
	Sun, 30 Jun 2019 21:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8E689C99;
 Sun, 30 Jun 2019 21:51:16 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a14so19306481edv.12;
 Sun, 30 Jun 2019 14:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cEH/o2HqpCknJy9nBRwsk/dmMAy15QQ1nN1L9qQycZE=;
 b=RmI2+EjkBwPUT1wTmrE6ZHS+AevtmvT14uDTTk0eF6IHIrZn6T0BPH4nRa0iXddFUh
 sq8g/MGC4mWOlA2kBp7EBf7K49y4f+Y9KogbpFp0I3gPTR9pXWzrYb3d3OmDi9fslDSZ
 GA0ykouSt+YEI2Q8aIyD53efGO8Ju7lKy45+eBqKww70WoZE5CS5W80dRnanrkphl6Ln
 UqYqmxjWP7349VEbrNzQnxpuaw4iBxcjl31Ijimlv5OdYJYiS1dppXM/UnulvHlr7W+P
 e8QXNYC0R5PcSso0R+VQ4+uVN/NK4Qa16ubtPjyPcJZlfaZ7uDuLpfH0Qmr4iUnEtGrv
 zWdg==
X-Gm-Message-State: APjAAAU/P3ImFoA/E2ZebSN2Jvnrsq0GJle4gJBPSOy7j+/jzTUUe3CO
 3odmGdc/oCj5sZ9r/yQazArNHmsCrXa3l5t1/LSZ+qv2wIY=
X-Google-Smtp-Source: APXvYqwqSO7bWu5n9I4u0fubDx1l3J2iji+w1ZRrnKG2OiBWNy76A/X+iG46a48ivT0yJjFdJt+MkLstJA8aFc8wAQI=
X-Received: by 2002:a17:906:85d4:: with SMTP id
 i20mr20309832ejy.256.1561931475535; 
 Sun, 30 Jun 2019 14:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-5-robdclark@gmail.com>
 <20190630211726.GJ7043@pendragon.ideasonboard.com>
In-Reply-To: <20190630211726.GJ7043@pendragon.ideasonboard.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 30 Jun 2019 14:50:59 -0700
Message-ID: <CAF6AEGu7XschmqWz_t9xWk_kFQoE=U-KTSB_+k9-SDAYNDdFww@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup
 panel-id
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cEH/o2HqpCknJy9nBRwsk/dmMAy15QQ1nN1L9qQycZE=;
 b=swHJlUxLQh9WSUVWMGFVfNaERr7FI/U6xHa2WiwUDplT1QHGinlHfeOkVEPbAeWKDy
 SDrlERC+XPDRlLP7VBhI3Eut+59BpwzU9FLLsH9aCpKdxED/oh2XR1QL/5yNqJmannXG
 kOXgIw1N7U3JROMuXrxtr8ecLR4WvNYeJ70EUbVIv3ZsNzazYxGVlNbyZXf2Oz4BtNyc
 bcxkuzq/rX31WUekCwhk5G/KFOlZAs8asUrjs8FCzwMcRKGP0bH148HifFS18/3OEJ3+
 i67q3WrMmFjxhWDDiUGjmAK0bPcSUNacn+qfeg7jziurh5wsb0IgE17PJkaHAOAdryWr
 6EEg==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMjoxNyBQTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2guCj4KPiBPbiBTdW4sIEp1biAzMCwgMjAxOSBhdCAwMTozNjowOFBN
IC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0Bj
aHJvbWl1bS5vcmc+Cj4gPgo+ID4gVXNlIHRoZSBkcm1fb2ZfZmluZF9wYW5lbF9pZCgpIGhlbHBl
ciB0byBkZWNpZGUgd2hpY2ggZW5kcG9pbnQgdG8gdXNlCj4gPiB3aGVuIGxvb2tpbmcgdXAgcGFu
ZWwuICBUaGlzIHdheSB3ZSBjYW4gc3VwcG9ydCBkZXZpY2VzIHRoYXQgaGF2ZQo+ID4gbXVsdGlw
bGUgcG9zc2libGUgcGFuZWxzLCBzdWNoIGFzIHRoZSBhYXJjaDY0IGxhcHRvcHMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyB8IDUgKysrLS0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+ID4gaW5kZXggMjcxOWQ5YzA4NjRi
Li41NmM2NmE0M2YxYTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXNuNjVkc2k4Ni5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4
Ni5jCj4gPiBAQCAtNzkwLDcgKzc5MCw3IEBAIHN0YXRpYyBpbnQgdGlfc25fYnJpZGdlX3Byb2Jl
KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQo+ID4gIHsKPiA+ICAgICAgIHN0cnVj
dCB0aV9zbl9icmlkZ2UgKnBkYXRhOwo+ID4gLSAgICAgaW50IHJldDsKPiA+ICsgICAgIGludCBy
ZXQsIHBhbmVsX2lkOwo+ID4KPiA+ICAgICAgIGlmICghaTJjX2NoZWNrX2Z1bmN0aW9uYWxpdHko
Y2xpZW50LT5hZGFwdGVyLCBJMkNfRlVOQ19JMkMpKSB7Cj4gPiAgICAgICAgICAgICAgIERSTV9F
UlJPUigiZGV2aWNlIGRvZXNuJ3Qgc3VwcG9ydCBJMkNcbiIpOwo+ID4gQEAgLTgxMSw3ICs4MTEs
OCBAQCBzdGF0aWMgaW50IHRpX3NuX2JyaWRnZV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50LAo+ID4KPiA+ICAgICAgIHBkYXRhLT5kZXYgPSAmY2xpZW50LT5kZXY7Cj4gPgo+ID4gLSAg
ICAgcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKHBkYXRhLT5kZXYtPm9mX25vZGUs
IDEsIDAsCj4gPiArICAgICBwYW5lbF9pZCA9IGRybV9vZl9maW5kX3BhbmVsX2lkKCk7Cj4gPiAr
ICAgICByZXQgPSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UocGRhdGEtPmRldi0+b2Zfbm9k
ZSwgMSwgcGFuZWxfaWQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnBkYXRhLT5wYW5lbCwgTlVMTCk7Cj4gPiAgICAgICBpZiAocmV0KSB7Cj4gPiAgICAgICAg
ICAgICAgIERSTV9FUlJPUigiY291bGQgbm90IGZpbmQgYW55IHBhbmVsIG5vZGVcbiIpOwo+Cj4g
Tm8sIEknbSBzb3JyeSwgYnV0IHRoYXQncyBhIG5vLWdvLiBXZSBjYW4ndCBwYXRjaCBldmVyeSBz
aW5nbGUgYnJpZGdlCj4gZHJpdmVyIHRvIHN1cHBvcnQgdGhpcyBoYWNrLiBXZSBuZWVkIGEgc29s
dXRpb24gaW1wbGVtZW50ZWQgYXQgYW5vdGhlcgo+IGxldmVsIHRoYXQgd2lsbCBub3Qgc3ByZWFk
IHRocm91Z2hvdXQgdGhlIHdob2xlIHN1YnN5c3RlbS4KPgoKaXQgY291bGQgYmUgcG9zc2libGUg
dG8gbWFrZSBhIGJldHRlciBoZWxwZXIuLiBidXQgcmVhbGx5IHRoZXJlIGFyZW4ndAoqdGhhdCog
bWFueSBicmlkZ2UgZHJpdmVycwoKc3VnZ2VzdGlvbnMgb2ZjIHdlbGNvbWUsIGJ1dCBJIHRoaW5r
IG9uZSB3YXkgb3IgYW5vdGhlciB3ZSBhcmUgZ29pbmcKdG8gbmVlZCB0byBwYXRjaCBicmlkZ2Vz
IGJ5IHRoZSB0aW1lIHdlIGdldCB0byBhZGRpbmcgQUNQSSBzdXBwb3J0LCBzbwpyZWFsbHkgdHJp
dmlhbCBjb3VwbGUgbGluZSBwYXRjaGVzIHRvIHRoZSBoYW5kZnVsIG9mIGJyaWRnZXMgd2UgaGF2
ZQppc24ndCByZWFsbHkgc29tZXRoaW5nIHRoYXQgd29ycmllcyBtZQoKQlIsCi1SCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
