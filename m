Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1A29EE05
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 15:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04F66ECE0;
	Thu, 29 Oct 2020 14:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D1E6ECC5;
 Thu, 29 Oct 2020 14:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 8654AFB05;
 Thu, 29 Oct 2020 15:20:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CkkmBXdQo8oH; Thu, 29 Oct 2020 15:20:57 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 4486C44636; Thu, 29 Oct 2020 15:20:57 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/2] drm: etnaviv: Add lockdep annotations for context lock
Date: Thu, 29 Oct 2020 15:20:56 +0100
Message-Id: <7a0ea85eb081033b96a4a4fe2f0c013cca1dab9e.1603981111.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1603981111.git.agx@sigxcpu.org>
References: <cover.1603981111.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZXRuYXZpdl9pb21tdV9maW5kX2lvdmEgaGFzIGl0IHNvIGV0bmF2aXZfaW9tbXVfaW5zZXJ0X2V4
YWN0IGFuZApsb2NrZGVwX2Fzc2VydF9oZWxkIHNob3VsZCBoYXZlIGl0IGFzIHdlbGwuCgpTaWdu
ZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUuYwppbmRleCAz
NjA3ZDM0OGMyOTguLmNkNTk5YWMwNDY2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9tbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2
X21tdS5jCkBAIC0xMzEsNiArMTMxLDggQEAgc3RhdGljIHZvaWQgZXRuYXZpdl9pb21tdV9yZW1v
dmVfbWFwcGluZyhzdHJ1Y3QgZXRuYXZpdl9pb21tdV9jb250ZXh0ICpjb250ZXh0LAogewogCXN0
cnVjdCBldG5hdml2X2dlbV9vYmplY3QgKmV0bmF2aXZfb2JqID0gbWFwcGluZy0+b2JqZWN0Owog
CisJbG9ja2RlcF9hc3NlcnRfaGVsZCgmY29udGV4dC0+bG9jayk7CisKIAlldG5hdml2X2lvbW11
X3VubWFwKGNvbnRleHQsIG1hcHBpbmctPnZyYW1fbm9kZS5zdGFydCwKIAkJCSAgICBldG5hdml2
X29iai0+c2d0LCBldG5hdml2X29iai0+YmFzZS5zaXplKTsKIAlkcm1fbW1fcmVtb3ZlX25vZGUo
Jm1hcHBpbmctPnZyYW1fbm9kZSk7CkBAIC0yMjMsNiArMjI1LDggQEAgc3RhdGljIGludCBldG5h
dml2X2lvbW11X2ZpbmRfaW92YShzdHJ1Y3QgZXRuYXZpdl9pb21tdV9jb250ZXh0ICpjb250ZXh0
LAogc3RhdGljIGludCBldG5hdml2X2lvbW11X2luc2VydF9leGFjdChzdHJ1Y3QgZXRuYXZpdl9p
b21tdV9jb250ZXh0ICpjb250ZXh0LAogCQkgICBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUsIHNp
emVfdCBzaXplLCB1NjQgdmEpCiB7CisJbG9ja2RlcF9hc3NlcnRfaGVsZCgmY29udGV4dC0+bG9j
ayk7CisKIAlyZXR1cm4gZHJtX21tX2luc2VydF9ub2RlX2luX3JhbmdlKCZjb250ZXh0LT5tbSwg
bm9kZSwgc2l6ZSwgMCwgMCwgdmEsCiAJCQkJCSAgIHZhICsgc2l6ZSwgRFJNX01NX0lOU0VSVF9M
T1dFU1QpOwogfQotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
