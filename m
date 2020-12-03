Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471912CD58E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 13:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A32B6E082;
	Thu,  3 Dec 2020 12:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9587C6E082
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 12:35:21 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B3CZEZW060263;
 Thu, 3 Dec 2020 06:35:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606998914;
 bh=DoPsaIJexYKJMxAMl3u5Ghhewkvhl0VgCDQpfSLQiPk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=GbCY9rKopohTsdkX6idgPLAwuf4Q0ivNH64hHVSkbTdPmK8tItEXMOX9H5yZCr88v
 Vf5k1OTozhJxg1RMWRLTdnhqmFN2h1BkoGaI7xdPi8TssThn8v66XItf8GmoAB8uAq
 L2nbn5ZuHZZ9IbrtdaIjvmb9y1+PM5xuEJldBeKI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B3CZEAb047470
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Dec 2020 06:35:14 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Dec
 2020 06:35:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Dec 2020 06:35:13 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B3CZCmm130650;
 Thu, 3 Dec 2020 06:35:12 -0600
Subject: Re: [PATCH v2 1/5] drm: add legacy support for using degamma for gamma
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel
 Vetter <daniel@ffwll.ch>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-2-tomi.valkeinen@ti.com>
 <20201130103840.GR4141@pendragon.ideasonboard.com>
 <f744a803-6d8c-5188-7bfa-93cc05cc26bf@ti.com>
 <20201130141057.GL401619@phenom.ffwll.local>
 <93e718be-01ff-fc5c-6497-f7afb2becb38@ti.com>
 <CAKMK7uGY91+-HUuZfignoFJHWTm-zCAdsH4jLrC=EOXAHdEmvQ@mail.gmail.com>
 <20201203123153.GE6112@intel.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1208079c-929e-6e3b-2cf5-844b4456ec44@ti.com>
Date: Thu, 3 Dec 2020 14:35:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203123153.GE6112@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sekhar Nori <nsekhar@ti.com>,
 Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMTIvMjAyMCAxNDozMSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgoKPiBCVFcgSSBoYXZl
IHNvbWUgZ2FtbWEgcmVsYXRlZCBzdHVmZiBoZXJlCj4gZ2l0Oi8vZ2l0aHViLmNvbS92c3lyamFs
YS9saW51eC5naXQgZmJfaGVscGVyX2M4X2x1dF80Cj4gCj4gd2hpY2ggdHJpZXMgdG8gZml4IHNv
bWUgZmJfaGVscGVyIGdhbW1hIHN0dWZmLCBhbmQgSSdtIGFsc28KPiBnZXR0aW5nIHJpZCBvZiB0
aGUgZ2FtbWFfc3RvcmUgc3R1ZmYgZm9yIHRoZSBsZWFjeSB1YXBpIGZvcgo+IGRyaXZlcnMgd2hp
Y2ggaW1wbGVtZW50IHRoZSBmYW5jaWVyIGNvbG9yIG1hbmFnZW1lbnQgc3R1ZmYuCj4gSW4gZmFj
dCBJIGp1c3QgdGhyZXcgb3V0IHRoZSBoZWxwZXIgdGhpbmcgZW50aXJlbHkgYW5kIG1hZGUKPiB0
aGUgY29yZSBkaXJlY3RseSBjYWxsIHRoZSByaWdodCBzdHVmZi4gTm90IHN1cmUgaWYgdGhhdAo+
IHdvdWxkIGJlIGhlbHBmdWwsIGhhcm1mdWwgb3IganVzdCBtZWggaGVyZS4KCkkgZGlkbid0IGNo
ZWNrIHlvdXIgYnJhbmNoIHlldCwgYnV0IEkganVzdCBzZW50ICJbUEFUQ0ggMC8yXSBkcm06IGZp
eCBhbmQgY2xlYW51cCBsZWdhY3kgZ2FtbWEgc3VwcG9ydCIuCgogVG9taQoKLS0gClRleGFzIElu
c3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZ
LXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxz
aW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
