Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C133F10AD73
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 11:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EA089450;
	Wed, 27 Nov 2019 10:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D207F89450
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:23:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARAI6oZ024345; Wed, 27 Nov 2019 11:23:21 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxkjxr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:23:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3552B100039;
 Wed, 27 Nov 2019 11:23:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 87F9B2B1213;
 Wed, 27 Nov 2019 11:23:16 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 27 Nov 2019 11:23:15 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/bridge/synopsys: dsi: read status error during transfer
Date: Wed, 27 Nov 2019 11:23:13 +0100
Message-ID: <1574850193-13197-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=nRnCfDOyz8UKlH1ej2bd+91eyXIv7FWz+tcHNpHp4WI=;
 b=kOfanqpRLE2X5OrdBPfGaTDLlOFrumNPxqc7RurAe1I3jLcFvaNiJU//PE/Lnujs8qoC
 DsqtMYOd44gy77KydQ/V2SH0hgd9srdp3Ji0zhw7yWqc7pxP+x849gQoEL3dCxmbVBYV
 XWVMbrdmBtzVa/x3S9eQ+hQWf+qLbasdhd8bO2B8bSzWMiSFjmirfvG96cALT2Mhaqcv
 ZX94+A54k/LwzQ9gbVtbmvDX29sg2enBMz5m+pFP+c4ajsxvOvNSXA5Yhce1k8phO9hw
 Y5s2EJNu/YquovOlayUOjL/HcK0PQ+EyOFvKEtEM/WJN8fyupT6nXjpgClf607+N8i7z 6w== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgpSZWFkIHRoZSBE
