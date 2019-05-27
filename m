Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE082B204
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 12:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2DC89885;
	Mon, 27 May 2019 10:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89EF89861
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 10:21:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RAGcSf031336; Mon, 27 May 2019 12:21:49 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sptu9jjhj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 12:21:49 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C31B531;
 Mon, 27 May 2019 10:21:48 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 89C692805;
 Mon, 27 May 2019 10:21:48 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May
 2019 12:21:48 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May 2019 12:21:48
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>,
 Yannick Fertre <yannick.fertre@st.com>, Nickey
 Yang <nickey.yang@rock-chips.com>, Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou
 <vincent.abriou@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] drm/stm: dsi: add power on/off phy ops
Date: Mon, 27 May 2019 12:21:39 +0200
Message-ID: <1558952499-15418-3-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
References: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=wps+SDKyn14/sTW3Eret7RKWvrgnINJUAp0gJ+ptxDk=;
 b=gvnKygsUyE2/7zsLmyK3byjlXUl15AlFFGnZXXay4/tht9zRv0eFUjQgboXgGkVkG6Ju
 h6ku6Z4gIaLCcqeKKfwVIPusDk/0Oy3k+890b3+4a4eN6K/7Wa9E6UX937/Jk0ASBT28
 GIsazNr4pqEgE5PqEB56/cMIKYtdOV2AP+YzakDwVLsDTBBc0d1tmcSwc43jyCFgGZ45
 UuyhgsE9EvSEnT6EvTr4+zJYzQl6Z1n2kVnBN4V/LMmptiT7oARZ9K6focryReCaPmPt
 GNzKaHf/PobBU0uG+2eq0wsvL/C9U6wYA74KR82gQQe4LI8RRhCOwuLAjD1kKNDzKcD1 uQ== 
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

VGhlc2UgbmV3IHBoeXNpY2FsIG9wZXJhdGlvbnMgYXJlIGhlbHBmdWwgdG8gcG93ZXJfb24vb2Zm
IHRoZSBkc2kKd3JhcHBlci4gSWYgdGhlIGRzaSB3cmFwcGVyIGlzIHBvd2VyZWQgaW4gdmlkZW8g
bW9kZSwgdGhlIGRpc3BsYXkKY29udHJvbGxlciAobHRkYykgcmVnaXN0ZXIgYWNjZXNzIHdpbGwg
aGFuZyB3aGVuIERTSSBmaWZvcyBhcmUgZnVsbC4KClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVy
dHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdf
bWlwaV9kc2ktc3RtLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlw
aV9kc2ktc3RtLmMKaW5kZXggMDFkYjAyMC4uMGFiMzJmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3
X21pcGlfZHNpLXN0bS5jCkBAIC0yMTAsMTAgKzIxMCwyNyBAQCBzdGF0aWMgaW50IGR3X21pcGlf
ZHNpX3BoeV9pbml0KHZvaWQgKnByaXZfZGF0YSkKIAlpZiAocmV0KQogCQlEUk1fREVCVUdfRFJJ
VkVSKCIhVElNRU9VVCEgd2FpdGluZyBQTEwsIGxldCdzIGNvbnRpbnVlXG4iKTsKIAorCXJldHVy
biAwOworfQorCitzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9waHlfcG93ZXJfb24odm9pZCAqcHJp
dl9kYXRhKQoreworCXN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaSA9IHByaXZfZGF0YTsKKwor
CURSTV9ERUJVR19EUklWRVIoIlxuIik7CisKIAkvKiBFbmFibGUgdGhlIERTSSB3cmFwcGVyICov
CiAJZHNpX3NldChkc2ksIERTSV9XQ1IsIFdDUl9EU0lFTik7Cit9CiAKLQlyZXR1cm4gMDsKK3N0
YXRpYyB2b2lkIGR3X21pcGlfZHNpX3BoeV9wb3dlcl9vZmYodm9pZCAqcHJpdl9kYXRhKQorewor
CXN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaSA9IHByaXZfZGF0YTsKKworCURSTV9ERUJVR19E
UklWRVIoIlxuIik7CisKKwkvKiBEaXNhYmxlIHRoZSBEU0kgd3JhcHBlciAqLworCWRzaV9jbGVh
cihkc2ksIERTSV9XQ1IsIFdDUl9EU0lFTik7CiB9CiAKIHN0YXRpYyBpbnQKQEAgLTI4Nyw2ICsz
MDQsOCBAQCBkd19taXBpX2RzaV9nZXRfbGFuZV9tYnBzKHZvaWQgKnByaXZfZGF0YSwgY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdf
bWlwaV9kc2lfcGh5X29wcyBkd19taXBpX2RzaV9zdG1fcGh5X29wcyA9IHsKIAkuaW5pdCA9IGR3
X21pcGlfZHNpX3BoeV9pbml0LAorCS5wb3dlcl9vbiA9IGR3X21pcGlfZHNpX3BoeV9wb3dlcl9v
biwKKwkucG93ZXJfb2ZmID0gZHdfbWlwaV9kc2lfcGh5X3Bvd2VyX29mZiwKIAkuZ2V0X2xhbmVf
bWJwcyA9IGR3X21pcGlfZHNpX2dldF9sYW5lX21icHMsCiB9OwogCi0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
