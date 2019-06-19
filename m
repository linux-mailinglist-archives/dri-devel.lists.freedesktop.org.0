Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B34B47F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30F36E323;
	Wed, 19 Jun 2019 09:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911ED6E31A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:04:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3AD35307C94B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:04:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-86.ams2.redhat.com
 [10.36.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBC4560FAB;
 Wed, 19 Jun 2019 09:04:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C456A16E05; Wed, 19 Jun 2019 11:04:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/12] drm/virtio: switch from ttm to gem shmem helpers.
Date: Wed, 19 Jun 2019 11:04:08 +0200
Message-Id: <20190619090420.6667-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 19 Jun 2019 09:04:24 +0000 (UTC)
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

dHRtIGluY3JlYXNpbmdseSBnZXRzIGludG8gdGhlIHdheSB3aGlsZSBoYWNraW5nIG9uIHZpcnRp
by1ncHUgbWVtb3J5Cm1hbmFnZW1lbnQuICBJdCBhbHNvIG92ZXJraWxsIGZvciB3aGF0IHZpcnRp
by1ncHUgbmVlZHMuICBMZXRzIGdldCByaWQKb2YgaXQuCgp2MzoKIC0gYWRkIGdlbSBhcnJheSBo
ZWxwZXJzLgogLSByZXdvcmsgZmVuY2luZy4KCmNoZWVycywKICBHZXJkCgpHZXJkIEhvZmZtYW5u
ICgxMik6CiAgZHJtOiBhZGQgZ2VtIGFycmF5IGhlbHBlcnMKICBkcm0vdmlydGlvOiBwYXNzIGdl
bSByZXNlcnZhdGlvbiBvYmplY3QgdG8gdHRtIGluaXQKICBkcm0vdmlydGlvOiBzd2l0Y2ggdmly
dGlvX2dwdV93YWl0X2lvY3RsKCkgdG8gZ2VtIGhlbHBlci4KICBkcm0vdmlydGlvOiBzaW1wbGlm
eSBjdXJzb3IgdXBkYXRlcwogIGRybS92aXJ0aW86IHJlbW92ZSB2aXJ0aW9fZ3B1X29iamVjdF93
YWl0CiAgZHJtL3ZpcnRpbzogZHJvcCBub193YWl0IGFyZ3VtZW50IGZyb20gdmlydGlvX2dwdV9v
YmplY3RfcmVzZXJ2ZQogIGRybS92aXJ0aW86IHJlbW92ZSB0dG0gY2FsbHMgZnJvbSBpbgogICAg
dmlydGlvX2dwdV9vYmplY3Rfe3Jlc2VydmUsdW5yZXNlcnZlfQogIGRybS92aXJ0aW86IHJld29y
ayB2aXJ0aW9fZ3B1X2V4ZWNidWZmZXJfaW9jdGwgZmVuY2luZwogIGRybS92aXJ0aW86IHJld29y
ayB2aXJ0aW9fZ3B1X29iamVjdF9jcmVhdGUgZmVuY2luZwogIGRybS92aXJ0aW86IGRyb3Agdmly
dGlvX2dwdV9vYmplY3RfbGlzdF92YWxpZGF0ZS92aXJ0aW9fZ3B1X3VucmVmX2xpc3QKICBkcm0v
dmlydGlvOiBzd2l0Y2ggZnJvbSB0dG0gdG8gZ2VtIHNobWVtIGhlbHBlcnMKICBkcm0vdmlydGlv
OiByZW1vdmUgdmlydGlvX2dwdV9hbGxvY19vYmplY3QKCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfZHJ2LmggICAgfCAgNzcgKystLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtX2FycmF5
X2hlbHBlci5oICAgICAgfCAgMTUgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2FycmF5X2hl
bHBlci5jICB8ICA3OCArKysrKysKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYu
YyAgICB8ICAyMCArLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dlbS5jICAgIHwg
IDQzICstLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jICB8IDE1NCAr
KysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYyAgICB8ICAg
OSAtCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgfCAyMTAgKysrKyst
LS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMgIHwgIDEz
ICstCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJpbWUuYyAgfCAgMzcgLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdHRtLmMgICAgfCAzMDQgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyAgICAgfCAg
NDggKysrLQogZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAzICst
CiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL0tjb25maWcgICAgICAgICAgfCAgIDIgKy0KIGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vTWFrZWZpbGUgICAgICAgICB8ICAgMiArLQogMTUgZmlsZXMgY2hh
bmdlZCwgMjcyIGluc2VydGlvbnMoKyksIDc0MyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBpbmNsdWRlL2RybS9kcm1fZ2VtX2FycmF5X2hlbHBlci5oCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fYXJyYXlfaGVscGVyLmMKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdHRtLmMKCi0tIAoyLjE4LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
