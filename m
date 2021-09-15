Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318E340CF75
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 00:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E5B89FC8;
	Wed, 15 Sep 2021 22:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FBF789EB7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 22:36:39 +0000 (UTC)
X-UUID: 13f26141339e40829ef5efb66c760724-20210916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1dcN9z0+dqS7YRg5qM55n17pug7se8K9l7H/Va/Q5Ps=; 
 b=cn4xq7Ioj3p700RmRq18RDIck8+HK/Cv25X5z/hW4VW+21bm00Uvq4xFwXNFn13Yyk3rP4WBKXhe2qD8H++cg6CSo9jW3HikQdQnf9bMT/YzAL+2FE7YyWarPZra2iLIvYqUiwGtVGTj4bTIltT7YTiqrHcThAE9FGwQgALMSVo=;
X-UUID: 13f26141339e40829ef5efb66c760724-20210916
Received: from mtkcas32.mediatek.inc [(172.27.6.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1943860499; Thu, 16 Sep 2021 06:31:32 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 16 Sep 2021 06:31:27 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Sep 2021 06:31:26 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 2/3] drm/mediatek: implment the dsi hs packets aligned
Date: Thu, 16 Sep 2021 06:31:16 +0800
Message-ID: <20210915223117.7857-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915223117.7857-1-jitao.shi@mediatek.com>
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: CDCC4146967362D458A2E0792F8551705A6E2C2FBCE27A5EB7F63530179B27D72000:8
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

U29tZSBkc2kgZGV2aWNlcyByZXF1aXJlIHRoZSBwYWNrZXRzIG9uIGxhbmVzIGFsaWduZWQgYXQg
dGhlIGVuZCwNCm9yIHRoZSBzY3JlZW4gd2lsbCBzaGlmdCBvciBzY3JvbGwuDQoNClNpZ25lZC1v
ZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMCArKysrKysrKysrDQogMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQppbmRl
eCA5M2I0MGMyNDVmMDAuLjlkNzJlNmRjZTBiZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMNCkBAIC0xOTQsNiArMTk0LDggQEAgc3RydWN0IG10a19kc2kgew0KIAlzdHJ1Y3QgY2xr
ICpoc19jbGs7DQogDQogCXUzMiBkYXRhX3JhdGU7DQorCS8qIGZvcmNlIGRzaSBsaW5lIGVuZCB3
aXRob3V0IGRzaV9udWxsIGRhdGEgKi8NCisJYm9vbCBoc19wYWNrZXRfZW5kX2FsaWduZWQ7DQog
DQogCXVuc2lnbmVkIGxvbmcgbW9kZV9mbGFnczsNCiAJZW51bSBtaXBpX2RzaV9waXhlbF9mb3Jt
YXQgZm9ybWF0Ow0KQEAgLTQ5OSw2ICs1MDEsMTMgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jb25m
aWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQ0KIAkJRFJNX1dBUk4oIkhGUCArIEhC
UCBsZXNzIHRoYW4gZC1waHksIEZQUyB3aWxsIHVuZGVyIDYwSHpcbiIpOw0KIAl9DQogDQorCWlm
IChkc2ktPmhzX3BhY2tldF9lbmRfYWxpZ25lZCkgew0KKwkJaG9yaXpvbnRhbF9zeW5jX2FjdGl2
ZV9ieXRlID0gcm91bmR1cChob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUsIGRzaS0+bGFuZXMp
IC0gMjsNCisJCWhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlID0gcm91bmR1cChob3Jpem9udGFs
X2Zyb250cG9yY2hfYnl0ZSwgZHNpLT5sYW5lcykgLSAyOw0KKwkJaG9yaXpvbnRhbF9iYWNrcG9y
Y2hfYnl0ZSA9IHJvdW5kdXAoaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSwgZHNpLT5sYW5lcykg
LSAyOw0KKwkJaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSAtPSAodm0tPmhhY3RpdmUgKiBkc2lf
dG1wX2J1Zl9icHAgKyAyKSAlIGRzaS0+bGFuZXM7DQorCX0NCisNCiAJd3JpdGVsKGhvcml6b250
YWxfc3luY19hY3RpdmVfYnl0ZSwgZHNpLT5yZWdzICsgRFNJX0hTQV9XQyk7DQogCXdyaXRlbCho
b3Jpem9udGFsX2JhY2twb3JjaF9ieXRlLCBkc2ktPnJlZ3MgKyBEU0lfSEJQX1dDKTsNCiAJd3Jp
dGVsKGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlLCBkc2ktPnJlZ3MgKyBEU0lfSEZQX1dDKTsN
CkBAIC03OTMsNiArODAyLDcgQEAgc3RhdGljIGludCBtdGtfZHNpX2hvc3RfYXR0YWNoKHN0cnVj
dCBtaXBpX2RzaV9ob3N0ICpob3N0LA0KIAlkc2ktPmxhbmVzID0gZGV2aWNlLT5sYW5lczsNCiAJ
ZHNpLT5mb3JtYXQgPSBkZXZpY2UtPmZvcm1hdDsNCiAJZHNpLT5tb2RlX2ZsYWdzID0gZGV2aWNl
LT5tb2RlX2ZsYWdzOw0KKwlkc2ktPmhzX3BhY2tldF9lbmRfYWxpZ25lZCA9IGRldmljZS0+aHNf
cGFja2V0X2VuZF9hbGlnbmVkOw0KIA0KIAlyZXR1cm4gMDsNCiB9DQotLSANCjIuMjUuMQ0K

