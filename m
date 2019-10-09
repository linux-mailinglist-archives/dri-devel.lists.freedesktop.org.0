Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01007D0CE8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0986E96D;
	Wed,  9 Oct 2019 10:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BB96E96B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:38:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99AcClQ056919;
 Wed, 9 Oct 2019 05:38:12 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99AcCin046525
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Oct 2019 05:38:12 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 05:38:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 05:38:08 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99Ac9us102652;
 Wed, 9 Oct 2019 05:38:10 -0500
Subject: Re: [PATCH v3 1/8] drm/omap: use refcount API to track the number of
 users of dma_addr
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
References: <20191007112555.25278-1-jjhiblot@ti.com>
 <20191007112555.25278-2-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <189e18c8-0238-d237-8be0-458617f915b6@ti.com>
Date: Wed, 9 Oct 2019 13:38:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007112555.25278-2-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570617492;
 bh=Z5D/75cQev2cYCB2gbFw30TdYaTtnU/j0+Qd7gY6btE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vpn84Cb7RL6amVS3uTpq6obX8i1jsf4j4G0uZlFpMUmq5I2cIrq5JorbmUp9X0ohW
 PhBHni3TkCuDzjPCLcekOQ0/C5tRNv69c4m84ZUqg8RvXF+ImiLoMxWAxrjTXywfe7
 ewWyZU67wGti1kmB6PgHh8v097cMb5hlXLdHfAMs=
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
Cc: jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSkosCgpPbiAwNy8xMC8yMDE5IDE0OjI1LCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+
IFRoaXMgd291bGQgZ2l2ZSB1cyBhIFdBUk5fT04oKSBpZiB0aGUgcGluL3VucGluIGNhbGxzIGFy
ZSB1bmJhbGFuY2VkLgo+IAo+IFByb3Bvc2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNxdWVz
IEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgo+IFJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8
dG9taS52YWxrZWluZW5AdGkuY29tPgo+IC0tLQoKVGhpcyBkb2Vzbid0IGNvbXBpbGUsIGJ1dCBp
dCBnZXRzIGZpeGVkIGluIHNvbWUgbGF0ZXIgcGF0Y2ggaW4gdGhlIHNlcmllcy4KCkNhbiB5b3Ug
Zml4IHRoaXMsIGFuZCBhZGQgeW91ciByZXZpZXdlZC1ieXMsIGFuZCByZXNlbmQgb25lIG1vcmUg
dGltZS4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxh
bmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00
LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
