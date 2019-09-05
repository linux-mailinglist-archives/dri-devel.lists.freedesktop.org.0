Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46559A9B1F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD2089DA7;
	Thu,  5 Sep 2019 07:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51582894DC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 07:05:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E561910F23E3;
 Thu,  5 Sep 2019 07:05:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 211D960BE1;
 Thu,  5 Sep 2019 07:05:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6832231EEC; Thu,  5 Sep 2019 09:05:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/vram: switch to gem vma offset manager
Date: Thu,  5 Sep 2019 09:05:04 +0200
Message-Id: <20190905070509.22407-4-kraxel@redhat.com>
In-Reply-To: <20190905070509.22407-1-kraxel@redhat.com>
References: <20190905070509.22407-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 05 Sep 2019 07:05:14 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFzcyBnZW0gdm1hX29mZnNldF9tYW5hZ2VyIHRvIHR0bV9ib19kZXZpY2VfaW5pdCgpLCBzbyB0
dG0gdXNlcyBpdAppbnN0ZWFkIG9mIGl0cyBvd24gZW1iZWRkZWQgc3RydWN0LiAgVGhpcyBtYWtl
cyBzb21lIGdlbSBmdW5jdGlvbnMKKHNwZWNpZmljYWxseSBkcm1fZ2VtX29iamVjdF9sb29rdXAp
IHdvcmsgb24gdHRtIG9iamVjdHMuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMKaW5kZXggNTZmZDE1MTllYjM1Li4zYjI1NTJi
ZWM0ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMKQEAgLTE3Miw3ICsxNzIs
NyBAQCBpbnQgZHJtX3ZyYW1fbW1faW5pdChzdHJ1Y3QgZHJtX3ZyYW1fbW0gKnZtbSwgc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKIAogCXJldCA9IHR0bV9ib19kZXZpY2VfaW5pdCgmdm1tLT5iZGV2
LCAmYm9fZHJpdmVyLAogCQkJCSBkZXYtPmFub25faW5vZGUtPmlfbWFwcGluZywKLQkJCQkgTlVM
TCwKKwkJCQkgZGV2LT52bWFfb2Zmc2V0X21hbmFnZXIsCiAJCQkJIHRydWUpOwogCWlmIChyZXQp
CiAJCXJldHVybiByZXQ7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
