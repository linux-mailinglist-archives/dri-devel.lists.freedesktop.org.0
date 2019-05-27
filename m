Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C57142B82A
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 17:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DF1898C4;
	Mon, 27 May 2019 15:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514D2898C4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 15:11:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RFBtrL031065;
 Mon, 27 May 2019 10:11:55 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RFBsNX050891
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 10:11:55 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 10:11:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 10:11:54 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RFBpnk021989;
 Mon, 27 May 2019 10:11:52 -0500
Subject: Re: [PATCHv3 22/23] drm/bridge: tc358767: add IRQ and HPD support
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
 <CGME20190503123143epcas1p3e660a6578d5a6261e7885928db6cba8f@epcas1p3.samsung.com>
 <20190503122949.12266-23-tomi.valkeinen@ti.com>
 <93a0800e-ab83-e2f3-32d8-eb9e5ef8c5f1@samsung.com>
 <1ea932c7-a6d6-e4fc-bad4-ea9519656018@ti.com>
 <34a9e6fa-2457-ed8e-1bdd-ac09eac2d265@samsung.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <4bc546d2-e3cf-ffc0-69b8-3369b4e84993@ti.com>
Date: Mon, 27 May 2019 18:11:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <34a9e6fa-2457-ed8e-1bdd-ac09eac2d265@samsung.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558969915;
 bh=zYeJBrrxLboqBsBNDK4kcppz0imWTi5q/FkWJvsVbuU=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=Um7TWpa0A4oo/37HQTPOOGS2RxrakmHdXIlpKBusMTQVRNvMtGHcxVOCsh0utKBzD
 l4b6k5YS1p9lKzqi21z58yxF+GLTVt2v1i6MjAulCN4435EyYOu3LAIzGDmNLIKYRT
 zuQ7GPt2Rj1S0l5GRcovHA5HXVD1ErWVFhWxNAgQ=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEvMDUvMjAxOSAxNzoxOCwgQW5kcnplaiBIYWpkYSB3cm90ZToKCj4+IERpc3BsYXlQb3J0
IHNwZWMgdGFsa3MgYWJvdXQgZG9pbmcgdGhlIGRpc3BsYXktcHJvcHMgcmVhZGluZyBhbmQgRURJ
RCByZWFkaW5nIHdoZW4KPj4gaGFuZGxpbmcgSFBELgo+Pgo+PiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGJlc3QgdG8gY2hhbmdlIHRoZSBjb2RlIHNvIHRoYXQgd2UgcmVhZCBkaXNwbGF5IHByb3BzIGFu
ZCBFRElEIGluIEhQRCwKPj4gYnV0IHNvIHRoYXQgd2UgYWxzbyBjYW4gcmVhZCB0aGVtIGxhdGVy
ICh3aGVuIG5lZWRlZCwgcHJvYmFibHkgYnJpZGdlIGVuYWJsZSBhbmQKPj4gZ2V0X21vZGVzKSBp
ZiB3ZSBoYXZlbid0IGRvbmUgdGhlIHJlYWRzIGFscmVhZHkuIEkndmUgaGFkIHRoaXMgaW4gbWlu
ZCBzaW5jZSBJIHN0YXJ0ZWQgdGhlCj4+IHNlcmllcywgYnV0IGFzIGl0IGRpZG4ndCBmZWVsIGxp
a2UgYSBzaW1wbGUgY2hhbmdlLCBJIGxlZnQgaXQgZm9yIGxhdGVyLgo+IAo+IAo+IE15IGFwcHJv
YWNoIGFuZCBleHBlcmllbmNlIHN1Z2dlc3QgdGhhdCBkZXRlY3QsIHNob3VsZCBiZSByYXRoZXIK
PiBsaWdodHdlaWdodCBhbmQgc2hvdWxkIG5vdCBtb2RpZnkgc3RhdGUsIEkgYW0gbm90IGV2ZW4g
c3VyZSBpZiBpdCBpcwo+IGNhbGxlZCBhdCBhbGwgb24gZm9yY2VkIGNvbm5lY3Rvci4KCkkganVz
dCByZWFsaXplZCB0aGF0IHRoaXMgaXMgbm90IGV4YWN0bHkgcGVyZmVjdC4uLgoKTGluayB0cmFp
bmluZyBjYW4gYWRqdXN0IHRoZSBsaW5rIHNwZWVkIGFuZC9vciBudW1iZXIgb2YgbGFuZXMsIGFs
dGhvdWdoIAp0aGUgZHJpdmVyIGRvZXNuJ3Qgc3VwcG9ydCB0aGlzIGF0IHRoZSBtb21lbnQuIFRo
ZSBzcGVlZCBhbmQgbnVtYmVyIG9mIApsYW5lcyBhZmZlY3QgdGhlIHZpZGVvIG1vZGVzIHRoYXQg
YXJlIHBvc3NpYmxlLCBzbyB0aGV5IGFmZmVjdCBnZXRfbW9kZXMuCgpTby4uLiBJIHRoaW5rIHRo
ZSBkcml2ZXIgc2hvdWxkIHNldCB1cCB0aGUgbGluayBmdWxseSBiZWZvcmUgZ2V0X21vZGVzIApn
ZXQgY2FsbGVkLCBpbnN0ZWFkIG9mIGxlYXZpbmcgdGhlIGxpbmsgc2V0dXAgdG8gdGhlIHBvaW50
IHdoZXJlIHdlIAplbmFibGUgdGhlIGJyaWRnZS4gTWF5YmUuLi4gVGhpcyBpcyBub3QgZXhhY3Rs
eSBjbGVhciB0byBtZSA9KS4KCkluIGFueSBjYXNlLCBJIHRoaW5rIHRoYXQncyBmdXR1cmUgd29y
ay4gSSBoYXZlIGNoYW5nZWQgdGhlIGNvZGUgdG8gcmVhZCAKdGhlIGRpc3BsYXkgcHJvcHMgaW4g
Z2V0X21vZGVzKCksIGFuZCBJIGhhdmUgYW5vdGhlciBzbWFsbCBmaXggdG9vLiBJJ2xsIApzZW5k
IHY0IHRoaXMgd2VlaywgYW5kIGhvcGVmdWxseSB3ZSBjYW4gZ2V0IHRoaXMgbWVyZ2VkLgoKICBU
b21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwg
MDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlr
a2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
