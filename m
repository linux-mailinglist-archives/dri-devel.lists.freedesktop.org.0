Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E845C66
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7614897EE;
	Fri, 14 Jun 2019 12:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179EA897EB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:14:04 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A9B7E40007;
 Fri, 14 Jun 2019 12:14:01 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 08/12] drm/connector: Introduce a TV margins structure
Date: Fri, 14 Jun 2019 14:13:15 +0200
Message-Id: <06f9c2fdbca44d9c04a0420cc78265c83ccd0d41.1560514379.git-series.maxime.ripard@bootlin.com>
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

VGhlIFRWIG1hcmdpbnMgaGFzIGJlZW4gZGVmaW5lZCBhcyBhIHN0cnVjdHVyZSBpbnNpZGUgdGhl
CmRybV9jb25uZWN0b3Jfc3RhdGUgc3RydWN0dXJlIHNvIGZhci4gSG93ZXZlciwgd2Ugd2lsbCBu
ZWVkIGl0IGluIG90aGVyCnN0cnVjdHVyZXMgYXMgd2VsbCwgc28gbGV0J3MgbW92ZSB0aGF0IHN0
cnVjdHVyZSBkZWZpbml0aW9uIHNvIHRoYXQgaXQgY2FuCmJlIHJldXNlZC4KClNpZ25lZC1vZmYt
Ynk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogaW5jbHVk
ZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9kcm0vZHJt
X2Nvbm5lY3Rvci5oCmluZGV4IDY4YTA0MTY5ZWEzNi4uYzU4YTM1YjM0YzFhIDEwMDY0NAotLS0g
YS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5l
Y3Rvci5oCkBAIC00NjQsMTMgKzQ2NCwzNyBAQCBpbnQgZHJtX2Rpc3BsYXlfaW5mb19zZXRfYnVz
X2Zvcm1hdHMoc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm8sCiAJCQkJICAgICB1bnNpZ25l
ZCBpbnQgbnVtX2Zvcm1hdHMpOwogCiAvKioKKyAqIHN0cnVjdCBkcm1fY29ubmVjdG9yX3R2X21h
cmdpbnMgLSBUViBjb25uZWN0b3IgcmVsYXRlZCBtYXJnaW5zCisgKgorICogRGVzY3JpYmVzIHRo
ZSBtYXJnaW5zIGluIHBpeGVscyB0byBwdXQgYXJvdW5kIHRoZSBpbWFnZSBvbiBUVgorICogY29u
bmVjdG9ycyB0byBkZWFsIHdpdGggb3ZlcnNjYW4uCisgKi8KK3N0cnVjdCBkcm1fY29ubmVjdG9y
X3R2X21hcmdpbnMgeworCS8qKgorCSAqIEBib3R0b206IEJvdHRvbSBtYXJnaW4gaW4gcGl4ZWxz
LgorCSAqLworCXVuc2lnbmVkIGludCBib3R0b207CisKKwkvKioKKwkgKiBAbGVmdDogTGVmdCBt
YXJnaW4gaW4gcGl4ZWxzLgorCSAqLworCXVuc2lnbmVkIGludCBsZWZ0OworCisJLyoqCisJICog
QHJpZ2h0OiBSaWdodCBtYXJnaW4gaW4gcGl4ZWxzLgorCSAqLworCXVuc2lnbmVkIGludCByaWdo
dDsKKworCS8qKgorCSAqIEB0b3A6IFRvcCBtYXJnaW4gaW4gcGl4ZWxzLgorCSAqLworCXVuc2ln
bmVkIGludCB0b3A7Cit9OworCisvKioKICAqIHN0cnVjdCBkcm1fdHZfY29ubmVjdG9yX3N0YXRl
IC0gVFYgY29ubmVjdG9yIHJlbGF0ZWQgc3RhdGVzCiAgKiBAc3ViY29ubmVjdG9yOiBzZWxlY3Rl
ZCBzdWJjb25uZWN0b3IKLSAqIEBtYXJnaW5zOiBtYXJnaW5zIChhbGwgbWFyZ2lucyBhcmUgZXhw
cmVzc2VkIGluIHBpeGVscykKLSAqIEBtYXJnaW5zLmxlZnQ6IGxlZnQgbWFyZ2luCi0gKiBAbWFy
Z2lucy5yaWdodDogcmlnaHQgbWFyZ2luCi0gKiBAbWFyZ2lucy50b3A6IHRvcCBtYXJnaW4KLSAq
IEBtYXJnaW5zLmJvdHRvbTogYm90dG9tIG1hcmdpbgorICogQG1hcmdpbnM6IFRWIG1hcmdpbnMK
ICAqIEBtb2RlOiBUViBtb2RlCiAgKiBAYnJpZ2h0bmVzczogYnJpZ2h0bmVzcyBpbiBwZXJjZW50
CiAgKiBAY29udHJhc3Q6IGNvbnRyYXN0IGluIHBlcmNlbnQKLS0gCmdpdC1zZXJpZXMgMC45LjEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
