Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDCC65831
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 15:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271146E248;
	Thu, 11 Jul 2019 13:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E626E248
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 13:57:02 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so5883229edr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 06:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rOuNeNHVv9/VVG4l5Hr645r7uYLWPBnGXVkIWcZHk1k=;
 b=c4dZWSZ/d0inqomHyrtudG5NQC0dqUygrbBuJcBK6wunWEafYDAXPnn4rFBX6ALgC5
 tMXuivKBejRt5B7jyN3nf9uXWPuZZz7BSwgL29YLZYz900FNCJ/CNku0xL67UroTF8NX
 QhoXsvz0JjV880wuAFPi4QepfATLkA/faktFV6dBWW0QXkOxrHT5e5lLZPfg2Z8hE78m
 pwn0kkNFydCnw7nrvzeExgujyxvCAo8sn5jAiYEE6CTj3nNPHJ/1L/ViNa47ubnYuYBT
 OAgCwB6j9pGLctSt9ZNtwM0AVYk2FI9wbcBgLpyIQVr3NXsjp4JZgSvTh5Lzc0OsYLNs
 UjkA==
X-Gm-Message-State: APjAAAXRs0q+Yk8RE2v39f4OdGoA0pWdlyNehBFuJqR/637yzpBAI/OO
 Xlsyi2D44SbhJsg0WItLgvh8z/shUNecJN8FK68=
X-Google-Smtp-Source: APXvYqzCXNLAVWTByGsPoZc2vVxWqyN7oxSE4kQB+14zl0pHNyO0KNu+RzsrXlqWTab7INRkE7CRqcAP/9FQebzVmI0=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr3631650edn.272.1562853420690; 
 Thu, 11 Jul 2019 06:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
 <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
 <20190706010604.GG20625@sirena.org.uk>
 <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
