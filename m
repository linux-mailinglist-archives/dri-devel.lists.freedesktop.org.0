Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46EA9B69
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E81489E15;
	Thu,  5 Sep 2019 07:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E78899F0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:00:04 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2676FB443D939C8DA4D7;
 Wed,  4 Sep 2019 20:00:03 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 19:59:54 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <b.zolnierkie@samsung.com>, <maarten.lankhorst@linux.intel.com>,
 <daniel.vetter@ffwll.ch>, <viresh.kumar@linaro.org>,
 <rafael.j.wysocki@intel.com>, <yuehaibing@huawei.com>
Subject: [PATCH -next] fbdev/sa1100fb: use devm_platform_ioremap_resource() to
 simplify code
Date: Wed, 4 Sep 2019 19:57:54 +0800
Message-ID: <20190904115754.21612-1-yuehaibing@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNpbXBsaWZ5IHRoZSBjb2Rl
IGEgYml0LgpUaGlzIGlzIGRldGVjdGVkIGJ5IGNvY2NpbmVsbGUuCgpSZXBvcnRlZC1ieTogSHVs
ayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMg
fCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3NhMTEwMGZiLmMKaW5kZXggYWUyYmNmZS4uNDQyOGNlZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi9zYTExMDBmYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
c2ExMTAwZmIuYwpAQCAtMTE1Niw3ICsxMTU2LDYgQEAgc3RhdGljIHN0cnVjdCBzYTExMDBmYl9p
bmZvICpzYTExMDBmYl9pbml0X2ZiaW5mbyhzdHJ1Y3QgZGV2aWNlICpkZXYpCiBzdGF0aWMgaW50
IHNhMTEwMGZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IHNhMTEwMGZiX2luZm8gKmZiaTsKLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAlpbnQgcmV0LCBp
cnE7CiAKIAlpZiAoIWRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldikpIHsKQEAgLTExNzIsOCAr
MTE3MSw3IEBAIHN0YXRpYyBpbnQgc2ExMTAwZmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAlpZiAoIWZiaSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlyZXMgPSBwbGF0Zm9y
bV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwotCWZiaS0+YmFzZSA9IGRl
dm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOworCWZiaS0+YmFzZSA9IGRldm1f
cGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKIAlpZiAoSVNfRVJSKGZiaS0+YmFz
ZSkpCiAJCXJldHVybiBQVFJfRVJSKGZiaS0+YmFzZSk7CiAKLS0gCjIuNy40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
