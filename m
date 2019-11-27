Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6722A10AD7F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 11:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23CF6E4FB;
	Wed, 27 Nov 2019 10:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA1D6E4F4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:24:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARAMKPI028075; Wed, 27 Nov 2019 11:24:07 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2whcxsb0rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:24:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65C1110002A;
 Wed, 27 Nov 2019 11:24:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B85732B1216;
 Wed, 27 Nov 2019 11:24:06 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 27 Nov 2019 11:24:05 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: goodix: request_irq: convert gpio to irq
Date: Wed, 27 Nov 2019 11:24:05 +0100
Message-ID: <1574850245-13325-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=Bmi9ZxvHiIlWxe/sSml2LTtA26zSCPWx7oIRLedeHJE=;
 b=essqUBkxbMrrIuPbpzljeVkKukn47nmTXRvV9HLBD2v3JURaDG8dBcU17MDwF7T55mn2
 b6JllkFERRYnivQyKHDjbJVbVVGySsq5FOLd0Op0sBW2459+7cto8S1eLBwclSPmsMVM
 FZj8G4xjTtpAmI2diFvD61FuJfIeDPgeBoU8Lyx0fVz1wmbn5mBW+BoOwXeaccPS3Vns
 uwqCzwJ4wpws9WKcj+HEB1jy4dtc3OhD9jk5VUEmz5O4+lqrgWwlnFfT23QnYmWsGQj6
 eZcjhorvXJf921ohtHfc6gWkezI0bez9WVTfgkhlhl2pzYSsMrXt4lDboDNyTINnG+zR uA== 
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

RnJvbTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgpDb252ZXJ0IGdw
aW8gdG8gaXJxIGlmIG5vdCBhbHJlYWR5IGRvbmUgYnkgZ3BpbyBsaWIuCgpTaWduZWQtb2ZmLWJ5
OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlCi0tLQogZHJpdmVycy9pbnB1dC90b3Vj
aHNjcmVlbi9nb29kaXguYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jIGIv
ZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9nb29kaXguYwppbmRleCBiNDcwNzczLi5mMWQ5ZDVl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jCisrKyBiL2Ry
aXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4LmMKQEAgLTIzLDYgKzIzLDcgQEAKICNpbmNs
dWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2lycS5oPgogI2luY2x1ZGUgPGxp
bnV4L2ludGVycnVwdC5oPgorI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4KICNpbmNsdWRlIDxsaW51
eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVk
ZSA8bGludXgvYWNwaS5oPgpAQCAtMzkyLDYgKzM5MywxMyBAQCBzdGF0aWMgdm9pZCBnb29kaXhf
ZnJlZV9pcnEoc3RydWN0IGdvb2RpeF90c19kYXRhICp0cykKIAogc3RhdGljIGludCBnb29kaXhf
cmVxdWVzdF9pcnEoc3RydWN0IGdvb2RpeF90c19kYXRhICp0cykKIHsKKwlpbnQgZ3BpbzsKKwor
CWdwaW8gPSBkZXNjX3RvX2dwaW8odHMtPmdwaW9kX2ludCk7CisKKwlpZiAoZ3Bpb19pc192YWxp
ZChncGlvKSkKKwkJdHMtPmNsaWVudC0+aXJxID0gZ3Bpb190b19pcnEoZ3Bpbyk7CisKIAlyZXR1
cm4gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgmdHMtPmNsaWVudC0+ZGV2LCB0cy0+Y2xpZW50
LT5pcnEsCiAJCQkJCSBOVUxMLCBnb29kaXhfdHNfaXJxX2hhbmRsZXIsCiAJCQkJCSB0cy0+aXJx
X2ZsYWdzLCB0cy0+Y2xpZW50LT5uYW1lLCB0cyk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
