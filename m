Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C3D2B79C2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 10:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F247E6E3D2;
	Wed, 18 Nov 2020 09:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3096E3D2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 09:00:07 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id o25so1421375oie.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 01:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1FsQN+8izne3JfHZCqz8SHsDVQ3dYaFlVE4Pg17Uqps=;
 b=KKiI8JWq3PzgGVdBzPB030iFoJN+YRlGzkWc20wD1gh6GwiGKs7t7/95GoT+NUQHyb
 EX5kThkhYbCx1tBn1mbtCIUYPPr8ebFEs2oS+ZC4WgVnU1ZeIr+gf3zzMHpuePpRf31L
 3U3LMs6URzNHC23Cr9GDaf0Q6tM8bYD4x8uP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1FsQN+8izne3JfHZCqz8SHsDVQ3dYaFlVE4Pg17Uqps=;
 b=l3x2vDJX7Tu/Q7pQ5XRWVeU6qHP0BcpOtTwQp5r31SfJVgBLCdqCEp94PBj5jqh6//
 5M+AuZyuiYQ1pspxyVeLjvcPoAznoYAECjlPt0xMNHMZR9Bv2l39BNGGRQqb4T9bfeKB
 ro0yjHsUaIVFx3Qi/V8eRYj73sqiLPoFJ/ueLlBG6zJdij3So+DKyWPmKWchh1oCyzkQ
 y+axztCRXFEz1i1Rjr/+MqQ2t25S99ekRmX4AyMSh7lO1Pg8q4l4B6an4a2ntRac+r8V
 08Bxja4W0IWIPHZ1jYEcqWI3YZtWR5qYl57jiKxBiGsggA/tKTdWHWVOrsHgnRlt+Ch9
 EBgA==
X-Gm-Message-State: AOAM531g9FCXoytRkCJazdKsPOp5DQrPEUNsZKbp+WkgfVUsVqHErT/b
 kvrIEUGn7epU1aYfBMQ2iOh9cIe70ohD9KZhhZC4Uw==
X-Google-Smtp-Source: ABdhPJyPn9yquhxjYhFS4h9ZTn/G+AO/koeMNkor10wNSKkR/ie+hTCpZdf19Ki8PBhbStq+LVOeKmujydpa/PCr7No=
X-Received: by 2002:aca:4f14:: with SMTP id d20mr2107464oib.14.1605690006733; 
 Wed, 18 Nov 2020 01:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20201117155229.9837-1-mark.jonas@de.bosch.com>
 <e089d4d5-3bd8-c2cd-3011-ed87ae4284e8@suse.de>
