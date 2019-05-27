Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11A2B449
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6709F89D49;
	Mon, 27 May 2019 12:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087F689971
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:58:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RBqHta004118; Mon, 27 May 2019 13:58:37 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sptu9k0sp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 13:58:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E78138;
 Mon, 27 May 2019 11:58:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CF622A01;
 Mon, 27 May 2019 11:58:35 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May
 2019 13:58:34 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May 2019 13:58:34
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <yannick.fertre@st.com>, <philippe.cornu@st.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <alexandre.torgue@st.com>
Subject: [PATCH] drm/stm: ltdc: restore calls to clk_{enable/disable}
Date: Mon, 27 May 2019 13:58:30 +0200
Message-ID: <20190527115830.15836-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=CHNiLECO7COJeJykJENYiJJ3vrh3cyTCAguGAsVnNK8=;
 b=tg2zDJoONVSJEtDceghChtbL1O2vw81Tyd4NdODekOXiJzVpk2S/HtQ51BLR+lPFK8W8
 1yEOdH+MMu7kjaFpNVrBCOonUMEH6uS1ZeLgYr2keJZlGnKfR530U17kWDkTRAgkfw7t
 i0YsN4zStVhAbPiDFefzLknaw3G1DbBwxiS/OetzihCaIraCIpmMwlvrZ07HkrdhKn/N
 uU26gPuiccaXbcCRq/+xxq152uiZYl63BJtp7ShiUtErfPXC7SIQ2gtegYyxmUL4bg5R
 HmYYjXp06iCTa5NzTp0+1bnjZ9aJWEJLgkf+PodDjij2fyY0S5NnhR9Y8CVLmbsFaN+j 6A== 
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
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+CgpS
ZXN0b3JlIGNhbGxzIHRvIGNsa197ZW5hYmxlL2Rpc2FibGV9IGRlbGV0ZWQgYWZ0ZXIgYXBwbHlp
bmcgdGhlIHdyb25nCnZlcnNpb24gb2YgdGhlIHBhdGNoCgpGaXhlczogZmQ2OTA1ZmNhNGYwICgi
ZHJtL3N0bTogbHRkYzogcmVtb3ZlIGNsa19yb3VuZF9yYXRlIGNvbW1lbnQiKQoKU2lnbmVkLW9m
Zi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRleCBhZTJhYWYyYTYyZWUuLmFjMjk4OTBlZGVi
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMKQEAgLTUwNywxMCArNTA3LDEyIEBAIHN0YXRpYyBib29sIGx0ZGNf
Y3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlzdHJ1Y3QgbHRkY19kZXZp
Y2UgKmxkZXYgPSBjcnRjX3RvX2x0ZGMoY3J0Yyk7CiAJaW50IHJhdGUgPSBtb2RlLT5jbG9jayAq
IDEwMDA7CiAKKwljbGtfZGlzYWJsZShsZGV2LT5waXhlbF9jbGspOwogCWlmIChjbGtfc2V0X3Jh
dGUobGRldi0+cGl4ZWxfY2xrLCByYXRlKSA8IDApIHsKIAkJRFJNX0VSUk9SKCJDYW5ub3Qgc2V0
IHJhdGUgKCVkSHopIGZvciBwaXhlbCBjbGtcbiIsIHJhdGUpOwogCQlyZXR1cm4gZmFsc2U7CiAJ
fQorCWNsa19lbmFibGUobGRldi0+cGl4ZWxfY2xrKTsKIAogCWFkanVzdGVkX21vZGUtPmNsb2Nr
ID0gY2xrX2dldF9yYXRlKGxkZXYtPnBpeGVsX2NsaykgLyAxMDAwOwogCi0tIAoyLjE1LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
