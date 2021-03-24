Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106DB347DEC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 17:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C16B6ECA3;
	Wed, 24 Mar 2021 16:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316BC6ECA9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 16:42:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CE5761A12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616604170;
 bh=FpJ4ufMl3GoETEBMXPsfhMl5UzmY31frNljvtIkqZOE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ip//tYNx0qxfnmr4eR3JAA2+Itc24es7mwJQjJL07abkvmQYpDXcO9J8WWxO268/I
 JFbBlzhLB4pjKpi3ajTdodXBCgK5RLYj6OXrTWOad//1IpkDWh8PA/DxmErNyoY6fi
 YSJc3LSD6udZE6sznr4+WullETs4zWCfSXkXwGFSkD4OUDddqbDe9Tu0zPZvKfF+g8
 J0gqhFSdJKUkkjV+UomcUJZTk8aF2So2W8338Pv32ORTAfG7CDwqERgQBkBNR7aapi
 eEZic2+cqlNuQNCc/cdhH59T6vYOv+iIzvLiP3V0CcGnlnZo+VcgAdOZFFs6mYNqF6
 tUS+8klPf5qIg==
Received: by mail-oi1-f181.google.com with SMTP id d12so21457431oiw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 09:42:50 -0700 (PDT)
X-Gm-Message-State: AOAM532QuBTShaRX4Sut/uzb4EDpOf1RrOdLQp3W6Wtv+NjPozoQ0Eqh
 7k0L3DQxC43YmUa+x5L9wqw9iQUJc+xRiUUZlSE=
X-Google-Smtp-Source: ABdhPJzT1TALAguRWsDlD8O6reb7Z/5YQKB/EH/94NPd80Aw6gOETK/aeiwvnSRsg6ZUwyQE7bBChezT8Gvob1FyBik=
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr3096654oie.4.1616604169767; 
 Wed, 24 Mar 2021 09:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210324121832.3714570-1-arnd@kernel.org>
 <e1310273dcc577f3a772380ada7b6cc1906d680b.camel@perches.com>
In-Reply-To: <e1310273dcc577f3a772380ada7b6cc1906d680b.camel@perches.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 24 Mar 2021 17:42:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0JyoAtTYTi+M_mJ3_KtUJ6NeJB=FNWhzezqcXMac++mQ@mail.gmail.com>
Message-ID: <CAK8P3a0JyoAtTYTi+M_mJ3_KtUJ6NeJB=FNWhzezqcXMac++mQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] drm/imx: imx-ldb: fix out of bounds array access
 warning
