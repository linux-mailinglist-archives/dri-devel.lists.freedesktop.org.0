Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF6A9B6E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0A789E8C;
	Thu,  5 Sep 2019 07:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 951 seconds by postgrey-1.36 at gabe;
 Wed, 04 Sep 2019 12:10:54 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C96898BF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:10:54 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1C68646AB9A51F46E78D;
 Wed,  4 Sep 2019 19:55:01 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 19:54:52 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <b.zolnierkie@samsung.com>, <tglx@linutronix.de>,
 <alexios.zavras@intel.com>, <gregkh@linuxfoundation.org>,
 <allison@lohutok.net>, <yuehaibing@huawei.com>
Subject: [PATCH -next] fbdev: omapfb: use devm_platform_ioremap_resource() to
 simplify code
Date: Wed, 4 Sep 2019 19:54:06 +0800
Message-ID: <20190904115406.23880-1-yuehaibing@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNpbXBsaWZ5IHRoZSBjb2Rl
IGEgYml0LgpUaGlzIGlzIGRldGVjdGVkIGJ5IGNvY2NpbmVsbGUuCgpSZXBvcnRlZC1ieTogSHVs
ayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBm
Yi92cmZiLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi92
cmZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi92cmZiLmMKaW5kZXggODE5
ZTBiYy4uZWUwZGQ0YyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFw
ZmIvdnJmYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL3ZyZmIuYwpA
QCAtMzM5LDkgKzMzOSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHZyZmJfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAlpbnQgaTsKIAogCS8qIGZpcnN0IHJlc291cmNlIGlzIHRo
ZSByZWdpc3RlciByZXMsIHRoZSByZXN0IGFyZSB2cmZiIGNvbnRleHRzICovCi0KLQltZW0gPSBw
bGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwotCXZyZmJfYmFz
ZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCBtZW0pOworCXZyZmJfYmFzZSA9
IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKIAlpZiAoSVNfRVJSKHZy
ZmJfYmFzZSkpCiAJCXJldHVybiBQVFJfRVJSKHZyZmJfYmFzZSk7CiAKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
