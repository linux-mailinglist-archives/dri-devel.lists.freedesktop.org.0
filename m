Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B38101AE0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937086EBC7;
	Tue, 19 Nov 2019 08:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241F289CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:27:32 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8333D21CBF6EEC815726;
 Mon, 18 Nov 2019 20:27:29 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:27:21 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/5] drm/sun4i: Use PTR_ERR_OR_ZERO() to simplify code in
 sun4i_tmds_create
Date: Mon, 18 Nov 2019 20:34:41 +0800
Message-ID: <1574080484-48744-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574080484-48744-1-git-send-email-zhengbin13@huawei.com>
References: <1574080484-48744-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hk
bWlfdG1kc19jbGsuYzoyMzI6MS0zOiBXQVJOSU5HOiBQVFJfRVJSX09SX1pFUk8gY2FuIGJlIHVz
ZWQKClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9m
Zi1ieTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuNGlfaGRtaV90bWRzX2Nsay5jIHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW40aV9oZG1pX3RtZHNfY2xrLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfaGRtaV90bWRzX2Nsay5jCmluZGV4IGZiZjdkYTkuLmM5MGRkMGEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pX3RtZHNfY2xrLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfdG1kc19jbGsuYwpAQCAtMjI5LDggKzIyOSw1IEBA
IGludCBzdW40aV90bWRzX2NyZWF0ZShzdHJ1Y3Qgc3VuNGlfaGRtaSAqaGRtaSkKIAl0bWRzLT5k
aXZfb2Zmc2V0ID0gaGRtaS0+dmFyaWFudC0+dG1kc19jbGtfZGl2X29mZnNldDsKCiAJaGRtaS0+
dG1kc19jbGsgPSBkZXZtX2Nsa19yZWdpc3RlcihoZG1pLT5kZXYsICZ0bWRzLT5odyk7Ci0JaWYg
KElTX0VSUihoZG1pLT50bWRzX2NsaykpCi0JCXJldHVybiBQVFJfRVJSKGhkbWktPnRtZHNfY2xr
KTsKLQotCXJldHVybiAwOworCXJldHVybiBQVFJfRVJSX09SX1pFUk8oaGRtaS0+dG1kc19jbGsp
OwogfQotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