To: Joe Perches <joe@perches.com>
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liu Ying <victor.liu@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMzoyMCBQTSBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMu
Y29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjAyMS0wMy0yNCBhdCAxMzoxNyArMDEwMCwgQXJuZCBC
ZXJnbWFubiB3cm90ZToKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4g
Pgo+ID4gV2hlbiBDT05GSUdfT0YgaXMgZGlzYWJsZWQsIGJ1aWxkaW5nIHdpdGggJ21ha2UgVz0x
JyBwcm9kdWNlcyB3YXJuaW5ncwo+ID4gYWJvdXQgb3V0IG9mIGJvdW5kcyBhcnJheSBhY2Nlc3M6
Cj4gPgo+ID4gZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtbGRiLmM6IEluIGZ1bmN0aW9uICdpbXhf
bGRiX3NldF9jbG9jay5jb25zdHByb3AnOgo+ID4gZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtbGRi
LmM6MTg2Ojg6IGVycm9yOiBhcnJheSBzdWJzY3JpcHQgLTIyIGlzIGJlbG93IGFycmF5IGJvdW5k
cyBvZiAnc3RydWN0IGNsayAqWzRdJyBbLVdlcnJvcj1hcnJheS1ib3VuZHNdCj4gPgo+ID4gQWRk
IGFuIGVycm9yIGNoZWNrIGJlZm9yZSB0aGUgaW5kZXggaXMgdXNlZCwgd2hpY2ggaGVscHMgd2l0
aCB0aGUKPiA+IHdhcm5pbmcsIGFzIHdlbGwgYXMgYW55IHBvc3NpYmxlIG90aGVyIGVycm9yIGNv
bmRpdGlvbiB0aGF0IG1heSBiZQo+ID4gdHJpZ2dlcmVkIGF0IHJ1bnRpbWUuCj4gPgo+ID4gVGhl
IHdhcm5pbmcgY291bGQgYmUgZml4ZWQgYnkgYWRkaW5nIGEgS2NvbmZpZyBkZXBlZGVuY3kgb24g
Q09ORklHX09GLAo+ID4gYnV0IExpdSBZaW5nIHBvaW50cyBvdXQgdGhhdCB0aGUgZHJpdmVyIG1h
eSBoaXQgdGhlIG91dC1vZi1ib3VuZHMKPiA+IHByb2JsZW0gYXQgcnVudGltZSBhbnl3YXkuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+IC0t
LQo+ID4gdjI6IGZpeCBzdWJqZWN0IGxpbmUKPiA+ICAgICBleHBhbmQgcGF0Y2ggZGVzY3JpcHRp
b24KPiA+ICAgICBwcmludCBtdXggbnVtYmVyCj4gPiAgICAgY2hlY2sgdXBwZXIgYm91bmQgYXMg
d2VsbAo+IFtdCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtbGRiLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYwo+IFtdCj4gPiBAQCAtMTk3LDYgKzE5Nywx
MiBAQCBzdGF0aWMgdm9pZCBpbXhfbGRiX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2Rl
ciAqZW5jb2RlcikKPiA+ICAgICAgIGludCBkdWFsID0gbGRiLT5sZGJfY3RybCAmIExEQl9TUExJ
VF9NT0RFX0VOOwo+ID4gICAgICAgaW50IG11eCA9IGRybV9vZl9lbmNvZGVyX2FjdGl2ZV9wb3J0
X2lkKGlteF9sZGJfY2gtPmNoaWxkLCBlbmNvZGVyKTsKPiA+Cj4gPiArICAgICBpZiAobXV4IDwg
MCB8fCBtdXggPj0gQVJSQVlfU0laRShsZGItPmNsa19zZWwpKSB7Cj4gPiArICAgICAgICAgICAg
IGRldl93YXJuKGxkYi0+ZGV2LCAiJXM6IGludmFsaWQgbXV4ICVkXG4iLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICBfX2Z1bmNfXywgRVJSX1BUUihtdXgpKTsKPgo+IFRoaXMgZG9lcyBub3Qg
Y29tcGlsZSB3aXRob3V0IHdhcm5pbmdzLgo+Cj4gZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtbGRi
LmM6IEluIGZ1bmN0aW9uIOKAmGlteF9sZGJfZW5jb2Rlcl9lbmFibGXigJk6Cj4gZHJpdmVycy9n
cHUvZHJtL2lteC9pbXgtbGRiLmM6MjAxOjIyOiB3YXJuaW5nOiBmb3JtYXQg4oCYJWTigJkgZXhw
ZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmGludOKAmSwgYnV0IGFyZ3VtZW50IDQgaGFzIHR5cGUg
4oCYdm9pZCAq4oCZIFstV2Zvcm1hdD1dCj4gICAyMDEgfCAgIGRldl93YXJuKGxkYi0+ZGV2LCAi
JXM6IGludmFsaWQgbXV4ICVkXG4iLAo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgo+Cj4gSWYgeW91IHdhbnQgdG8gdXNlIEVSUl9QVFIsIHRoZSAl
ZCBzaG91bGQgYmUgJXBlIGFzIEVSUl9QVFIKPiBpcyBjb252ZXJ0aW5nIGFuIGludCBhIHZvaWQg
KiB0byBkZWNvZGUgdGhlIGVycm9yIHR5cGUgYW5kCj4gZW1pdCBpdCBhcyBhIHN0cmluZy4KClNv
cnJ5IGFib3V0IHRoYXQuCgpJIGRlY2lkZWQgYWdhaW5zdCB1c2luZyBFUlJfUFRSKCkgaW4gb3Jk
ZXIgdG8gYWxzbyBjaGVjayBmb3IKcG9zaXRpdmUgYXJyYXkgb3ZlcmZsb3csIGJ1dCB0aGUgdmVy
c2lvbiBJIHRlc3RlZCB3YXMgZGlmZmVyZW50IGZyb20KdGhlIHZlcnNpb24gSSBzZW50LgoKdjMg
Y29taW5nLgoKICAgICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
