Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE31C88D0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C9D892AC;
	Wed,  2 Oct 2019 12:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D2A892AC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 12:40:03 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 430082133F;
 Wed,  2 Oct 2019 12:40:03 +0000 (UTC)
Date: Wed, 2 Oct 2019 08:40:02 -0400
From: Sasha Levin <sashal@kernel.org>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATHC v6] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Message-ID: <20191002124002.GL17454@sasha-vm>
References: <20190918060227.6834-1-weh@microsoft.com>
 <DM5PR21MB0137DA408FE59E8C1171CFFCD78E0@DM5PR21MB0137.namprd21.prod.outlook.com>
 <DM5PR21MB01375E8543451D4550D622CDD7880@DM5PR21MB0137.namprd21.prod.outlook.com>
 <20191001184828.GF8171@sasha-vm>
 <PU1P153MB0169811097EA55DF795888B2BF9C0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PU1P153MB0169811097EA55DF795888B2BF9C0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570020003;
 bh=C27WP3WjY83XjqK00FA77hEI/TbJNxmgHsX3G7ohuJY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r1ISHHmlUa3ArxhsAN1rIrYFbdp7E9Nft088x4rC2BWSc1rug9fMRZiNAEvlaN9sk
 psxK5zJ4K0fRIworDS+q3PHxoLSWsTxwjQE2GdAQfEPZ2BVH804MSe+aysCm4f7xwy
 KNwsXlVW8+wyrVavZo30CoO4tzHc6UVNjBTRJcfA=
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
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michael Kelley <mikelley@microsoft.com>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDg6MDk6NDFBTSArMDAwMCwgRGV4dWFuIEN1aSB3cm90
ZToKPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogU2FzaGEgTGV2aW4gPHNh
c2hhbEBrZXJuZWwub3JnPgo+PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEsIDIwMTkgMTE6NDgg
QU0KPj4KPj4gT24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDU6MjY6MzRQTSArMDAwMCwgTWljaGFl
bCBLZWxsZXkgd3JvdGU6Cj4+ID5Gcm9tOiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9z
b2Z0LmNvbT4gIFNlbnQ6IFdlZG5lc2RheSwKPj4gU2VwdGVtYmVyIDE4LCAyMDE5IDI6NDggUE0K
Pj4gPj4gPgo+PiA+PiA+IFdpdGhvdXQgZGVmZXJyZWQgSU8gc3VwcG9ydCwgaHlwZXJ2X2ZiIGRy
aXZlciBpbmZvcm1zIHRoZSBob3N0IHRvIHJlZnJlc2gKPj4gPj4gPiB0aGUgZW50aXJlIGd1ZXN0
IGZyYW1lIGJ1ZmZlciBhdCBmaXhlZCByYXRlLCBlLmcuIGF0IDIwSHosIG5vIG1hdHRlciB0aGVy
ZQo+PiA+PiA+IGlzIHNjcmVlbiB1cGRhdGUgb3Igbm90LiBUaGlzIHBhdGNoIHN1cHBvcnRzIGRl
ZmVycmVkIElPIGZvciBzY3JlZW5zIGluCj4+ID4+ID4gZ3JhcGhpY3MgbW9kZSBhbmQgYWxzbyBl
bmFibGVzIHRoZSBmcmFtZSBidWZmZXIgb24tZGVtYW5kIHJlZnJlc2guIFRoZQo+PiA+PiA+IGhp
Z2hlc3QgcmVmcmVzaCByYXRlIGlzIHN0aWxsIHNldCBhdCAyMEh6Lgo+PiA+PiA+Cj4+ID4+ID4g
Q3VycmVudGx5IEh5cGVyLVYgb25seSB0YWtlcyBhIHBoeXNpY2FsIGFkZHJlc3MgZnJvbSBndWVz
dCBhcyB0aGUgc3RhcnRpbmcKPj4gPj4gPiBhZGRyZXNzIG9mIGZyYW1lIGJ1ZmZlci4gVGhpcyBp
bXBsaWVzIHRoZSBndWVzdCBtdXN0IGFsbG9jYXRlIGNvbnRpZ3VvdXMKPj4gPj4gPiBwaHlzaWNh
bCBtZW1vcnkgZm9yIGZyYW1lIGJ1ZmZlci4gSW4gYWRkaXRpb24sIEh5cGVyLVYgR2VuIDIgVk1z
IG9ubHkKPj4gPj4gPiBhY2NlcHQgYWRkcmVzcyBmcm9tIE1NSU8gcmVnaW9uIGFzIGZyYW1lIGJ1
ZmZlciBhZGRyZXNzLiBEdWUgdG8gdGhlc2UKPj4gPj4gPiBsaW1pdGF0aW9ucyBvbiBIeXBlci1W
IGhvc3QsIHdlIGtlZXAgYSBzaGFkb3cgY29weSBvZiBmcmFtZSBidWZmZXIKPj4gPj4gPiBpbiB0
aGUgZ3Vlc3QuIFRoaXMgbWVhbnMgb25lIG1vcmUgY29weSBvZiB0aGUgZGlydHkgcmVjdGFuZ2xl
IGluc2lkZQo+PiA+PiA+IGd1ZXN0IHdoZW4gZG9pbmcgdGhlIG9uLWRlbWFuZCByZWZyZXNoLiBU
aGlzIGNhbiBiZSBvcHRpbWl6ZWQgaW4gdGhlCj4+ID4+ID4gZnV0dXJlIHdpdGggaGVscCBmcm9t
IGhvc3QuIEZvciBub3cgdGhlIGhvc3QgcGVyZm9ybWFuY2UgZ2FpbiBmcm9tCj4+IGRlZmVycmVk
Cj4+ID4+ID4gSU8gb3V0d2VpZ2hzIHRoZSBzaGFkb3cgY29weSBpbXBhY3QgaW4gdGhlIGd1ZXN0
Lgo+PiA+PiA+Cj4+ID4+ID4gU2lnbmVkLW9mZi1ieTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNv
bT4KPj4gPgo+PiA+U2FzaGEgLS0gdGhpcyBwYXRjaCBhbmQgb25lIG90aGVyIGZyb20gV2VpIEh1
IGZvciB0aGUgSHlwZXItViBmcmFtZSBidWZmZXIKPj4gPmRyaXZlciBzaG91bGQgYmUgcmVhZHku
ICBCb3RoIHBhdGNoZXMgYWZmZWN0IG9ubHkgdGhlIEh5cGVyLVYgZnJhbWUgYnVmZmVyCj4+ID5k
cml2ZXIgc28gY2FuIGdvIHRocm91Z2ggdGhlIEh5cGVyLVYgdHJlZS4gIENhbiB5b3UgcGljayB0
aGVzZSB1cD8gIFRoeC4KPj4KPj4gSSBjYW4ndCBnZXQgdGhpcyB0byBhcHBseSBhbnl3aGVyZSwg
d2hhdCB0cmVlIGlzIGl0IGJhc2VkIG9uPwo+Pgo+PiAtLQo+PiBUaGFua3MsCj4+IFNhc2hhCj4K
PkhpIFNhc2hhLAo+VG9kYXkncyBoeXBlcnYvbGludXguZ2l0J3MgaHlwZXJ2LW5leHQgYnJhbmNo
J3MgdG9wIGNvbW1pdCBpcwo+ICAgIDQ4YjcyYTI2OTdkNSAoImh2X25ldHZzYzogQWRkIHRoZSBz
dXBwb3J0IG9mIGhpYmVybmF0aW9uIikuCj4KPlBsZWFzZSBwaWNrIHVwIHR3byBwYXRjaGVzIGZy
b20gV2VpIEh1Ogo+IzE6IFtQQVRDSCB2NF0gdmlkZW86IGh5cGVydjogaHlwZXJ2X2ZiOiBPYnRh
aW4gc2NyZWVuIHJlc29sdXRpb24gZnJvbSBIeXBlci1WIGhvc3QKPiMyOiBbUEFUSEMgdjZdIHZp
ZGVvOiBoeXBlcnY6IGh5cGVydl9mYjogU3VwcG9ydCBkZWZlcnJlZCBJTyBmb3IgSHlwZXItViBm
cmFtZSBidWZmZXIgZHJpdmVyCgpBaCwgSSBndWVzcyBJIHdhcyBtaXNzaW5nIHRoZSBmaXJzdCBv
bmUuIEkndmUgcXVldWVkIGJvdGggZm9yCmh5cGVydi1uZXh0LCB0aGFua3MhCgotLQpUaGFua3Ms
ClNhc2hhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
