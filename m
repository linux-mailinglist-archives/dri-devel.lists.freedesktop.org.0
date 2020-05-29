Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE31E9026
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304956E9C3;
	Sat, 30 May 2020 09:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0103A89F0B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 12:35:21 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id p5so1148101ile.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QQKUqX33jKxu7xXLL4ova+QPLIPkMuSTOrsUN0PAZO0=;
 b=LKp56kq34nPmIiOKHnOneCDJMToOPA7EL0pXwQM+nXciQtcVkxUWRXy8WLq8jE00e2
 POnOJuG8DVAAtng0S7S/Qv/gkSatXlGeptpsTCBQV0P3WtbkvecoVJQgHcrx0SVBm8P3
 qEHiIQo0Ho4rVCrriGzJxCrGzM9itFljdnr11y1rf+6soTk08cZ9mG50CFDo0rck76mO
 K4MhjTmLdFAX+KtZUB0R8H96avchflxwDyLosfVU+RIGfgfbalHhKmPc91j128quOw6L
 blXNe6pItY5lY5CCu30pXpa/Ed69elCz95zelGlKb6kcbNlfrop5cm50R6ji05M1Q3DL
 y6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QQKUqX33jKxu7xXLL4ova+QPLIPkMuSTOrsUN0PAZO0=;
 b=bhMtUpYxAJiui0kfwroGxsYMSsdjmM8av2V93MWOLyHUzJ3oGXiNlCP8Fy5JatkUPI
 Q8tjmK8Ep7j0EncXFYlcE2lRRKz7EvaHFck1VDAmao4D2j8bm6ZgN6g6GRdzcixgKIzP
 g2h1Cucy4f8PuTCVt6W2VE2LuwTi0fZIoU246odA+vv5li89oSTasp3YMNis3YmuCHtX
 sjaJbqz5SlcEMn1boeJuL3dtq5wc6wkaX0Sesbe3ITu2/5ZEghuRHe691+SLrOb7eSzV
 ZCut1OLFQPYA/BL8Yqd8FffL4JvcC5wAhDhqlGyyxy0ryF+qJp82/lEovbHpg+rgoPNI
 CXCQ==
X-Gm-Message-State: AOAM532T7Lvaki0Pbhhn5wmWf/mbJGXeN7n3HxUg2xyAiNYMRf+4gx8j
 f717m1YKlqfg24T0YE124AhxKEMPu4uIKcVGceY=
X-Google-Smtp-Source: ABdhPJxsnPf7Ua0YRkxDmtaDeUWOtLqME8clmbrqOqhmFRtW14m06XVzx5wUbmg/g2x33c99GItnUdh5UwJSKkPZHrQ=
X-Received: by 2002:a92:4885:: with SMTP id j5mr6542365ilg.35.1590755719955;
 Fri, 29 May 2020 05:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-6-peron.clem@gmail.com>
 <788ac664-e426-d307-f81e-9632de09887c@arm.com>
