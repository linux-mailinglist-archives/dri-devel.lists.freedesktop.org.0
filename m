Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CB1328E7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 15:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E556E0BC;
	Tue,  7 Jan 2020 14:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC686E0BC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 14:30:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200107143057euoutp02adcd078decbdd006ec22cfb257dc8da3~noTgzvgQg1555615556euoutp02O
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 14:30:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200107143057euoutp02adcd078decbdd006ec22cfb257dc8da3~noTgzvgQg1555615556euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578407457;
 bh=YgnItu538B1ztQqs79aZbQUUXrKoCstD8E4g8Q7Ybu8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ChsLxN+LF3JeAUMqDyRcOF6utsQkwyvCTCqKpuiU0n954YXAErEh4W4sKpkKal3Bl
 p0NMfLfQpZEvcB9wKb9QA09QtoMxjUsqpaC8f7Up65KbA0qYl2wKdPu58v6BCGZfp0
 IGCzu6mcHNiXZvZdxTwJYgnTAEfAmR/4aKV1XasI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200107143056eucas1p163341045e657c8298b19b5021fff7632~noTgb9ta80603906039eucas1p1c;
 Tue,  7 Jan 2020 14:30:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id B1.8C.60679.026941E5; Tue,  7
 Jan 2020 14:30:56 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200107143056eucas1p245cadd5382db3cc439859e287ec3c987~noTgDupvg1331313313eucas1p2f;
 Tue,  7 Jan 2020 14:30:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200107143056eusmtrp1c0d4e04bfd43b02ae8514717211bb997~noTgC_-qY1347213472eusmtrp14;
 Tue,  7 Jan 2020 14:30:56 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-d5-5e1496203525
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F6.E2.08375.026941E5; Tue,  7
 Jan 2020 14:30:56 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200107143055eusmtip1249502c58878904e4345166c15d8481d~noTfjbCQ42348023480eusmtip1B;
 Tue,  7 Jan 2020 14:30:55 +0000 (GMT)
