Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8CD5DF43
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 10:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83608903B;
	Wed,  3 Jul 2019 08:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15418903B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 08:04:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x637rQ6P011005; Wed, 3 Jul 2019 10:04:19 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdw4a28d7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 03 Jul 2019 10:04:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0858641;
 Wed,  3 Jul 2019 08:04:15 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA7E0169F;
 Wed,  3 Jul 2019 08:04:15 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 3 Jul 2019
 10:04:15 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 3 Jul 2019 10:04:14
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <alexandre.torgue@st.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <olivier.moysan@st.com>,
 <jsarha@ti.com>
Subject: [PATCH] drm/bridge: sii902x: add audio graph card support
Date: Wed, 3 Jul 2019 10:04:12 +0200
Message-ID: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_02:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Me2aIVtHkOwy84/SxLI2Xnts7qdQwbxVRhp1y4JNm4U=;
 b=xszA75fYJmgBnFtufF/fyMNT8ZY1A4LbSlEKstxr/xjye2iA6Hm+/HSoVN5izM6WFILS
 Fl690awtgTlr3w7LOAlH0Nt6/VDHHIZhyJQ3ICqlhhRjhnttP0dRV+OxNYmu+1avUHRY
 yHxolqUTOGod5kvDpxoYE6qrMnTwGYnk1jnypkgP1bFOiJqW8gxZADRSwSRBNStFteup
 QQPNg0N9J7J1DmGe4sITKKibHagNPzfX0n/E7y9c/iyPLMQNiogQ1QEhS24XPidLgE/X
 b7wPl7nKOj2vjB0g3kKUXOURArS5DX4OXQMu5xQTulab/e6J76r+MElhnp6rbKagEQTW nQ== 
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

SW1wbGVtZW50IGdldF9kYWlfaWQgY2FsbGJhY2sgb2YgYXVkaW8gSERNSSBjb2RlYwp0byBzdXBw
b3J0IEFTb0MgYXVkaW8gZ3JhcGggY2FyZC4KSERNSSBhdWRpbyBvdXRwdXQgaGFzIHRvIGJlIGNv
bm5lY3RlZCB0byBzaWk5MDJ4IHBvcnQgMy4KZ2V0X2RhaV9pZCBjYWxsYmFjayBtYXBzIHRoaXMg
cG9ydCB0byBBU29DIERBSSBpbmRleCAwLgoKU2lnbmVkLW9mZi1ieTogT2xpdmllciBNb3lzYW4g
PG9saXZpZXIubW95c2FuQHN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkw
MnguYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5j
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKaW5kZXggZGQ3YWE0NjZiMjgwLi5k
YWY5ZWYzY2Q4MTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCkBAIC0xNTgsNiArMTU4LDgg
QEAKIAogI2RlZmluZSBTSUk5MDJYX0kyQ19CVVNfQUNRVUlTSVRJT05fVElNRU9VVF9NUwk1MDAK
IAorI2RlZmluZSBTSUk5MDJYX0FVRElPX1BPUlRfSU5ERVgJCTMKKwogc3RydWN0IHNpaTkwMngg
ewogCXN0cnVjdCBpMmNfY2xpZW50ICppMmM7CiAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwpAQCAt
NjkwLDExICs2OTIsMzIgQEAgc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2dldF9lbGQoc3RydWN0
IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IHNp
aTkwMnhfYXVkaW9fZ2V0X2RhaV9pZChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVu
dCwKKwkJCQkgICAgc3RydWN0IGRldmljZV9ub2RlICplbmRwb2ludCkKK3sKKwlzdHJ1Y3Qgb2Zf
ZW5kcG9pbnQgb2ZfZXA7CisJaW50IHJldDsKKworCXJldCA9IG9mX2dyYXBoX3BhcnNlX2VuZHBv
aW50KGVuZHBvaW50LCAmb2ZfZXApOworCWlmIChyZXQgPCAwKQorCQlyZXR1cm4gcmV0OworCisJ
LyoKKwkgKiBIRE1JIHNvdW5kIHNob3VsZCBiZSBsb2NhdGVkIGF0IHJlZyA9IDwzPgorCSAqIFJl
dHVybiBleHBlY3RlZCBEQUkgaW5kZXggMC4KKwkgKi8KKwlpZiAob2ZfZXAucG9ydCA9PSBTSUk5
MDJYX0FVRElPX1BPUlRfSU5ERVgpCisJCXJldHVybiAwOworCisJcmV0dXJuIC1FSU5WQUw7Cit9
CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRtaV9jb2RlY19vcHMgc2lpOTAyeF9hdWRpb19jb2Rl
Y19vcHMgPSB7CiAJLmh3X3BhcmFtcyA9IHNpaTkwMnhfYXVkaW9faHdfcGFyYW1zLAogCS5hdWRp
b19zaHV0ZG93biA9IHNpaTkwMnhfYXVkaW9fc2h1dGRvd24sCiAJLmRpZ2l0YWxfbXV0ZSA9IHNp
aTkwMnhfYXVkaW9fZGlnaXRhbF9tdXRlLAogCS5nZXRfZWxkID0gc2lpOTAyeF9hdWRpb19nZXRf
ZWxkLAorCS5nZXRfZGFpX2lkID0gc2lpOTAyeF9hdWRpb19nZXRfZGFpX2lkLAogfTsKIAogc3Rh
dGljIGludCBzaWk5MDJ4X2F1ZGlvX2NvZGVjX2luaXQoc3RydWN0IHNpaTkwMnggKnNpaTkwMngs
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
