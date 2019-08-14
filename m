Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C498DBE8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9FA6E79D;
	Wed, 14 Aug 2019 17:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4949C6E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:32:00 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a21so7748947edt.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Qm6tCEyYHljYJCx+l7YOn3eiOVSI2Q6xsqKk/Szr8xk=;
 b=uY2bSdZ5mEEdCaPeQXCo5mq3ygSn7tMAvot06tknpDFTMmdySn0nHDjsFTzuzTpe14
 +p2N6AVFNeyb/uRNORK0JvqbYvveX1UB27g30fmQbsle0FUlibGG/t3DRbAKLF1Naudr
 rqimFtb0U6d+VVvCzHXohyGeH4cQoOBU8Z+YCF2kuRNfCLvpguETwJ+ie8wtvGi252o7
 n9KyuyVPFcci9JwLiWsXLfSGjBBaZtBBJukYWcvcs6ABOE859RB8NHjXrahcg7NmHAt8
 HfByZnZUHelViDGl/11gzOV+Y/0y+529qfUGxRJyzL1oDgWvo7757TMCo4slFExQrp9I
 SCiQ==
X-Gm-Message-State: APjAAAVOhWVlat7gfxWhZEyxQappBTMz6eHQoOTaQdo9xbVv+ljAz4yK
 It1aqNPdsSm1H1fS2DIdIrUn2Q==
X-Google-Smtp-Source: APXvYqwRn9v1KmyAl7iLql4TVsuC4BlSbySrQOJ2/+/4v8L1EDdXOOJ8MyXwatv64FQ4zcha8koF8Q==
X-Received: by 2002:aa7:c353:: with SMTP id j19mr858899edr.292.1565803918776; 
 Wed, 14 Aug 2019 10:31:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f6sm74361edn.63.2019.08.14.10.31.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:31:58 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:31:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 07/15] drm/mxsfb: Fix the vblank events
