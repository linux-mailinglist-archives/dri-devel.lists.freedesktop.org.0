Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF79410AD6F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 11:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED8789263;
	Wed, 27 Nov 2019 10:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E635892F6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:22:54 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARAM3r3006174; Wed, 27 Nov 2019 11:22:51 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxj2xh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:22:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF3FB10002A;
 Wed, 27 Nov 2019 11:22:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 199782B1211;
 Wed, 27 Nov 2019 11:22:51 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 27 Nov 2019 11:22:50 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/bridge/synopsys: dsi: check post disable
Date: Wed, 27 Nov 2019 11:22:45 +0100
Message-ID: <1574850165-13135-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=DGAu8nBd8sSn0yVexjpoA/8nuPadx0SdCFMZkuAqTjI=;
 b=ygulLg2e5rLFuUd584h0vuVZhD+RKemgd493AWF3vztp/dF30AIlPn83ICzuODlilTxU
 68GX8ZqJt66704So7IBm4ukcmBA8GkDdLslHejaaqixJcgaRkjF4QV4GlSuEqvIBc29i
 mJXPz/6TRQqMtI9NOvyTIFIZVOTr3E1MxaRbvXKanIGnsjB2vYegAlDIYVe95fUGzwTH
 TIa7QobmHTOohdnwiXst1FjfyPY0PnoyjiRDohKzq/ZdTHdjt1LGIJ7puffGWhwdB21A
 jueEyE2x/gECpq6uTHG6hwTYfZLyQ6ePA6pSWlnSMDu3aBgDsku+AvNgXJ3yDN+V2OmP JA== 
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

RnJvbTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgpTb21lIGJyaWRn
ZXMgZGlkIG5vdCByZWdpc3RlcmVkIHRoZSBwb3N0X2Rpc2FibGUgZnVuY3Rpb24uClRvIGF2b2lk
IGEgY3Jhc2gsIGNoZWNrIGl0IGJlZm9yZSBjYWxsaW5nLgoKU2lnbmVkLW9mZi1ieTogWWFubmlj
ayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctbWlwaS1kc2kuYwppbmRleCBjYzgwNmJhLi4xZTM3MjMzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCkBAIC04ODYsNyArODg2LDgg
QEAgc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfYnJpZGdlX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJt
X2JyaWRnZSAqYnJpZGdlKQogCSAqIFRoaXMgbmVlZHMgdG8gYmUgZml4ZWQgaW4gdGhlIGRybV9i
cmlkZ2UgZnJhbWV3b3JrIGFuZCB0aGUgQVBJCiAJICogbmVlZHMgdG8gYmUgdXBkYXRlZCB0byBt
YW5hZ2Ugb3VyIG93biBjYWxsIGNoYWlucy4uLgogCSAqLwotCWRzaS0+cGFuZWxfYnJpZGdlLT5m
dW5jcy0+cG9zdF9kaXNhYmxlKGRzaS0+cGFuZWxfYnJpZGdlKTsKKwlpZiAoZHNpLT5wYW5lbF9i
cmlkZ2UtPmZ1bmNzLT5wb3N0X2Rpc2FibGUpCisJCWRzaS0+cGFuZWxfYnJpZGdlLT5mdW5jcy0+
cG9zdF9kaXNhYmxlKGRzaS0+cGFuZWxfYnJpZGdlKTsKIAogCWlmIChkc2ktPnNsYXZlKSB7CiAJ
CWR3X21pcGlfZHNpX2Rpc2FibGUoZHNpLT5zbGF2ZSk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