In-Reply-To: <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 Jul 2019 06:56:47 -0700
Message-ID: <CAF6AEGtGjKRA3A8v6pgaXLgpeiLZuz6HuDSFRjKrNp4iQNVZtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rOuNeNHVv9/VVG4l5Hr645r7uYLWPBnGXVkIWcZHk1k=;
 b=axG7bOARPIoTxYMvOcDOF/i1jLKA7ugbJM5J2diOYTfJSi1G02UMeCwP0qKtKZ0x/b
 XK+cwxGV7LGh3jue4qzcMwws9DmDl9mTsEBdza+3KVA3Db6NQuIjTKfAvOg3/CVJax2t
 awEUyzFocfnhMkakkOvkn3qSWuLQtjSpUS8iRtOlJq74YbViyepwXTM4waUWH62+eGBp
 dvASbyXaGReT3F55G9qNyr5sPN1zClC/3b6IBx8bLuihYRO/0qg1+awW6N94K50pwD9H
 MbJNBC6xtCS4tJwiFQJA1lZOH0MrGUj1hfXdAGPSxWbMZtywtF1go93s2eE0m1EcT+ja
 0aiQ==
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgNjoxMSBBTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPiB3cm90ZToKPgo+IE9uIDA2LjA3LjIwMTkgMDM6MDYsIE1hcmsgQnJvd24gd3Jv
dGU6Cj4gPiBPbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAwMjo0NToxMlBNIC0wNzAwLCBKZWZmcmV5
IEh1Z28gd3JvdGU6Cj4gPj4gQWRkIGJhc2ljIHN1cHBvcnQgd2l0aCBhIHNpbXBsZSBpbXBsZW1l
bnRhdGlvbiB0aGF0IHV0aWxpemVzIHRoZSBnZW5lcmljCj4gPj4gcmVhZC93cml0ZSBjb21tYW5k
cyB0byBhbGxvdyBkZXZpY2UgcmVnaXN0ZXJzIHRvIGJlIGNvbmZpZ3VyZWQuCj4gPiBUaGlzIGxv
b2tzIGdvb2QgdG8gbWUgYnV0IEkgcmVhbGx5IGRvbid0IGtub3cgYW55dGhpbmcgYWJvdXQgRFNJ
LAo+ID4gSSdkIGFwcHJlY2lhdGUgc29tZSByZXZpZXcgZnJvbSBvdGhlciBwZW9wbGUgd2hvIGRv
LiAgSSB0YWtlIGl0Cj4gPiB0aGVyZSdzIHNvbWUgc3BlYyB0aGluZyBpbiBEU0kgdGhhdCBzYXlz
IHJlZ2lzdGVycyBhbmQgYnl0ZXMgbXVzdAo+ID4gYm90aCBiZSA4IGJpdD8KPgo+Cj4gSSBhbSBs
aXR0bGUgYml0IGNvbmZ1c2VkIGFib3V0IHJlZ21hcCB1c2FnZSBoZXJlLiBPbiB0aGUgb25lIGhh
bmQgaXQKPiBuaWNlbHkgZml0cyB0byB0aGlzIHNwZWNpZmljIGRyaXZlciwgcHJvYmFibHkgYmVj
YXVzZSBpdCBhbHJlYWR5IHVzZXMKPiByZWdtYXBfaTJjLgo+Cj4gT24gdGhlIG90aGVyIGl0IHdp
bGwgYmUgdW51c2FibGUgZm9yIGFsbW9zdCBhbGwgY3VycmVudCBEU0kgZHJpdmVycyBhbmQKPiBw
cm9iYWJseSBmb3IgbW9zdCBuZXcgZHJpdmVycy4gV2h5Pwo+Cj4gMS4gRFNJIHByb3RvY29sIGRl
ZmluZXMgYWN0dWFsbHkgbW9yZSB0aGFuIDMwIHR5cGVzIG9mIHRyYW5zYWN0aW9uc1sxXSwKPiBi
dXQgdGhpcyBwYXRjaHNldCBpbXBsZW1lbnRzIG9ubHkgZmV3IG9mIHRoZW0gKGRzaSBnZW5lcmlj
IHdyaXRlL3JlYWQKPiBmYW1pbHkpLiBJcyBpdCBwb3NzaWJsZSB0byBpbXBsZW1lbnQgbXVsdGlw
bGUgdHlwZXMgb2YgdHJhbnNhY3Rpb25zIGluCj4gcmVnbWFwPwo+Cj4gMi4gVGhlcmUgaXMgYWxy
ZWFkeSBzb21lIHNldCBvZiBoZWxwZXJzIHdoaWNoIHVzZXMgZHNpIGJ1cywgcmV3cml0aW5nIGl0
Cj4gb24gcmVnbWFwIGlzIHBvc3NpYmxlIG9yIGRyaXZlciBjb3VsZCB1c2Ugb2YgcmVnbWFwIGFu
ZCBkaXJlY3QgYWNjZXNzCj4gdG9nZXRoZXIsIHRoZSBxdWVzdGlvbiBpcyBpZiBpdCBpcyByZWFs
bHkgbmVjZXNzYXJ5Lgo+Cj4gMy4gRFNJIGRldmljZXMgYXJlIG5vIE1GRHMgc28gcmVnbWFwIGFi
c3RyYWN0aW9uIGhhcyBubyBiaWcgdmFsdWUgYWRkZWQKPiAoY29ycmVjdCBtZSwgaWYgdGhlcmUg
YXJlIG90aGVyIHNpZ25pZmljYW50IGJlbmVmaXRzKS4KPgoKSSBhc3N1bWUgaXQgaXMgbm90ICpq
dXN0KiB0aGlzIG9uZSBicmlkZ2UgdGhhdCBjYW4gYmUgcHJvZ3JhbW1lZCBvdmVyCmVpdGhlciBp
MmMgb3IgZHNpLCBkZXBlbmRpbmcgb24gaG93IHRoaW5ncyBhcmUgd2lyZWQgdXAgb24gdGhlIGJv
YXJkLgpJdCBjZXJ0YWlubHkgd291bGQgYmUgbmljZSBmb3IgcmVnbWFwIHRvIHN1cHBvcnQgdGhp
cyBjYXNlLCBzbyB3ZQpkb24ndCBoYXZlIHRvIHdyaXRlIHR3byBkaWZmZXJlbnQgYnJpZGdlIGRy
aXZlcnMgZm9yIHRoZSBzYW1lIGJyaWRnZS4KSSB3b3VsZG4ndCBleHBlY3QgYSBwYW5lbCB0aGF0
IGlzIG9ubHkgcHJvZ3JhbW1lZCB2aWEgZHNpIHRvIHVzZSB0aGlzLgoKQlIsCi1SCgo+Cj4gWzFd
Ogo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVk
ZS92aWRlby9taXBpX2Rpc3BsYXkuaCNMMTUKPgo+Cj4gUmVnYXJkcwo+Cj4gQW5kcnplago+Cj4K
PiA+Cj4gPiBBIGNvdXBsZSBvZiBtaW5vciBjb21tZW50cywgbm8gbmVlZCB0byByZXNlbmQganVz
dCBmb3IgdGhlc2U6Cj4gPgo+ID4+ICsgICAgICAgcGF5bG9hZFswXSA9IChjaGFyKXJlZzsKPiA+
PiArICAgICAgIHBheWxvYWRbMV0gPSAoY2hhcil2YWw7Cj4gPiBEbyB5b3UgbmVlZCB0aGUgY2Fz
dHM/Cj4gPgo+ID4+ICsgICAgcmV0ID0gbWlwaV9kc2lfZ2VuZXJpY193cml0ZShkc2ksIHBheWxv
YWQsIDIpOwo+ID4+ICsgICAgcmV0dXJuIHJldCA8IDAgPyByZXQgOiAwOwo+ID4gUGxlYXNlIGp1
c3Qgd3JpdGUgYW4gaWYgc3RhdGVtZW50LCBpdCBoZWxwcyB3aXRoIGxlZ2liaWxpdHkuCj4gPgo+
ID4+ICtzdHJ1Y3QgcmVnbWFwICpfX3JlZ21hcF9pbml0X2RzaShzdHJ1Y3QgbWlwaV9kc2lfZGV2
aWNlICpkc2ksCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0
IHJlZ21hcF9jb25maWcgKmNvbmZpZywKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgbG9ja19jbGFzc19rZXkgKmxvY2tfa2V5LAo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmxvY2tfbmFtZSkKPiA+PiArewo+ID4+ICsgICAgcmV0
dXJuIF9fcmVnbWFwX2luaXQoJmRzaS0+ZGV2LCAmZHNpX2J1cywgJmRzaS0+ZGV2LCBjb25maWcs
Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrX2tleSwgbG9ja19uYW1lKTsKPiA+
PiArfQo+ID4+ICtFWFBPUlRfU1lNQk9MX0dQTChfX3JlZ21hcF9pbml0X2RzaSk7Cj4gPiBQZXJo
YXBzIHZhbGlkYXRlIHRoYXQgdGhlIGNvbmZpZyBpcyBPSyAobWFpbmx5IHRoZSByZWdpc3Rlci92
YWx1ZQo+ID4gc2l6ZXMpPyAgVGhvdWdoIEknbSBub3Qgc3VyZSBpdCdzIHdvcnRoIGl0IHNvIHBl
cmhhcHMgbm90IC0gdXAgdG8KPiA+IHlvdS4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
