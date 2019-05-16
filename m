Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23D20A43
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836E7891CB;
	Thu, 16 May 2019 14:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04F88915A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:55:55 +0000 (UTC)
Received: from localhost.localdomain
 (aaubervilliers-681-1-43-46.w90-88.abo.wanadoo.fr [90.88.161.46])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C8D2E200017;
 Thu, 16 May 2019 14:55:50 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/4] drm/vc4: Binner BO management improvements
Date: Thu, 16 May 2019 16:55:40 +0200
Message-Id: <20190516145544.29051-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
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

Q2hhbmdlcyBzaW52ZSB2ODoKKiBBZGRlZCBjb2xsZWN0ZWQgUmV2aWV3ZWQtYnk7CiogRml4ZWQg
dXAgYW5vdGhlciBwcm9ibGVtYXRpYyBjYXNlIGFzIGRpc2N1c3NlZCBvbiB2OC4KCkNoYW5nZXMg
c2luY2Ugdjc6CiogTW92ZWQgdGhlIHVzZWQgYm9vbCB0byB2YzRfdjNkX2Jpbl9ib19nZXQgaW4g
b3JkZXIgdG8gY2hlY2sgaXQgbG9ja2VkIGFuZAogIGF2b2lkIGEgcG9zc2libGUgcmFjZSBjb25k
aXRpb247CgpDaGFuZ2VzIHNpbmNlIHY2OgoqIFJlbW92ZWQgdmM0X3YzZF9iaW5fYm9fcHV0IGZy
b20gZXJyb3IgcGF0aHM7CiogQWRkZWQgV0FSTl9PTl9PTkNFIHdoZW4gbm8gYmluIEJPIGF0IHJl
ZmNvdW50IHJlbGVhc2UuCgpDaGFuZ2VzIHNpbmNlIHY1OgoqIEZpeCBtb3JlIGxvY2tpbmcgbWlz
dGFrZXM7CiogSW50cm9kdWNlIGdldC9wdXQgaGVscGVyczsKKiBHcmFiYmVkIGEgcmVmZXJlbmNl
IHdoZW4gc3VibWl0dGluZyBhbiBleGVjIGpvYiB3aXRoIGEgYmlubmVyIHNsb3QuCiogQWRkcmVz
c2VkIG1pc2MgY29tbWVudHMuCgpDaGFuZ2VzIHNpbmNlIHY0OgoqIFVzZWQgYSBrcmVmIG9uIHRo
ZSBiaW5uZXIgYm8gaW5zdGVhZCBvZiBmaXJzdG9wZW4vbGFzdGNsb3NlOwoqIEFkZGVkIGEgbXV0
ZXggdG8gcHJldmVudCByYWNlIGNvbmRpdGlvbnM7CiogVG9vayBjYXJlIG9mIGVuYWJsaW5nIHRo
ZSBPT00gaW50ZXJydXB0IHdoZW4gd2UgaGF2ZSBhIGJpbm5lciBCTyBhbGxvY2F0ZWQuCgpDaGFu
Z2VzIHNpbmNlIHYzOgoqIFNwbGl0IGNoYW5nZXMgaW50byBtb3JlIGNvbW1pdHMgd2hlbiBwb3Nz
aWJsZTsKKiBSZXdvcmtlZCBiaW5uZXIgYm8gYWxsb2MgY29uZGl0aW9uIGFzIGRpc2N1c3NlZC4K
CkNoYW5nZXMgc2luY2UgdjI6CiogUmVtb3ZlZCBkZXByZWNhdGVkIHNlbnRlbmNlIGFib3V0IGZy
aXN0b3BlbjsKKiBBZGRlZCBjb2xsZWN0ZWQgUmV2aWV3ZWQtQnkgdGFncy4KCkNoYW5nZXMgc2lu
Y2UgdjE6CiogU3F1YXNoZWQgdGhlIHR3byBmaW5hbCBwYXRjaGVzIGludG8gb25lLgoKUGF1bCBL
b2NpYWxrb3dza2kgKDQpOgogIGRybS92YzQ6IFJlZm9ybWF0IGFuZCB0aGUgYmlubmVyIGJvIGFs
bG9jYXRpb24gaGVscGVyCiAgZHJtL3ZjNDogQ2hlY2sgZm9yIFYzRCBiZWZvcmUgYmlubmVyIGJv
IGFsbG9jCiAgZHJtL3ZjNDogQ2hlY2sgZm9yIHRoZSBiaW5uZXIgYm8gYmVmb3JlIGhhbmRsaW5n
IE9PTSBpbnRlcnJ1cHQKICBkcm0vdmM0OiBBbGxvY2F0ZSBiaW5uZXIgYm8gd2hlbiBzdGFydGlu
ZyB0byB1c2UgdGhlIFYzRAoKIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2JvLmMgIHwgMzEgKysr
KysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuYyB8ICA2ICsrKwogZHJp
dmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmggfCAxNCArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9nZW0uYyB8IDExICsrKysrKwogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaXJxLmMg
fCAyMCArKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF92M2QuYyB8IDcyICsrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDEzMiBpbnNl
cnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
