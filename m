Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22504EC46B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 15:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259706F809;
	Fri,  1 Nov 2019 14:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AD56F809
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 14:13:08 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id w12so11017164iol.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 07:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TlYI6UI9fS5d9yjIzRHk5DK4kYPW9gPr3Mb6SrPAxFE=;
 b=DsfO7Vx5RlAyd+4b/98vmw2nNfn5KKU5dtkNjKH7U5nLsa39IKXkg/FRJXQMbqSmYP
 CnXyOBIkNG9ii7UhMjVzNBl5nNdy59HHr9hpBXEwOR2o2qsQ1pUeH0NG7Rp4E/uzgbFs
 javwOcLTZ9eDAHSwhgN078ipQXvG/QQzcMZZUuGC9qXuihDffwyUDdc4ZOCBliCEyjf+
 v+iUsoFgepPrqqw01vViI/ovelGpXVI6v7AQ60s8dUJxVbyf8v7b0raMTfH+29LOeqix
 qA0xn/oCWOp9HqAgDqJwsQtp+uxSZ3zQ/FpAVGyiOd35DRA3Q6TVrsoWUlhOtx5lY3eh
 jCIg==
X-Gm-Message-State: APjAAAWjIl1KBYEwqG3opzWkM4PxroOYrDERcnOjOqzUe+SKtCJEbfMR
 B2fXq9wACnV3yfzIs3GsSshvoPa/SK7iw5AmmgsL7gfPdzY=
X-Google-Smtp-Source: APXvYqyMLNtzaVw0BMP+EGUQO4Zl/cXY4bdNL2Xb19JBMdareqJEAqq7IY7jnvNWY72KqdWH+k6HJ4EIjuJgdGAsAFQ=
X-Received: by 2002:a5e:d917:: with SMTP id n23mr1074088iop.28.1572617587422; 
 Fri, 01 Nov 2019 07:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-5-jagan@amarulasolutions.com>
 <20191028153427.pc3tnoz2d23filhx@hendrix>
 <CAMty3ZCisTrFGjzHyqSofqFAsKSLV1n2xP5Li3Lonhdi0WUZVA@mail.gmail.com>
 <20191029085401.gvqpwmmpyml75vis@hendrix>
In-Reply-To: <20191029085401.gvqpwmmpyml75vis@hendrix>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 1 Nov 2019 19:42:55 +0530
Message-ID: <CAMty3ZAWPZSHtAZDf_0Dpx588YGGv3pJX1cXMfkZus3+WF94cA@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] drm/sun4i: dsi: Handle bus clock explicitly
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TlYI6UI9fS5d9yjIzRHk5DK4kYPW9gPr3Mb6SrPAxFE=;
 b=DY+6pMGsOyfGXGpiBchev1A8MThpoGrRVDP4c2kL1T2x4iLT/1Oqzt0RbI2ugp6JUB
 jckKQDRHFHVY5qfJ+Q4esI6fnzcsXhgeDDJSWIDSEmHIwj3RqKsHUvNZWM1tGAt7NrsV
 znRnibutxTKLGXs71MnmqdNJnPvXmveeL+O9c=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLAoKT24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMjoyNCBQTSBNYXhpbWUgUmlwYXJk
IDxtcmlwYXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMjksIDIwMTkgYXQg
MDQ6MDM6NTZBTSArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiA+ID4gPiBleHBsaWNpdCBoYW5k
bGluZyBvZiBjb21tb24gY2xvY2sgd291bGQgcmVxdWlyZSBzaW5jZSB0aGUgQTY0Cj4gPiA+ID4g
ZG9lc24ndCBuZWVkIHRvIG1lbnRpb24gdGhlIGNsb2NrLW5hbWVzIGV4cGxpY2l0bHkgaW4gZHRz
IHNpbmNlIGl0Cj4gPiA+ID4gc3VwcG9ydCBvbmx5IG9uZSBidXMgY2xvY2suCj4gPiA+ID4KPiA+
ID4gPiBBbHNvIHBhc3MgY2xrX2lkIE5VTEwgaW5zdGVhZCAiYnVzIiB0byByZWdtYXAgY2xvY2sg
aW5pdCBmdW5jdGlvbgo+ID4gPiA+IHNpbmNlIHRoZSBzaW5nbGUgY2xvY2sgdmFyaWFudHMgbm8g
bmVlZCB0byBtZW50aW9uIGNsb2NrLW5hbWVzCj4gPiA+ID4gZXhwbGljaXRseS4KPiA+ID4KPiA+
ID4gWW91IGRvbid0IG5lZWQgZXhwbGljaXQgY2xvY2sgaGFuZGxpbmcuIFBhc3NpbmcgTlVMTCBh
cyB0aGUgYXJndW1lbnQKPiA+ID4gaW4gcmVnbWFwX2luaXRfbW1pb19jbGsgd2lsbCBtYWtlIGl0
IHVzZSB0aGUgZmlyc3QgY2xvY2ssIHdoaWNoIGlzIHRoZQo+ID4gPiBidXMgY2xvY2suCj4gPgo+
ID4gSW5kZWVkIEkgdHJpZWQgdGhhdCwgc2luY2UgTlVMTCBjbGtfaWQgd291bGRuJ3QgZW5hYmxl
IHRoZSBidXMgY2xvY2sKPiA+IGR1cmluZyByZWdtYXBfbW1pb19nZW5fY29udGV4dCBjb2RlLCBw
YXNzaW5nIE5VTEwgdHJpZ2dlcmluZyB2YmxhbmsKPiA+IHRpbWVvdXQuCj4KPiBUaGVyZSdzIGEg
YnVuY2ggb2YgdXNlcnMgb2YgTlVMTCBpbiB0cmVlLCBzbyBmaW5kaW5nIG91dCB3aHkgTlVMTAo+
IGRvZXNuJ3Qgd29yayBpcyB0aGUgd2F5IGZvcndhcmQuCgpJJ2QgaGF2ZSBsb29rZWQgdGhlIHNv
bWUgb2YgdGhlIHVzZXJzIGJlZm9yZSBjaGVja2luZyB0aGUgY29kZSBhcwp3ZWxsLiBBcyBJIHNh
aWQgcGFzc2luZyBOVUxMIGNsa19pZCB0byBkZXZtX3JlZ21hcF9pbml0X21taW9fY2xrID0+Cl9f
ZGV2bV9yZWdtYXBfaW5pdF9tbWlvX2NsayB3b3VsZCByZXR1cm4gYmVmb3JlIHByb2Nlc3Npbmcg
dGhlIGNsb2NrLgoKSGVyZSBpcyB0aGUgY29kZSBzbmlwcGV0IG9uIHRoZSB0cmVlIGp1c3QgdG8g
bWFrZSBzdXJlIEknbSBvbiB0aGUgc2FtZQpwYWdlIG9yIG5vdC4KCnN0YXRpYyBzdHJ1Y3QgcmVn
bWFwX21taW9fY29udGV4dCAqcmVnbWFwX21taW9fZ2VuX2NvbnRleHQoc3RydWN0IGRldmljZSAq
ZGV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAq
Y2xrX2lkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCBfX2lv
bWVtICpyZWdzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IHJlZ21hcF9jb25maWcgKmNvbmZpZykKewogICAgICAgIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiAgICAgICAgLS0tLS0tLS0tLS0tLS0KICAgICAgICBpZiAoY2xrX2lkID09IE5VTEwp
CiAgICAgICAgICAgICAgICByZXR1cm4gY3R4OwoKICAgICAgICBjdHgtPmNsayA9IGNsa19nZXQo
ZGV2LCBjbGtfaWQpOwogICAgICAgIGlmIChJU19FUlIoY3R4LT5jbGspKSB7CiAgICAgICAgICAg
ICAgICByZXQgPSBQVFJfRVJSKGN0eC0+Y2xrKTsKICAgICAgICAgICAgICAgIGdvdG8gZXJyX2Zy
ZWU7CiAgICAgICAgfQoKICAgICAgICByZXQgPSBjbGtfcHJlcGFyZShjdHgtPmNsayk7CiAgICAg
ICAgaWYgKHJldCA8IDApIHsKICAgICAgICAgICAgICAgIGNsa19wdXQoY3R4LT5jbGspOwogICAg
ICAgICAgICAgICAgZ290byBlcnJfZnJlZTsKICAgICAgICB9CiAgICAgICAgLS0tLS0tLS0tLS0t
LQogICAgICAgIC0tLS0tLS0tLS0tLS0tLQp9CgpZZXMsIEkgZGlkIGNoZWNrIG9uIHRoZSBkcml2
ZXIgaW4gdGhlIHRyZWUgYmVmb3JlIGNvbW1pdHRpbmcgZXhwbGljaXQKY2xvY2sgaGFuZGxlLCB3
aGljaCBtYWtlIHNpbWlsYXIgcmVxdWlyZW1lbnRzIGxpa2UgdXMgaW4gWzFdLiB0aGlzCmlteDIg
d2R0IGRyaXZlciBpcyBoYW5kbGluZyB0aGUgZXhwbGljaXQgY2xvY2sgYXMgd2VsbC4gSSdtIHN1
cmUgdGhpcwpkcml2ZXIgaXMgdXBkYXRlZCBhcyBJIGhhdmUgc2VlbiBmZXcgY2hhbmdlcyByZWxh
dGVkIHRvIHRoaXMgZHJpdmVyIGluCk1MLgoKTGV0IG1lIGtub3cgaWYgSSBzdGlsbCBtaXNzIGFu
eSBrZXkgY2hhbmdlIG9yIG5vdGUgaGVyZSwgSSB3aWxsIGRpZwpmdXJ0aGVyIG9uIHRoaXMgZm9y
IHN1cmUuCgpbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuNC1yYzQvc291
cmNlL2RyaXZlcnMvd2F0Y2hkb2cvaW14Ml93ZHQuYyNMMjY0Cgp0aGFua3MsCkphZ2FuLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
