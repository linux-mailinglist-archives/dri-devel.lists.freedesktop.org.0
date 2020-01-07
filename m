Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0841329CE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 16:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA1189A9B;
	Tue,  7 Jan 2020 15:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006A489A9B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 15:17:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200107151739euoutp0105e325d80b80b9e9e54cd0284f7532c0~no8SW3hdA2434724347euoutp01P
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 15:17:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200107151739euoutp0105e325d80b80b9e9e54cd0284f7532c0~no8SW3hdA2434724347euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578410259;
 bh=CLHTkNZuOVtliAkpN5XfyL3WAhpmFlfrsrTVHzGQbb0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=obKDmdXdGmvRnx7O9eWDhh+84t7MtHm3i+gnWIkfkeW3McgOs2Z53RtBcUhhmJjNg
 jOfP07BOXZiYRhJOfJ3wkxPJnE9rRLq0GpFY5ugjtZaIIqZdp1yOyipxfRBFzewTdg
 EQJpzWg1niLKH/PrRGGxXFEQENSBUZlP9RmD9qoI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200107151738eucas1p20fd830141c104ea7546ddd491568497b~no8SDJNLC2591925919eucas1p2W;
 Tue,  7 Jan 2020 15:17:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 26.61.60698.211A41E5; Tue,  7
 Jan 2020 15:17:38 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200107151738eucas1p1735030762a811977b8b852f5fa762803~no8Rxzrs51439314393eucas1p15;
 Tue,  7 Jan 2020 15:17:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200107151738eusmtrp24b11fabe2bff7b00c22eb917bb3b2f03~no8Rw_amQ2271322713eusmtrp2t;
 Tue,  7 Jan 2020 15:17:38 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-f1-5e14a1122fd1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6B.57.07950.211A41E5; Tue,  7
 Jan 2020 15:17:38 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200107151737eusmtip1428fe6e5de6836168b4ae03fcc95458f~no8ROfDRy2069120691eusmtip1H;
 Tue,  7 Jan 2020 15:17:37 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/vc4: dsi: Fix bridge chain handling
