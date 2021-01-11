Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39C2F1B26
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD17C89EAE;
	Mon, 11 Jan 2021 16:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D780E89E01
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:39:47 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id m23so238107ioy.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6RtG2MQLaBsAC56nCZKcBSqEJTZMVf/AohqsRx6DIsU=;
 b=Qx4SuI4OEhGwr6TFozNzygnxB6Xkd9GRnG3vV0FKgaVlArvwODzuHA8hpG9bCpdjL7
 eULzyiD3kkWgAP/S9FtDLPhX+VA7SG5ch2UIeQ8najTIkUSQNciRmUQRERfBeBWpdodk
 otaB2qtK3WR109ii7BoC8/oi7Aj32zknuJ4aiUMwM9UUEf5ZJlu9g4A55j6vDcBzjOmg
 wqhn31YUEtE+4dpwO7SyLpBhwOBwxXhURmjb5cTFTkdjD+kmEk7GwL+VbxEgnN8TZj9j
 AYRdaKv/aba2CjVaTi1TevwGz1dl3p1b/rkAtWv3BWF5kBOteJ9xJnAlD7lRYjIIXq/J
 OJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6RtG2MQLaBsAC56nCZKcBSqEJTZMVf/AohqsRx6DIsU=;
 b=eUFveC0PyhtSX5Vqx/tLqCLnHZnApRxFYe4twdtOcL4o2FQ1uYDb4h8DnPWUXtn9us
 ccp1NTaUxB3jl0kbim2J81A2+PpkNbyqLhf5isDg9QIPaiFxJGAR4WofMOQ2UnIzkHgL
 MrDgjheBJbWhepaxSLXYRZQ9ig36q19gqtdiiwJvEBNSWKDt8tgGU8wlx7VTDqvFKhGO
 1hlHQmJkvJYWM8+dl5s/T/KikCFeuJZ1n7wAQp7bRRTzX1qI0ytBP9ZGXeYyu4/TDPv6
 CNeZq44MTNeqV5WDOYV9WWGZNtLEcDFZ6LL2GCvUUS9zW3/xjE0OKRMS6YrMnaAg8+2i
 4yTw==
X-Gm-Message-State: AOAM530MKEfrXhwNW4sMYx2rCCqxDf7nW0h+hheJRYRrQRgrefPuB5we
 kAQ84HP6F/ctKLG0BIzzXNcikw2B7NTGZGAoa+rZbw==
X-Google-Smtp-Source: ABdhPJydeMjMj1/GjrmfjQzAS7JPmLiAwNZ2xCJOtcbXqizmA/SEBoXsKn/ta7NqGOzzGPbgM3UPLpYyY0tsGjZFwa8=
X-Received: by 2002:a6b:b2cf:: with SMTP id b198mr88195iof.19.1610383187247;
 Mon, 11 Jan 2021 08:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20210110021142.28221-1-bas@basnieuwenhuizen.nl>
 <CADnq5_OVtCubsGP=-=q-hYJ3e6a3=pozi7ZhDiqdUkUKLCiwMg@mail.gmail.com>
