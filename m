Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5347226A5
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 12:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9949F8920D;
	Sun, 19 May 2019 10:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 741518920E
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 10:57:00 +0000 (UTC)
X-UUID: 1758048c19c34f08b74f2e3d20c4dc09-20190519
X-UUID: 1758048c19c34f08b74f2e3d20c4dc09-20190519
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2029802737; Sun, 19 May 2019 18:56:56 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 19 May 2019 18:56:54 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sun, 19 May 2019 18:56:52 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] pwm: fine tune pwm-mtk-disp clock control flow
Date: Sun, 19 May 2019 18:56:48 +0800
Message-ID: <20190519105649.72368-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190519105649.72368-1-jitao.shi@mediatek.com>
References: <20190519105649.72368-1-jitao.shi@mediatek.com>
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

TWF0Y2ggcHdtIGNsb2NrIHdoZW4gc3VzcGVuZCBhbmQgcmVzdW1lLgpQcmVwYXJlIGFuZCBlbmFi
bGUgZGlzcF9wd20gY2xvY2sgd2hlbiBkaXNwX3B3bSBlbmFibGUuCkRpc2FibGUgYW5kIHVucHJl
cGFyZSBkaXNwX3B3bSBjbG9jayB3aGVuIGRpc3BfcHdtIGRpc2FibGUuCgpTaWduZWQtb2ZmLWJ5
OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9wd20vcHdt
LW10ay1kaXNwLmMgfCA0MyArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1tdGstZGlzcC5jIGIvZHJpdmVycy9wd20vcHdtLW10ay1k
aXNwLmMKaW5kZXggMTU4MDNjNzFmZTgwLi4yNzA3OWFjYzNlMWQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvcHdtL3B3bS1tdGstZGlzcC5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1tdGstZGlzcC5jCkBA
IC0xMDYsMTMgKzEwNiwxMyBAQCBzdGF0aWMgaW50IG10a19kaXNwX3B3bV9jb25maWcoc3RydWN0
IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCWhpZ2hfd2lkdGggPSBk
aXY2NF91NjQocmF0ZSAqIGR1dHlfbnMsIGRpdik7CiAJdmFsdWUgPSBwZXJpb2QgfCAoaGlnaF93
aWR0aCA8PCBQV01fSElHSF9XSURUSF9TSElGVCk7CiAKLQllcnIgPSBjbGtfZW5hYmxlKG1kcC0+
Y2xrX21haW4pOworCWVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShtZHAtPmNsa19tYWluKTsKIAlp
ZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKIAotCWVyciA9IGNsa19lbmFibGUobWRwLT5jbGtf
bW0pOworCWVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShtZHAtPmNsa19tbSk7CiAJaWYgKGVyciA8
IDApIHsKLQkJY2xrX2Rpc2FibGUobWRwLT5jbGtfbWFpbik7CisJCWNsa19kaXNhYmxlX3VucHJl
cGFyZShtZHAtPmNsa19tYWluKTsKIAkJcmV0dXJuIGVycjsKIAl9CiAKQEAgLTEzMiw4ICsxMzIs
OCBAQCBzdGF0aWMgaW50IG10a19kaXNwX3B3bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpjaGlw
LCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCQkJCQkgMHgwKTsKIAl9CiAKLQljbGtfZGlzYWJs
ZShtZHAtPmNsa19tbSk7Ci0JY2xrX2Rpc2FibGUobWRwLT5jbGtfbWFpbik7CisJY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKG1kcC0+Y2xrX21tKTsKKwljbGtfZGlzYWJsZV91bnByZXBhcmUobWRwLT5j
bGtfbWFpbik7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTE0MywxMyArMTQzLDEzIEBAIHN0YXRpYyBp
bnQgbXRrX2Rpc3BfcHdtX2VuYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21f
ZGV2aWNlICpwd20pCiAJc3RydWN0IG10a19kaXNwX3B3bSAqbWRwID0gdG9fbXRrX2Rpc3BfcHdt
KGNoaXApOwogCWludCBlcnI7CiAKLQllcnIgPSBjbGtfZW5hYmxlKG1kcC0+Y2xrX21haW4pOwor
CWVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShtZHAtPmNsa19tYWluKTsKIAlpZiAoZXJyIDwgMCkK
IAkJcmV0dXJuIGVycjsKIAotCWVyciA9IGNsa19lbmFibGUobWRwLT5jbGtfbW0pOworCWVyciA9
IGNsa19wcmVwYXJlX2VuYWJsZShtZHAtPmNsa19tbSk7CiAJaWYgKGVyciA8IDApIHsKLQkJY2xr
X2Rpc2FibGUobWRwLT5jbGtfbWFpbik7CisJCWNsa19kaXNhYmxlX3VucHJlcGFyZShtZHAtPmNs
a19tYWluKTsKIAkJcmV0dXJuIGVycjsKIAl9CiAKQEAgLTE2Niw4ICsxNjYsOCBAQCBzdGF0aWMg
dm9pZCBtdGtfZGlzcF9wd21fZGlzYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBw
d21fZGV2aWNlICpwd20pCiAJbXRrX2Rpc3BfcHdtX3VwZGF0ZV9iaXRzKG1kcCwgRElTUF9QV01f
RU4sIG1kcC0+ZGF0YS0+ZW5hYmxlX21hc2ssCiAJCQkJIDB4MCk7CiAKLQljbGtfZGlzYWJsZSht
ZHAtPmNsa19tbSk7Ci0JY2xrX2Rpc2FibGUobWRwLT5jbGtfbWFpbik7CisJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKG1kcC0+Y2xrX21tKTsKKwljbGtfZGlzYWJsZV91bnByZXBhcmUobWRwLT5jbGtf
bWFpbik7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHdtX29wcyBtdGtfZGlzcF9wd21fb3Bz
ID0gewpAQCAtMjAyLDE0ICsyMDIsNiBAQCBzdGF0aWMgaW50IG10a19kaXNwX3B3bV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChJU19FUlIobWRwLT5jbGtfbW0pKQog
CQlyZXR1cm4gUFRSX0VSUihtZHAtPmNsa19tbSk7CiAKLQlyZXQgPSBjbGtfcHJlcGFyZShtZHAt
PmNsa19tYWluKTsKLQlpZiAocmV0IDwgMCkKLQkJcmV0dXJuIHJldDsKLQotCXJldCA9IGNsa19w
cmVwYXJlKG1kcC0+Y2xrX21tKTsKLQlpZiAocmV0IDwgMCkKLQkJZ290byBkaXNhYmxlX2Nsa19t
YWluOwotCiAJbWRwLT5jaGlwLmRldiA9ICZwZGV2LT5kZXY7CiAJbWRwLT5jaGlwLm9wcyA9ICZt
dGtfZGlzcF9wd21fb3BzOwogCW1kcC0+Y2hpcC5iYXNlID0gLTE7CkBAIC0yMTgsNyArMjEwLDcg
QEAgc3RhdGljIGludCBtdGtfZGlzcF9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlyZXQgPSBwd21jaGlwX2FkZCgmbWRwLT5jaGlwKTsKIAlpZiAocmV0IDwgMCkgewog
CQlkZXZfZXJyKCZwZGV2LT5kZXYsICJwd21jaGlwX2FkZCgpIGZhaWxlZDogJWRcbiIsIHJldCk7
Ci0JCWdvdG8gZGlzYWJsZV9jbGtfbW07CisJCXJldHVybiByZXQ7CiAJfQogCiAJcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgbWRwKTsKQEAgLTIzNywyNCArMjI5LDEzIEBAIHN0YXRpYyBpbnQg
bXRrX2Rpc3BfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQogCiAJ
cmV0dXJuIDA7Ci0KLWRpc2FibGVfY2xrX21tOgotCWNsa191bnByZXBhcmUobWRwLT5jbGtfbW0p
OwotZGlzYWJsZV9jbGtfbWFpbjoKLQljbGtfdW5wcmVwYXJlKG1kcC0+Y2xrX21haW4pOwotCXJl
dHVybiByZXQ7CiB9CiAKIHN0YXRpYyBpbnQgbXRrX2Rpc3BfcHdtX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBtdGtfZGlzcF9wd20gKm1kcCA9IHBsYXRm
b3JtX2dldF9kcnZkYXRhKHBkZXYpOwotCWludCByZXQ7Ci0KLQlyZXQgPSBwd21jaGlwX3JlbW92
ZSgmbWRwLT5jaGlwKTsKLQljbGtfdW5wcmVwYXJlKG1kcC0+Y2xrX21tKTsKLQljbGtfdW5wcmVw
YXJlKG1kcC0+Y2xrX21haW4pOwogCi0JcmV0dXJuIHJldDsKKwlyZXR1cm4gcHdtY2hpcF9yZW1v
dmUoJm1kcC0+Y2hpcCk7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3B3bV9kYXRhIG10
MjcwMV9wd21fZGF0YSA9IHsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
