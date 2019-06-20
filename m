Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2772F4C88E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2AE6E4F4;
	Thu, 20 Jun 2019 07:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C08B6E4F4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 07:44:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 097C330860CE;
 Thu, 20 Jun 2019 07:44:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AE7C5C2E4;
 Thu, 20 Jun 2019 07:44:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 572C617472; Thu, 20 Jun 2019 09:44:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/ttm: add gem base object
Date: Thu, 20 Jun 2019 09:44:19 +0200
Message-Id: <20190620074424.1677-2-kraxel@redhat.com>
In-Reply-To: <20190620074424.1677-1-kraxel@redhat.com>
References: <20190620074424.1677-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 20 Jun 2019 07:44:33 +0000 (UTC)
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
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRybV9nZW1fb2JqZWN0IHN0cnVjdCB0byB0dG1fYnVmZmVyX29iamVjdCwgc28gdHRtIG9i
amVjdHMgYXJlIGEgZ2RtCm9iamVjdCBzdXBlcmNsYXNzLiAgQWRkIGEgZnVuY3Rpb24gdG8gY2hl
Y2sgd2hlbmV2ZXIgYSBnaXZlbiBibyBhY3R1YWxseQp1c2VzIHRoZSBlbWJlZGRlZCBkcm1fZ2Vt
X29iamVjdCwgZm9yIHRoZSB0cmFuc2l0aW9uIHBlcmlvZC4KClNpZ25lZC1vZmYtYnk6IEdlcmQg
SG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9f
YXBpLmggfCAxOCArKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKaW5kZXggNDlkOWNkZmM1OGYyLi43MmY2YWVkYTYxOWMg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKKysrIGIvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19hcGkuaApAQCAtMzEsNiArMzEsNyBAQAogI2lmbmRlZiBfVFRNX0JPX0FQ
SV9IXwogI2RlZmluZSBfVFRNX0JPX0FQSV9IXwogCisjaW5jbHVkZSA8ZHJtL2RybV9nZW0uaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX2hhc2h0YWIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ZtYV9tYW5h
Z2VyLmg+CiAjaW5jbHVkZSA8bGludXgva3JlZi5oPgpAQCAtMTI3LDYgKzEyOCw3IEBAIHN0cnVj
dCB0dG1fdHQ7CiAvKioKICAqIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdAogICoKKyAqIEBiYXNl
OiBkcm1fZ2VtX29iamVjdCBzdXBlcmNsYXNzIGRhdGEuCiAgKiBAYmRldjogUG9pbnRlciB0byB0
aGUgYnVmZmVyIG9iamVjdCBkZXZpY2Ugc3RydWN0dXJlLgogICogQHR5cGU6IFRoZSBibyB0eXBl
LgogICogQGRlc3Ryb3k6IERlc3RydWN0aW9uIGZ1bmN0aW9uLiBJZiBOVUxMLCBrZnJlZSBpcyB1
c2VkLgpAQCAtMTY5LDYgKzE3MSw4IEBAIHN0cnVjdCB0dG1fdHQ7CiAgKi8KIAogc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0IHsKKwlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgYmFzZTsKKwogCS8qKgog
CSAqIE1lbWJlcnMgY29uc3RhbnQgYXQgaW5pdC4KIAkgKi8KQEAgLTc2OCw0ICs3NzIsMTggQEAg
aW50IHR0bV9ib19zd2Fwb3V0KHN0cnVjdCB0dG1fYm9fZ2xvYmFsICpnbG9iLAogCQkJc3RydWN0
IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpOwogdm9pZCB0dG1fYm9fc3dhcG91dF9hbGwoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYpOwogaW50IHR0bV9ib193YWl0X3VucmVzZXJ2ZWQoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7CisKKy8qKgorICogdHRtX2JvX3VzZXNfZW1iZWRkZWRf
Z2VtX29iamVjdCAtIGNoZWNrIGlmIHRoZSBnaXZlbiBibyB1c2VzIHRoZQorICogZW1iZWRkZWQg
ZHJtX2dlbV9vYmplY3QuCisgKgorICogSGVscGVyIGZvciB0aGUgdHJhbnNpdGlvbiBwZXJpb2Qs
IG9uY2UgYWxsIGRyaXZlcnMgYXJlIHN3aXRjaGVkIHRvCisgKiB1c2UgdGhlIGVtYmVkZGVkIGRy
bV9nZW1fb2JqZWN0IHRoaXMgY2FuIGdvIGF3YXkuCisgKgorICogQGJvOiBUaGUgYm8gdG8gY2hl
Y2suCisgKi8KK3N0YXRpYyBpbmxpbmUgYm9vbCB0dG1fYm9fdXNlc19lbWJlZGRlZF9nZW1fb2Jq
ZWN0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCit7CisJcmV0dXJuIGJvLT5iYXNlLmRl
diAhPSBOVUxMOworfQogI2VuZGlmCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
