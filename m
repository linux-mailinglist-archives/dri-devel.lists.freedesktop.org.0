Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F4E23B2E7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D5E6E39B;
	Tue,  4 Aug 2020 02:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABC86E39C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-uuBt2vecOwmLBzQXjoKXVQ-1; Mon, 03 Aug 2020 22:57:05 -0400
X-MC-Unique: uuBt2vecOwmLBzQXjoKXVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58225100CD03;
 Tue,  4 Aug 2020 02:57:04 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE5BC90E68;
 Tue,  4 Aug 2020 02:57:02 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/59] drm/nouveau/ttm: don't fill in blank ttm debug callback
Date: Tue,  4 Aug 2020 12:55:42 +1000
Message-Id: <20200804025632.3868079-10-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmUg
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV90dG0uYyB8IDkgLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwppbmRleCBiMDAxMjAyMWFlMTIu
LjZkZTc2MmEwYzIyOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jCkBAIC00
OSwxMiArNDksNiBAQCBub3V2ZWF1X21hbmFnZXJfZGVsKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFu
YWdlciAqbWFuLCBzdHJ1Y3QgdHRtX21lbV9yZWcgKnJlZykKIAlub3V2ZWF1X21lbV9kZWwocmVn
KTsKIH0KIAotc3RhdGljIHZvaWQKLW5vdXZlYXVfbWFuYWdlcl9kZWJ1ZyhzdHJ1Y3QgdHRtX21l
bV90eXBlX21hbmFnZXIgKm1hbiwKLQkJICAgICAgc3RydWN0IGRybV9wcmludGVyICpwcmludGVy
KQotewotfQotCiBzdGF0aWMgaW50CiBub3V2ZWF1X3ZyYW1fbWFuYWdlcl9uZXcoc3RydWN0IHR0
bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCiAJCQkgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKQEAgLTg2LDcgKzgwLDYgQEAgY29uc3Qgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2Z1
bmMgbm91dmVhdV92cmFtX21hbmFnZXIgPSB7CiAJLnRha2Vkb3duID0gbm91dmVhdV9tYW5hZ2Vy
X2ZpbmksCiAJLmdldF9ub2RlID0gbm91dmVhdV92cmFtX21hbmFnZXJfbmV3LAogCS5wdXRfbm9k
ZSA9IG5vdXZlYXVfbWFuYWdlcl9kZWwsCi0JLmRlYnVnID0gbm91dmVhdV9tYW5hZ2VyX2RlYnVn
LAogfTsKIAogc3RhdGljIGludApAQCAtMTEyLDcgKzEwNSw2IEBAIGNvbnN0IHN0cnVjdCB0dG1f
bWVtX3R5cGVfbWFuYWdlcl9mdW5jIG5vdXZlYXVfZ2FydF9tYW5hZ2VyID0gewogCS50YWtlZG93
biA9IG5vdXZlYXVfbWFuYWdlcl9maW5pLAogCS5nZXRfbm9kZSA9IG5vdXZlYXVfZ2FydF9tYW5h
Z2VyX25ldywKIAkucHV0X25vZGUgPSBub3V2ZWF1X21hbmFnZXJfZGVsLAotCS5kZWJ1ZyA9IG5v
dXZlYXVfbWFuYWdlcl9kZWJ1ZwogfTsKIAogc3RhdGljIGludApAQCAtMTQ3LDcgKzEzOSw2IEBA
IGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIG52MDRfZ2FydF9tYW5hZ2Vy
ID0gewogCS50YWtlZG93biA9IG5vdXZlYXVfbWFuYWdlcl9maW5pLAogCS5nZXRfbm9kZSA9IG52
MDRfZ2FydF9tYW5hZ2VyX25ldywKIAkucHV0X25vZGUgPSBub3V2ZWF1X21hbmFnZXJfZGVsLAot
CS5kZWJ1ZyA9IG5vdXZlYXVfbWFuYWdlcl9kZWJ1ZwogfTsKIAogaW50Ci0tIAoyLjI2LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
