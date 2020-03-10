Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BCD17F51E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 11:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62E86E196;
	Tue, 10 Mar 2020 10:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1556E196
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:35:33 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200310103531euoutp0102c7d1657dbbeaa73024658a79d6563a~66u8jPDKb3063930639euoutp01V
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:35:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200310103531euoutp0102c7d1657dbbeaa73024658a79d6563a~66u8jPDKb3063930639euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583836531;
 bh=7YWM7Z4IXWxMp+NS/R0C5Hfzu6++9AJ9hO517CES0ig=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Bz86n5waIqhqDkWSS2cvjvhfIYmEzfpq1WaMyUaDkxhXHw+Py9Ojft/cVwe1NG/kS
 c1AJqiDo62Ip06Ndxpzpa9OoceE5pKPRVbwwdRJkpm8gHL3sVc1sW7J/A9qMtnOKsi
 g6FshjokGn3nE9E39Om3YiWVH3oXI4887UoKfnjg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200310103531eucas1p2d8fc222fab47eb72c2bf473dbd75c443~66u8R29Ng0555805558eucas1p2n;
 Tue, 10 Mar 2020 10:35:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A9.6F.61286.37D676E5; Tue, 10
 Mar 2020 10:35:31 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200310103531eucas1p2c2d6a133dc899b21cdec6d8e9c2e9362~66u77ABoE0593005930eucas1p2y;
 Tue, 10 Mar 2020 10:35:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200310103531eusmtrp2b2d97778ab0e7975eb0c646877bc5c96~66u76PT5a0345603456eusmtrp2Z;
 Tue, 10 Mar 2020 10:35:31 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-bb-5e676d735889
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D0.D3.08375.37D676E5; Tue, 10
 Mar 2020 10:35:31 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200310103530eusmtip1a707ded0cec75734fe1c5c744396d996~66u7CwumB1904819048eusmtip1N;
 Tue, 10 Mar 2020 10:35:30 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: analogix_dp: Split bind() into probe() and
 real bind()
To: Andy Yan <andy.yan@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <14da8aee-71bd-bdd1-4ac9-94cb7eed7efa@samsung.com>
Date: Tue, 10 Mar 2020 11:35:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0a287abf-12ed-7e34-c765-144a8c10230d@rock-chips.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHKsWRmVeSWpSXmKPExsWy7djP87rFuelxBjd2S1vcWneO1aL//E1G
 i40z1rNaXPn6ns1i7qRai6vfXzJbrPgyk93i5JurLBadE5ewW3x68J/ZYsb5fUwWh/qiLWZM
 fsnmwOvx/kYru8fOWXfZPWZ3zGT1ODHhEpPH/e7jTB6bl9R7/J21n8Wjb8sqRo8DvZNZPD5v
 kgvgiuKySUnNySxLLdK3S+DKuNjznb3gPUvF/y2VDYwfmLsYOTkkBEwkvmxexNbFyMUhJLCC
 UeJm9z5mCOcLo0TjgcWMEM5nRokZhxeywbTc2LQbqmU5o8T8Lx+hqt4ySuw69Yy1i5GDQ1gg
 UuLbXzeQuIjAdkaJh7vns4M4zAI3mCRW/P/IAjKKTcBQouttF9hYXgE7iV0dT8CaWQRUJWY0
 gpWICsRKzF55mAWiRFDi5MwnYDangJNE6/b1YE8wC8hLNG+dDWWLS9x6Mp8JZJeEwF92iZb1
 x6HOdpFYvLKDEcIWlnh1fAs7hC0j8X8nTEMz0KXn1rJDOD2MEpebZkB1WEvcOfeLDeQ6ZgFN
 ifW79EFMCQFHia+93hAmn8SNt4IQN/BJTNo2nRkizCvR0SYEMUNNYtbxdXBbD164xDyBUWkW
 ks9mIflmFpJvZiGsXcDIsopRPLUUmKxSiw3zUsv1ihNzi0vz0vWS83M3MQJT3el/xz/tYPx6
 KekQowAHoxIPb4ZuWpwQa2JZcWXuIUYJDmYlEd54+fQ4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK
 4rzGi17GCgmkJ5akZqemFqQWwWSZODilGhhD/v51nW76NMYlTbNV83vWQZt0scZD5T5mBSor
 Tb5V9uZO2fHAaFfmZ5fbB3bzyT3a8urTT3vPUj1uhTT3F6l91XsmHqzqVnjFtvOD3vo2hrt7
 f9yd+nqT5btN91yV7/aZ+LzaHem2ieEvY9Hew2r5v8Qzz1967fy1fHPl8+n9d2ZfW+KpEPNP
 iaU4I9FQi7moOBEA5TgS83EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsVy+t/xu7rFuelxBlcWM1vcWneO1aL//E1G
 i40z1rNaXPn6ns1i7qRai6vfXzJbrPgyk93i5JurLBadE5ewW3x68J/ZYsb5fUwWh/qiLWZM
 fsnmwOvx/kYru8fOWXfZPWZ3zGT1ODHhEpPH/e7jTB6bl9R7/J21n8Wjb8sqRo8DvZNZPD5v
 kgvgitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL
 uNjznb3gPUvF/y2VDYwfmLsYOTkkBEwkbmzazdbFyMUhJLCUUeLogXfsEAkZiZPTGlghbGGJ
 P9e6oIpeM0rMfAJSxMEhLBAp8e2vG0hcRGA7o8ShRSfZQRxmgVtMEge2fGSF6NjGJDHz0AOw
 UWwChhJdb0FGcXLwCthJ7Op4wgoyiUVAVWJGIwtIWFQgVuLGzA4miBJBiZMzn4DFOQWcJFq3
 rwc7m1nATGLe5odQtrxE89bZULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUokloKjNLc
 YkO94sTc4tK8dL3k/NxNjMDo3nbs5+YdjJc2Bh9iFOBgVOLhzdBNixNiTSwrrsw9xCjBwawk
 whsvnx4nxJuSWFmVWpQfX1Sak1p8iNEU6LeJzFKiyfnAxJNXEm9oamhuYWlobmxubGahJM7b
 IXAwRkggPbEkNTs1tSC1CKaPiYNTqoHRR+OhjlTbRh7uu4tP8PgoX19qvoE/dIr93SV9Kh+r
 Tj1PCuF5sf/e5ydnZQ51RNb0rl76ZbWVu+IWgXqN5HShhC436flbF56wipA0z5gVN6F69Zrn
 v+dkfHhUfdSp9HV9iF/igZkTJ4p/T3jIdYU3eltmY61L5+KMxNap90J3VT7iubZynpOaEktx
 RqKhFnNRcSIA8N4ZcgQDAAA=
