Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA133F9D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC44B8961E;
	Tue,  4 Jun 2019 07:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218E689298
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:31:31 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 2/3] drm: Add bus flag for Sharp-specific signals
Date: Mon,  3 Jun 2019 17:31:19 +0200
Message-Id: <20190603153120.23947-2-paul@crapouillou.net>
In-Reply-To: <20190603153120.23947-1-paul@crapouillou.net>
References: <20190603153120.23947-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559575889; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCRtvN6bDnPOtOpR9F9ADHP2LKTTl3otOLpu3pQeu+A=;
 b=ktxaZJIAidgdHSgYp+cBaMNV4v9rUFSErAAMlKgHDebwaDqRMIpGq/QBgbQNLqEEx26BVA
 6cUkMT4y95ODpQeKAyRWT8p7h5qWbunEhBzK+IhKwcJhqT0xYj5T8B5s3mSN9OFt/OjrY6
 dUhmCsd+VN7OUfmIzdMjTaWyLRRK8uA=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBEUk1fQlVTX0ZMQUdfU0hBUlBfU0lHTkFMUyB0byB0aGUgZHJtX2J1c19mbGFncyBl
bnVtLgoKVGhpcyBmbGFncyBjYW4gYmUgdXNlZCB3aGVuIHRoZSBkaXNwbGF5IG11c3QgYmUgZHJp
dmVuIHdpdGggdGhlClNoYXJwLXNwZWNpZmljIHNpZ25hbHMgU1BMLCBDTFMsIFJFViwgUFMuCgpT
aWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KLS0tCgpO
b3RlczoKICAgIHYzOiBOZXcgcGF0Y2gKICAgIAogICAgdjQ6IFJlYmFzZSBvbiBkcm0tbWlzYy1u
ZXh0IChiMjMyZDRlZDkyZWEpCgogaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIHwgMyArKysK
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKaW5kZXggNTQ3
NjU2MTczYzc0Li41ODYxMzY3ZjczMzkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKQEAgLTMyMyw2ICszMjMs
OCBAQCBlbnVtIGRybV9wYW5lbF9vcmllbnRhdGlvbiB7CiAgKgkJCQkJZWRnZSBvZiB0aGUgcGl4
ZWwgY2xvY2sKICAqIEBEUk1fQlVTX0ZMQUdfU1lOQ19TQU1QTEVfTkVHRURHRToJU3luYyBzaWdu
YWxzIGFyZSBzYW1wbGVkIG9uIHRoZSBmYWxsaW5nCiAgKgkJCQkJZWRnZSBvZiB0aGUgcGl4ZWwg
Y2xvY2sKKyAqIEBEUk1fQlVTX0ZMQUdfU0hBUlBfU0lHTkFMUzoJCVNldCBpZiB0aGUgU2hhcnAt
c3BlY2lmaWMgc2lnbmFscworICoJCQkJCShTUEwsIENMUywgUFMsIFJFVikgbXVzdCBiZSB1c2Vk
CiAgKi8KIGVudW0gZHJtX2J1c19mbGFncyB7CiAJRFJNX0JVU19GTEFHX0RFX0xPVyA9IEJJVCgw
KSwKQEAgLTM0MSw2ICszNDMsNyBAQCBlbnVtIGRybV9idXNfZmxhZ3MgewogCURSTV9CVVNfRkxB
R19TWU5DX0RSSVZFX05FR0VER0UgPSBEUk1fQlVTX0ZMQUdfU1lOQ19ORUdFREdFLAogCURSTV9C
VVNfRkxBR19TWU5DX1NBTVBMRV9QT1NFREdFID0gRFJNX0JVU19GTEFHX1NZTkNfTkVHRURHRSwK
IAlEUk1fQlVTX0ZMQUdfU1lOQ19TQU1QTEVfTkVHRURHRSA9IERSTV9CVVNfRkxBR19TWU5DX1BP
U0VER0UsCisJRFJNX0JVU19GTEFHX1NIQVJQX1NJR05BTFMgPSBCSVQoOCksCiB9OwogCiAvKioK
LS0gCjIuMjEuMC41OTMuZzUxMWVjMzQ1ZTE4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
