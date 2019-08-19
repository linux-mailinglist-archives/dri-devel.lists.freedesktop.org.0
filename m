Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F26969211D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C608C89BF6;
	Mon, 19 Aug 2019 10:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02866E095
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 06:13:48 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B9C35382D04232DAEC32;
 Mon, 19 Aug 2019 14:13:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Mon, 19 Aug 2019 14:13:34 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/etnaviv: fix missing unlock on error in
 etnaviv_iommuv1_context_alloc()
Date: Mon, 19 Aug 2019 06:17:33 +0000
Message-ID: <20190819061733.50023-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
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
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBtaXNzaW5nIHVubG9jayBiZWZvcmUgcmV0dXJuIGZyb20gZnVuY3Rpb24gZXRuYXZp
dl9pb21tdXYxX2NvbnRleHRfYWxsb2MoKQppbiB0aGUgZXJyb3IgaGFuZGxpbmcgY2FzZS4KCkZp
eGVzOiAyN2I2NzI3OGUwMDcgKCJkcm0vZXRuYXZpdjogcmV3b3JrIE1NVSBoYW5kbGluZyIpClNp
Z25lZC1vZmYtYnk6IFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuYyB8IDQgKysrLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfaW9tbXUuYwppbmRleCBhYWM4ZGJmM2VhNTYuLjFhN2M4OWE2N2JlYSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9pb21tdS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuYwpAQCAtMTQwLDggKzE0MCwxMCBA
QCBldG5hdml2X2lvbW11djFfY29udGV4dF9hbGxvYyhzdHJ1Y3QgZXRuYXZpdl9pb21tdV9nbG9i
YWwgKmdsb2JhbCkKIAl9CiAKIAl2MV9jb250ZXh0ID0ga3phbGxvYyhzaXplb2YoKnYxX2NvbnRl
eHQpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXYxX2NvbnRleHQpCisJaWYgKCF2MV9jb250ZXh0KSB7
CisJCW11dGV4X3VubG9jaygmZ2xvYmFsLT5sb2NrKTsKIAkJcmV0dXJuIE5VTEw7CisJfQogCiAJ
djFfY29udGV4dC0+cGd0YWJsZV9jcHUgPSBkbWFfYWxsb2Nfd2MoZ2xvYmFsLT5kZXYsIFBUX1NJ
WkUsCiAJCQkJCSAgICAgICAmdjFfY29udGV4dC0+cGd0YWJsZV9kbWEsCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