In-Reply-To: <788ac664-e426-d307-f81e-9632de09887c@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 29 May 2020 14:35:08 +0200
Message-ID: <CAJiuCcemwM-11ZT5+-4JfyTgTRD-_JjWz=HDCme8743M5Epf0g@mail.gmail.com>
Subject: Re: [PATCH 05/15] drm/panfrost: use spinlock instead of atomic
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iaW4sCgpPbiBGcmksIDI5IE1heSAyMDIwIGF0IDE0OjIwLCBSb2JpbiBNdXJwaHkgPHJv
YmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDIwMjAtMDUtMTAgMTc6NTUsIENsw6lt
ZW50IFDDqXJvbiB3cm90ZToKPiA+IENvbnZlcnQgYnVzeV9jb3VudCB0byBhIHNpbXBsZSBpbnQg
cHJvdGVjdGVkIGJ5IHNwaW5sb2NrLgo+Cj4gQSBsaXR0bGUgbW9yZSByZWFzb25pbmcgbWlnaHQg
YmUgbmljZS4KCkkgaGF2ZSBmb2xsb3cgdGhlIG1vZGlmaWNhdGlvbiByZXF1ZXN0ZWQgZm9yIGxp
bWEgZGV2ZnJlcSBhbmQgY2xlYXJseQpkb24ndCBoYXZlIGFueSBhcmd1bWVudCB0byBzd2l0Y2gg
dG8gc3BpbmxvY2suCgpUaGUgTGltYSBNYWludGFpbmVyIGFza2VkIHRvIGNoYW5nZSB3aXRodCB0
aGUgZm9sbG93aW5nIHJlYXNvbiA6CiJCZXR0ZXIgbWFrZSB0aGlzIGNvdW50IGEgbm9ybWFsIGlu
dCB3aGljaCBpcyBhbHNvIHByb3RlY3RlZCBieSB0aGUgc3BpbmxvY2ssCmJlY2F1c2UgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbiBjYW4ndCBwcm90ZWN0IGF0b21pYyBvcHMgZm9yIHN0YXRlIGNoYW5n
ZQphbmQgYnVzeSBpZGxlIGNoZWNrIGFuZCB3ZSBhcmUgdXNpbmcgc3BpbmxvY2sgYWxyZWFkeSIK
Cj4KPiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5j
b20+Cj4gPiAtLS0KPiBbLi4uXQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZmcmVxLmggYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5oCj4gPiBpbmRleCAwNjk3ZjhkNWFhMzQuLmU2NjI5OTAwYTYxOCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKPiA+IEBA
IC00LDYgKzQsNyBAQAo+ID4gICAjaWZuZGVmIF9fUEFORlJPU1RfREVWRlJFUV9IX18KPiA+ICAg
I2RlZmluZSBfX1BBTkZST1NUX0RFVkZSRVFfSF9fCj4gPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9z
cGlubG9jay5oPgo+ID4gICAjaW5jbHVkZSA8bGludXgva3RpbWUuaD4KPiA+Cj4gPiAgIHN0cnVj
dCBkZXZmcmVxOwo+ID4gQEAgLTE0LDEwICsxNSwxNyBAQCBzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNl
Owo+ID4gICBzdHJ1Y3QgcGFuZnJvc3RfZGV2ZnJlcSB7Cj4gPiAgICAgICBzdHJ1Y3QgZGV2ZnJl
cSAqZGV2ZnJlcTsKPiA+ICAgICAgIHN0cnVjdCB0aGVybWFsX2Nvb2xpbmdfZGV2aWNlICpjb29s
aW5nOwo+ID4gKwo+ID4gICAgICAga3RpbWVfdCBidXN5X3RpbWU7Cj4gPiAgICAgICBrdGltZV90
IGlkbGVfdGltZTsKPiA+ICAgICAgIGt0aW1lX3QgdGltZV9sYXN0X3VwZGF0ZTsKPiA+IC0gICAg
IGF0b21pY190IGJ1c3lfY291bnQ7Cj4gPiArICAgICBpbnQgYnVzeV9jb3VudDsKPiA+ICsgICAg
IC8qCj4gPiArICAgICAgKiBQcm90ZWN0IGJ1c3lfdGltZSwgaWRsZV90aW1lLCB0aW1lX2xhc3Rf
dXBkYXRlIGFuZCBidXN5X2NvdW50Cj4gPiArICAgICAgKiBiZWNhdXNlIHRoZXNlIGNhbiBiZSB1
cGRhdGVkIGNvbmN1cnJlbnRseSwgZm9yIGV4YW1wbGUgYnkgdGhlIEdQCj4gPiArICAgICAgKiBh
bmQgUFAgaW50ZXJydXB0cy4KPiA+ICsgICAgICAqLwo+Cj4gTml0OiB0aGlzIGNvbW1lbnQgaXMg
Y2xlYXJseSB3cm9uZywgc2luY2Ugd2Ugb25seSBoYXZlIEpvYiwgR1BVIGFuZCBNTVUKPiBpbnRl
cnJ1cHRzIGhlcmUuIEkgZ3Vlc3MgaWYgdGhlcmUgaXMgYSByYWNlIGl0IHdvdWxkIGJlIGJldHdl
ZW4KPiBzdWJtaXNzaW9uL2NvbXBsZXRpb24vdGltZW91dCBvbiBkaWZmZXJlbnQgam9iIHNsb3Rz
LgoKSXQncyBjb3B5L3Bhc3RlIGZyb20gbGltYSBJIHdpbGwgdXBkYXRlIGl0LAoKPgo+IEdpdmVu
IHRoYXQsIHNob3VsZCB0aGlzIGFjdHVhbGx5IGJlIGNvbnNpZGVyZWQgYSBmaXggZm9yIDllNjJi
ODg1ZjcxNQo+ICgiZHJtL3BhbmZyb3N0OiBTaW1wbGlmeSBkZXZmcmVxIHV0aWxpc2F0aW9uIHRy
YWNraW5nIik/CgpJIGNhbid0IHNheSBpZiBpdCBjYW4gYmUgY29uc2lkZXJlZCBhcyBhIGZpeCwg
SSBkaWRuJ3Qgc2VlIGFueQppbXByb3ZlbWVudCBvbiBteSBib2FyZCBiZWZvcmUgYW5kIGFmdGVy
IHRoaXMgcGF0Y2guCkknbSBzdGlsbCBmYWNpbmcgc29tZSBpc3N1ZSBhbmQgZGlkbid0IGhhdmUg
dGltZSB0byBmdWxseSBpbnZlc3RpZ2F0ZSBpdC4KClRoYW5rcyBmb3IgeW91IHJldmlldywKCgo+
Cj4gUm9iaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
