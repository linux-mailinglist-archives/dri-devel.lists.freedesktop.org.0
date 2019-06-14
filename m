Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C072645C60
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A3D897D4;
	Fri, 14 Jun 2019 12:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46F0897C3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:13:55 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5E24DC001E;
 Fri, 14 Jun 2019 12:13:52 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 09/12] drm/atomic: Add a function to reset connector TV
 properties
Date: Fri, 14 Jun 2019 14:13:16 +0200
Message-Id: <da8097de4e52e677933707eddcf202ba89790876.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHVyaW5nIHRoZSBjb25uZWN0b3IgcmVzZXQsIGlmIHRoYXQgY29ubmVjdG9yIGhhcyBhIFRWIHBy
b3BlcnR5LCBpdCBuZWVkcwp0byBiZSByZXNldCB0byB0aGUgdmFsdWUgcHJvdmlkZWQgb24gdGhl
IGNvbW1hbmQgbGluZS4KClByb3ZpZGUgYSBoZWxwZXIgdG8gZG8gdGhhdC4KClNpZ25lZC1vZmYt
Ynk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMgfCAxOCArKysrKysrKysrKysrKysr
KysKIGluY2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmggICAgIHwgIDEgKwogMiBm
aWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y19zdGF0ZV9oZWxwZXIuYwppbmRleCA5N2FiMjY2NzliOTYuLmY0ZjBhZGE5YzE1MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMKQEAgLTM3Niw2ICszNzYsMjQg
QEAgdm9pZCBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvcikKIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19oZWxwZXJfY29ubmVj
dG9yX3Jlc2V0KTsKIAogLyoqCisgKiBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfdHZfcmVz
ZXQgLSBSZXNldHMgVFYgY29ubmVjdG9yIHByb3BlcnRpZXMKKyAqIEBjb25uZWN0b3I6IERSTSBj
b25uZWN0b3IKKyAqCisgKiBSZXNldHMgdGhlIFRWLXJlbGF0ZWQgcHJvcGVydGllcyBhdHRhY2hl
ZCB0byBhIGNvbm5lY3Rvci4KKyAqLwordm9pZCBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3Jf
dHZfcmVzZXQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKK3sKKwlzdHJ1Y3QgZHJt
X2NtZGxpbmVfbW9kZSAqY21kbGluZSA9ICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZTsKKwlzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqc3RhdGUgPSBjb25uZWN0b3ItPnN0YXRlOworCisJc3Rh
dGUtPnR2Lm1hcmdpbnMubGVmdCA9IGNtZGxpbmUtPnR2X21hcmdpbnMubGVmdDsKKwlzdGF0ZS0+
dHYubWFyZ2lucy5yaWdodCA9IGNtZGxpbmUtPnR2X21hcmdpbnMucmlnaHQ7CisJc3RhdGUtPnR2
Lm1hcmdpbnMudG9wID0gY21kbGluZS0+dHZfbWFyZ2lucy50b3A7CisJc3RhdGUtPnR2Lm1hcmdp
bnMuYm90dG9tID0gY21kbGluZS0+dHZfbWFyZ2lucy5ib3R0b207Cit9CitFWFBPUlRfU1lNQk9M
KGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9yZXNldCk7CisKKy8qKgogICogX19kcm1f
YXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZHVwbGljYXRlX3N0YXRlIC0gY29weSBhdG9taWMgY29u
bmVjdG9yIHN0YXRlCiAgKiBAY29ubmVjdG9yOiBjb25uZWN0b3Igb2JqZWN0CiAgKiBAc3RhdGU6
IGF0b21pYyBjb25uZWN0b3Igc3RhdGUKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9hdG9t
aWNfc3RhdGVfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5o
CmluZGV4IDRlNmQyZTdhNDBiOC4uZTQ1NzdjYzExNjg5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWNf
c3RhdGVfaGVscGVyLmgKQEAgLTYyLDYgKzYyLDcgQEAgdm9pZCBkcm1fYXRvbWljX2hlbHBlcl9w
bGFuZV9kZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogdm9pZCBfX2RybV9h
dG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLAogCQkJCQkgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpOwogdm9p
ZCBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3Rvcik7Cit2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9yZXNldChz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsKIHZvaWQKIF9fZHJtX2F0b21pY19oZWxw
ZXJfY29ubmVjdG9yX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLAogCQkJCQkgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqc3RhdGUpOwotLSAKZ2l0
LXNlcmllcyAwLjkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
