Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF819F18
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 16:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF1189740;
	Fri, 10 May 2019 14:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D66C89740
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 14:25:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AE1s09030708; Fri, 10 May 2019 16:20:33 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sc9s4jwnw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 16:20:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB84E31;
 Fri, 10 May 2019 14:20:31 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E2C5113A;
 Fri, 10 May 2019 14:20:31 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Fri, 10 May
 2019 16:20:31 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May 2019 16:20:30
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] drm/stm: dsi: add support of an optional regulator
Date: Fri, 10 May 2019 16:20:20 +0200
Message-ID: <1557498023-10766-3-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=98w/OussyxuOrcLWSMqRtFhnLM+xTLnhKVGbTHyMH+g=;
 b=1iDvh+RspI3I9R7djaQ6BAUvhMdBdC/10L5C4kP699I2iYf98qBnOS8hsWQp8VD8nTvS
 h9CdTHpg/QIxJG0IRtNr+tMWs+tk61GoNmus7in9fKUTQwFboYHuDXBj/mgqsySIMMDf
 fQvjFItf2PHJCmjiPAfxfEjDxdFMuZv4z+nUeuK4MzKwIwu1H/PluAb58ByvJIaiTWYL
 Kqj5xlCaADMMKtztF+qwhwbzLBf7I7JSRnOAZx0KK0sFW3YQcberQ9ck2QvWmOQtq7t6
 idnAu6e7qco9PGJASJhH5DiK82my9XTgqlRNPwn9SebDspe1KoZDevMPxjRIpuIztH7T qQ== 
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