Subject: Re: [PATCH 3/3] drm/exynos: dsi: Fix bridge chain handling
To: Boris Brezillon <boris.brezillon@collabora.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Eric Anholt <eric@anholt.net>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <c05cbff0-1596-bbaa-fc0f-84ae7c1a15c9@samsung.com>
Date: Tue, 7 Jan 2020 15:30:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191227144124.210294-3-boris.brezillon@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsWy7djP87oK00TiDFZv1bA4feYUk8WVr+/Z
 LA40Xma0mHR/AovF1e8vmS1OvrnKYvHi3kUWi7NNb9gtOicuYbdYe+Quu8WhvmiLGZNfsjnw
 eDS9P8bm8f5GK7vHjrtLGD1md8xk9Tgx4RKTx/3u40wefVtWMXoc6J3MEsARxWWTkpqTWZZa
 pG+XwJWx8dF+poI5vBX7rxxla2C8y9XFyMkhIWAiMX/BJtYuRi4OIYEVjBJrnt1lhHC+MEr8
 6zvNBuF8ZpS4e+0TC0zLyt7jUC3LGSVe390P1fKWUaLx+3ImkCphAWeJHfMXgiVEBK4wSxxs
 /s0GkmAWUJb4dvgFI4jNJqAp8XfzTbA4r4CdxP+Wp8wgNouAikRz2zmwGlGBCIknVx6zQtQI
 Spyc+QToDA4OTgEXidWdIhAj5SWat85mhrDFJW49mc8EsldC4C27ROuW82wQZ7tIrL+7CcoW
 lnh1fAs7hC0jcXpyD9Rr9RL3V7QwQzR3MEps3bCTGSJhLXHn3C82kMXMQEev36UPEXaUaN86
 gRUkLCHAJ3HjrSDEDXwSk7ZNZ4YI80p0tAlBVCtK3D+7FWqguMTSC1/ZJjAqzULy2Cwk38xC
 8s0shL0LGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBCa10/+Of9nBuOtP0iFGAQ5G
 JR7eCTLCcUKsiWXFlbmHGCU4mJVEeLV0ROKEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkr
 JJCeWJKanZpakFoEk2Xi4JRqYDSMXSNndnxJmuj27tyy8n0OP3XSLzpvem7gvdvYLG5H+cen
 D7cx/1CesMG6/1xpzMpz82IvRUkF/17o9bc51XjzCb1uozkvNX7+VjOwuZeQoV/z+9uDtbUP
 hTWvhmU+5/vBdT7u6B4pfsecD+IS19fwRt2uLg6qFFbqlAp3VVg3RzlyqWKJsxJLcUaioRZz
 UXEiAPJ/rdZmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xu7oK00TiDCY+FbE4feYUk8WVr+/Z
 LA40Xma0mHR/AovF1e8vmS1OvrnKYvHi3kUWi7NNb9gtOicuYbdYe+Quu8WhvmiLGZNfsjnw
 eDS9P8bm8f5GK7vHjrtLGD1md8xk9Tgx4RKTx/3u40wefVtWMXoc6J3MEsARpWdTlF9akqqQ
 kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex8dF+poI5vBX7rxxl
 a2C8y9XFyMkhIWAisbL3OGsXIxeHkMBSRolNJ3cwQSTEJXbPf8sMYQtL/LnWxQZR9JpRYuOX
 pywgCWEBZ4kd8xcygtgiAteYJb79UASxmQWUJb4dfgEWFxK4yCgxt5cXxGYT0JT4u/kmG4jN
 K2An8b/lKdgCFgEViea2c2D1ogIREm9/32SFqBGUODnzCdAuDg5OAReJ1Z0iEOPVJf7Mu8QM
 YctLNG+dDWWLS9x6Mp9pAqPQLCTds5C0zELSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6
 yfm5mxiBMbzt2M/NOxgvbQw+xCjAwajEwztBRjhOiDWxrLgy9xCjBAezkgivlo5InBBvSmJl
 VWpRfnxRaU5q8SFGU6DfJjJLiSbnA9NLXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs
 1NSC1CKYPiYOTqkGxqJFajlSXq42PHdPRUscbPLXmmks0dGS+evxUcOAvan/dKyyeJ3c9sua
 htTIV1slK0Yx1SluWDzJ00rUmoth5bqDagb29gbv/65R2hNY/rDa/ym7GN/fFXy6/TfUze1W
 XPMoc+L36RB5v17/0+Jvhxd9vWw4+xxX/8u0V5fOxa3ZM99/YaGFEktxRqKhFnNRcSIANYzv
 FvcCAAA=
X-CMS-MailID: 20200107143056eucas1p245cadd5382db3cc439859e287ec3c987
X-Msg-Generator: CA
X-RootMTR: 20191227144136eucas1p2ba3fd4aca3c3c20d8ec67b804cbac597
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191227144136eucas1p2ba3fd4aca3c3c20d8ec67b804cbac597
References: <20191227144124.210294-1-boris.brezillon@collabora.com>
 <CGME20191227144136eucas1p2ba3fd4aca3c3c20d8ec67b804cbac597@eucas1p2.samsung.com>
 <20191227144124.210294-3-boris.brezillon@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMTIuMjAxOSAxNTo0MSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IENvbW1pdCAwNTE5
