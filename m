Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4569CE4A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 13:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122E689CA4;
	Mon, 26 Aug 2019 11:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD6589CA4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 11:39:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7QBdS5B043246;
 Mon, 26 Aug 2019 06:39:28 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7QBdSIU112973
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Aug 2019 06:39:28 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 26
 Aug 2019 06:39:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 26 Aug 2019 06:39:27 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7QBdQ1g005321;
 Mon, 26 Aug 2019 06:39:26 -0500
Subject: Re: [PATCH v2 25/50] drm/omap: hdmi4: Rework EDID read to isolate
 data read
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-26-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <708f7343-43de-d097-de34-530ae3ad8c5b@ti.com>
Date: Mon, 26 Aug 2019 14:39:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820011721.30136-26-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566819568;
 bh=RTJ1ZessNv3DdTnAAqtg/4NLByM8YN9sSS+qf1lADLs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hChT35FkOxMCjJUkRkcv2uk0xcQAJve4Ko8Qyk8NWymm7MZqEuTTbZ4GOZ/Fk+Arp
 V9nyIVBV7aAGUlkHnX8PETY5nr7C0M6+C26V4mQL5tfxeUg/PlFybv28A1FxMJkqF0
 pgdw9i0EOfCzEmcKKGARYLznjfdqwvKepiuZd8II=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyMC8wOC8yMDE5IDA0OjE2LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+IEluIHBy
ZXBhcmF0aW9uIG9mIGFkZGluZyBEUk0gYnJpZGdlIHN1cHBvcnQgdG8gdGhlIGhkbWk0IGVuY29k
ZXIgY29kZSwKPiByZXdvcmsgdGhlIEVESUQgcmVhZCB0byBpc29sYXRlIGRhdGEgcmVhZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTQu
YyAgICAgIHwgOTQgKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3MvaGRtaTRfY29yZS5jIHwgNTkgKysrLS0tLS0tLS0tLS0tCj4gICBkcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5oIHwgIDQgKy0KPiAgIDMgZmlsZXMgY2hh
bmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgODQgZGVsZXRpb25zKC0pCgpJIGZpbmQgdGhpcyAoYW5k
IHRoZSBuZXh0KSBwYXRjaCBhIGJpdCBkaWZmaWN1bHQgdG8gcmV2aWV3LiBDYW4geW91IApleHBs
YWluIGEgYml0IG1vcmUgd2hhdCB0aGUgcHVycG9zZSBhbmQgdGhlIGNoYW5nZSBpcz8KCiAgVG9t
aQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAw
MTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2th
L0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
