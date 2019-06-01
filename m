Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC57931AD5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 11:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1279B89807;
	Sat,  1 Jun 2019 09:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A9AC897D4
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 09:26:36 +0000 (UTC)
X-UUID: 3fdc10fb3388403a8519b8a6142017c9-20190601
X-UUID: 3fdc10fb3388403a8519b8a6142017c9-20190601
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1653669255; Sat, 01 Jun 2019 17:26:32 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 1 Jun 2019 17:26:31 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 1 Jun 2019 17:26:29 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v4 7/7] drm: mediatek: adjust dsi and mipi_tx probe sequence
Date: Sat, 1 Jun 2019 17:26:15 +0800
Message-ID: <20190601092615.67917-8-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190601092615.67917-1-jitao.shi@mediatek.com>
References: <20190601092615.67917-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-MTK: N
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
Cc: stonea168@163.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bXRrX21pcGlfdHggaXMgdGhlIHBoeSBvZiBtdGtfZHNpLgptdGtfZHNpIGdldCB0aGUgcGh5KG10
a19taXBpX3R4KSBpbiBwcm9iZSgpLgoKU28sICBtdGtfbWlwaV90eCBpbml0IHNob3VsZCBiZSBh
aGVhZCBvZiBtdGtfZHNpLiBPciBtdGtfZHNpIHdpbGwKZGVmZXIgdG8gd2FpdCBtdGtfbWlwaV90
eCBwcm9iZSBkb25lLgoKU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0
ZWsuY29tPgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMKaW5kZXggNTdjZTQ3MDhlZjFiLi5mYzgwOWE2MWZhYjkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCkBAIC02NDAsOCArNjQwLDggQEAgc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgKiBjb25zdCBtdGtfZHJtX2RyaXZlcnNbXSA9IHsKIAkmbXRr
X2Rpc3BfcmRtYV9kcml2ZXIsCiAJJm10a19kcGlfZHJpdmVyLAogCSZtdGtfZHJtX3BsYXRmb3Jt
X2RyaXZlciwKLQkmbXRrX2RzaV9kcml2ZXIsCiAJJm10a19taXBpX3R4X2RyaXZlciwKKwkmbXRr
X2RzaV9kcml2ZXIsCiB9OwogCiBzdGF0aWMgaW50IF9faW5pdCBtdGtfZHJtX2luaXQodm9pZCkK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