To: Boris Brezillon <boris.brezillon@collabora.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Eric Anholt <eric@anholt.net>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <7462ec16-c26b-c3bf-ed9b-234198c848f1@samsung.com>
Date: Tue, 7 Jan 2020 16:17:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191227144124.210294-2-boris.brezillon@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfyyUcRjf99737l43r73OyTPZrKtVrFBqezeGxtbVX635o1Tqyjusc+xe
 PyKNkPwoO7+G05SGzCoqhBGOCPmVH6P5sXLhip0VmYicl+W/z/N5ns/zeT7bQ2DiQb41EagM
 ZVRKuUIqEOHVbSu9R8WFEl+nt1onuutjJ48eXDII6Ka7A4jOmFTj9NCyHqM75oZwenaiH6e7
 4+aEdHJ6kZB+0ToupLVpl+jcTL3Aw1QWZ2gTyAwj94SymvEiJMtPyuPLPqg/8WSTqe08WVpl
 GZI1PczEzxE+Ilc/RhEYzqgc3a6JAuoqdPyQFvJWqb5MGIvWRSnIhADqBPSM1fNSkIgQU6UI
 EgzLOFcsIsjMGtgufiEYq9ELdySZ8cMY13iGQDNlQFwxj2BmdQM3TllQHlCi/rq1WEINYtAc
 vyowNjBqP/xumUVGLKDs4O+b0S2epNwgvaGWZ8Q4dQDuPzBamBCW1AXQDU7xuRlz6MjTbRmY
 UF6Q/F7L53baQnxVPsZhK/ise7xlDNS8EEY7hzDubi/ImF4UcNgCvrdXbuexgY3axzwOx8Bk
 aQLGiZMQVFXUbotdYKznz6aY2HSwg/I6R44+Bd2FBqGRBsoMRubNuRvMIKM6B+NoEpISxdz0
 PpjsrtpeaAXFfUsCNZJqdiXT7Eqj2ZVG89/3CcLLkBUTxgb5M6yzkolwYOVBbJjS3+FGcNBr
 tPlrXevtSzXo3dp1LaIIJDUl1TYWvmK+PJyNDNIiIDCphLQ/IvEVk37yyChGFXxVFaZgWC3a
 S+BSK9L5qf6KmPKXhzI3GSaEUe10eYSJdSxKVcZcjov2iWw3b12xqC+v++F1fiT7p+1IhL7A
 ML2n0aXXqYenkIa6r4/evuhJnX4Z4Xy22a1veFU/MOVZ+ypX8mjiW99J0v15/uGC4kb9AnUo
 PnatXyMm5+tKhrzv2IYcPKMKK1xr8rZsmGF1rjlEXlTiwhdru2jV2OzxLO9sNynOBsiP2WMq
 Vv4P0JjW/2cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsVy+t/xu7pCC0XiDP6dkLM4feYUk8WVr+/Z
 LA40Xma0mHR/AovF1e8vmS1OvrnKYvHi3kUWi7NNb9gtOicuYbdYe+Quu8WhvmiLGZNfsjnw
 eDS9P8bm8f5GK7vHjrtLGD1md8xk9Tgx4RKTx/3u40wefVtWMXoc6J3MEsARpWdTlF9akqqQ
 kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexa8MT1oLDvBUrXq5i
 b2D8x9XFyMkhIWAiMbn5GnMXIxeHkMBSRolLJ2+wQyTEJXbPf8sMYQtL/LnWxQZR9JpRouvQ
 A7AiYQEHiWUTHjGB2CIC15glvv1QBLGZBZQlvh1+wQjRcJFR4vvzRYwgCTYBTYm/m2+ygdi8
 AnYSE/fuBGtmEVCRaO+5BrZNVCBC4u3vm6wQNYISJ2c+YQGxOQVcJDqPHmKFWKAu8WfeJWYI
 W16ieetsKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dL
 zs/dxAiM423Hfm7Zwdj1LvgQowAHoxIPr4WUcJwQa2JZcWXuIUYJDmYlEV4tHZE4Id6UxMqq
 1KL8+KLSnNTiQ4ymQM9NZJYSTc4Hppi8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6Yklqdmp
 qQWpRTB9TBycUg2MG0Kurnws56db5Jyg9+f5aau51Wc4ufSmLF3/3FQ52OP7gUV1H7qets9w
 1nwVqWzy2HXdSsPprxYoKs3PTS/xnGUU9SDeuaDrjeF5k5+My5reiVbfObbdPfm1ustxuXtK
 zPPl/oh1XXp8R+7zlNaJB5vVm9J61osrygc/ffLC3DJa8I6d7dWdSizFGYmGWsxFxYkAnHcO
 6fkCAAA=
