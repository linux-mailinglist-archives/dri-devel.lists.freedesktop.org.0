Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAB84C88C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E1B6E3DB;
	Thu, 20 Jun 2019 07:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E270E6E3DB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 07:44:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 821FC30832D3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 07:44:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1068460A97;
 Thu, 20 Jun 2019 07:44:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 40EF216E19; Thu, 20 Jun 2019 09:44:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/ttm: make ttm bo a gem bo subclass
Date: Thu, 20 Jun 2019 09:44:18 +0200
Message-Id: <20190620074424.1677-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 20 Jun 2019 07:44:27 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpHZXJkIEhvZmZtYW5uICg2KToKICBkcm0vdHRtOiBhZGQgZ2VtIGJhc2Ugb2JqZWN0CiAgZHJt
L3ZyYW06IHVzZSBlbWJlZGRlZCBnZW0gb2JqZWN0CiAgZHJtL3F4bDogdXNlIGVtYmVkZGVkIGdl
bSBvYmplY3QKICBkcm0vdHRtOiB1c2UgZ2VtIHJlc2VydmF0aW9uIG9iamVjdAogIGRybS90dG06
IHVzZSBnZW0gdm1hX25vZGUKICBkcm0vdnJhbTogZHJvcCBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dl
bV9wcmltZV9tbWFwCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5o
IHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oICAgICAgICAgICAgICB8ICA2
ICstLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmggICAgICAgICAgIHwgIDYgKy0t
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaCAgICAgfCAgMiArLQogZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgICAgIHwgIDIgKy0KIGluY2x1ZGUv
ZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAgICAgICB8ICA3ICstLS0KIGluY2x1ZGUvZHJt
L3R0bS90dG1fYm9fYXBpLmggICAgICAgICAgICAgICB8IDI0ICsrKysrKysrLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jICAgICAgfCAzNiArKysrLS0tLS0tLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9jbWQuYyAgICAgICAgICAgICAgfCAgNCArLQogZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfZGVidWdmcy5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9xeGwvcXhsX2Rpc3BsYXkuYyAgICAgICAgICB8ICA4ICsrLS0KIGRyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX2dlbS5jICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9vYmplY3QuYyAgICAgICAgICAgfCAyMCArKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX3JlbGVhc2UuYyAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF90dG0uYyAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYyAgICAgICAgICAgICAgIHwgNDggKysrKysrKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3ZtLmMgICAgICAgICAgICB8ICA5ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9wcmltZS5jICAgICB8ICAzIC0tCiAxOSBmaWxlcyBjaGFuZ2VkLCA5NCBp
bnNlcnRpb25zKCspLCA5NyBkZWxldGlvbnMoLSkKCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
