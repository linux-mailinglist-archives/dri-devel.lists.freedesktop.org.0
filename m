Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C51D6CF2
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 22:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15089FD1;
	Sun, 17 May 2020 20:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C206F89FD1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 20:49:30 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id 62so4387419vsi.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TsfmXod3oy5xhJXYdTP6uvg75Ovvz/7MBA04gc9Bbu8=;
 b=ZUgYdtsIjG2C+8MNsq+hZtfFyNIexe8nwVW5LEDvS09a/ofDW+5G8nGmqqq0zQ6c/W
 HFN5icjqvedtmUxFS17/66L/gLP3jYj/tQvhIneDrOUowWK3XzV92WmUaV9WVG0c7pZd
 xbNWNzxBPwU6jE2xvD/xMCGjTHvgZVWAmJAhNQvJtwP1d6/3ROk6/Va2N3dCwDJ5fpf8
 Jd7LJcQG9w5LNgfJbSLSkKpfyam7DZdR9Jp6RQlASFnXcBSmS11kqsdOG1aH/NsWMTT7
 XFADQPge8cSZM1Abjska41+h6uPcRQ4+06Z1E9lOQNdTwCj9sh49W5e+T1zeZvE0R2tC
 nP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TsfmXod3oy5xhJXYdTP6uvg75Ovvz/7MBA04gc9Bbu8=;
 b=OytrkOc2wQbqbfGeDj0SnGxHNYbPV/4AgJkQ3qXXlYzfg+LkeuMrbtmCDAZxSVvOD0
 Mh7knj+Emz1VyfpVkV4QxBjd/XRPkYnzTDwPadTIR4w8+lyIOsiM8NuNbRnaAIMUbeE1
 CY9OBKR7v2DatYLj0swlp2V3cXP/kUjBisXWVb/znMYLkTjPCxgoZqXt5b0L5StrKy3z
 2sAXj9mRL9IlwOIIiKru0hzwe4nP+c9EozY0inNTmWf+6OikkAXo2tOneKHgyOiq1hX1
 m5/zKP0TIJ/2bcepVpZBQpJep8vJBwkrqE0I6Ch/dLEqYZUEa80brfmiK/RKFvgqD2mH
 LdtA==
X-Gm-Message-State: AOAM5300CuDBYOp9XkxfSIhwl6DhxWyK4kv3m4cvPM7HSQjwmCgLHNtN
 qpr2rJBOsJsocR9cI5sDB9mxwhx6/JN6Q9/KtPc=
X-Google-Smtp-Source: ABdhPJxavdtgM0pkzzhcHa9x4ufOG8rlfkTHsGb2oz/RH+g851WNRVzlCxLvZZJXB7KDmpGO6FP3xpEC1pyYULquj/0=
X-Received: by 2002:a67:ff14:: with SMTP id v20mr4561898vsp.118.1589748569869; 
 Sun, 17 May 2020 13:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200505151613.2932456-1-emil.l.velikov@gmail.com>
 <92d34b33-d550-af6f-25a0-6d2ae2cbe4e6@rock-chips.com>
In-Reply-To: <92d34b33-d550-af6f-25a0-6d2ae2cbe4e6@rock-chips.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 17 May 2020 21:46:40 +0100
Message-ID: <CACvgo53h7jZBQrwhMjTwkXQ+9Bu+HSs0QriV_7GBRZmhDkA4Rw@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop: call vop_cfg_done() under reg_lock
To: Sandy Huang <hjc@rock-chips.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA2IE1heSAyMDIwIGF0IDAyOjMyLCBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMu
Y29tPiB3cm90ZToKPgo+IEhpIEVtaWwgVmVsaWtvdiwKPgo+IOWcqCAyMDIwLzUvNSDkuIvljYgx
MToxNiwgRW1pbCBWZWxpa292IOWGmemBkzoKPiA+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52
ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPgo+ID4gVGhlIGZ1bmN0aW9uIHZvcF9jZmdfZG9uZSgp
IGlzIGEgc2ltcGxlIFZPUF9SRUdfU0VUKCkuIEFzIHN1Y2ggaXQgc2hvdWxkCj4gPiBiZSBkb25l
IHVuZGVyIGEgcmVnX2xvY2suIEEgcXVpY2sgbG9vayB0aHJvdWdoIHRoZSBkcml2ZXIgc2hvd3Mg
dGhhdCBhbGwKPiA+IG90aGVyIGluc3RhbmNlcyAoYXBhcnQgZnJvbSBkcml2ZXIgaW5pdCkgaGF2
ZSB0aGUgbG9jay4gRG8gdGhlIHNhbWUgaGVyZQo+ID4KPiA+IENjOiBTYW5keSBIdWFuZyA8aGpj
QHJvY2stY2hpcHMuY29tPgo+ID4gQ2M6IEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgo+ID4gLS0tCj4gPiBOb3RpY2VkIHdoaWxlIHNraW1taW5nIHRocm91Z2ggdGhlIGNvZGUg
YW5kIHRodXMgdW50ZXN0ZWQuCj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX2RybV92b3AuYyB8IDQgKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AuYwo+ID4gaW5kZXggMzM0NjNiNzlhMzdiLi4xZDc2NDU1Y2E5
MzMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X3ZvcC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3Zv
cC5jCj4gPiBAQCAtNjQ1LDEwICs2NDUsMTAgQEAgc3RhdGljIGludCB2b3BfZW5hYmxlKHN0cnVj
dCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfc3RhdGUpCj4gPiAg
ICAgICAgICAgICAgIHMtPmVuYWJsZV9hZmJjID0gZmFsc2U7Cj4gPiAgICAgICB9Cj4gPgo+ID4g
LSAgICAgc3Bpbl91bmxvY2soJnZvcC0+cmVnX2xvY2spOwo+ID4gLQo+ID4gICAgICAgdm9wX2Nm
Z19kb25lKHZvcCk7Cj4gPgo+ID4gKyAgICAgc3Bpbl91bmxvY2soJnZvcC0+cmVnX2xvY2spOwo+
ID4gKwo+ID4gICAgICAgLyoKPiA+ICAgICAgICAqIEF0IGhlcmUsIHZvcCBjbG9jayAmIGlvbW11
IGlzIGVuYWJsZSwgUi9XIHZvcCByZWdzIHdvdWxkIGJlIHNhZmUuCj4gPiAgICAgICAgKi8KPgo+
IHRoYW5rcyBmb3IgeW91ciBwYXRjaAo+IFJldmlld2VkLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJv
Y2stY2hpcHMuY29tPgo+ClRoYW5rcy4gRG9lc24ndCBzZWVtcyBsaWtlIHRoaXMgd2FzIG1lcmdl
ZCwgc28gSSBwdXNoZWQgaXQgdG8gZHJtLW1pc2MtbmV4dC4KCi1FbWlsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
