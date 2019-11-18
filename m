Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA6100555
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB87F6E49F;
	Mon, 18 Nov 2019 12:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370B46E49F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:09:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAIC9FHO121166;
 Mon, 18 Nov 2019 06:09:15 -0600
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAIC9FCT113261
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Nov 2019 06:09:15 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 06:09:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 06:09:14 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAIC9CMD126316;
 Mon, 18 Nov 2019 06:09:13 -0600
Subject: Re: [PATCH 0/4] drm/omap: dss: Use PTR_ERR_OR_ZERO() to simplify code
To: zhengbin <zhengbin13@huawei.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sebastian.reichel@collabora.com>, <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <1574078853-69002-1-git-send-email-zhengbin13@huawei.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <daade52d-0dfc-9365-b17c-02e7e785afad@ti.com>
Date: Mon, 18 Nov 2019 14:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1574078853-69002-1-git-send-email-zhengbin13@huawei.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574078955;
 bh=m+KroGEZR2s4ys9ZMgZ0jBH+Kg14iOhTrfo3+nEaMMc=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=E6qJANtlvA9BqtKoJYEIyjcsQeKcRldM6p30kt/td5lMhUMjDRNBVWcnRcguRzpMw
 t8RT+1y98ua/SCLVCp0RE+Doyt4HrMq5Ik/T4FrSFyHNPlPcaV5GpeYjZrpIW1DRcb
 l3MpbhD3ZgmV6ZsO6qzvwL9hi/t8xfTcd2Qs3m+k=
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

SGkgemhlbmdiaW4sCgpPbiAxOC8xMS8yMDE5IDE0OjA3LCB6aGVuZ2JpbiB3cm90ZToKPiB6aGVu
Z2JpbiAoNCk6Cj4gICAgZHJtL29tYXA6IGRzczogVXNlIFBUUl9FUlJfT1JfWkVSTygpIHRvIHNp
bXBsaWZ5IGNvZGUgaW4KPiAgICAgIGhkbWlfYXVkaW9fcmVnaXN0ZXIKPiAgICBkcm0vb21hcDog
ZHNzOiBVc2UgUFRSX0VSUl9PUl9aRVJPKCkgdG8gc2ltcGxpZnkgY29kZSBpbgo+ICAgICAgaGRt
aTRfY29yZV9pbml0Cj4gICAgZHJtL29tYXA6IGRzczogVXNlIFBUUl9FUlJfT1JfWkVSTygpIHRv
IHNpbXBsaWZ5IGNvZGUgaW4KPiAgICAgIGhkbWk1X2NvcmVfaW5pdAo+ICAgIGRybS9vbWFwOiBk
c3M6IFVzZSBQVFJfRVJSX09SX1pFUk8oKSB0byBzaW1wbGlmeSBjb2RlIGluIGhkbWlfcGh5X2lu
aXQKPiAKPiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5jICAgICAgfCA1ICst
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5jIHwgNSArLS0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk1X2NvcmUuYyB8IDUgKy0tLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pX3BoeS5jICAgfCA1ICstLS0tCj4g
ICA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpUaGFu
a3MsIGJ1dCBJIGRvbid0IGxpa2UgUFRSX0VSUl9PUl9aRVJPLCBJIHRoaW5rIGl0IG1ha2VzIHRo
ZSBjb2RlIG1vcmUgCmRpZmZpY3VsdCB0byByZWFkIGFuZCBtYW5hZ2UuCgogIFRvbWkKCi0tIApU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
