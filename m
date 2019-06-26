Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A2562C0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 08:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39646E299;
	Wed, 26 Jun 2019 06:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D16E6E299
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 06:55:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D0AFE3082140;
 Wed, 26 Jun 2019 06:55:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46D241001B11;
 Wed, 26 Jun 2019 06:55:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7D42E16E18; Wed, 26 Jun 2019 08:55:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/bochs: fix framebuffer setup.
Date: Wed, 26 Jun 2019 08:55:49 +0200
Message-Id: <20190626065551.12956-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 26 Jun 2019 06:55:55 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYm8tPndpZHRoIGRvZXNuJ3QgbWF0Y2ggZmItPndpZHRoIHRoZSBkcml2ZXIgZmFpbHMgdG8g
Y29uZmlndXJlCnRoZSBkaXNwbGF5IGNvcnJlY3RseSwgcmVzdWx0aW5nIGluIGEgc2NyYW1ibGVk
IGRpc3BsYXkuCgpUaGlzIGxpdHRsZSBzZXJpZXMgaGFzIGEgcGF0Y2ggZm9yIHZyYW0sIHRvIHN0
b3JlIGJvLT53aWR0aCAoMS8yKSwKYW5kIHRoZSBhY3R1YWwgYnVnZml4ICgyLzIpLiAgVGhlIG90
aGVyIGRyaXZlcnMgdXNpbmcgdGhlIHZyYW0gaGVscGVycwphcmUgcHJvYmFibHkgYWZmZWN0ZWQg
dG9vLgoKUmVwcm9kdWNlcjogUnVuIGdub21lLXNoZWxsIGluIHdheWxhbmQgbW9kZS4gIEl0J2xs
IHJvdW5kIHVwIHRoZSBibwpkaW1lbnNpb25zIHRvIGEgbXVsdGlwbGUgb2YgNjQgKGZvciB0aWxp
bmcgSSBndWVzcykuICBTb21ld2hhdCBvZGQKZGlzcGxheSByZXNvbHV0aW9ucyB3aWxsIHJlcHJv
ZHVjZSB0aGUgYnVnLiAgRXhhbXBsZTogIEFuIDgwMHg2MDAKZnJhbWVidWZmZXIgd2lsbCB1c2Ug
YW4gODMyeDY0MCBiby4KCkdlcmQgSG9mZm1hbm4gKDIpOgogIGRybS92cmFtOiBzdG9yZSBkdW1i
IGJvIGRpbWVuc2lvbnMuCiAgZHJtL2JvY2hzOiBmaXggZnJhbWVidWZmZXIgc2V0dXAuCgogZHJp
dmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmggICAgICAgICB8ICAyICstCiBpbmNsdWRlL2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmggICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2Jv
Y2hzX2h3LmMgICAgICB8IDEzICsrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9i
b2Noc19rbXMuYyAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5jIHwgIDIgKysKIDUgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