U0lfSU5UX1NUMSBzdGF0dXMgcmVnaXN0ZXIgdG8gY2hlY2sgaWYKZXJyb3JzIG9jY3VyIHdoaWxl
IHJlYWRpbmcvd3JpdGluZyBhIGNvbW1hbmQgdG8gcGFuZWwuCkluIGNhc2Ugb2YgZXJyb3IsIHRo
ZSB0cmFuc2ZlciBpcyByZXRyaWVkIDMgdGltZXMuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZl
cnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDk5ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYwppbmRleCBiNmU3OTNi
Li5jYzgwNmJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LW1pcGktZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBp
LWRzaS5jCkBAIC0yMTIsNiArMjEyLDIwIEBACiAKICNkZWZpbmUgRFNJX0lOVF9TVDAJCQkweGJj
CiAjZGVmaW5lIERTSV9JTlRfU1QxCQkJMHhjMAorI2RlZmluZSBHUFJYRQkJCQlCSVQoMTIpCisj
ZGVmaW5lIEdQUkRFCQkJCUJJVCgxMSkKKyNkZWZpbmUgR1BUWEUJCQkJQklUKDEwKQorI2RlZmlu
ZSBHUFdSRQkJCQlCSVQoOSkKKyNkZWZpbmUgR0NXUkUJCQkJQklUKDgpCisjZGVmaW5lIERQSVBM
RFdFCQkJQklUKDcpCisjZGVmaW5lIEVPVFBFCQkJCUJJVCg2KQorI2RlZmluZSBQU0UJCQkJQklU
KDUpCisjZGVmaW5lIENSQ0UJCQkJQklUKDQpCisjZGVmaW5lIEVDQ01FCQkJCUJJVCgzKQorI2Rl
ZmluZSBFQ0NTRQkJCQlCSVQoMikKKyNkZWZpbmUgVE9MUFJYCQkJCUJJVCgxKQorI2RlZmluZSBU
T0hTVFgJCQkJQklUKDApCisKICNkZWZpbmUgRFNJX0lOVF9NU0swCQkJMHhjNAogI2RlZmluZSBE
U0lfSU5UX01TSzEJCQkweGM4CiAKQEAgLTM5Nyw2ICs0MTEsNDIgQEAgc3RhdGljIGludCBkd19t
aXBpX2RzaV9nZW5fcGt0X2hkcl93cml0ZShzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSwgdTMyIGhk
cl92YWwpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgZHdfbWlwaV9kc2lfcmVhZF9zdGF0
dXMoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpCit7CisJdTMyIHZhbDsKKworCXZhbCA9IGRzaV9y
ZWFkKGRzaSwgRFNJX0lOVF9TVDEpOworCisJaWYgKHZhbCAmIEdQUlhFKQorCQlEUk1fREVCVUdf
RFJJVkVSKCJEU0kgR2VuZXJpYyBwYXlsb2FkIHJlY2VpdmUgZXJyb3JcbiIpOworCWlmICh2YWwg
JiBHUFJERSkKKwkJRFJNX0RFQlVHX0RSSVZFUigiRFNJIEdlbmVyaWMgcGF5bG9hZCByZWFkIGVy
cm9yXG4iKTsKKwlpZiAodmFsICYgR1BUWEUpCisJCURSTV9ERUJVR19EUklWRVIoIkRTSSBHZW5l
cmljIHBheWxvYWQgdHJhbnNtaXQgZXJyb3JcbiIpOworCWlmICh2YWwgJiBHUFdSRSkKKwkJRFJN
X0RFQlVHX0RSSVZFUigiRFNJIEdlbmVyaWMgcGF5bG9hZCB3cml0ZSBlcnJvclxuIik7CisJaWYg
KHZhbCAmIEdDV1JFKQorCQlEUk1fREVCVUdfRFJJVkVSKCJEU0kgR2VuZXJpYyBjb21tYW5kIHdy
aXRlIGVycm9yXG4iKTsKKwlpZiAodmFsICYgRFBJUExEV0UpCisJCURSTV9ERUJVR19EUklWRVIo
IkRTSSBEUEkgcGF5bG9hZCB3cml0ZSBlcnJvclxuIik7CisJaWYgKHZhbCAmIEVPVFBFKQorCQlE
Uk1fREVCVUdfRFJJVkVSKCJEU0kgRW9UcCBlcnJvclxuIik7CisJaWYgKHZhbCAmIFBTRSkKKwkJ
RFJNX0RFQlVHX0RSSVZFUigiRFNJIFBhY2tldCBzaXplIGVycm9yXG4iKTsKKwlpZiAodmFsICYg
Q1JDRSkKKwkJRFJNX0RFQlVHX0RSSVZFUigiRFNJIENSQyBlcnJvclxuIik7CisJaWYgKHZhbCAm
IEVDQ01FKQorCQlEUk1fREVCVUdfRFJJVkVSKCJEU0kgRUNDIG11bHRpLWJpdCBlcnJvclxuIik7
CisJaWYgKHZhbCAmIEVDQ1NFKQorCQlEUk1fREVCVUdfRFJJVkVSKCJEU0kgRUNDIHNpbmdsZS1i
aXQgZXJyb3JcbiIpOworCWlmICh2YWwgJiBUT0xQUlgpCisJCURSTV9ERUJVR19EUklWRVIoIkRT
SSBUaW1lb3V0IGxvdy1wb3dlciByZWNlcHRpb25cbiIpOworCWlmICh2YWwgJiBUT0hTVFgpCisJ
CURSTV9ERUJVR19EUklWRVIoIkRTSSBUaW1lb3V0IGhpZ2gtc3BlZWQgdHJhbnNtaXNzaW9uXG4i
KTsKKworCXJldHVybiB2YWw7Cit9CisKIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfd3JpdGUoc3Ry
dWN0IGR3X21pcGlfZHNpICpkc2ksCiAJCQkgICAgIGNvbnN0IHN0cnVjdCBtaXBpX2RzaV9wYWNr
ZXQgKnBhY2tldCkKIHsKQEAgLTQyNiw2ICs0NzYsMTIgQEAgc3RhdGljIGludCBkd19taXBpX2Rz
aV93cml0ZShzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSwKIAkJCQkiZmFpbGVkIHRvIGdldCBhdmFp
bGFibGUgd3JpdGUgcGF5bG9hZCBGSUZPXG4iKTsKIAkJCXJldHVybiByZXQ7CiAJCX0KKworCQl2
YWwgPSBkd19taXBpX2RzaV9yZWFkX3N0YXR1cyhkc2kpOworCQlpZiAodmFsKSB7CisJCQlkZXZf
ZXJyKGRzaS0+ZGV2LCAiZHNpIHN0YXR1cyBlcnJvciAweCUweFxuIiwgdmFsKTsKKwkJCXJldHVy
biAtRUlOVkFMOworCQl9CiAJfQogCiAJd29yZCA9IDA7CkBAIC00NTksNiArNTE1LDEyIEBAIHN0
YXRpYyBpbnQgZHdfbWlwaV9kc2lfcmVhZChzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSwKIAkJCXJl
dHVybiByZXQ7CiAJCX0KIAorCQl2YWwgPSBkd19taXBpX2RzaV9yZWFkX3N0YXR1cyhkc2kpOwor
CQlpZiAodmFsKSB7CisJCQlkZXZfZXJyKGRzaS0+ZGV2LCAiZHNpIHN0YXR1cyBlcnJvciAweCUw
eFxuIiwgdmFsKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CisKIAkJdmFsID0gZHNpX3JlYWQo
ZHNpLCBEU0lfR0VOX1BMRF9EQVRBKTsKIAkJZm9yIChqID0gMDsgaiA8IDQgJiYgaiArIGkgPCBs
ZW47IGorKykKIAkJCWJ1ZltpICsgal0gPSB2YWwgPj4gKDggKiBqKTsKQEAgLTQ3Myw2ICs1MzUs
NyBAQCBzdGF0aWMgc3NpemVfdCBkd19taXBpX2RzaV9ob3N0X3RyYW5zZmVyKHN0cnVjdCBtaXBp
X2RzaV9ob3N0ICpob3N0LAogCXN0cnVjdCBkd19taXBpX2RzaSAqZHNpID0gaG9zdF90b19kc2ko
aG9zdCk7CiAJc3RydWN0IG1pcGlfZHNpX3BhY2tldCBwYWNrZXQ7CiAJaW50IHJldCwgbmJfYnl0
ZXM7CisJaW50IHJldHJ5ID0gMzsKIAogCXJldCA9IG1pcGlfZHNpX2NyZWF0ZV9wYWNrZXQoJnBh
Y2tldCwgbXNnKTsKIAlpZiAocmV0KSB7CkBAIC00ODQsMjQgKzU0NywzMiBAQCBzdGF0aWMgc3Np
emVfdCBkd19taXBpX2RzaV9ob3N0X3RyYW5zZmVyKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0
LAogCWlmIChkc2ktPnNsYXZlKQogCQlkd19taXBpX21lc3NhZ2VfY29uZmlnKGRzaS0+c2xhdmUs
IG1zZyk7CiAKLQlyZXQgPSBkd19taXBpX2RzaV93cml0ZShkc2ksICZwYWNrZXQpOwotCWlmIChy
ZXQpCi0JCXJldHVybiByZXQ7Ci0JaWYgKGRzaS0+c2xhdmUpIHsKLQkJcmV0ID0gZHdfbWlwaV9k
c2lfd3JpdGUoZHNpLT5zbGF2ZSwgJnBhY2tldCk7CisJd2hpbGUgKHJldHJ5LS0pIHsKKwkJcmV0
ID0gZHdfbWlwaV9kc2lfd3JpdGUoZHNpLCAmcGFja2V0KTsKIAkJaWYgKHJldCkKLQkJCXJldHVy
biByZXQ7Ci0JfQorCQkJY29udGludWU7CiAKLQlpZiAobXNnLT5yeF9idWYgJiYgbXNnLT5yeF9s
ZW4pIHsKLQkJcmV0ID0gZHdfbWlwaV9kc2lfcmVhZChkc2ksIG1zZyk7Ci0JCWlmIChyZXQpCi0J
CQlyZXR1cm4gcmV0OwotCQluYl9ieXRlcyA9IG1zZy0+cnhfbGVuOwotCX0gZWxzZSB7Ci0JCW5i
X2J5dGVzID0gcGFja2V0LnNpemU7CisJCWlmIChkc2ktPnNsYXZlKSB7CisJCQlyZXQgPSBkd19t
aXBpX2RzaV93cml0ZShkc2ktPnNsYXZlLCAmcGFja2V0KTsKKwkJCWlmIChyZXQpCisJCQkJY29u
dGludWU7CisJCX0KKworCQlpZiAobXNnLT5yeF9idWYgJiYgbXNnLT5yeF9sZW4pIHsKKwkJCXJl
dCA9IGR3X21pcGlfZHNpX3JlYWQoZHNpLCBtc2cpOworCQkJaWYgKHJldCkKKwkJCQljb250aW51
ZTsKKwkJCW5iX2J5dGVzID0gbXNnLT5yeF9sZW47CisKKwkJfSBlbHNlIHsKKwkJCW5iX2J5dGVz
ID0gcGFja2V0LnNpemU7CisJCX0KKwkJYnJlYWs7CiAJfQogCisJaWYgKHJldCkKKwkJcmV0dXJu
IHJldDsKKwogCXJldHVybiBuYl9ieXRlczsKIH0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
