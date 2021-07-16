Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF53C3CB1E4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 07:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8196E905;
	Fri, 16 Jul 2021 05:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jul 2021 05:20:20 UTC
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1856E905
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 05:20:20 +0000 (UTC)
X-UUID: c90715cfd530412f86cab2922eaad03e-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=P1PqkGczpPcvXL+IzAZftPYToRlDDBZD9w87wJ0kAHw=; 
 b=mQcCrsGRKaRiO8i5EZBuSWghx+bwTW1gU9lB38AR5ZwellxEGTHP04HMxE6Us5DZ791LgpxH0zwNzR8UmKKWXQvJwzxtYxGL3m5gsEfLAaAyW/ktCKrW6LPuug6OTxtiv6z8lBJLbnIVCw0p7S2e5OKZxMdtvjfA21Kkf53Kg6U=;
X-UUID: c90715cfd530412f86cab2922eaad03e-20210716
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1858786546; Fri, 16 Jul 2021 13:15:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 13:15:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 13:15:11 +0800
Message-ID: <1626412511.16906.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: dpi: fix NULL dereference in
 mtk_dpi_bridge_atomic_check
From: CK Hu <ck.hu@mediatek.com>
To: Frank Wunderlich <linux@fw-web.de>
Date: Fri, 16 Jul 2021 13:15:11 +0800
In-Reply-To: <20210712080736.116435-1-linux@fw-web.de>
References: <20210712080736.116435-1-linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao
 Shi <jitao.shi@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOg0KDQpPbiBNb24sIDIwMjEtMDctMTIgYXQgMTA6MDcgKzAyMDAsIEZyYW5rIFd1
bmRlcmxpY2ggd3JvdGU6DQo+IEZyb206IEZyYW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGlj
LWZpbGVzLmRlPg0KPiANCj4gYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZSBpcyBub3Qgc2V0IChOVUxM
KSBzbyB1c2UgYnJpZGdlX3RvX2RwaShicmlkZ2UpDQo+IGxpa2UgaXQncyBkb25lIGluIGJyaWRn
ZV9hdG9taWNfZ2V0X291dHB1dF9idXNfZm10cw0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1
QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4ZXM6IGVjODc0N2M1MjQzNCAoImRybS9tZWRpYXRl
azogZHBpOiBBZGQgYnVzIGZvcm1hdCBuZWdvdGlhdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IEZy
YW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYw0KPiBpbmRleCBiY2VkNTU1NjQ4YjAuLmEyZWNhMWY2Njk4NCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IEBAIC02MDUsNyArNjA1LDcgQEAgc3RhdGljIGlu
dCBtdGtfZHBpX2JyaWRnZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwN
Cj4gIAkJCQkgICAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLA0KPiAgCQkJ
CSAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSkNCj4gIHsNCj4g
LQlzdHJ1Y3QgbXRrX2RwaSAqZHBpID0gYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZTsNCj4gKwlzdHJ1
Y3QgbXRrX2RwaSAqZHBpID0gYnJpZGdlX3RvX2RwaShicmlkZ2UpOw0KPiAgCXVuc2lnbmVkIGlu
dCBvdXRfYnVzX2Zvcm1hdDsNCj4gIA0KPiAgCW91dF9idXNfZm9ybWF0ID0gYnJpZGdlX3N0YXRl
LT5vdXRwdXRfYnVzX2NmZy5mb3JtYXQ7DQoNCg==

