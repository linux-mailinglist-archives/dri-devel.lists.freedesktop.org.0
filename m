Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888353AB164
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 12:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097646E8E2;
	Thu, 17 Jun 2021 10:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 53A616E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:32:25 +0000 (UTC)
X-UUID: 02451195d5c24f96b8b31394ae37a108-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qBwqJW6+KXN1WXu/dJswBwv1ZwB6zof1JysV9dlVxzI=; 
 b=Y1vLfTmBUaTFzfQ2nmgXofsxWwcy+ajQlBqvyRRvzrPFod7KXt+ADGrJL32VEFeO+qEqPUgJKBXI7Mjne6yDdhmjJdKhU1G7nt4BQ+w4U3p4x6nliyFAu/ZxsiSHTRcwYe1uFHef87mAev9oHRG8SQUg3CPNuQIdXeVJrFDiaeI=;
X-UUID: 02451195d5c24f96b8b31394ae37a108-20210617
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 629330851; Thu, 17 Jun 2021 18:32:22 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Jun 2021 18:32:16 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 17 Jun 2021 18:32:16 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/mediatek: force hsa hbp hfp packets multiple of
 lanenum to avoid screen shift
Date: Thu, 17 Jun 2021 18:32:14 +0800
Message-ID: <20210617103214.44217-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: FC510DC44A542FB00BE6C56F37F322843E845B614EB23D762E60C3DDE504DF812000:8
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, shuijing.li@mediatek.com,
 huijuan.xie@mediatek.com, stonea168@163.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJyaWRnZSBjaGlwICJBTlg3NjI1IiByZXF1aXJlcyB0aGUgcGFja2V0cyBvbiBsYW5lcyB0
byBhbGlnbmUgYXQgdGhlIGVuZCwNCm9yIEFOWDc2MjUgd2lsbCBzaGlmdCB0aGUgc2NyZWVuLg0K
DQpTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+DQotLS0N
CiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTMgKysrKysrKysrKysrKw0K
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYw0KaW5kZXggYWU0MDNjNjdjYmQ5Li40NzM1ZTAwOTJmZmUgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jDQpAQCAtMTk0LDYgKzE5NCw4IEBAIHN0cnVjdCBtdGtfZHNpIHsN
CiAJc3RydWN0IGNsayAqaHNfY2xrOw0KIA0KIAl1MzIgZGF0YV9yYXRlOw0KKwkvKiBmb3JjZSBk
c2kgbGluZSBlbmQgd2l0aG91dCBkc2lfbnVsbCBkYXRhICovDQorCWJvb2wgZm9yY2VfZHNpX2Vu
ZF93aXRob3V0X251bGw7DQogDQogCXVuc2lnbmVkIGxvbmcgbW9kZV9mbGFnczsNCiAJZW51bSBt
aXBpX2RzaV9waXhlbF9mb3JtYXQgZm9ybWF0Ow0KQEAgLTQ5OSw2ICs1MDEsMTMgQEAgc3RhdGlj
IHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQ0KIAkJ
RFJNX1dBUk4oIkhGUCArIEhCUCBsZXNzIHRoYW4gZC1waHksIEZQUyB3aWxsIHVuZGVyIDYwSHpc
biIpOw0KIAl9DQogDQorCWlmIChkc2ktPmZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsKSB7DQor
CQlob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUgPSByb3VuZHVwKGhvcml6b250YWxfc3luY19h
Y3RpdmVfYnl0ZSwgZHNpLT5sYW5lcykgLSAyOw0KKwkJaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5
dGUgPSByb3VuZHVwKGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlLCBkc2ktPmxhbmVzKSAtIDI7
DQorCQlob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlID0gcm91bmR1cChob3Jpem9udGFsX2JhY2tw
b3JjaF9ieXRlLCBkc2ktPmxhbmVzKSAtIDI7DQorCQlob3Jpem9udGFsX2JhY2twb3JjaF9ieXRl
IC09ICh2bS0+aGFjdGl2ZSAqIGRzaV90bXBfYnVmX2JwcCArIDIpICUgZHNpLT5sYW5lczsNCisJ
fQ0KKw0KIAl3cml0ZWwoaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlLCBkc2ktPnJlZ3MgKyBE
U0lfSFNBX1dDKTsNCiAJd3JpdGVsKGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUsIGRzaS0+cmVn
cyArIERTSV9IQlBfV0MpOw0KIAl3cml0ZWwoaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUsIGRz
aS0+cmVncyArIERTSV9IRlBfV0MpOw0KQEAgLTEwOTUsNiArMTEwNCwxMCBAQCBzdGF0aWMgaW50
IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJZHNpLT5icmlk
Z2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsNCiAJZHNpLT5icmlkZ2UudHlwZSA9IERSTV9NT0RF
X0NPTk5FQ1RPUl9EU0k7DQogDQorCWlmIChkc2ktPm5leHRfYnJpZGdlKQ0KKwkJZHNpLT5mb3Jj
ZV9kc2lfZW5kX3dpdGhvdXRfbnVsbCA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChkc2ktPm5leHRf
YnJpZGdlLT5vZl9ub2RlLA0KKwkJCQkJCQkJCSJmb3JjZV9kc2lfZW5kX3dpdGhvdXRfbnVsbCIp
Ow0KKw0KIAlkcm1fYnJpZGdlX2FkZCgmZHNpLT5icmlkZ2UpOw0KIA0KIAlyZXQgPSBjb21wb25l
bnRfYWRkKCZwZGV2LT5kZXYsICZtdGtfZHNpX2NvbXBvbmVudF9vcHMpOw0KLS0gDQoyLjI1LjEN
Cg==

