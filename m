Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE8A9B51
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A4F89DBC;
	Thu,  5 Sep 2019 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B395F89BF4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:57:19 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E7F8989353DA47D25456;
 Wed,  4 Sep 2019 19:57:15 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 19:57:06 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jingoohan1@gmail.com>, <b.zolnierkie@samsung.com>
Subject: [PATCH -next] fbdev: s3c-fb: use devm_platform_ioremap_resource() to
 simplify code
Date: Wed, 4 Sep 2019 19:55:23 +0800
Message-ID: <20190904115523.25068-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
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
Cc: linux-fbdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNpbXBsaWZ5IHRoZSBjb2Rl
IGEgYml0LgpUaGlzIGlzIGRldGVjdGVkIGJ5IGNvY2NpbmVsbGUuCgpSZXBvcnRlZC1ieTogSHVs
ayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1mYi5jIHwg
MyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1mYi5jIGIvZHJpdmVycy92aWRlby9m
YmRldi9zM2MtZmIuYwppbmRleCBiYTA0ZDdhLi40M2FjOGQ3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3MzYy1mYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvczNjLWZiLmMK
QEAgLTE0MTEsOCArMTQxMSw3IEBAIHN0YXRpYyBpbnQgczNjX2ZiX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlwbV9ydW50aW1lX2VuYWJsZShzZmItPmRldik7CiAKLQly
ZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwotCXNm
Yi0+cmVncyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7CisJc2ZiLT5yZWdzID0g
ZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwogCWlmIChJU19FUlIoc2Zi
LT5yZWdzKSkgewogCQlyZXQgPSBQVFJfRVJSKHNmYi0+cmVncyk7CiAJCWdvdG8gZXJyX2xjZF9j
bGs7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
