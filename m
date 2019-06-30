Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5075B235
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 00:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3594589D7F;
	Sun, 30 Jun 2019 22:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B5F89D2E;
 Sun, 30 Jun 2019 22:05:08 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so19333722edr.11;
 Sun, 30 Jun 2019 15:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=huwU9KZd7cZQBkiZLk+Dq6NUAeMW1L8FhP5mFVT+0LQ=;
 b=PWhusd15FqfR9GSxAyRkXT/sts6bxT6u6lYpaASt745JMOwwiI5TD8EZHSB/7nMDUK
 bPDo5WN7S2cTouOeXA9yg5nGis/LYCsJ1E5g7b29Ol4Mj6XJjMwezm6eDMuxfSllQOnw
 IXbEmwa6bgHZk8Q6fYh5eKGmjeaHhWRppCPZGaL0dMRjUK0sERo5FamkJ38ftuUs/qkf
 uDKA/SbZ3eKWBCTQa9C1JXtsje7V/WqZzgmVRbvdPXaK47qpEF+N4qIQ+weHkGgeT7tA
 a5KBco5aVwMdsNPVK0ImE1POFtkDt1A6R6yP0+EmgIZci6eYolzf2jhFmwyx1vrr5kT9
 NiYg==
X-Gm-Message-State: APjAAAU3WKZh/xnHj5PUbk5B4zHcgIo9UMLQFUNS7OMC2wGES5JNEvla
 yup1Se6HItCKZgmbchUx9tiNxYtw/lRMpE8KMLs=
X-Google-Smtp-Source: APXvYqzG9FAiNJK/XKX97ZRKsT8GEK/0s3mM4cIJpq9VmKivbCdkQuXPhcl8kk1iXAhWeHcA/1R7ZGniwa1OFZB0fRs=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr24969015edn.272.1561932306845; 
 Sun, 30 Jun 2019 15:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-5-robdclark@gmail.com>
 <20190630211726.GJ7043@pendragon.ideasonboard.com>
 <CAF6AEGu7XschmqWz_t9xWk_kFQoE=U-KTSB_+k9-SDAYNDdFww@mail.gmail.com>
 <20190630215742.GK7043@pendragon.ideasonboard.com>
