Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D9B0AB9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 10:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F407C6EC77;
	Thu, 12 Sep 2019 08:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452A46EC77
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 08:57:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8C8u6xt002413; Thu, 12 Sep 2019 10:56:57 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uv2awg4hb-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 12 Sep 2019 10:56:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C5C2A53;
 Thu, 12 Sep 2019 08:56:46 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1BA12B841B;
 Thu, 12 Sep 2019 10:56:45 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 12 Sep
 2019 10:56:45 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 12 Sep 2019 10:56:45
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
Subject: [PATCH] drm/stm: dsi: higher pll out only in video burst mode
Date: Thu, 12 Sep 2019 10:56:29 +0200
Message-ID: <1568278589-20400-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-12_04:2019-09-11,2019-09-12 signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=hC/Ep7sILGc8IpTJGW+E2kTEYIt84RL/dPIXG9oXwF0=;
 b=DxjeenHlDwZIXSKz4Z4Cj9H1cpx4vn5MQKPwyPNsHrltd/aGq+o1yO8tGnckqJRC1rQT
 TTPOBEn7Xm3/pY0nTQv62iCWyOKOPdXagbxmaGYUTGLFXVJRr9J745Yf0T8YzhMgvxIj
 Egqir2G8pxnZajnCAKontJPhtgQ3bODtPj0En19MSxqkZnR62OROnca6RjLlA+wST1Kv
 0+UXJgXGPswnPexcPT76AarTnogHSI0AsJoVVCIZICvYkoaPww4Pbdl2oNvga7B66J5P
 5HaDRbiCk1h77MaWfvXvtIl9nPZnpZLMtIg/C1rvoSeOq5j8JYibDjDUguNOPx5DkzdF YA== 
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

SW4gb3JkZXIgdG8gYmV0dGVyIHN1cHBvcnQgdmlkZW8gbm9uLWJ1cnN0IG1vZGVzLAp0aGUgKzIw
JSBvbiBwbGwgb3V0IGlzIGFkZGVkIG9ubHkgaW4gYnVyc3QgbW9kZS4KClNpZ25lZC1vZmYtYnk6
IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+ClJldmlld2VkLWJ5OiBZYW5u
aWNrIEZFUlRSRSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9z
dG0vZHdfbWlwaV9kc2ktc3RtLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9k
d19taXBpX2RzaS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMK
aW5kZXggYTAzYTY0Mi4uNTE0ZWZlZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9k
d19taXBpX2RzaS1zdG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0
bS5jCkBAIC0yNjAsOCArMjYwLDExIEBAIGR3X21pcGlfZHNpX2dldF9sYW5lX21icHModm9pZCAq
cHJpdl9kYXRhLCBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKIAkvKiBDb21w
dXRlIHJlcXVlc3RlZCBwbGwgb3V0ICovCiAJYnBwID0gbWlwaV9kc2lfcGl4ZWxfZm9ybWF0X3Rv
X2JwcChmb3JtYXQpOwogCXBsbF9vdXRfa2h6ID0gbW9kZS0+Y2xvY2sgKiBicHAgLyBsYW5lczsK
KwogCS8qIEFkZCAyMCUgdG8gcGxsIG91dCB0byBiZSBoaWdoZXIgdGhhbiBwaXhlbCBidyAoYnVy
c3QgbW9kZSBvbmx5KSAqLwotCXBsbF9vdXRfa2h6ID0gKHBsbF9vdXRfa2h6ICogMTIpIC8gMTA7
CisJaWYgKG1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX0JVUlNUKQorCQlwbGxfb3V0
X2toeiA9IChwbGxfb3V0X2toeiAqIDEyKSAvIDEwOworCiAJaWYgKHBsbF9vdXRfa2h6ID4gZHNp
LT5sYW5lX21heF9rYnBzKSB7CiAJCXBsbF9vdXRfa2h6ID0gZHNpLT5sYW5lX21heF9rYnBzOwog
CQlEUk1fV0FSTigiV2FybmluZyBtYXggcGh5IG1icHMgaXMgdXNlZFxuIik7Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
