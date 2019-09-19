Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56D6B76FD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 12:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DFA6FB66;
	Thu, 19 Sep 2019 10:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880796FB3D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 10:02:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2297A811DE;
 Thu, 19 Sep 2019 10:02:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 382D960C80;
 Thu, 19 Sep 2019 10:02:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 02E549CAB; Thu, 19 Sep 2019 12:02:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/11] drm/vram: drop verify_access
Date: Thu, 19 Sep 2019 12:02:22 +0200
Message-Id: <20190919100223.13309-11-kraxel@redhat.com>
In-Reply-To: <20190919100223.13309-1-kraxel@redhat.com>
References: <20190919100223.13309-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 19 Sep 2019 10:02:31 +0000 (UTC)
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG5lZWRlZCBhbnkgbW9yZS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8IDIy
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwppbmRleCBiYzM3YzQ2NTE3NjYuLmJl
OGIwOWFjNTI4MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCkBAIC01NDAs
MTMgKzU0MCw2IEBAIHN0YXRpYyB2b2lkIGRybV9nZW1fdnJhbV9ib19kcml2ZXJfZXZpY3RfZmxh
Z3Moc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibywKIAkqcGwgPSBnYm8tPnBsYWNlbWVu
dDsKIH0KIAotc3RhdGljIGludCBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX3ZlcmlmeV9hY2Nlc3Mo
c3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibywKLQkJCQkJCXN0cnVjdCBmaWxlICpmaWxw
KQotewotCXJldHVybiBkcm1fdm1hX25vZGVfdmVyaWZ5X2FjY2VzcygmZ2JvLT5iby5iYXNlLnZt
YV9ub2RlLAotCQkJCQkgIGZpbHAtPnByaXZhdGVfZGF0YSk7Ci19Ci0KIHN0YXRpYyB2b2lkIGRy
bV9nZW1fdnJhbV9ib19kcml2ZXJfbW92ZV9ub3RpZnkoc3RydWN0IGRybV9nZW1fdnJhbV9vYmpl
Y3QgKmdibywKIAkJCQkJICAgICAgIGJvb2wgZXZpY3QsCiAJCQkJCSAgICAgICBzdHJ1Y3QgdHRt
X21lbV9yZWcgKm5ld19tZW0pCkBAIC04MTEsMjAgKzgwNCw2IEBAIHN0YXRpYyB2b2lkIGJvX2Ry
aXZlcl9ldmljdF9mbGFncyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCWRybV9nZW1f
dnJhbV9ib19kcml2ZXJfZXZpY3RfZmxhZ3MoZ2JvLCBwbGFjZW1lbnQpOwogfQogCi1zdGF0aWMg
aW50IGJvX2RyaXZlcl92ZXJpZnlfYWNjZXNzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
Ci0JCQkJICAgc3RydWN0IGZpbGUgKmZpbHApCi17Ci0Jc3RydWN0IGRybV9nZW1fdnJhbV9vYmpl
Y3QgKmdibzsKLQotCS8qIFRUTSBtYXkgcGFzcyBCT3MgdGhhdCBhcmUgbm90IEdFTSBWUkFNIEJP
cy4gKi8KLQlpZiAoIWRybV9pc19nZW1fdnJhbShibykpCi0JCXJldHVybiAtRUlOVkFMOwotCi0J
Z2JvID0gZHJtX2dlbV92cmFtX29mX2JvKGJvKTsKLQotCXJldHVybiBkcm1fZ2VtX3ZyYW1fYm9f
ZHJpdmVyX3ZlcmlmeV9hY2Nlc3MoZ2JvLCBmaWxwKTsKLX0KLQogc3RhdGljIHZvaWQgYm9fZHJp
dmVyX21vdmVfbm90aWZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCQkJICBib29s
IGV2aWN0LAogCQkJCSAgc3RydWN0IHR0bV9tZW1fcmVnICpuZXdfbWVtKQpAQCAtODgxLDcgKzg2
MCw2IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX2JvX2RyaXZlciBib19kcml2ZXIgPSB7CiAJLmluaXRf
bWVtX3R5cGUgPSBib19kcml2ZXJfaW5pdF9tZW1fdHlwZSwKIAkuZXZpY3Rpb25fdmFsdWFibGUg
PSB0dG1fYm9fZXZpY3Rpb25fdmFsdWFibGUsCiAJLmV2aWN0X2ZsYWdzID0gYm9fZHJpdmVyX2V2
aWN0X2ZsYWdzLAotCS52ZXJpZnlfYWNjZXNzID0gYm9fZHJpdmVyX3ZlcmlmeV9hY2Nlc3MsCiAJ
Lm1vdmVfbm90aWZ5ID0gYm9fZHJpdmVyX21vdmVfbm90aWZ5LAogCS5pb19tZW1fcmVzZXJ2ZSA9
IGJvX2RyaXZlcl9pb19tZW1fcmVzZXJ2ZSwKIAkuaW9fbWVtX2ZyZWUgPSBib19kcml2ZXJfaW9f
bWVtX2ZyZWUsCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
