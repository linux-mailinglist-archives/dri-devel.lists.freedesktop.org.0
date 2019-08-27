Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777819DEF3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DAC897C5;
	Tue, 27 Aug 2019 07:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64754897C5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 07:43:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R7hH9l118996;
 Tue, 27 Aug 2019 02:43:17 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R7hHRp044762
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 02:43:17 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 02:43:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 02:43:16 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R7hF8N109408;
 Tue, 27 Aug 2019 02:43:15 -0500
Subject: Re: [PATCH v2 15/50] drm/bridge: tfp410: Replace manual connector
 handling with bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-16-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9ca1ccf0-eb37-8012-ce6e-4f7e4b47d39e@ti.com>
Date: Tue, 27 Aug 2019 10:43:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820011721.30136-16-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566891797;
 bh=kD4Gzg+5WTxUnj324Y8aZM0OI8D5YaUHQm6Q+ROr0pg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nNwbL580pafEUZu/vDbQByV8bXI2m22ZujGv6eagJ8k4prnsw89zMS+OfL1m99pmY
 fdpGfkav3d8ZbsOyDIkKTsSN+WxmQhuQ9aBkFLv3J59+IMX9wMAfDAovZbZym9eIlS
 mJMBpUx+hD90247WzQdt2GYM2c30LPNpECsIwuoo=
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

T24gMjAvMDgvMjAxOSAwNDoxNiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBOb3cgdGhhdCBh
IGRyaXZlciBpcyBhdmFpbGFibGUgZm9yIGRpc3BsYXkgY29ubmVjdG9ycywgcmVwbGFjZSB0aGUK
PiBtYW51YWwgY29ubmVjdG9yIGhhbmRsaW5nIGNvZGUgd2l0aCB1c2FnZSBvZiB0aGUgRFJNIGJy
aWRnZSBBUEkuIFRoZQo+IHRmcDQxMCBkcml2ZXIgZG9lc24ndCBkZWFsIHdpdGggdGhlIGRpc3Bs
YXkgY29ubmVjdG9yIGRpcmVjdGx5IGFueW1vcmUsCj4gYnV0IHN0aWxsIGRlbGVnYXRlcyBkcm1f
Y29ubmVjdG9yIG9wZXJhdGlvbnMgdG8gdGhlIG5leHQgYnJpZGdlLiBUaGlzCj4gYnJpbmdzIHVz
IG9uZSBzdGVwIGNsb3NlciB0byBoYXZpbmcgdGhlIHRmcDQxMCBkcml2ZXIgaGFuZGxpbmcgdGhl
Cj4gVEZQNDEwIG9ubHkuCgpUaGUgbmV4dCBzdGVwIHdpbGwgZHJvcCB0aG9zZSBocGQgcmVsYXRl
ZCBkZWxheWVkIHdvcmtzPyBUaGV5IGxvb2sgCnByZXR0eSB1Z2x5ID0pLgoKPiArCWR2aS0+YnJp
ZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFZJRDsKClRoaXMgaXMgbm90IHRoZSBjb25u
ZWN0b3IgdHlwZSBzZWVuIGJ5IHVzZXJzcGFjZSwgaXMgaXQ/IEkgaGF2ZSBuZXZlciAKc2VlbiBh
IGJvYXJkIHVzZSBURlA0MTAgd2l0aCBhIERWSSBjb25uZWN0b3IuLi4KCiAgVG9taQoKLS0gClRl
eGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNp
bmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxl
OiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
