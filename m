Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD59C4061
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 20:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8723B6E884;
	Tue,  1 Oct 2019 18:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04756E884
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 18:48:29 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52F3120B7C;
 Tue,  1 Oct 2019 18:48:29 +0000 (UTC)
Date: Tue, 1 Oct 2019 14:48:28 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michael Kelley <mikelley@microsoft.com>
Subject: Re: [PATHC v6] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Message-ID: <20191001184828.GF8171@sasha-vm>
References: <20190918060227.6834-1-weh@microsoft.com>
 <DM5PR21MB0137DA408FE59E8C1171CFFCD78E0@DM5PR21MB0137.namprd21.prod.outlook.com>
 <DM5PR21MB01375E8543451D4550D622CDD7880@DM5PR21MB0137.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM5PR21MB01375E8543451D4550D622CDD7880@DM5PR21MB0137.namprd21.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569955709;
 bh=GNgNrUswTuvHulo9vmyBNdCcYSawvC+U+jdWFB0IKyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=erK6Grjo4aC6WkHaCceBQ+bGig2oyXgyMli+uxdawFNMuoPz3ptlHI20zYnrieCdU
 DH7OOYU9vc/9njBGuy7uy4PfYeLd9Uh8a+RY1FFmytt9TO1CwQHXQsyOdJ04V8Ogsu
 DpqPyFfJN64LOCdPZCl/4MKpJVDaxghK2+7Ki9Hw=
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
Cc: "info@metux.net" <info@metux.net>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 Wei Hu <weh@microsoft.com>, "shc_work@mail.ru" <shc_work@mail.ru>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDU6MjY6MzRQTSArMDAwMCwgTWljaGFlbCBLZWxsZXkg
d3JvdGU6Cj5Gcm9tOiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4gIFNl
bnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDE4LCAyMDE5IDI6NDggUE0KPj4gPgo+PiA+IFdpdGhv
dXQgZGVmZXJyZWQgSU8gc3VwcG9ydCwgaHlwZXJ2X2ZiIGRyaXZlciBpbmZvcm1zIHRoZSBob3N0
IHRvIHJlZnJlc2gKPj4gPiB0aGUgZW50aXJlIGd1ZXN0IGZyYW1lIGJ1ZmZlciBhdCBmaXhlZCBy
YXRlLCBlLmcuIGF0IDIwSHosIG5vIG1hdHRlciB0aGVyZQo+PiA+IGlzIHNjcmVlbiB1cGRhdGUg
b3Igbm90LiBUaGlzIHBhdGNoIHN1cHBvcnRzIGRlZmVycmVkIElPIGZvciBzY3JlZW5zIGluCj4+
ID4gZ3JhcGhpY3MgbW9kZSBhbmQgYWxzbyBlbmFibGVzIHRoZSBmcmFtZSBidWZmZXIgb24tZGVt
YW5kIHJlZnJlc2guIFRoZQo+PiA+IGhpZ2hlc3QgcmVmcmVzaCByYXRlIGlzIHN0aWxsIHNldCBh
dCAyMEh6Lgo+PiA+Cj4+ID4gQ3VycmVudGx5IEh5cGVyLVYgb25seSB0YWtlcyBhIHBoeXNpY2Fs
IGFkZHJlc3MgZnJvbSBndWVzdCBhcyB0aGUgc3RhcnRpbmcKPj4gPiBhZGRyZXNzIG9mIGZyYW1l
IGJ1ZmZlci4gVGhpcyBpbXBsaWVzIHRoZSBndWVzdCBtdXN0IGFsbG9jYXRlIGNvbnRpZ3VvdXMK
Pj4gPiBwaHlzaWNhbCBtZW1vcnkgZm9yIGZyYW1lIGJ1ZmZlci4gSW4gYWRkaXRpb24sIEh5cGVy
LVYgR2VuIDIgVk1zIG9ubHkKPj4gPiBhY2NlcHQgYWRkcmVzcyBmcm9tIE1NSU8gcmVnaW9uIGFz
IGZyYW1lIGJ1ZmZlciBhZGRyZXNzLiBEdWUgdG8gdGhlc2UKPj4gPiBsaW1pdGF0aW9ucyBvbiBI
eXBlci1WIGhvc3QsIHdlIGtlZXAgYSBzaGFkb3cgY29weSBvZiBmcmFtZSBidWZmZXIKPj4gPiBp
biB0aGUgZ3Vlc3QuIFRoaXMgbWVhbnMgb25lIG1vcmUgY29weSBvZiB0aGUgZGlydHkgcmVjdGFu
Z2xlIGluc2lkZQo+PiA+IGd1ZXN0IHdoZW4gZG9pbmcgdGhlIG9uLWRlbWFuZCByZWZyZXNoLiBU
aGlzIGNhbiBiZSBvcHRpbWl6ZWQgaW4gdGhlCj4+ID4gZnV0dXJlIHdpdGggaGVscCBmcm9tIGhv
c3QuIEZvciBub3cgdGhlIGhvc3QgcGVyZm9ybWFuY2UgZ2FpbiBmcm9tIGRlZmVycmVkCj4+ID4g
SU8gb3V0d2VpZ2hzIHRoZSBzaGFkb3cgY29weSBpbXBhY3QgaW4gdGhlIGd1ZXN0Lgo+PiA+Cj4+
ID4gU2lnbmVkLW9mZi1ieTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4KPgo+U2FzaGEgLS0g
dGhpcyBwYXRjaCBhbmQgb25lIG90aGVyIGZyb20gV2VpIEh1IGZvciB0aGUgSHlwZXItViBmcmFt
ZSBidWZmZXIKPmRyaXZlciBzaG91bGQgYmUgcmVhZHkuICBCb3RoIHBhdGNoZXMgYWZmZWN0IG9u
bHkgdGhlIEh5cGVyLVYgZnJhbWUgYnVmZmVyCj5kcml2ZXIgc28gY2FuIGdvIHRocm91Z2ggdGhl
IEh5cGVyLVYgdHJlZS4gIENhbiB5b3UgcGljayB0aGVzZSB1cD8gIFRoeC4KCkkgY2FuJ3QgZ2V0
IHRoaXMgdG8gYXBwbHkgYW55d2hlcmUsIHdoYXQgdHJlZSBpcyBpdCBiYXNlZCBvbj8KCi0tClRo
YW5rcywKU2FzaGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
