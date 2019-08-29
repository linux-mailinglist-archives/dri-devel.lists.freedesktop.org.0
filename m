Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1BDA1612
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775E76E0A6;
	Thu, 29 Aug 2019 10:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DFF6E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:33:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A9E3B18C4271;
 Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C57771001944;
 Thu, 29 Aug 2019 10:33:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 12F6631E7F; Thu, 29 Aug 2019 12:33:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 01/18] drm/virtio: pass gem reservation object to ttm init
Date: Thu, 29 Aug 2019 12:32:44 +0200
Message-Id: <20190829103301.3539-2-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGlzIGdlbSBhbmQgdHRtIHdpbGwgdXNlIHRoZSBzYW1lIHJlc2VydmF0aW9uIG9iamVj
dCwKc28gbWl4aW5nIGFuZCBtYXRjaGluZyB0dG0gLyBnZW0gcmVzZXJ2YXRpb24gaGVscGVycyBz
aG91bGQKd29yayBmaW5lLgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIGIvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCmluZGV4IGFiMzNiNjUxNjdmNi4uZWI0ZDQy
ZjlkMWQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCkBAIC0xMzgs
NyArMTM4LDggQEAgaW50IHZpcnRpb19ncHVfb2JqZWN0X2NyZWF0ZShzdHJ1Y3QgdmlydGlvX2dw
dV9kZXZpY2UgKnZnZGV2LAogCXZpcnRpb19ncHVfaW5pdF90dG1fcGxhY2VtZW50KGJvKTsKIAly
ZXQgPSB0dG1fYm9faW5pdCgmdmdkZXYtPm1tYW4uYmRldiwgJmJvLT50Ym8sIHBhcmFtcy0+c2l6
ZSwKIAkJCSAgdHRtX2JvX3R5cGVfZGV2aWNlLCAmYm8tPnBsYWNlbWVudCwgMCwKLQkJCSAgdHJ1
ZSwgYWNjX3NpemUsIE5VTEwsIE5VTEwsCisJCQkgIHRydWUsIGFjY19zaXplLCBOVUxMLAorCQkJ
ICBiby0+Z2VtX2Jhc2UucmVzdiwKIAkJCSAgJnZpcnRpb19ncHVfdHRtX2JvX2Rlc3Ryb3kpOwog
CS8qIHR0bV9ib19pbml0IGZhaWx1cmUgd2lsbCBjYWxsIHRoZSBkZXN0cm95ICovCiAJaWYgKHJl
dCAhPSAwKQotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