X-CMS-MailID: 20200107151738eucas1p1735030762a811977b8b852f5fa762803
X-Msg-Generator: CA
X-RootMTR: 20191227144134epcas5p17bc84f69fc1cfee56b10922b070f2820
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191227144134epcas5p17bc84f69fc1cfee56b10922b070f2820
References: <20191227144124.210294-1-boris.brezillon@collabora.com>
 <CGME20191227144134epcas5p17bc84f69fc1cfee56b10922b070f2820@epcas5p1.samsung.com>
 <20191227144124.210294-2-boris.brezillon@collabora.com>
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
YW5nZSBpbmR1Y2VkIGNoYW5nZXMgdG8gdGhlIFZDNCBkcml2ZXIKPiB3aGljaCB3YXMgbWFudWFs
bHkgcmVzZXR0aW5nIHRoZSBlbmNvZGVyLT5icmlkZ2UgZWxlbWVudCB0byBOVUxMIHRvCj4gY29u
dHJvbCB0aGUgZW5hYmxlL2Rpc2FibGUgc2VxdWVuY2Ugb2YgdGhlIGJyaWRnZSBjaGFpbi4gRHVy
aW5nIHRoaXMKPiBjb252ZXJzaW9uLCAyIGJ1Z3Mgd2VyZSBpbnRyb2R1Y2VkOgo+Cj4gMS8gbGlz
dF9zcGxpY2UoKSB3YXMgdXNlZCB0byBtb3ZlIGNoYWluIGVsZW1lbnRzIHRvIG91ciBvd24gaW50
ZXJuYWwKPiAgICBjaGFpbiwgYnV0IGxpc3Rfc3BsaWNlKCkgZG9lcyBub3QgcmVzZXQgdGhlIHNv
dXJjZSBsaXN0IHRvIGFuIGVtcHR5Cj4gICAgc3RhdGUsIGxlYWRpbmcgdG8gdW5leHBlY3RlZCBi
cmlkZ2UgaG9vayBjYWxscyB3aGVuCj4gICAgZHJtX2JyaWRnZV9jaGFpbl94eHgoKSBoZWxwZXJz
IHdlcmUgY2FsbGVkIGJ5IHRoZSBjb3JlLiBSZXBsYWNpbmcKPiAgICB0aG9zZSBsaXN0X3NwbGlj
ZSgpIGNhbGxzIGJ5IGxpc3Rfc3BsaWNlX2luaXQoKSBvbmVzIGZpeGVzIHRoaXMKPiAgICBwcm9i
bGVtLgo+Cj4gMi8gZHJtX2JyaWRnZV9jaGFpbl94eHgoKSBoZWxwZXJzIG9wZXJhdGUgb24gdGhl
Cj4gICAgYnJpZGdlLT5lbmNvZGVyLT5icmlkZ2VfY2hhaW4gbGlzdCwgd2hpY2ggaXMgbm93IGVt
cHR5LiBXaGVuIHRoZQo+ICAgIGhlbHBlciB1c2VzIGxpc3RfZm9yX2VhY2hfZW50cnlfcmV2ZXJz
ZSgpIHdlIGVuZCB1cCB3aXRoIG5vIG9wZXJhdGlvbgo+ICAgIGRvbmUgd2hpY2ggaXMgbm90IHdo
YXQgd2Ugd2FudC4gQnV0IHRoYXQncyBldmVuIHdvcnNlIHdoZW4gdGhlIGhlbHBlcgo+ICAgIHVz
ZXMgbGlzdF9mb3JfZWFjaF9lbnRyeV9mcm9tKCksIGJlY2F1c2UgaW4gdGhhdCBjYXNlIHdlIGVu
ZCB1cCBpbgo+ICAgIGFuIGluZmluaXRlIGxvb3Agc2VhcmNoaW5nIGZvciB0aGUgbGlzdCBoZWFk
IGVsZW1lbnQgd2hpY2ggaXMgbm8KPiAgICBsb25nZXIgZW5jb2Rlci0+YnJpZGdlX2NoYWluIGJ1
dCB2YzRfZHNpLT5icmlkZ2VfY2hhaW4uIFRvIGFkZHJlc3MKPiAgICB0aGF0IHByb2JsZW0gd2Ug
c3RvcCB1c2luZyB0aGUgYnJpZGdlIGNoYWluIGhlbHBlcnMgYW5kIGNhbGwgdGhlCj4gICAgaG9v
a3MgZGlyZWN0bHkuCj4KPiBSZXBvcnRlZC1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93
c2tpQHNhbXN1bmcuY29tPgo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IEZp
eGVzOiAwNTE5M2RjMzgxOTcgKCJkcm0vYnJpZGdlOiBNYWtlIHRoZSBicmlkZ2UgY2hhaW4gYSBk
b3VibGUtbGlua2VkIGxpc3QiKQo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9y
aXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxh
LmhhamRhQHNhbXN1bmcuY29tPgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
