Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DE876C2D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 16:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809CE6ED9D;
	Fri, 26 Jul 2019 14:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB946ED9D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:57:08 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id D6EE85C02B3;
 Fri, 26 Jul 2019 16:57:06 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 26 Jul 2019 16:57:05 +0200
From: Stefan Agner <stefan@agner.ch>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] drm/tegra: return with probe defer if GPIO subsystem is
 not ready
In-Reply-To: <f035a8ba-ffa7-b98b-a444-db8b4bbd34ec@gmail.com>
References: <20180726133606.14587-1-stefan@agner.ch>
 <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
 <cd14bca0a1f1e097265602a1d5f0c0f5@agner.ch>
 <f035a8ba-ffa7-b98b-a444-db8b4bbd34ec@gmail.com>
Message-ID: <d02d9605797d784dc941c9d98769bf5d@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1564153026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKw/2BALKQNgmImrcFcR8qt4PZbrmJFQiHxkm8oGnN0=;
 b=IF6peK+cmaLIt7j7RZ7TU9ze6nNP7kz+xzoXwfKhB8cYiMZCzvc6jsy/cQQvAM8pPKBVhm
 /PC5gP1r95Xmk0H433os/KLAO2si4zkauLP7EpHjCEWEqUcPkEIVqHm7bgGgtNHjDlDeAt
 uRiWb1fcfMmKA5gfsUDYuQNSK1BGLQA=
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0yNiAxNjo0NiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI2LjA3LjIwMTkg
MTc6MjMsIFN0ZWZhbiBBZ25lciDQv9C40YjQtdGCOgo+PiBIaSBUaGllcnJ5LCBIaSBEYXZlLAo+
Pgo+PiBPbiAyMDE4LTA5LTA3IDAxOjMxLCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4+PiBPbiAyNi4w
Ny4yMDE4IDA2OjM2LCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4+Pj4gSWYgdGhlIEdQSU8gc3Vic3lz
dGVtIGlzIG5vdCByZWFkeSBtYWtlIHN1cmUgdG8gcmV0dXJuIC1FUFJPQkVfREVGRVIKPj4+PiBp
bnN0ZWFkIG9mIHNpbGVudGx5IGNvbnRpbnVpbmcgd2l0aG91dCBIUEQuCj4+Pj4KPj4+PiBSZXBv
cnRlZC1ieTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Cj4+Pgo+Pj4g
SSB0aGluayB0aGlzIGRpZCBub3QgZ2V0IG1lcmdlZCB5ZXQsIGFueSBjaGFuY2UgdG8gZ2V0IGl0
IGluPwo+Pgo+PiBBbnkgY2hhbmNlIHRvIGdldCB0aGlzIGluIGluIHRoZSBuZXh0IG1lcmdlIHdp
bmRvdz8KPiAKPiBUaGUgcGF0Y2ggaXNuJ3QgcmVsZXZhbnQgYW55bW9yZSAoc2luY2UgdjUuMykg
YmVjYXVzZSB0aGUgY29kZSB3YXMKPiBjaGFuZ2VkIGFuZCBub3cgcHJvcGFnYXRlcyB0aGUgcHJv
cGVyIGVycm9yIGNvZGUgaW4gYSBjYXNlIG9mIGVycm9yLAo+IHBsZWFzZSBzZWUgWzFdLgo+IAo+
IFsxXQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2g9djUuMy1yYzEmaWQ9YmJhZDY0MDcwOWZkNDNmZjc3
Yjg4MzhjNDA5Yzk3N2MwYjI4NDMwYwoKT2ggSSBzZWUsIEkgYWNjaWRlbnRhbGx5IGNoZWNrZWQg
aW4gTGludXggNS4yLiBTb3JyeSBmb3IgdGhlIG5vaXNlIGFuZAp0aGFua3MgZm9yIHRoZSBsaW5r
IQoKLS0KU3RlZmFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
