Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4937460270
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0306F6E443;
	Fri,  5 Jul 2019 08:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD5C8984C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 10:39:17 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6DD5577DDC701E995BDE;
 Thu,  4 Jul 2019 18:39:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 4 Jul 2019 18:39:06 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul
 <sean@poorly.run>
Subject: [PATCH -next] drm/i915: fix possible memory leak in
 intel_hdcp_auth_downstream()
Date: Thu, 4 Jul 2019 10:45:34 +0000
Message-ID: <20190704104534.12508-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
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
Cc: kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J2tzdl9maWZvJyBpcyBtYWxsb2NlZCBpbiBpbnRlbF9oZGNwX2F1dGhfZG93bnN0cmVhbSgpIGFu
ZCBzaG91bGQgYmUKZnJlZWQgYmVmb3JlIGxlYXZpbmcgZnJvbSB0aGUgZXJyb3IgaGFuZGxpbmcg
Y2FzZXMsIG90aGVyd2lzZSBpdCB3aWxsCmNhdXNlIG1lbW9yeSBsZWFrLgoKU2lnbmVkLW9mZi1i
eTogV2VpIFlvbmdqdW4gPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9oZGNwLmMKaW5kZXggYmMzYTk0ZDQ5MWM0Li4yN2JkNzI3NmE4MmQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jCkBAIC01MzYsNyArNTM2LDggQEAg
aW50IGludGVsX2hkY3BfYXV0aF9kb3duc3RyZWFtKHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNv
bm5lY3RvcikKIAogCWlmIChkcm1faGRjcF9jaGVja19rc3ZzX3Jldm9rZWQoZGV2LCBrc3ZfZmlm
bywgbnVtX2Rvd25zdHJlYW0pKSB7CiAJCURSTV9FUlJPUigiUmV2b2tlZCBLc3YocykgaW4ga3N2
X2ZpZm9cbiIpOwotCQlyZXR1cm4gLUVQRVJNOworCQlyZXQgPSAtRVBFUk07CisJCWdvdG8gZXJy
OwogCX0KIAogCS8qCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
