Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F509A991
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 10:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5FF6EBE9;
	Fri, 23 Aug 2019 08:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4A96EBE9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:04:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7N84Hsn127010;
 Fri, 23 Aug 2019 03:04:17 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7N84HPc079882
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 23 Aug 2019 03:04:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 23
 Aug 2019 03:04:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 23 Aug 2019 03:04:16 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7N84Eb1090080;
 Fri, 23 Aug 2019 03:04:15 -0500
Subject: Re: [PATCH] drm/omap: Fix port lookup for SDI output
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20190818140838.GC30291@darkstar.musicnaut.iki.fi>
 <20190821183226.13784-1-laurent.pinchart@ideasonboard.com>
 <20190821202627.GD30291@darkstar.musicnaut.iki.fi>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <45a226f3-7a31-2109-8f01-1628b3d61654@ti.com>
Date: Fri, 23 Aug 2019 11:04:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821202627.GD30291@darkstar.musicnaut.iki.fi>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566547457;
 bh=Q5tcG2om7OB0TnkdUup59lJ6tgZhUw6VzAk7+8LXn04=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=YzSGHC8uJCQLyQlMIp4AADoxJkE4kdbk4lHCRSACKzdAeh2sZx8A6kOwvOwKGA4ri
 MPvkPYtZEkoXwNhykYRGjcbLAoh3Siv1asf57mAhG0NmF0MwU4iS1UoXvM3KOYQhJF
 5tZCv8dgefkqf1MfyKC2Js+F6O34SRM7+fnr1PzA=
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
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEvMDgvMjAxOSAyMzoyNiwgQWFybyBLb3NraW5lbiB3cm90ZToKPiBIaSwKPiAKPiBPbiBX
ZWQsIEF1ZyAyMSwgMjAxOSBhdCAwOTozMjoyNlBNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdy
b3RlOgo+PiBXaGVuIHJlZmFjdG9yaW5nIHBvcnQgbG9va3VwIGZvciBEU1Mgb3V0cHV0cywgY29t
bWl0IGQxN2ViNDUzN2E3ZQo+PiAoImRybS9vbWFwOiBGYWN0b3Igb3V0IGNvbW1vbiBpbml0L2Ns
ZWFudXAgY29kZSBmb3Igb3V0cHV0IGRldmljZXMiKQo+PiBpbmNvcnJlY3RseSBoYXJkY29kZWQg
dXNhZ2Ugb2YgRFQgcG9ydCAwLiBUaGlzIGJyZWFrcyBvcGVyYXRpb24gZm9yIFNESQo+PiAod2hp
Y2ggdXNlcyB0aGUgRFQgcG9ydCAxKSBhbmQgRFBJIG91dHB1dHMgb3RoZXIgdGhhbiBEUEkwICh3
aGljaCBhcmUKPj4gbm90IHVzZWQgaW4gbWFpbmxpbmUgRFQgc291cmNlcykuCj4+Cj4+IEZpeCB0
aGlzIGJ5IHVzaW5nIHRoZSBwb3J0IG51bWJlciBmcm9tIHRoZSBvdXRwdXQgb21hcF9kc3NfZGV2
aWNlCj4+IG9mX3BvcnRzIGZpZWxkLgo+Pgo+PiBGaXhlczogZDE3ZWI0NTM3YTdlICgiZHJtL29t
YXA6IEZhY3RvciBvdXQgY29tbW9uIGluaXQvY2xlYW51cCBjb2RlIGZvciBvdXRwdXQgZGV2aWNl
cyIpCj4+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KPiAKPiBUZXN0ZWQtYnk6IEFhcm8gS29za2luZW4gPGFhcm8ua29z
a2luZW5AaWtpLmZpPgo+IAo+IFRoYW5rcywgdGhpcyBmaXhlcyB0aGUgZGlzcGxheSBpc3N1ZSBv
biBOOTAwLgoKVGhhbmtzLCBwdXNoZWQgdG8gZHJtLW1pc2MtZml4ZXMuCgogIFRvbWkKCi0tIApU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
