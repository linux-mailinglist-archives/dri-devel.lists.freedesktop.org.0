Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D015A7F320
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A756ED97;
	Fri,  2 Aug 2019 09:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2636ED97
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:55:13 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x729tBY8102297;
 Fri, 2 Aug 2019 04:55:11 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x729tBw9047743
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 2 Aug 2019 04:55:11 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 2 Aug
 2019 04:55:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 2 Aug 2019 04:55:11 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x729t92n124050;
 Fri, 2 Aug 2019 04:55:10 -0500
Subject: Re: [PATCH] drm/tilcdc: Check priv->crtc validity in
 cpufreq_transition()
To: Jyri Sarha <jsarha@ti.com>
References: <20190802083901.2018-1-peter.ujfalusi@ti.com>
 <d45d48b6-6e74-1cec-85cc-ffc219fe4cdc@ti.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <ad4ddbbc-9523-dee6-fe02-4a2837b17294@ti.com>
Date: Fri, 2 Aug 2019 12:55:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d45d48b6-6e74-1cec-85cc-ffc219fe4cdc@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564739712;
 bh=tJwlzuH0v9hwG+wyVfKZSw1beVRcuxdhkO40sri+XW8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=IQb1iDuW3WfgiXvG+yklwGJrNpTeiVAs/3px5wFdHX3oR0LvcBj3PrPFxKbY+NVQR
 E0yeuB3fibxhA3w+N/ybTrdroWl+bq9BQFblclVBibyK2XgXcGpwHS4Da92UzE8XqP
 wvyxe8q+c7zGbXnJshS+7qwjL+wmtt6FyYanbuDo=
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
Cc: airlied@linux.ie, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAwMi8wOC8yMDE5IDEyLjM1LCBKeXJpIFNhcmhhIHdyb3RlOgo+IE9uIDAyLzA4LzIwMTkg
MTE6MzksIFBldGVyIFVqZmFsdXNpIHdyb3RlOgo+PiBUaGUgbm90aWZpZXIgY2FuIGJlIGNhbGxl
ZCBiZWZvcmUgd2UgaGF2ZSBjcnRjLiBXaXRoIHRoZSBjaGVjayB3ZSBjYW4gYXZvaWQKPj4gTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlIHdpdGhpbiB0aWxjZGNfY3J0Y191cGRhdGVfY2xrKCkuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+
Cj4gCj4gUGV0ZXIsIGRvIHlvdSBoYXZlICJkcm0vdGlsY2RjOiBSZWdpc3RlciBjcHVmcmVxIG5v
dGlmaWVyIGFmdGVyIHdlIGhhdmUKPiBpbml0aWFsaXplZCBjcnRjIiBbMV0gaW4geW91ciBicmFu
Y2g/IEl0IHdhcyBtZXJnZWQgaW4gdjUuMC4gSWYgeW91IGRvCj4gYW5kIHN0aWxsIHNlZSB0aGUg
Y3Jhc2gsIHRoZW4gSSBuZWVkIHRvIHN0dWR5IHRoaXMgbW9yZS4KPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gSnlyaQo+IAo+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gv
MjkyNDEyLwo+ICAgICBjb21taXQgNDMyOTczZmQzYTIwMTAyODQwZDVmN2U2MWFmOWYxYTAzYzIx
N2E0YwoKWW91ciBwYXRjaCBmaXhlZCB0aGUgaXNzdWUgaW4gYSBiZXR0ZXIgd2F5LiBJIHdhcyBq
dXN0IGNhcnJ5aW5nIHRoaXMKc2luY2UgRGVjZW1iZXIgMjAxOCBhbmQgc2luY2UgaXQgc3RpbGwg
YXBwbGllcyBJIHRob3VnaHQgdGhhdCBJIHdpbGwKc2VuZCBpdC4uLgoKSnVzdCBpZ25vcmUgdGhp
cyBwYXRjaCBhbmQgdGhhbmtzIGZvciB0aGUgcHJvcGVyIGZpeC4KCj4gCj4+IC0tLQo+PiAgZHJp
dmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90
aWxjZGNfZHJ2LmMKPj4gaW5kZXggMzA0NmE0YTQyMzJkLi44NTA5MzEyMzcyMmQgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jCj4+IEBAIC0xNjksNyArMTY5LDcgQEAgc3Rh
dGljIGludCBjcHVmcmVxX3RyYW5zaXRpb24oc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwKPj4g
IAlzdHJ1Y3QgdGlsY2RjX2RybV9wcml2YXRlICpwcml2ID0gY29udGFpbmVyX29mKG5iLAo+PiAg
CQkJc3RydWN0IHRpbGNkY19kcm1fcHJpdmF0ZSwgZnJlcV90cmFuc2l0aW9uKTsKPj4gIAo+PiAt
CWlmICh2YWwgPT0gQ1BVRlJFUV9QT1NUQ0hBTkdFKQo+PiArCWlmICh2YWwgPT0gQ1BVRlJFUV9Q
T1NUQ0hBTkdFICYmIHByaXYtPmNydGMpCj4+ICAJCXRpbGNkY19jcnRjX3VwZGF0ZV9jbGsocHJp
di0+Y3J0Yyk7Cj4+ICAKPj4gIAlyZXR1cm4gMDsKPj4KPiAKPiAKCi0gUMOpdGVyCgpUZXhhcyBJ
bnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4K
WS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVs
c2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
