Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 024EAD6AC6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 22:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1187B6E588;
	Mon, 14 Oct 2019 20:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ED46E588
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 20:24:55 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id E5B6D5C1173;
 Mon, 14 Oct 2019 22:24:53 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 14 Oct 2019 22:24:51 +0200
From: Stefan Agner <stefan@agner.ch>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v4 02/14] drm/mxsfb: Read bus flags from bridge if present
In-Reply-To: <1567078215-31601-3-git-send-email-robert.chiras@nxp.com>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
 <1567078215-31601-3-git-send-email-robert.chiras@nxp.com>
Message-ID: <b5da1f015a4dd87a612e1a9e57fdca7a@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1571084693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifyjUFLJ9uzTTzrkMj72r74yQo5VoUndfopoOcl3f6Y=;
 b=ayl3bydti//Ft78EF77JKVgVud3aqxfZUVRuMvkxxAa1IFoCp3dkRn5NwJLsQZZPle7h6C
 5Vt2j+sm4oPWLuS2/XFt4lLAG1myi+QvLayxT8TgtM5RRNelA1XOmaMc7tHIfQT/1WYTlt
 4YpAItIPKcBliTO2mLv6ikb7eM8fheY=
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
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yOSAxMzozMCwgUm9iZXJ0IENoaXJhcyB3cm90ZToKPiBGcm9tOiBHdWlkbyBH
w7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgo+IAo+IFRoZSBicmlkZ2UgbWlnaHQgaGF2ZSBzcGVj
aWFsIHJlcXVpcm1lbnRlcyBvbiB0aGUgaW5wdXQgYnVzLiBUaGlzCj4gaXMgZS5nLiB1c2VkIGJ5
IHRoZSBpbXgtbndsIGJyaWRnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8
YWd4QHNpZ3hjcHUub3JnPgo+IFJldmlld2VkLWJ5OiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25l
ci5jaD4KCkFwcGxpZWQgdG8gdGhlIGRybS1taXNjLW5leHQgYnJhbmNoLgoKSSBkZWNpZGVkIHRv
IGFwcGx5IHRob3NlIHR3byBzaW5jZSB0aGV5IGFyZSBpbmRlcGVuZGVudCBmcm9tIHRoZSByZXN0
LgpZb3UgY2FuIGRyb3AgdGhlbSBpbiB0aGUgbmV4dCBzcGluIG9mIHRoZSByZXN0LgoKLS0KU3Rl
ZmFuCgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYyB8IDUgKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCj4gYi9kcml2
ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCj4gaW5kZXggZGUwOWI5My4uYjY5YWNlOCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwo+IEBAIC0yMDksNyArMjA5LDcgQEAg
c3RhdGljIHZvaWQgbXhzZmJfY3J0Y19tb2RlX3NldF9ub2ZiKHN0cnVjdAo+IG14c2ZiX2RybV9w
cml2YXRlICpteHNmYikKPiAgewo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IG14c2ZiLT5w
aXBlLmNydGMuZGV2Owo+ICAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm0gPSAmbXhzZmItPnBp
cGUuY3J0Yy5zdGF0ZS0+YWRqdXN0ZWRfbW9kZTsKPiAtCWNvbnN0IHUzMiBidXNfZmxhZ3MgPSBt
eHNmYi0+Y29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnVzX2ZsYWdzOwo+ICsJdTMyIGJ1c19mbGFn
cyA9IG14c2ZiLT5jb25uZWN0b3ItPmRpc3BsYXlfaW5mby5idXNfZmxhZ3M7Cj4gIAl1MzIgdmRj
dHJsMCwgdnN5bmNfcHVsc2VfbGVuLCBoc3luY19wdWxzZV9sZW47Cj4gIAlpbnQgZXJyOwo+ICAK
PiBAQCAtMjMzLDYgKzIzMyw5IEBAIHN0YXRpYyB2b2lkIG14c2ZiX2NydGNfbW9kZV9zZXRfbm9m
YihzdHJ1Y3QKPiBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIpCj4gIAo+ICAJY2xrX3NldF9yYXRl
KG14c2ZiLT5jbGssIG0tPmNydGNfY2xvY2sgKiAxMDAwKTsKPiAgCj4gKwlpZiAobXhzZmItPmJy
aWRnZSAmJiBteHNmYi0+YnJpZGdlLT50aW1pbmdzKQo+ICsJCWJ1c19mbGFncyA9IG14c2ZiLT5i
cmlkZ2UtPnRpbWluZ3MtPmlucHV0X2J1c19mbGFnczsKPiArCj4gIAlEUk1fREVWX0RFQlVHX0RS
SVZFUihkcm0tPmRldiwgIlBpeGVsIGNsb2NrOiAlZGtIeiAoYWN0dWFsOiAlZGtIeilcbiIsCj4g
IAkJCSAgICAgbS0+Y3J0Y19jbG9jaywKPiAgCQkJICAgICAoaW50KShjbGtfZ2V0X3JhdGUobXhz
ZmItPmNsaykgLyAxMDAwKSk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
