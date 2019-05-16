Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95E20A4B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DC589718;
	Thu, 16 May 2019 14:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0A68916B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:55:56 +0000 (UTC)
Received: from localhost.localdomain
 (aaubervilliers-681-1-43-46.w90-88.abo.wanadoo.fr [90.88.161.46])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8CB75200018;
 Thu, 16 May 2019 14:55:54 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/4] drm/vc4: Check for V3D before binner bo alloc
Date: Thu, 16 May 2019 16:55:42 +0200
Message-Id: <20190516145544.29051-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516145544.29051-1-paul.kocialkowski@bootlin.com>
References: <20190516145544.29051-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
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
 Eben Upton <eben@raspberrypi.org>, David Airlie <airlied@linux.ie>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hlY2sgdGhhdCB3ZSBoYXZlIGEgVjNEIGRldmljZSByZWdpc3RlcmVkIGJlZm9yZSBhdHRlbXB0
aW5nIHRvCmFsbG9jYXRlIGEgYmlubmVyIGJ1ZmZlciBvYmplY3QuCgpTaWduZWQtb2ZmLWJ5OiBQ
YXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+ClJldmlld2Vk
LWJ5OiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92
YzQvdmM0X3YzZC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF92M2QuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92YzQvdmM0X3YzZC5jCmluZGV4IDdjNDkwMTA2ZTE4NS4uYzE2ZGI0NjY1YWY2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF92M2QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF92M2QuYwpAQCAtMjQxLDYgKzI0MSw5IEBAIHN0YXRpYyBpbnQgYmluX2JvX2FsbG9j
KHN0cnVjdCB2YzRfZGV2ICp2YzQpCiAJaW50IHJldCA9IDA7CiAJc3RydWN0IGxpc3RfaGVhZCBs
aXN0OwogCisJaWYgKCF2M2QpCisJCXJldHVybiAtRU5PREVWOworCiAJLyogV2UgbWF5IG5lZWQg
dG8gdHJ5IGFsbG9jYXRpbmcgbW9yZSB0aGFuIG9uY2UgdG8gZ2V0IGEgQk8KIAkgKiB0aGF0IGRv
ZXNuJ3QgY3Jvc3MgMjU2TUIuICBUcmFjayB0aGUgb25lcyB3ZSd2ZSBhbGxvY2F0ZWQKIAkgKiB0
aGF0IGZhaWxlZCBzbyBmYXIsIHNvIHRoYXQgd2UgY2FuIGZyZWUgdGhlbSB3aGVuIHdlJ3ZlIGdv
dAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
