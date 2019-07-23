Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A963E71F2A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1936E38A;
	Tue, 23 Jul 2019 18:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686D26E317
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 16:55:54 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7A35E40005;
 Tue, 23 Jul 2019 16:55:49 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 fabrizio.castro@bp.renesas.com
Subject: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Date: Tue, 23 Jul 2019 18:57:00 +0200
Message-Id: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
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
Cc: "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFItQ2FyIExWRFMgZW5jb2RlciB1bml0cyBzdXBwb3J0IGR1YWwtbGluayBvcGVyYXRpb25z
IGJ5IHNwbGl0dGluZwp0aGUgcGl4ZWwgb3V0cHV0IGJldHdlZW4gdGhlIHByaW1hcnkgZW5jb2Rl
ciBhbmQgdGhlIGNvbXBhbmlvbiBvbmUuCgpJbiBvcmRlciBmb3IgdGhlIHByaW1hcnkgZW5jb2Rl
ciB0byBzdWNjZXNmdWxseSBjb250cm9sIHRoZSBjb21wYW5pb24ncwpvcGVyYXRpb25zIHRoaXMg
c2hvdWxkIG5vdCBmYWlsIGF0IHByb2JlIHRpbWUgYW5kIHJlZ2lzdGVyIGl0c2VsZiBpdHMKYXNz
b2NpYXRlZCBkcm0gYnJpZGdlIHNvIHRoYXQgdGhlIHByaW1hcnkgb25lIGNhbiBmaW5kIGl0LgoK
Q3VycmVudGx5IHRoZSBjb21wYW5pb24gZW5jb2RlciBmYWlscyBhdCBwcm9iZSB0aW1lLCBjYXVz
aW5nIHRoZQpyZWdpc3RyYXRpb24gb2YgdGhlIHByaW1hcnkgdG8gZmFpbCBwcmV2ZW50aW5nIHRo
ZSB3aG9sZSBEVSB1bml0IHRvIGJlCnJlZ2lzdGVyZWQgY29ycmVjdGx5LgoKRml4ZXM6IGZhNDQw
ZDg3MDM1OCAoImRybTogcmNhci1kdTogbHZkczogQWRkIHN1cHBvcnQgZm9yIGR1YWwtbGluayBt
b2RlIikKUmVwb3J0ZWQtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJl
bmVzYXMuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGpt
b25kaS5vcmc+CgotLS0KVGhlICJGaXhlcyIgdGFnIHJlZmVycyB0byBhIHBhdGNoIGN1cnJlbnRs
eSBwYXJ0IG9mIHRoZQpyZW5lc2FzLWRyaXZlcnMtMjAxOS0wNy0wOS12NS4yIGJyYW5jaCBvZiBH
ZWVydCdzIHJlbmVzYXMtZHJpdmVycyB0cmVlLgoKIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfbHZkcy5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9sdmRzLmMKaW5kZXggYmFkYTdlZTk4NTQ0Li44YjAxNWJhOTU4OTUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfbHZkcy5jCkBAIC03NjcsMTQgKzc2NywyOSBAQCBzdGF0aWMgaW50IHJj
YXJfbHZkc19wYXJzZV9kdChzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQogCW9mX25vZGVfcHV0KHJl
bW90ZV9pbnB1dCk7CiAJb2Zfbm9kZV9wdXQocmVtb3RlKTsKCi0JLyoKLQkgKiBPbiBEMy9FMyB0
aGUgTFZEUyBlbmNvZGVyIHByb3ZpZGVzIGEgY2xvY2sgdG8gdGhlIERVLCB3aGljaCBjYW4gYmUK
LQkgKiB1c2VkIGZvciB0aGUgRFBBRCBvdXRwdXQgZXZlbiB3aGVuIHRoZSBMVkRTIG91dHB1dCBp
cyBub3QgY29ubmVjdGVkLgotCSAqIERvbid0IGZhaWwgcHJvYmUgaW4gdGhhdCBjYXNlIGFzIHRo
ZSBEVSB3aWxsIG5lZWQgdGhlIGJyaWRnZSB0bwotCSAqIGNvbnRyb2wgdGhlIGNsb2NrLgotCSAq
LwotCWlmIChsdmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xWRFNfUVVJUktfRVhUX1BMTCkKLQkJ
cmV0dXJuIHJldCA9PSAtRU5PREVWID8gMCA6IHJldDsKKwlzd2l0Y2ggKHJldCkgeworCWNhc2Ug
LUVOT0RFVjoKKwkJLyoKKwkJICogT24gRDMvRTMgdGhlIExWRFMgZW5jb2RlciBwcm92aWRlcyBh
IGNsb2NrIHRvIHRoZSBEVSwgd2hpY2gKKwkJICogY2FuIGJlIHVzZWQgZm9yIHRoZSBEUEFEIG91
dHB1dCBldmVuIHdoZW4gdGhlIExWRFMgb3V0cHV0IGlzCisJCSAqIG5vdCBjb25uZWN0ZWQuIERv
bid0IGZhaWwgcHJvYmUgaW4gdGhhdCBjYXNlIGFzIHRoZSBEVSB3aWxsCisJCSAqIG5lZWQgdGhl
IGJyaWRnZSB0byBjb250cm9sIHRoZSBjbG9jay4KKwkJICovCisJCWlmIChsdmRzLT5pbmZvLT5x
dWlya3MgJiBSQ0FSX0xWRFNfUVVJUktfRVhUX1BMTCkKKwkJCXJldCA9IDA7CisJCWJyZWFrOwor
CWNhc2UgLUVOWElPOgorCQkvKgorCQkgKiBXaGVuIHRoZSBMVkRTIG91dHB1dCBpcyB1c2VkIGlu
IGR1YWwgbGluayBtb2RlLCB0aGUKKwkJICogY29tcGFuaW9uIGVuY29kZXIgZmFpbHMgYXQKKwkJ
ICogJ3JjYXJfbHZkc19wYXJzZV9kdF9jb21wYW5pb24oKScuIERvbid0IGZhaWwgcHJvYmUgaW4K
KwkJICogdGhhdCBjYXNlIGFzIHRoZSBtYXN0ZXIgZW5jb2RlciB3aWxsIG5lZWQgdGhlIGNvbXBh
bmlvbidzCisJCSAqIGJyaWRnZSB0byBjb250cm9sIGl0cyBvcGVyYXRpb25zLgorCQkgKi8KKwkJ
aWYgKGx2ZHMtPmluZm8tPnF1aXJrcyAmIFJDQVJfTFZEU19RVUlSS19EVUFMX0xJTkspCisJCQly
ZXQgPSAwOworCQlicmVhazsKKwl9CgogCXJldHVybiByZXQ7CiB9Ci0tCjIuMjIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