In-Reply-To: <20190630215742.GK7043@pendragon.ideasonboard.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 30 Jun 2019 15:04:51 -0700
Message-ID: <CAF6AEGvJ3FoBxu=EhrHJ96nV-60TTiAwkWb0a5Wsauw-_dtjiw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup
 panel-id
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=huwU9KZd7cZQBkiZLk+Dq6NUAeMW1L8FhP5mFVT+0LQ=;
 b=p8vWawq+/OHSShN1FMmHtzpNBricWTtnpm4uHpJJbmX6ir7pwMoM0MGZKzIaqefQv2
 iN7twAwIGt9wP6JkJeEiuwj4iwJ8n7ZYFTomLhx+12kt8ZiGetfKNu3GvX5fN09fnDp7
 ZKvJFYmKUE9M5UHNGvDPiGqtXXun2Og+axtqACxUhNXYA4oa0ZcS/EhSC7w86mYhVuGF
 Qgdv1+xxQQCI9CGGggjlc5N/Do/idnC8TUMChEeOiH0250HcGutdNWuZtJ9WGXWMBZCJ
 rPk+WkMxNRomwrfidqg79aI9xRxiTVKk3a9zT+Be11J0WW+pRaVo8jMQNGPN66CLhBPw
 dkAw==
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

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMjo1OCBQTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gT24gU3Vu
LCBKdW4gMzAsIDIwMTkgYXQgMDI6NTA6NTlQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4g
T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMjoxNyBQTSBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+
ID4gPiBPbiBTdW4sIEp1biAzMCwgMjAxOSBhdCAwMTozNjowOFBNIC0wNzAwLCBSb2IgQ2xhcmsg
d3JvdGU6Cj4gPiA+ID4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+
ID4gPiA+Cj4gPiA+ID4gVXNlIHRoZSBkcm1fb2ZfZmluZF9wYW5lbF9pZCgpIGhlbHBlciB0byBk
ZWNpZGUgd2hpY2ggZW5kcG9pbnQgdG8gdXNlCj4gPiA+ID4gd2hlbiBsb29raW5nIHVwIHBhbmVs
LiAgVGhpcyB3YXkgd2UgY2FuIHN1cHBvcnQgZGV2aWNlcyB0aGF0IGhhdmUKPiA+ID4gPiBtdWx0
aXBsZSBwb3NzaWJsZSBwYW5lbHMsIHN1Y2ggYXMgdGhlIGFhcmNoNjQgbGFwdG9wcy4KPiA+ID4g
Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9y
Zz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNp
ODYuYyB8IDUgKysrLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1
ZHNpODYuYwo+ID4gPiA+IGluZGV4IDI3MTlkOWMwODY0Yi4uNTZjNjZhNDNmMWE2IDEwMDY0NAo+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiA+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gPiA+ID4gQEAg
LTc5MCw3ICs3OTAsNyBAQCBzdGF0aWMgaW50IHRpX3NuX2JyaWRnZV9wcm9iZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50LAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqaWQpCj4gPiA+ID4gIHsKPiA+ID4gPiAgICAgICBzdHJ1
Y3QgdGlfc25fYnJpZGdlICpwZGF0YTsKPiA+ID4gPiAtICAgICBpbnQgcmV0Owo+ID4gPiA+ICsg
ICAgIGludCByZXQsIHBhbmVsX2lkOwo+ID4gPiA+Cj4gPiA+ID4gICAgICAgaWYgKCFpMmNfY2hl
Y2tfZnVuY3Rpb25hbGl0eShjbGllbnQtPmFkYXB0ZXIsIEkyQ19GVU5DX0kyQykpIHsKPiA+ID4g
PiAgICAgICAgICAgICAgIERSTV9FUlJPUigiZGV2aWNlIGRvZXNuJ3Qgc3VwcG9ydCBJMkNcbiIp
Owo+ID4gPiA+IEBAIC04MTEsNyArODExLDggQEAgc3RhdGljIGludCB0aV9zbl9icmlkZ2VfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiA+ID4gPgo+ID4gPiA+ICAgICAgIHBkYXRh
LT5kZXYgPSAmY2xpZW50LT5kZXY7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICByZXQgPSBkcm1fb2Zf
ZmluZF9wYW5lbF9vcl9icmlkZ2UocGRhdGEtPmRldi0+b2Zfbm9kZSwgMSwgMCwKPiA+ID4gPiAr
ICAgICBwYW5lbF9pZCA9IGRybV9vZl9maW5kX3BhbmVsX2lkKCk7Cj4gPiA+ID4gKyAgICAgcmV0
ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKHBkYXRhLT5kZXYtPm9mX25vZGUsIDEsIHBh
bmVsX2lkLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
cGRhdGEtPnBhbmVsLCBOVUxMKTsKPiA+ID4gPiAgICAgICBpZiAocmV0KSB7Cj4gPiA+ID4gICAg
ICAgICAgICAgICBEUk1fRVJST1IoImNvdWxkIG5vdCBmaW5kIGFueSBwYW5lbCBub2RlXG4iKTsK
PiA+ID4KPiA+ID4gTm8sIEknbSBzb3JyeSwgYnV0IHRoYXQncyBhIG5vLWdvLiBXZSBjYW4ndCBw
YXRjaCBldmVyeSBzaW5nbGUgYnJpZGdlCj4gPiA+IGRyaXZlciB0byBzdXBwb3J0IHRoaXMgaGFj
ay4gV2UgbmVlZCBhIHNvbHV0aW9uIGltcGxlbWVudGVkIGF0IGFub3RoZXIKPiA+ID4gbGV2ZWwg
dGhhdCB3aWxsIG5vdCBzcHJlYWQgdGhyb3VnaG91dCB0aGUgd2hvbGUgc3Vic3lzdGVtLgo+ID4K
PiA+IGl0IGNvdWxkIGJlIHBvc3NpYmxlIHRvIG1ha2UgYSBiZXR0ZXIgaGVscGVyLi4gYnV0IHJl
YWxseSB0aGVyZSBhcmVuJ3QKPiA+ICp0aGF0KiBtYW55IGJyaWRnZSBkcml2ZXJzCj4gPgo+ID4g
c3VnZ2VzdGlvbnMgb2ZjIHdlbGNvbWUsIGJ1dCBJIHRoaW5rIG9uZSB3YXkgb3IgYW5vdGhlciB3
ZSBhcmUgZ29pbmcKPiA+IHRvIG5lZWQgdG8gcGF0Y2ggYnJpZGdlcyBieSB0aGUgdGltZSB3ZSBn
ZXQgdG8gYWRkaW5nIEFDUEkgc3VwcG9ydCwgc28KPiA+IHJlYWxseSB0cml2aWFsIGNvdXBsZSBs
aW5lIHBhdGNoZXMgdG8gdGhlIGhhbmRmdWwgb2YgYnJpZGdlcyB3ZSBoYXZlCj4gPiBpc24ndCBy
ZWFsbHkgc29tZXRoaW5nIHRoYXQgd29ycmllcyBtZQo+Cj4gSXQncyBvbmx5IG9uZSByaWdodCBu
b3cgYXMgdGhhdCdzIHRoZSBvbmx5IG9uZSB5b3UgY2FyZSBhYm91dCwgYnV0Cj4gYmVmb3JlIHdl
J2xsIGhhdmUgdGltZSB0byBibGluaywgaXQgd2lsbCBiZSBhbm90aGVyIG9uZSwgYW5kIGFub3Ro
ZXIKPiBvbmUsIC4uLiBTb3JyeSwgdGhhdCdzIGEgbm8tZ28gZm9yIG1lLgoKSSBjb3VsZCBvZmMg
YWRkIGhlbHBlciBjYWxsIHRvIGFsbCB0aGUgZXhpc3RpbmcgYnJpZGdlcy4uIHRoYXQgc2VlbWVk
CmEgYml0IG92ZXJraWxsIGZvciB2MSBwYXRjaHNldAoKQlIsCi1SCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
