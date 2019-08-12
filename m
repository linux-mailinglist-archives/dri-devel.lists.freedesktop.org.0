Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0444A89702
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 07:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A086E495;
	Mon, 12 Aug 2019 05:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24A36E495
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:57:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7C5vIR4061742;
 Mon, 12 Aug 2019 00:57:18 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7C5vI9Q080164
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Aug 2019 00:57:18 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 12
 Aug 2019 00:56:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 12 Aug 2019 00:56:05 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7C5u3mB022015;
 Mon, 12 Aug 2019 00:56:03 -0500
Subject: Re: [PATCH for-5.3] drm/omap: ensure we have a valid dma_mask
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Christoph Hellwig <hch@lst.de>
References: <20190808101042.18809-1-hch@lst.de>
 <7fff8fd3-16ae-1f42-fcd6-9aa360fe36b5@ti.com> <20190809080750.GA21874@lst.de>
 <c219e7e6-0f66-d6fd-e0cf-59c803386825@ti.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <b5961703-6e6f-5183-206b-d792017beb96@ti.com>
Date: Mon, 12 Aug 2019 08:56:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c219e7e6-0f66-d6fd-e0cf-59c803386825@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565589438;
 bh=d/2eujAuWcFMzItdKiZz1Co+QI1jNG7Mcvw6s/uq0OE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=aWW5sFmsib5UYxgILEXnXw+NZAMQwMz0uPV7NaumisPe9UoIh+rdngL/9a29c0sT4
 sTHG54yZhPi0b+Bgb2N95dodWtp54E5cClAQkI/hehzDqaYl5tBHNCf7L9fEUkikFY
 WqpCHXJV88nTU61dWCA3w05/m62gjyjEweMDBJAU=
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
Cc: airlied@linux.ie, "H. Nikolaus Schaller" <hns@goldelico.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAwOS8wOC8yMDE5IDEzLjAwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBIZXJlJ3MgbXkg
dmVyc2lvbi4KPiAKPiBGcm9tIGMyNTgzMDllMzZmYzg2MDc2ZGIxNTVhZWFkMDNhMzkwMGI5NmMz
ZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQHRpLmNvbT4KPiBEYXRlOiBGcmksIDkgQXVnIDIwMTkgMDk6NTQ6NDkgKzAzMDAK
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9vbWFwOiBlbnN1cmUgd2UgaGF2ZSBhIHZhbGlkIGRtYV9t
YXNrCj4gCj4gVGhlIG9tYXBkcm0gZHJpdmVyIHVzZXMgZG1hX3NldF9jb2hlcmVudF9tYXNrKCks
IGJ1dCB0aGF0J3Mgbm90IGVub3VnaAo+IGFueW1vcmUgd2hlbiBMUEFFIGlzIGVuYWJsZWQuCj4g
Cj4gRnJvbSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT46Cj4gCj4gVGhlIHRyYWRpdGlv
bmFsIGFybSBETUEgY29kZSBpZ25vcmVzLCBidXQgdGhlIGdlbmVyaWMgZG1hLWRpcmVjdC9zd2lv
dGxiCj4gaGFzIHN0cmljdGVyIGNoZWNrcyBhbmQgdGh1cyBmYWlscyBtYXBwaW5ncyB3aXRob3V0
IGEgRE1BIG1hc2suICBBcyB3ZQo+IHVzZSBzd2lvdGxiIGZvciBhcm0gd2l0aCBMUEFFIG5vdywg
b21hcGRybSBuZWVkcyB0byBjYXRjaCB1cCBhbmQKPiBhY3R1YWxseSBzZXQgYSBETUEgbWFzay4K
PiAKPiBDaGFuZ2UgdGhlIGRtYV9zZXRfY29oZXJlbnRfbWFzaygpIGNhbGwgdG8KPiBkbWFfY29l
cmNlX21hc2tfYW5kX2NvaGVyZW50KCkgc28gdGhhdCB0aGUgZGV2LT5kbWFfbWFzayBpcyBhbHNv
IHNldC4KClJldmlld2VkLWJ5OiBQZXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAdGkuY29t
PgoKPiBGaXhlczogYWQzYzdiMThjNWIzICgiYXJtOiB1c2Ugc3dpb3RsYiBmb3IgYm91bmNlIGJ1
ZmZlcmluZyBvbiBMUEFFIGNvbmZpZ3MiKQo+IFJlcG9ydGVkLWJ5OiAiSC4gTmlrb2xhdXMgU2No
YWxsZXIiIDxobnNAZ29sZGVsaWNvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYu
Ywo+IGluZGV4IDI4OGM1OWRhZTU2YS4uMWJhZDBhMmNjNWM2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2Rydi5jCj4gQEAgLTY2OSw3ICs2NjksNyBAQCBzdGF0aWMgaW50IHBkZXZfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChvbWFwZHNzX2lzX2luaXRp
YWxpemVkKCkgPT0gZmFsc2UpCj4gIAkJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4gIAo+IC0JcmV0
ID0gZG1hX3NldF9jb2hlcmVudF9tYXNrKCZwZGV2LT5kZXYsIERNQV9CSVRfTUFTSygzMikpOwo+
ICsJcmV0ID0gZG1hX2NvZXJjZV9tYXNrX2FuZF9jb2hlcmVudCgmcGRldi0+ZGV2LCBETUFfQklU
X01BU0soMzIpKTsKPiAgCWlmIChyZXQpIHsKPiAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWls
ZWQgdG8gc2V0IHRoZSBETUEgbWFza1xuIik7Cj4gIAkJcmV0dXJuIHJldDsKPiAKPiAKPiAKPiAK
Ci0gUMOpdGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