X-CMS-MailID: 20200310103531eucas1p2c2d6a133dc899b21cdec6d8e9c2e9362
X-Msg-Generator: CA
X-RootMTR: 20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8
References: <CGME20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8@eucas1p2.samsung.com>
 <20200302142615.14947-1-m.szyprowski@samsung.com>
 <30f64c8f-2a12-46c2-e5eb-505bbb2088ed@samsung.com>
 <331b5d65-f619-ff84-d4e7-55d2257a90c5@rock-chips.com>
 <0a287abf-12ed-7e34-c765-144a8c10230d@rock-chips.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Jingoo Han <jingoohan1@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5keSwKCk9uIDEwLjAzLjIwMjAgMDI6MTAsIEFuZHkgWWFuIHdyb3RlOgo+IFsuLi5dCgo+
IHJldCA9IGFuYWxvZ2l4X2RwX2R0X3BhcnNlX3BkYXRhKGRwKTsKPiDCoMKgwqDCoMKgwqDCoCBp
ZiAocmV0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUihy
ZXQpOwo+Cj4KPiDCoMKgwqAgSSB0aGluayB0aGlzIGlzIHRoZSBwcm9ibGVtIEkgdGVzdGVkLiBO
b3cgdGhlIHBkYXRhIHdlcmUgcGFyc2UgaW4gCj4gcHJvYmUsIGJ1dCB0aGUgcGxhdGFfZGF0YS0+
ZGV2X3R5cGUgd2FzIHBvcHVsYXRlZCBpbiAKPiByb2NrY2hpcF9kcF9iaW5kL2V4eW5vc19kcF9i
aW5kIGFmdGVyIHByb2JlLlNvIHdlIGNhbid0IHBhcnNlIHRoZSAKPiByaWdodCBjb25maWd1cmF0
aW9uIGhlcmUuCgpJbmRlZWQsIHBsYXRfZGF0YSB3YXNuJ3QgcHJvcGVybHkgaW5pdGlhbGl6ZWQu
IFRoYW5rcyBmb3IgZmluZGluZyBpdCAKb3V0ISBJIHdpbGwgc2VuZCB2MiBpbiBhIGZldyBtaW51
dGVzLgoKID4gWy4uLl0KCkJlc3QgcmVnYXJkcwotLSAKTWFyZWsgU3p5cHJvd3NraSwgUGhEClNh
bXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