In-Reply-To: <CADnq5_OVtCubsGP=-=q-hYJ3e6a3=pozi7ZhDiqdUkUKLCiwMg@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 11 Jan 2021 17:40:06 +0100
Message-ID: <CAP+8YyGAuYW+qOCDmQR+_X0y-jC5sKoxm+k7V8YrAEaTM942dA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Check actual format for legacy pageflip.
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zhan Liu <zhan.liu@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgNDowMiBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEphbiA5LCAyMDIxIGF0IDk6MTEgUE0gQmFz
IE5pZXV3ZW5odWl6ZW4KPiA8YmFzQGJhc25pZXV3ZW5odWl6ZW4ubmw+IHdyb3RlOgo+ID4KPiA+
IFdpdGggbW9kaWZpZXJzIG9uZSBjYW4gYWN0dWFsbHkgaGF2ZSBkaWZmZXJlbnQgZm9ybWF0X2lu
Zm8gc3RydWN0cwo+ID4gZm9yIHRoZSBzYW1lIGZvcm1hdCwgd2hpY2ggbm93IG1hdHRlcnMgZm9y
IEFNREdQVSBzaW5jZSB3ZSBjb252ZXJ0Cj4gPiBpbXBsaWNpdCBtb2RpZmllcnMgdG8gZXhwbGlj
aXQgbW9kaWZpZXJzIHdpdGggbXVsdGlwbGUgcGxhbmVzLgo+ID4KPiA+IEkgY2hlY2tlZCBvdGhl
ciBkcml2ZXJzIGFuZCBpdCBkb2Vzbid0IGxvb2sgbGlrZSB0aGV5IGVuZCB1cCB0cmlnZ2VyaW5n
Cj4gPiB0aGlzIGNhc2Ugc28gSSB0aGluayB0aGlzIGlzIHNhZmUgdG8gcmVsYXguCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5s
Pgo+ID4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cj4gPiBSZXZpZXdlZC1ieTogWmhhbiBMaXUgPHpoYW4ubGl1QGFtZC5jb20+Cj4gPiBBY2tlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gQWNrZWQt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IEZpeGVzOiA4
MTY4NTNmOWRjNDAgKCJkcm0vYW1kL2Rpc3BsYXk6IFNldCBuZXcgZm9ybWF0IGluZm8gZm9yIGNv
bnZlcnRlZCBtZXRhZGF0YS4iKQo+Cj4gRG8geW91IGhhdmUgY29tbWl0IHJpZ2h0cyB0byBkcm0t
bWlzYyBvciBkbyB5b3UgbmVlZCBzb21lb25lIHRvIGNvbW1pdAo+IHRoaXMgZm9yIHlvdT8KCkkg
ZG9uJ3QgaGF2ZSBjb21taXQgcmlnaHRzIHNvIGlmIHRoZSBwYXRjaCBjb3VsZCBiZSBjb21taXR0
ZWQgZm9yIG1lCnRoYXQgd291bGQgYmUgYXBwcmVjaWF0ZWQhCj4KPiBUaGFua3MhCj4KPiBBbGV4
Cj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyB8IDkgKysrKysrKyst
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3BsYW5lLmMKPiA+IGluZGV4IGU2MjMxOTQ3Zjk4Ny4uYTBjYjc0NmJjYjBhIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKPiA+IEBAIC0xMTYzLDcgKzExNjMsMTQgQEAgaW50IGRy
bV9tb2RlX3BhZ2VfZmxpcF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gICAgICAg
ICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4KPiA+IC0gICAgICAg
aWYgKG9sZF9mYi0+Zm9ybWF0ICE9IGZiLT5mb3JtYXQpIHsKPiA+ICsgICAgICAgLyoKPiA+ICsg
ICAgICAgICogT25seSBjaGVjayB0aGUgRk9VUkNDIGZvcm1hdCBjb2RlLCBleGNsdWRpbmcgbW9k
aWZpZXJzLiBUaGlzIGlzCj4gPiArICAgICAgICAqIGVub3VnaCBmb3IgYWxsIGxlZ2FjeSBkcml2
ZXJzLiBBdG9taWMgZHJpdmVycyBoYXZlIHRoZWlyIG93bgo+ID4gKyAgICAgICAgKiBjaGVja3Mg
aW4gdGhlaXIgLT5hdG9taWNfY2hlY2sgaW1wbGVtZW50YXRpb24sIHdoaWNoIHdpbGwKPiA+ICsg
ICAgICAgICogcmV0dXJuIC1FSU5WQUwgaWYgYW55IGh3IG9yIGRyaXZlciBjb25zdHJhaW50IGlz
IHZpb2xhdGVkIGR1ZQo+ID4gKyAgICAgICAgKiB0byBtb2RpZmllciBjaGFuZ2VzLgo+ID4gKyAg
ICAgICAgKi8KPiA+ICsgICAgICAgaWYgKG9sZF9mYi0+Zm9ybWF0LT5mb3JtYXQgIT0gZmItPmZv
cm1hdC0+Zm9ybWF0KSB7Cj4gPiAgICAgICAgICAgICAgICAgRFJNX0RFQlVHX0tNUygiUGFnZSBm
bGlwIGlzIG5vdCBhbGxvd2VkIHRvIGNoYW5nZSBmcmFtZSBidWZmZXIgZm9ybWF0LlxuIik7Cj4g
PiAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ICAgICAgICAgICAgICAgICBnb3Rv
IG91dDsKPiA+IC0tCj4gPiAyLjI5LjIKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
