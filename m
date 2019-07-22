Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8B2704FA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFC289CD5;
	Mon, 22 Jul 2019 16:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6259989CD5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:06:22 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MG65hm016172; Mon, 22 Jul 2019 18:06:05 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ture1chdq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 18:06:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2982631;
 Mon, 22 Jul 2019 16:06:02 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C274452BB;
 Mon, 22 Jul 2019 16:06:02 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul
 2019 18:06:02 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 18:06:02
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <alexandre.torgue@st.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <olivier.moysan@st.com>,
 <jsarha@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/3] drm/bridge: sii902x: fix audio mclk management
Date: Mon, 22 Jul 2019 18:05:57 +0200
Message-ID: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_12:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=tUyFF2dLFUND6HSCHRKN4a+J8+L0QNOSCuz5edjnQdI=;
 b=pVx177ZLmPbDmrPaz6AKQXlRGdiOL2ctfNMtl4BiexOt4zilvs7BIDxCJ9Je/mc5xavj
 YVcLd1nqYnoce0RRHqe4bwpGRxaQ30NyAg9OFc0Nk+GJuDYmREeeH3amg70dt/5zK1R8
 p6trXidCt/SvztRTcJUI/nq6reKG2KUcMIyepuX5jO85rOaG/4EdaDYQ6VYzo1XgVwkG
 PGRyU0QnYt1s0d56InkKqqHXUuOS0xKUBL74Fb0gI5xaNm0X746TGeXN9ItMycjjKq+8
 rM4tVMBhw+PK/MCGYq7g2lsDOZmZ8t2zQLnhoDsGUPbipQ4xBE5NlQLoK4Slx4HvspAv 1A== 
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

Rml4IGF1ZGlvIG1hc3RlciBjbG9jayB1c2UgZm9yIFNpbGFiIHNpaTkwMnggSERNSSB0cmFuc2Nl
aXZlci4KTWFrZSBhdWRpbyBtYXN0ZXIgY2xvY2sgb3B0aW9uYWwsIGFzIHRoaXMgY2xvY2sgaXMg
bm90IG1hbmRhdG9yeS4KCkNoYW5nZXMgaW4gdjI6Ci0gUmVseSBvbiBjbGsgZnJhbWV3b3JrIHRv
IG1hbmFnZSB1bmRlZmluZWQgbWNsayBjYXNlLgotIFVzZSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwg
aW5zdGVhZCBvZiBkZXZtX2Nsa19nZXQuCgpPbGl2aWVyIE1veXNhbiAoMyk6CiAgZHJtL2JyaWRn
ZTogc2lpOTAyeDogZml4IG1pc3NpbmcgcmVmZXJlbmNlIHRvIG1jbGsgY2xvY2sKICBkdC1iaW5k
aW5nczogZGlzcGxheTogc2lpOTAyeDogQ2hhbmdlIGF1ZGlvIG1jbGsgYmluZGluZwogIGRybS9i
cmlkZ2U6IHNpaTkwMng6IG1ha2UgYXVkaW8gbWNsayBvcHRpb25hbAoKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0ICAgICB8ICA1ICsrLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyAgICAgICAgICAgICAgICAgICAgICAgfCAxOCAr
KysrKysrKysrLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