Message-ID: <20190814173155.GR7444@phenom.ffwll.local>
Mail-Followup-To: Robert Chiras <robert.chiras@nxp.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
 <1565779731-1300-8-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565779731-1300-8-git-send-email-robert.chiras@nxp.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qm6tCEyYHljYJCx+l7YOn3eiOVSI2Q6xsqKk/Szr8xk=;
 b=k/gxraMcIYfFKbabTJ1uwZwJ8VES3yQLUNViHQMA+d1o/fXBUmn8Xlra/WXeXV9OK6
 oIRMcB4HXQV1z1V493ABRs1dndtGFVbP9eicDVkQRWohVqSbxdWxsF3LaxECADogDqgb
 PIOsIK/y/ZmlDZ6O+dGhdkqTrvL9DfZPgNEz8=
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDE6NDg6NDNQTSArMDMwMCwgUm9iZXJ0IENoaXJhcyB3
cm90ZToKPiBDdXJyZW50bHksIHRoZSB2Ymxhbmsgc3VwcG9ydCBpcyBub3QgY29ycmVjdGx5IGlt
cGxlbWVudGVkIGluIE1YU0ZCX0RSTQo+IGRyaXZlci4gVGhlIGNhbGwgdG8gZHJtX3ZibGFua19p
bml0IGlzIG1hZGUgd2l0aCBtb2RlX2NvbmZpZy5udW1fY3J0Ywo+IHdoaWNoIGF0IHRoYXQgdGlt
ZSBpcyAwLiBCZWNhdXNlIG9mIHRoaXMsIHZibGFuayBpcyBub3QgYWN0aXZhdGVkLCBzbwo+IHRo
ZXJlIHdvbid0IGJlIGFueSB2YmxhbmsgZXZlbnQgc3VibWl0dGVkLgo+IEZvciBleGFtcGxlLCB3
aGVuIHJ1bm5pbmcgbW9kZXRlc3Qgd2l0aCB0aGUgJy12JyBwYXJhbWV0ZXIgd2lsbCByZXN1bHQK
PiBpbiBhbiBhc3Ryb25vbWljYWwgcmVmcmVzaCByYXRlICgxMDAwMCsgSHopLCBiZWNhdXNlIG9m
IHRoYXQuCgpVaCwgdGhhdCBzb3VuZHMgYSBiaXQgbGlrZSBhIGJ1ZyBzb21ld2hlcmUuIElmIHZi
bGFuayBkb2Vzbid0IHdvcmssIHdlCnNob3VsZCBnaXZlIHVzZXJzcGFjZSBhbiBlcnJvciBiYWNr
LgoKTWF5YmUgd2UgbmVlZCBtb3JlIGNoZWNrcyBpbiBkcm1fdmJsYW5rX2luaXQoKT8gQ2FuIHlv
dSBwbHMgbG9vayBpbnRvCnRoYXQ/Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBDaGlyYXMg
PHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214
c2ZiX2Rydi5jIHwgMTEgKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214
c2ZiL214c2ZiX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCj4gaW5k
ZXggMjc0Mzk3NS4uODI5YWJlYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIv
bXhzZmJfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKPiBA
QCAtMzgsNiArMzgsOSBAQAo+ICAjaW5jbHVkZSAibXhzZmJfZHJ2LmgiCj4gICNpbmNsdWRlICJt
eHNmYl9yZWdzLmgiCj4gIAo+ICsvKiBUaGUgZUxDRElGIG1heCBwb3NzaWJsZSBDUlRDcyAqLwo+
ICsjZGVmaW5lIE1BWF9DUlRDUyAxCj4gKwo+ICBlbnVtIG14c2ZiX2RldnR5cGUgewo+ICAJTVhT
RkJfVjMsCj4gIAlNWFNGQl9WNCwKPiBAQCAtMTM4LDYgKzE0MSw4IEBAIHN0YXRpYyB2b2lkIG14
c2ZiX3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKPiAg
CQlteHNmYi0+Y29ubmVjdG9yID0gJm14c2ZiLT5wYW5lbF9jb25uZWN0b3I7Cj4gIAl9Cj4gIAo+
ICsJZHJtX2NydGNfdmJsYW5rX29uKCZwaXBlLT5jcnRjKTsKPiArCj4gIAlwbV9ydW50aW1lX2dl
dF9zeW5jKGRybS0+ZGV2KTsKPiAgCWRybV9wYW5lbF9wcmVwYXJlKG14c2ZiLT5wYW5lbCk7Cj4g
IAlteHNmYl9jcnRjX2VuYWJsZShteHNmYik7Cj4gQEAgLTE2NCw2ICsxNjksOCBAQCBzdGF0aWMg
dm9pZCBteHNmYl9waXBlX2Rpc2FibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpw
aXBlKQo+ICAJfQo+ICAJc3Bpbl91bmxvY2tfaXJxKCZkcm0tPmV2ZW50X2xvY2spOwo+ICAKPiAr
CWRybV9jcnRjX3ZibGFua19vZmYoJnBpcGUtPmNydGMpOwo+ICsKPiAgCWlmIChteHNmYi0+Y29u
bmVjdG9yICE9ICZteHNmYi0+cGFuZWxfY29ubmVjdG9yKQo+ICAJCW14c2ZiLT5jb25uZWN0b3Ig
PSBOVUxMOwo+ICB9Cj4gQEAgLTI0Niw3ICsyNTMsNyBAQCBzdGF0aWMgaW50IG14c2ZiX2xvYWQo
c3RydWN0IGRybV9kZXZpY2UgKmRybSwgdW5zaWduZWQgbG9uZyBmbGFncykKPiAgCj4gIAlwbV9y
dW50aW1lX2VuYWJsZShkcm0tPmRldik7Cj4gIAo+IC0JcmV0ID0gZHJtX3ZibGFua19pbml0KGRy
bSwgZHJtLT5tb2RlX2NvbmZpZy5udW1fY3J0Yyk7Cj4gKwlyZXQgPSBkcm1fdmJsYW5rX2luaXQo
ZHJtLCBNQVhfQ1JUQ1MpOwo+ICAJaWYgKHJldCA8IDApIHsKPiAgCQlkZXZfZXJyKGRybS0+ZGV2
LCAiRmFpbGVkIHRvIGluaXRpYWxpc2UgdmJsYW5rXG4iKTsKPiAgCQlnb3RvIGVycl92Ymxhbms7
Cj4gQEAgLTI2OSw2ICsyNzYsOCBAQCBzdGF0aWMgaW50IG14c2ZiX2xvYWQoc3RydWN0IGRybV9k
ZXZpY2UgKmRybSwgdW5zaWduZWQgbG9uZyBmbGFncykKPiAgCQlnb3RvIGVycl92Ymxhbms7Cj4g
IAl9Cj4gIAo+ICsJZHJtX2NydGNfdmJsYW5rX29mZigmbXhzZmItPnBpcGUuY3J0Yyk7CgpBcmUg
eW91IHN1cmUgeW91IG5lZWQgdGhpcyBvbmUgaGVyZT8gdmJsYW5rcyBzaG91bGQgYmUgb2ZmIGFm
dGVyCmRybV92YmxhbmtfaW5pdCgpIGlzIGNhbGxlZC4KClRoYW5rcywgRGFuaWVsCgo+ICsKPiAg
CS8qCj4gIAkgKiBBdHRhY2ggcGFuZWwgb25seSBpZiB0aGVyZSBpcyBvbmUuCj4gIAkgKiBJZiB0
aGVyZSBpcyBubyBwYW5lbCBhdHRhY2gsIGl0IG11c3QgYmUgYSBicmlkZ2UuIEluIHRoaXMgY2Fz
ZSwgd2UKPiAtLSAKPiAyLjcuNAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