In-Reply-To: <e089d4d5-3bd8-c2cd-3011-ed87ae4284e8@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Nov 2020 09:59:55 +0100
Message-ID: <CAKMK7uEpEt4w4kVJLOd2Yw1MnsrCn-NMgT4TjcxROpZBa_xvYg@mail.gmail.com>
Subject: Re: [PATCH] drm: imx: Move fbdev setup to before output polling
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Jonas <mark.jonas@de.bosch.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTgsIDIwMjAgYXQgOToxMCBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaQo+Cj4gQW0gMTcuMTEuMjAgdW0gMTY6NTIgc2No
cmllYiBNYXJrIEpvbmFzOgo+ID4gRnJvbTogTGVvIFJ1YW4gPHRpbmdxdWFuLnJ1YW5AY24uYm9z
Y2guY29tPgo+ID4KPiA+IFRoZSBnZW5lcmljIGZiZGV2IGhhcyB0byBiZSBzZXR1cCBiZWZvcmUg
ZW5hYmxpbmcgb3V0cHV0IHBvbGxpbmcuCj4gPiBPdGhlcndpc2UgdGhlIGZiZGV2IGNsaWVudCBp
cyBub3QgcmVhZHkgdG8gaGFuZGxlIGRlbGF5ZWQgZXZlbnRzLgo+ID4KPiA+IFNpbmNlIGY1Mzcw
NWZkLCB0aGUgZ2VuZXJpYyBmYmRldiBpcyBzZXR1cCBhZnRlciB0aGUgb3V0cHV0IHBvbGxpbmcK
PiA+IGluaXQuIER1cmluZyBmYmRldiBzZXR1cCwgd2hlbiBmYmRldiBwcm9iZXMgYXR0YWNoZWQg
b3V0cHV0cyBhbmQgYQo+ID4gc3RhdHVzIGNoYW5nZXMgZnJvbSB1bmtub3duIHRvIGNvbm5lY3Rl
ZCwgdGhlIGRlbGF5ZWQgZXZlbnQgaXMKPiA+IG1hcmtlZCBhbmQgdGhlIG91dHB1dF9wb2xsX3dv
cmsgdGhyZWFkIGlzIHNjaGVkdWxlZCB3aXRob3V0IGRlbGF5Lgo+ID4gSWYgb3V0cHV0X3BvbGxf
ZXhlY3V0ZSgpIGlzIHJ1bnMgaW1tZWRpYXRlbHksIHRoZSBkZWxheWVkIGV2ZW50Cj4gPiBpcyBo
YW5kbGVkIHdpdGhvdXQgYWN0dWFsbHkgcG9sbGluZyB0aGUgb3V0cHV0IGJlY2F1c2UgdGhlIGZi
ZGV2IGlzIG5vdAo+ID4gcmVnaXN0ZXJlZCB5ZXQuIFNvIHRoZSBkZWxheWVkIGV2ZW50IGlzIGxv
c3QuIFRoaXMgbGVhZHMgdG8gYSBkYXJrCj4gPiBzY3JlZW4gdW50aWwgYSBLTVMgYXBwbGljYXRp
b24gKG9yIGZiY29uKSBzZXRzIHRoZSBzY3JlZW4gbW9kZS4KPiA+Cj4gPiBUaGlzIHBhdGNoIGZp
eGVzIHRoZSBpc3N1ZSBieSBtb3ZpbmcgdGhlIHNldHVwIG9mIGdlbmVyaWMgZmJkZXYgYmVmb3Jl
Cj4gPiBpbml0aWFsaXppbmcgYW5kIGVuYWJsaW5nIG91dHB1dCBwb2xsaW5nLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IExlbyBSdWFuIDx0aW5ncXVhbi5ydWFuQGNuLmJvc2NoLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IE1hcmsgSm9uYXMgPG1hcmsuam9uYXNAZGUuYm9zY2guY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtZHJtLWNvcmUuYyB8IDggKysrKysrLS0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2lteC9pbXgtZHJtLWNvcmUuYwo+ID4gaW5kZXggOWJmNWFkNmQxOGEyLi4yNjY1
MDQwZTExYzcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29y
ZS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jCj4gPiBAQCAt
MjQwLDE0ICsyNDAsMTggQEAgc3RhdGljIGludCBpbXhfZHJtX2JpbmQoc3RydWN0IGRldmljZSAq
ZGV2KQo+ID4gICAgICAgICAgICAgICBsZWdhY3lmYl9kZXB0aCA9IDE2Owo+ID4gICAgICAgfQo+
ID4KPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBUaGUgZ2VuZXJpYyBmYmRldiBoYXMgdG8gYmUg
c2V0dXAgYmVmb3JlIGVuYWJsaW5nIG91dHB1dCBwb2xsaW5nLgo+ID4gKyAgICAgICogT3RoZXJ3
aXNlIHRoZSBmYmRldiBjbGllbnQgaXMgbm90IHJlYWR5IHRvIGhhbmRsZSBkZWxheWVkIGV2ZW50
cy4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZHJtLCBs
ZWdhY3lmYl9kZXB0aCk7Cj4gPiArCj4gPiAgICAgICBkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQo
ZHJtKTsKPiA+Cj4gPiAgICAgICByZXQgPSBkcm1fZGV2X3JlZ2lzdGVyKGRybSwgMCk7Cj4gPiAg
ICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICBnb3RvIGVycl9wb2xsX2Zpbmk7Cj4gPgo+
ID4gLSAgICAgZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZHJtLCBsZWdhY3lmYl9kZXB0aCk7Cj4g
PiAtCj4KPiBUaGlzIGRvZXMgbm90IHdvcmsgd2VsbC4gZmJkZXYgaXMgc3VwcG9zZWQgdG8gYmUg
YW5vdGhlciByZWd1bGFyIERSTQo+IGNsaWVudC4gSXQgaGFzIHRvIGJlIGVuYWJsZWQgYWZ0ZXIg
cmVnaXN0ZXJpbmcgdGhlIERSTSBkZXZpY2UuCj4KPiBJJ2QgcmF0aGVyIGltcHJvdmUgZmJkZXYg
b3IgdGhlIGRyaXZlciB0byBoYW5kbGUgdGhpcyBncmFjZWZ1bGx5LgoKWWVhaCBJJ20gbm90IHVu
ZGVyc3RhbmRpbmcgdGhlIHBvaW50IGhlcmUuIE9uY2UgZmJjb24gaXMgcnVubmluZywgeW91Cmhh
dmUgYSBzY3JlZW4uIEFueSBmYmRldiB1c2Vyc3BhY2UgY2xpZW50ICBhbHNvIHNob3VsZCBkbyBh
IG1vZGVzZXQKZmlyc3QuIEFuZCBpZiB0aGV5IGRvbnQgYW5kIGl0J3MgZXhwZWN0ZWQgdWFwaSBm
b3IgZmJkZXYgY2hhcmRldiB0aGF0CnRoZSBkaXNwbGF5IGJvb3RzIHVwIGVuYWJsZWQsIHRoZW4g
d2UgbmVlZCB0byBmaXggdGhhdCBpbiB0aGUgZmJkZXYKaGVscGVycywgbm90IHRocm91Z2ggY2xl
dmVyIHJlb3JkZXJpbmcgaW4gZHJpdmVycyBzbyB0aGF0IGEKc2lkZS1lZmZlY3QgY2F1c2VzIGEg
bW9kZXNldC4KCk5vdGUgdGhhdCB0aGlzIGlzIGEgYml0IHRyaWNreSBzaW5jZSBmYmRldiBzaG91
bGRuJ3QgdGFrZSBvdmVyIHRoZQpzY3JlZW4gYnkgZGVmYXVsdCwgc28gd2UnZCBuZWVkIHRvIGRl
bGF5IHRoaXMgdW50aWwgZmlyc3Qgb3BlbiBvZgovZGV2L2ZiMC4gQW5kIHdlIHNob3VsZCBwcm9i
YWJseSBhbHNvIGRlbGF5IHRoZSBob3RwbHVnIGhhbmRsaW5nIHVudGlsCnRoZSBmaXJzdCBvcGVu
LiBmYmNvbiBhbHNvIGZha2Utb3BlbnMgdGhlIGZiZGV2IGZpbGUsIHNvIGl0J3MgdGhlIHNhbWUK
Y29kZSBwYXRoLgotRGFuaWVsCgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiA+ICAgICAg
IHJldHVybiAwOwo+ID4KPiA+ICBlcnJfcG9sbF9maW5pOgo+ID4KPgo+IC0tCj4gVGhvbWFzIFpp
bW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJICj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55Cj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXIKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
