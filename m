Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A83B47A9F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE6789154;
	Mon, 17 Jun 2019 07:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6E989154
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 07:18:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H7G0ZS016840; Mon, 17 Jun 2019 09:18:22 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t4peu0wyj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 09:18:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C73034;
 Mon, 17 Jun 2019 07:18:20 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7417155B;
 Mon, 17 Jun 2019 07:18:20 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun
 2019 09:18:20 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun 2019 09:18:20
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm/stm: drv: fix suspend/resume
Date: Mon, 17 Jun 2019 09:18:17 +0200
Message-ID: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_05:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=Ia2/UrCUbgT3bw0BUTt336OAmpb+nVhfRSlDq35fcEs=;
 b=djNFXoDB4cGYOdCBR/WaJaQgc3IkLbr6gG3WsKXYywl2EAUpnCglQjTOgMM3NgTdcALz
 RnyxPh/XODS35rQRIAjo1GYk5FJto0TGQ53PiJItJY2wRMFfvAZMdCihDAVFxzhTwpII
 sQ0yUGmVo4AX4apALbfQbpXmJ0vzkqNRS4KYccRtdBEP6MJaCHobWu9Lla2hxtkktYDZ
 CHvFLsHbYqO/4n6bO6cD1IRs51HsaYrmZdKvYANqCjepEBGKuDPgSR9CvfoUbw7G7k97
 RC5yVFldo0CzjKjNEBoaNniM2SmKQ7oJM50d/KITK4TyI5x9OY5n9bngEEOhonkb1mDL rw== 
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

V2l0aG91dCB0aGlzIGZpeCwgdGhlIHN5c3RlbSBjYW4gbm90IGdvIGluICJzdXNwZW5kIiBtb2Rl
CmR1ZSB0byBhbiBlcnJvciBpbiBkcnZfc3VzcGVuZCBmdW5jdGlvbi4KCkZpeGVzOiAzNWFiNmNm
ICgiZHJtL3N0bTogc3VwcG9ydCBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQiKQoKU2lnbmVkLW9m
Zi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3N0bS9kcnYuYyB8IDE1ICsrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYwppbmRleCA1NjU5NTcy
Li45ZGVlNGU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMKQEAgLTEzNiw4ICsxMzYsNyBAQCBzdGF0aWMgX19tYXli
ZV91bnVzZWQgaW50IGRydl9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlzdHJ1Y3QgbHRk
Y19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKIAlzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGU7CiAKLQlpZiAoV0FSTl9PTighbGRldi0+c3VzcGVuZF9zdGF0ZSkpCi0JCXJl
dHVybiAtRU5PRU5UOworCVdBUk5fT04obGRldi0+c3VzcGVuZF9zdGF0ZSk7CiAKIAlzdGF0ZSA9
IGRybV9hdG9taWNfaGVscGVyX3N1c3BlbmQoZGRldik7CiAJaWYgKElTX0VSUihzdGF0ZSkpCkBA
IC0xNTUsMTUgKzE1NCwxNyBAQCBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IGRydl9yZXN1bWUo
c3RydWN0IGRldmljZSAqZGV2KQogCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGRkZXYtPmRl
dl9wcml2YXRlOwogCWludCByZXQ7CiAKKwlpZiAoV0FSTl9PTighbGRldi0+c3VzcGVuZF9zdGF0
ZSkpCisJCXJldHVybiAtRU5PRU5UOworCiAJcG1fcnVudGltZV9mb3JjZV9yZXN1bWUoZGV2KTsK
IAlyZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9yZXN1bWUoZGRldiwgbGRldi0+c3VzcGVuZF9zdGF0
ZSk7Ci0JaWYgKHJldCkgeworCWlmIChyZXQpCiAJCXBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZChk
ZXYpOwotCQlsZGV2LT5zdXNwZW5kX3N0YXRlID0gTlVMTDsKLQkJcmV0dXJuIHJldDsKLQl9CiAK
LQlyZXR1cm4gMDsKKwlsZGV2LT5zdXNwZW5kX3N0YXRlID0gTlVMTDsKKworCXJldHVybiByZXQ7
CiB9CiAKIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgZHJ2X3J1bnRpbWVfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
