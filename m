Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D508B11E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC2C89BD2;
	Tue, 13 Aug 2019 07:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D2589BD2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:29:45 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7D7TdHk126943;
 Tue, 13 Aug 2019 02:29:39 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7D7TdPN123736
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Aug 2019 02:29:39 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 02:29:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 02:29:39 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7D7TaRQ006341;
 Tue, 13 Aug 2019 02:29:37 -0500
Subject: Re: [PATCH 27/60] drm/omap: Simplify HDMI mode and infoframe
 configuration
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-24-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8bc028da-ad5f-b4eb-0de4-f1554a28c3cb@ti.com>
Date: Tue, 13 Aug 2019 10:29:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-24-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565681379;
 bh=zRSdUM3a2jyGeonXOxCSgL0Bn9hOWdtaLKvInrJX0T0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Z1J6R1csI60LIPA6tvOWBXDcOS6Q6dYncw/6tqz0B0LsULVR1YlXqcMzuYN3eg0lO
 AvQgUlQBsuKRc+CPbvS1EKnnDG9g1FnVX7st/7eWbYpIUgT0UHDpAlnw/0LbDaxXBo
 PJ+AxBytd8tfh+RGtxIZTrPBQf1BJuor5kfsHSSI=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDcvMjAxOSAyMToxOSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBSZW1vdmUgdGhl
IG9tYXBfY29ubmVjdG9yX2dldF9oZG1pX21vZGUoKSBmdW5jdGlvbiBhcyB0aGUgSERNSSBtb2Rl
IGNhbgo+IGJlIGFjY2Vzc2VkIGRpcmVjdGx5IGZyb20gdGhlIGNvbm5lY3RvcidzIGRpc3BsYXkg
aW5mby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9v
bWFwX2Nvbm5lY3Rvci5jIHwgMTEgLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfY29ubmVjdG9yLmggfCAgMSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9v
bWFwX2VuY29kZXIuYyAgIHwgIDQgKy0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMTUgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQHRpLmNvbT4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQg
T3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJ
RDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
