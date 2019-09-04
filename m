Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E3A9B60
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667AB89E05;
	Thu,  5 Sep 2019 07:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CCE8937C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:26:43 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4A74BF3FA70A6108B030;
 Wed,  4 Sep 2019 20:26:42 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 20:26:33 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <linux@prisktech.co.nz>, <b.zolnierkie@samsung.com>
Subject: [PATCH -next] fbdev: wm8505fb: use devm_platform_ioremap_resource()
 to simplify code
Date: Wed, 4 Sep 2019 20:01:32 +0800
Message-ID: <20190904120132.25524-1-yuehaibing@huawei.com>
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
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNpbXBsaWZ5IHRoZSBjb2Rl
IGEgYml0LgpUaGlzIGlzIGRldGVjdGVkIGJ5IGNvY2NpbmVsbGUuCgpSZXBvcnRlZC1ieTogSHVs
ayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3dtODUwNWZiLmMg
fCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3dtODUwNWZiLmMgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3dtODUwNWZiLmMKaW5kZXggMTdjNzgwMy4uMzUxZDI3YiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi93bTg1MDVmYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
d204NTA1ZmIuYwpAQCAtMjYxLDcgKzI2MSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZmJfb3BzIHdtODUw
NWZiX29wcyA9IHsKIHN0YXRpYyBpbnQgd204NTA1ZmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgd204NTA1ZmJfaW5mbwkqZmJpOwotCXN0cnVjdCByZXNv
dXJjZQkqcmVzOwogCXN0cnVjdCBkaXNwbGF5X3RpbWluZ3MgKmRpc3BfdGltaW5nOwogCXZvaWQJ
CQkqYWRkcjsKIAlpbnQgcmV0OwpAQCAtMjk5LDggKzI5OCw3IEBAIHN0YXRpYyBpbnQgd204NTA1
ZmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlhZGRyID0gYWRkciArIHNp
emVvZihzdHJ1Y3Qgd204NTA1ZmJfaW5mbyk7CiAJZmJpLT5mYi5wc2V1ZG9fcGFsZXR0ZQk9IGFk
ZHI7CiAKLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0s
IDApOwotCWZiaS0+cmVnYmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCBy
ZXMpOworCWZiaS0+cmVnYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2
LCAwKTsKIAlpZiAoSVNfRVJSKGZiaS0+cmVnYmFzZSkpCiAJCXJldHVybiBQVFJfRVJSKGZiaS0+
cmVnYmFzZSk7CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