QWRkIHN1cHBvcnQgb2YgYW4gb3B0aW9uYWwgcmVndWxhdG9yIGZvciB0aGUgcGh5IHBhcnQgb2Yg
dGhlIERTSQpjb250cm9sbGVyLgoKU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5u
aWNrLmZlcnRyZUBzdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1z
dG0uYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9k
d19taXBpX2RzaS1zdG0uYwppbmRleCAxYmVmNzNlLi4yMmJkMDk1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
dG0vZHdfbWlwaV9kc2ktc3RtLmMKQEAgLTksNiArOSw3IEBACiAjaW5jbHVkZSA8bGludXgvY2xr
Lmg+CiAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bVAuaD4KICNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+CiAjaW5jbHVkZSA8ZHJtL2JyaWRn
ZS9kd19taXBpX2RzaS5oPgpAQCAtNzYsNiArNzcsNyBAQCBzdHJ1Y3QgZHdfbWlwaV9kc2lfc3Rt
IHsKIAl1MzIgaHdfdmVyc2lvbjsKIAlpbnQgbGFuZV9taW5fa2JwczsKIAlpbnQgbGFuZV9tYXhf
a2JwczsKKwlzdHJ1Y3QgcmVndWxhdG9yICp2ZGRfc3VwcGx5OwogfTsKIAogc3RhdGljIGlubGlu
ZSB2b2lkIGRzaV93cml0ZShzdHJ1Y3QgZHdfbWlwaV9kc2lfc3RtICpkc2ksIHUzMiByZWcsIHUz
MiB2YWwpCkBAIC0zMTgsMTcgKzMyMCwzMSBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3N0bV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gUFRSX0VSUihkc2kt
PmJhc2UpOwogCX0KIAorCWRzaS0+dmRkX3N1cHBseSA9IGRldm1fcmVndWxhdG9yX2dldF9vcHRp
b25hbChkZXYsICJwaHktZHNpIik7CisJaWYgKElTX0VSUihkc2ktPnZkZF9zdXBwbHkpKSB7CisJ
CXJldCA9IFBUUl9FUlIoZHNpLT52ZGRfc3VwcGx5KTsKKwkJaWYgKHJldCAhPSAtRVBST0JFX0RF
RkVSKQorCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gcmVxdWVzdCByZWd1bGF0b3I6ICVkXG4iLCBy
ZXQpOworCQlyZXR1cm4gcmV0OworCX0KKworCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoZHNpLT52
ZGRfc3VwcGx5KTsKKwlpZiAocmV0KSB7CisJCURSTV9FUlJPUigiZmFpbGVkIHRvIGVuYWJsZSBy
ZWd1bGF0b3I6ICVkXG4iLCByZXQpOworCQlyZXR1cm4gcmV0OworCX0KKwogCWRzaS0+cGxscmVm
X2NsayA9IGRldm1fY2xrX2dldChkZXYsICJyZWYiKTsKIAlpZiAoSVNfRVJSKGRzaS0+cGxscmVm
X2NsaykpIHsKIAkJcmV0ID0gUFRSX0VSUihkc2ktPnBsbHJlZl9jbGspOwotCQlkZXZfZXJyKGRl
diwgIlVuYWJsZSB0byBnZXQgcGxsIHJlZmVyZW5jZSBjbG9jazogJWRcbiIsIHJldCk7Ci0JCXJl
dHVybiByZXQ7CisJCURSTV9FUlJPUigiVW5hYmxlIHRvIGdldCBwbGwgcmVmZXJlbmNlIGNsb2Nr
OiAlZFxuIiwgcmV0KTsKKwkJZ290byBlcnJfY2xrX2dldDsKIAl9CiAKIAlyZXQgPSBjbGtfcHJl
cGFyZV9lbmFibGUoZHNpLT5wbGxyZWZfY2xrKTsKIAlpZiAocmV0KSB7Ci0JCWRldl9lcnIoZGV2
LCAiJXM6IEZhaWxlZCB0byBlbmFibGUgcGxscmVmX2Nsa1xuIiwgX19mdW5jX18pOwotCQlyZXR1
cm4gcmV0OworCQlEUk1fRVJST1IoIiVzOiBGYWlsZWQgdG8gZW5hYmxlIHBsbHJlZl9jbGtcbiIs
IF9fZnVuY19fKTsKKwkJZ290byBlcnJfY2xrX2dldDsKIAl9CiAKIAlkd19taXBpX2RzaV9zdG1f
cGxhdF9kYXRhLmJhc2UgPSBkc2ktPmJhc2U7CkBAIC0zMzksMTEgKzM1NSwxOSBAQCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3N0bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CWRzaS0+ZHNpID0gZHdfbWlwaV9kc2lfcHJvYmUocGRldiwgJmR3X21pcGlfZHNpX3N0bV9wbGF0
X2RhdGEpOwogCWlmIChJU19FUlIoZHNpLT5kc2kpKSB7CiAJCURSTV9FUlJPUigiRmFpbGVkIHRv
IGluaXRpYWxpemUgbWlwaSBkc2kgaG9zdFxuIik7Ci0JCWNsa19kaXNhYmxlX3VucHJlcGFyZShk
c2ktPnBsbHJlZl9jbGspOwotCQlyZXR1cm4gUFRSX0VSUihkc2ktPmRzaSk7CisJCXJldCA9IFBU
Ul9FUlIoZHNpLT5kc2kpOworCQlnb3RvIGVycl9kc2lfcHJvYmU7CiAJfQogCiAJcmV0dXJuIDA7
CisKK2Vycl9kc2lfcHJvYmU6CisJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+cGxscmVmX2Ns
ayk7CitlcnJfY2xrX2dldDoKKwlyZWd1bGF0b3JfZGlzYWJsZShkc2ktPnZkZF9zdXBwbHkpOwor
CisJcmV0dXJuIHJldDsKKwogfQogCiBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3N0bV9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKQEAgLTM1MSw2ICszNzUsNyBAQCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3N0bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAlzdHJ1Y3QgZHdfbWlwaV9kc2lfc3RtICpkc2kgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShkc2ktPnBsbHJlZl9jbGspOworCXJlZ3VsYXRv
cl9kaXNhYmxlKGRzaS0+dmRkX3N1cHBseSk7CiAJZHdfbWlwaV9kc2lfcmVtb3ZlKGRzaS0+ZHNp
KTsKIAogCXJldHVybiAwOwpAQCAtMzYzLDYgKzM4OCw3IEBAIHN0YXRpYyBpbnQgX19tYXliZV91
bnVzZWQgZHdfbWlwaV9kc2lfc3RtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCURSTV9E
RUJVR19EUklWRVIoIlxuIik7CiAKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHNpLT5wbGxyZWZf
Y2xrKTsKKwlyZWd1bGF0b3JfZGlzYWJsZShkc2ktPnZkZF9zdXBwbHkpOwogCiAJcmV0dXJuIDA7
CiB9CkBAIC0zNzAsOSArMzk2LDE2IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdfbWlw
aV9kc2lfc3RtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogc3RhdGljIGludCBfX21heWJl
X3VudXNlZCBkd19taXBpX2RzaV9zdG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlz
dHJ1Y3QgZHdfbWlwaV9kc2lfc3RtICpkc2kgPSBkd19taXBpX2RzaV9zdG1fcGxhdF9kYXRhLnBy
aXZfZGF0YTsKKwlpbnQgcmV0OwogCiAJRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKIAorCXJldCA9
IHJlZ3VsYXRvcl9lbmFibGUoZHNpLT52ZGRfc3VwcGx5KTsKKwlpZiAocmV0KSB7CisJCURSTV9F
UlJPUigiZmFpbGVkIHRvIGVuYWJsZSByZWd1bGF0b3I6ICVkXG4iLCByZXQpOworCQlyZXR1cm4g
cmV0OworCX0KKwogCWNsa19wcmVwYXJlX2VuYWJsZShkc2ktPnBsbHJlZl9jbGspOwogCiAJcmV0
dXJuIDA7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
