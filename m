Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24FB596D3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 11:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489206E8B9;
	Fri, 28 Jun 2019 09:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32F36E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 09:03:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C1BE87632;
 Fri, 28 Jun 2019 09:03:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05BC85D704;
 Fri, 28 Jun 2019 09:03:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ACDE49D7D; Fri, 28 Jun 2019 11:03:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 18/18] drm/ttm: drop ttm_buffer_object->resv
Date: Fri, 28 Jun 2019 11:03:03 +0200
Message-Id: <20190628090303.29467-19-kraxel@redhat.com>
In-Reply-To: <20190628090303.29467-1-kraxel@redhat.com>
References: <20190628090303.29467-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 28 Jun 2019 09:03:15 +0000 (UTC)
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
Cc: thomas@shipmail.org, tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 ckoenig.leichtzumerken@gmail.com, open list <linux-kernel@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, bskeggs@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsIHVzZXJzIG1vdmVkIHRvIHR0bV9idWZmZXJfb2JqZWN0LT5iYXNlLnJlc3YKClNpZ25lZC1v
ZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGluY2x1ZGUvZHJt
L3R0bS90dG1fYm9fYXBpLmggfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAy
IC0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKaW5k
ZXggN2ZmYzUwYTMzMDNkLi42NWVmNTM3NmRlNTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fYXBpLmgKKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaApAQCAtMjMw
LDcgKzIzMCw2IEBAIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCB7CiAKIAlzdHJ1Y3Qgc2dfdGFi
bGUgKnNnOwogCi0Jc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdjsKIAlzdHJ1Y3QgbXV0
ZXggd3VfbXV0ZXg7CiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBlMDc5MmZkMzhiNTQuLjc0
NjViZjYyZTU0YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMzMwLDExICsxMzMwLDkgQEAgaW50
IHR0bV9ib19pbml0X3Jlc2VydmVkKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCWJvLT5h
Y2Nfc2l6ZSA9IGFjY19zaXplOwogCWJvLT5zZyA9IHNnOwogCWlmIChyZXN2KSB7Ci0JCWJvLT5y
ZXN2ID0gcmVzdjsKIAkJYm8tPmJhc2UucmVzdiA9IHJlc3Y7CiAJCXJlc2VydmF0aW9uX29iamVj
dF9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKIAl9IGVsc2UgewotCQliby0+cmVzdiA9ICZi
by0+YmFzZS5fcmVzdjsKIAkJYm8tPmJhc2UucmVzdiA9ICZiby0+YmFzZS5fcmVzdjsKIAl9CiAJ
aWYgKCF0dG1fYm9fdXNlc19lbWJlZGRlZF9nZW1fb2JqZWN0KGJvKSkgewotLSAKMi4xOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
