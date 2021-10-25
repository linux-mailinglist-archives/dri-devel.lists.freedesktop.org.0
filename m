Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E815D439CE9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 19:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EEF8989E;
	Mon, 25 Oct 2021 17:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id A87B28989E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 16:57:28 +0000 (UTC)
X-UUID: e64907448fd74d6cab03d25ca28cdd7f-20211026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Z8L+3z/wIHAeKuil8GsA6t4fPgsm86Kkd45AQS4O+38=; 
 b=gDCO8yHRbvb8Oj0/GOKdzYNwU5c/qjbjcwYCInWzNT2ju3pBXI68qk7nYbwV1cu68oU8h2DaT3yiMnUTCVjcPX9qPpzaE4EBc/JoIr5oBrZsgnALlOcC4OuHhTO4alYw/ESg6a7lazB6PePUdZgPOt9ARdYHDBpjEm1yNy9tXaA=;
X-UUID: e64907448fd74d6cab03d25ca28cdd7f-20211026
Received: from mtkexhb02.mediatek.inc [(172.27.7.253)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2127466501; Tue, 26 Oct 2021 00:14:36 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 26 Oct 2021 00:14:36 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Oct 2021 00:14:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Oct 2021 00:14:35 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 1/5] drm/mediatek: Use mailbox rx_callback instead of
 cmdq_task_cb
Date: Tue, 26 Oct 2021 00:14:30 +0800
Message-ID: <20211025161434.2641-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211025161434.2641-1-jason-jh.lin@mediatek.com>
References: <20211025161434.2641-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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

RnJvbTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQoNCnJ4X2NhbGxi
YWNrIGlzIGEgc3RhbmRhcmQgbWFpbGJveCBjYWxsYmFjayBtZWNoYW5pc20gYW5kIGNvdWxkIGNv
dmVyIHRoZQ0KZnVuY3Rpb24gb2YgcHJvcHJpZXRhcnkgY21kcV90YXNrX2NiLCBzbyB1c2UgdGhl
IHN0YW5kYXJkIG9uZSBpbnN0ZWFkIG9mDQp0aGUgcHJvcHJpZXRhcnkgb25lLg0KDQpTaWduZWQt
b2ZmLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4NClNpZ25lZC1v
ZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDE2ICsrKysrKysrKysrKyst
LS0NCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KaW5kZXggYTRlODBlNDk5Njc0
Li4zNjlkM2U2OGMwYjYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
Yw0KQEAgLTQsNiArNCw4IEBADQogICovDQogDQogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KKyNp
bmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPg0KKyNpbmNsdWRlIDxsaW51eC9tYWlsYm94X2Nv
bnRyb2xsZXIuaD4NCiAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KICNpbmNsdWRlIDxs
aW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaD4NCiAjaW5jbHVkZSA8bGludXgvc29jL21lZGlh
dGVrL210ay1tbXN5cy5oPg0KQEAgLTIyMiw5ICsyMjQsMTEgQEAgc3RydWN0IG10a19kZHBfY29t
cCAqbXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KIH0N
CiANCiAjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCi1zdGF0aWMgdm9pZCBkZHBf
Y21kcV9jYihzdHJ1Y3QgY21kcV9jYl9kYXRhIGRhdGEpDQorc3RhdGljIHZvaWQgZGRwX2NtZHFf
Y2Ioc3RydWN0IG1ib3hfY2xpZW50ICpjbCwgdm9pZCAqbXNzZykNCiB7DQotCWNtZHFfcGt0X2Rl
c3Ryb3koZGF0YS5kYXRhKTsNCisJc3RydWN0IGNtZHFfY2JfZGF0YSAqZGF0YSA9IG1zc2c7DQor
DQorCWNtZHFfcGt0X2Rlc3Ryb3koZGF0YS0+cGt0KTsNCiB9DQogI2VuZGlmDQogDQpAQCAtNDc1
LDcgKzQ3OSwxMiBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfdXBkYXRlX2NvbmZpZyhzdHJ1
Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YywNCiAJCWNtZHFfcGt0X3dmZShjbWRxX2hhbmRsZSwg
bXRrX2NydGMtPmNtZHFfZXZlbnQsIGZhbHNlKTsNCiAJCW10a19jcnRjX2RkcF9jb25maWcoY3J0
YywgY21kcV9oYW5kbGUpOw0KIAkJY21kcV9wa3RfZmluYWxpemUoY21kcV9oYW5kbGUpOw0KLQkJ
Y21kcV9wa3RfZmx1c2hfYXN5bmMoY21kcV9oYW5kbGUsIGRkcF9jbWRxX2NiLCBjbWRxX2hhbmRs
ZSk7DQorCQlkbWFfc3luY19zaW5nbGVfZm9yX2RldmljZShtdGtfY3J0Yy0+Y21kcV9jbGllbnQt
PmNoYW4tPm1ib3gtPmRldiwNCisJCQkJCSAgIGNtZHFfaGFuZGxlLT5wYV9iYXNlLA0KKwkJCQkJ
ICAgY21kcV9oYW5kbGUtPmNtZF9idWZfc2l6ZSwNCisJCQkJCSAgIERNQV9UT19ERVZJQ0UpOw0K
KwkJbWJveF9zZW5kX21lc3NhZ2UobXRrX2NydGMtPmNtZHFfY2xpZW50LT5jaGFuLCBjbWRxX2hh
bmRsZSk7DQorCQltYm94X2NsaWVudF90eGRvbmUobXRrX2NydGMtPmNtZHFfY2xpZW50LT5jaGFu
LCAwKTsNCiAJfQ0KICNlbmRpZg0KIAltdGtfY3J0Yy0+Y29uZmlnX3VwZGF0aW5nID0gZmFsc2U7
DQpAQCAtODM5LDYgKzg0OCw3IEBAIGludCBtdGtfZHJtX2NydGNfY3JlYXRlKHN0cnVjdCBkcm1f
ZGV2aWNlICpkcm1fZGV2LA0KIAl9DQogDQogCWlmIChtdGtfY3J0Yy0+Y21kcV9jbGllbnQpIHsN
CisJCW10a19jcnRjLT5jbWRxX2NsaWVudC0+Y2xpZW50LnJ4X2NhbGxiYWNrID0gZGRwX2NtZHFf
Y2I7DQogCQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChwcml2LT5tdXRleF9ub2Rl
LA0KIAkJCQkJCSAibWVkaWF0ZWssZ2NlLWV2ZW50cyIsDQogCQkJCQkJIGRybV9jcnRjX2luZGV4
KCZtdGtfY3J0Yy0+YmFzZSksDQotLSANCjIuMTguMA0K