M2RjMzgxOTcgKCJkcm0vYnJpZGdlOiBNYWtlIHRoZSBicmlkZ2UgY2hhaW4gYSBkb3VibGUtbGlu
a2VkCj4gbGlzdCIpIHBhdGNoZWQgdGhlIGJyaWRnZSBjaGFpbiBsb2dpYyB0byB1c2UgYSBkb3Vi
bGUtbGlua2VkIGxpc3QgaW5zdGVhZAo+IG9mIGEgc2luZ2xlLWxpbmtlZCBsaXN0LiBUaGlzIGNo
YW5nZSBpbmR1Y2VkIGNoYW5nZXMgdG8gdGhlIEV4eW5vcyBkcml2ZXIKPiB3aGljaCB3YXMgbWFu
dWFsbHkgcmVzZXR0aW5nIHRoZSBlbmNvZGVyLT5icmlkZ2UgZWxlbWVudCB0byBOVUxMIHRvCj4g
Y29udHJvbCB0aGUgZW5hYmxlL2Rpc2FibGUgc2VxdWVuY2Ugb2YgdGhlIGJyaWRnZSBjaGFpbi4g
RHVyaW5nIHRoaXMKPiBjb252ZXJzaW9uLCAyIGJ1Z3Mgd2VyZSBpbnRyb2R1Y2VkOgo+Cj4gMS8g
bGlzdF9zcGxpY2UoKSB3YXMgdXNlZCB0byBtb3ZlIGNoYWluIGVsZW1lbnRzIHRvIG91ciBvd24g
aW50ZXJuYWwKPiAgICBjaGFpbiwgYnV0IGxpc3Rfc3BsaWNlKCkgZG9lcyBub3QgcmVzZXQgdGhl
IHNvdXJjZSBsaXN0IHRvIGFuIGVtcHR5Cj4gICAgc3RhdGUsIGxlYWRpbmcgdG8gdW5leHBlY3Rl
ZCBicmlkZ2UgaG9vayBjYWxscyB3aGVuCj4gICAgZHJtX2JyaWRnZV9jaGFpbl94eHgoKSBoZWxw
ZXJzIHdlcmUgY2FsbGVkIGJ5IHRoZSBjb3JlLiBSZXBsYWNpbmcKPiAgICB0aGUgbGlzdF9zcGxp
Y2UoKSBjYWxsIGJ5IGxpc3Rfc3BsaWNlX2luaXQoKSBmaXhlcyB0aGlzIHByb2JsZW0uCj4KPiAy
LyBkcm1fYnJpZGdlX2NoYWluX3h4eCgpIGhlbHBlcnMgb3BlcmF0ZSBvbiB0aGUKPiAgICBicmlk
Z2UtPmVuY29kZXItPmJyaWRnZV9jaGFpbiBsaXN0LCB3aGljaCBpcyBub3cgZW1wdHkuIFdoZW4g
dGhlCj4gICAgaGVscGVyIHVzZXMgbGlzdF9mb3JfZWFjaF9lbnRyeV9yZXZlcnNlKCkgd2UgZW5k
IHVwIHdpdGggbm8gb3BlcmF0aW9uCj4gICAgZG9uZSB3aGljaCBpcyBub3Qgd2hhdCB3ZSB3YW50
LiBCdXQgdGhhdCdzIGV2ZW4gd29yc2Ugd2hlbiB0aGUgaGVscGVyCj4gICAgdXNlcyBsaXN0X2Zv
cl9lYWNoX2VudHJ5X2Zyb20oKSwgYmVjYXVzZSBpbiB0aGF0IGNhc2Ugd2UgZW5kIHVwIGluCj4g
ICAgYW4gaW5maW5pdGUgbG9vcCBzZWFyY2hpbmcgZm9yIHRoZSBsaXN0IGhlYWQgZWxlbWVudCB3
aGljaCBpcyBubwo+ICAgIGxvbmdlciBlbmNvZGVyLT5icmlkZ2VfY2hhaW4gYnV0IGV4eW5vc19k
c2ktPmJyaWRnZV9jaGFpbi4gVG8gYWRkcmVzcwo+ICAgIHRoYXQgcHJvYmxlbSB3ZSBzdG9wIHVz
aW5nIHRoZSBicmlkZ2UgY2hhaW4gaGVscGVycyBhbmQgY2FsbCB0aGUKPiAgICBob29rcyBkaXJl
Y3RseS4KPgo+IFJlcG9ydGVkLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ft
c3VuZy5jb20+Cj4gRml4ZXM6IDA1MTkzZGMzODE5NyAoImRybS9icmlkZ2U6IE1ha2UgdGhlIGJy
aWRnZSBjaGFpbiBhIGRvdWJsZS1saW5rZWQgbGlzdCIpCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KCgpSZXZpZXdlZC1ieTog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVq
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
