Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A493DCE7C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 03:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4063B6E3AA;
	Mon,  2 Aug 2021 01:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id A1E356E321
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 01:07:29 +0000 (UTC)
X-UUID: 0c6a4cf7134549708409a216e2d78700-20210802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=c7qAG0km9s8UfLDAudvX69W67QH1Jy3xeC2kKUw1eTc=; 
 b=X8W8Mo68afLORmybBKoKEJORkIJ9SxsOJVKv4icVPkVEIQhK82YdZPcXLvBBXRxbz/LswXupwyCLqYpQiBC5SYc3xy9Khlvx+LSbssOhF5m/PKYgj1hwJVFiXfUYT0hQKIRKXAHoNQxh3sCH+mAbbvM3i1r1FcaGrOOBheX6ALU=;
X-UUID: 0c6a4cf7134549708409a216e2d78700-20210802
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1116612623; Mon, 02 Aug 2021 09:07:24 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 2 Aug 2021 09:07:21 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 2 Aug 2021 09:07:20 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v5 2/2] drm/mediatek: force hsa hbp hfp packets multiple of
 lanenum to avoid screen shift
Date: Mon, 2 Aug 2021 09:07:11 +0800
Message-ID: <20210802010711.169080-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802010711.169080-1-jitao.shi@mediatek.com>
References: <20210802010711.169080-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1BE911DEA230FC9258BBF1097BDE305EBC1B452C74411743C1D06DFC8D83CA372000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJyaWRnZSBjaGlwIEFOWDc2MjUgcmVxdWlyZXMgdGhlIHBhY2tldHMgb24gbGFuZXMgYWxp
Z25lZCBhdCB0aGUgZW5kLA0Kb3IgQU5YNzYyNSB3aWxsIHNoaWZ0IHRoZSBzY3JlZW4uDQoNClNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMyArKysrKysrKysrKysrDQogMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jDQppbmRleCBhZTQwM2M2N2NiZDkuLjQ3MzVlMDA5MmZmZSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMNCkBAIC0xOTQsNiArMTk0LDggQEAgc3RydWN0IG10a19kc2kgew0KIAlz
dHJ1Y3QgY2xrICpoc19jbGs7DQogDQogCXUzMiBkYXRhX3JhdGU7DQorCS8qIGZvcmNlIGRzaSBs
aW5lIGVuZCB3aXRob3V0IGRzaV9udWxsIGRhdGEgKi8NCisJYm9vbCBmb3JjZV9kc2lfZW5kX3dp
dGhvdXRfbnVsbDsNCiANCiAJdW5zaWduZWQgbG9uZyBtb2RlX2ZsYWdzOw0KIAllbnVtIG1pcGlf
ZHNpX3BpeGVsX2Zvcm1hdCBmb3JtYXQ7DQpAQCAtNDk5LDYgKzUwMSwxMyBAQCBzdGF0aWMgdm9p
ZCBtdGtfZHNpX2NvbmZpZ192ZG9fdGltaW5nKHN0cnVjdCBtdGtfZHNpICpkc2kpDQogCQlEUk1f
V0FSTigiSEZQICsgSEJQIGxlc3MgdGhhbiBkLXBoeSwgRlBTIHdpbGwgdW5kZXIgNjBIelxuIik7
DQogCX0NCiANCisJaWYgKGRzaS0+Zm9yY2VfZHNpX2VuZF93aXRob3V0X251bGwpIHsNCisJCWhv
cml6b250YWxfc3luY19hY3RpdmVfYnl0ZSA9IHJvdW5kdXAoaG9yaXpvbnRhbF9zeW5jX2FjdGl2
ZV9ieXRlLCBkc2ktPmxhbmVzKSAtIDI7DQorCQlob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9
IHJvdW5kdXAoaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUsIGRzaS0+bGFuZXMpIC0gMjsNCisJ
CWhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPSByb3VuZHVwKGhvcml6b250YWxfYmFja3BvcmNo
X2J5dGUsIGRzaS0+bGFuZXMpIC0gMjsNCisJCWhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgLT0g
KHZtLT5oYWN0aXZlICogZHNpX3RtcF9idWZfYnBwICsgMikgJSBkc2ktPmxhbmVzOw0KKwl9DQor
DQogCXdyaXRlbChob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUsIGRzaS0+cmVncyArIERTSV9I
U0FfV0MpOw0KIAl3cml0ZWwoaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSwgZHNpLT5yZWdzICsg
RFNJX0hCUF9XQyk7DQogCXdyaXRlbChob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSwgZHNpLT5y
ZWdzICsgRFNJX0hGUF9XQyk7DQpAQCAtMTA5NSw2ICsxMTA0LDEwIEBAIHN0YXRpYyBpbnQgbXRr
X2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlkc2ktPmJyaWRnZS5v
Zl9ub2RlID0gZGV2LT5vZl9ub2RlOw0KIAlkc2ktPmJyaWRnZS50eXBlID0gRFJNX01PREVfQ09O
TkVDVE9SX0RTSTsNCiANCisJaWYgKGRzaS0+bmV4dF9icmlkZ2UpDQorCQlkc2ktPmZvcmNlX2Rz
aV9lbmRfd2l0aG91dF9udWxsID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKGRzaS0+bmV4dF9icmlk
Z2UtPm9mX25vZGUsDQorCQkJCQkJCQkJImZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsIik7DQor
DQogCWRybV9icmlkZ2VfYWRkKCZkc2ktPmJyaWRnZSk7DQogDQogCXJldCA9IGNvbXBvbmVudF9h
ZGQoJnBkZXYtPmRldiwgJm10a19kc2lfY29tcG9uZW50X29wcyk7DQotLSANCjIuMjUuMQ0K

