Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D382CB3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ABA6E2FD;
	Tue,  6 Aug 2019 07:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2B289F38
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 16:17:29 +0000 (UTC)
X-Originating-IP: 79.51.24.150
Received: from uno.homenet.telecomitalia.it
 (host150-24-dynamic.51-79-r.retail.telecomitalia.it [79.51.24.150])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D4E52C000B;
 Mon,  5 Aug 2019 16:17:23 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 fabrizio.castro@bp.renesas.com
Subject: [PATCH v2] drm: rcar_lvds: Fix dual link mode operations
Date: Mon,  5 Aug 2019 18:18:37 +0200
Message-Id: <20190805161837.11856-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
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
ciBhbmQgdGhlIGNvbXBhbmlvbiBvbmUuCgpDdXJyZW50bHkgdGhlIGNvbXBhbmlvbiBlbmNvZGVy
IGZhaWxzIGF0IHByb2JlIHRpbWUsIGNhdXNpbmcgdGhlCnJlZ2lzdHJhdGlvbiBvZiB0aGUgcHJp
bWFyeSB0byBmYWlsIGFzIHdlbGwsIHByZXZlbnRpbmcgdGhlIHdob2xlIERVIHVuaXQKZnJvbSBi
ZWluZyByZWdpc3RlcmVkIGF0IGFsbC4KCkZpeCB0aGlzIGJ5IG5vdCBiYWlsaW5nIG91dCBmcm9t
IHByb2JlIHdpdGggZXJyb3IgaWYgdGhlCiJyZW5lc2FzLGNvbXBhbmlvbiIgcHJvcGVydHkgaXMg
bm90IHNwZWNpZmllZC4KCkZpeGVzOiBmYTQ0MGQ4NzAzNTggKCJkcm06IHJjYXItZHU6IGx2ZHM6
IEFkZCBzdXBwb3J0IGZvciBkdWFsLWxpbmsgbW9kZSIpClJlcG9ydGVkLWJ5OiBGYWJyaXppbyBD
YXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFj
b3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwpp
bmRleCBiYWRhN2VlOTg1NDQuLjBiODcyZDAwNzYwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9sdmRzLmMKQEAgLTY2MiwxMCArNjYyLDggQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2Vf
ZHRfY29tcGFuaW9uKHN0cnVjdCByY2FyX2x2ZHMgKmx2ZHMpCgogCS8qIExvY2F0ZSB0aGUgY29t
cGFuaW9uIExWRFMgZW5jb2RlciBmb3IgZHVhbC1saW5rIG9wZXJhdGlvbiwgaWYgYW55LiAqLwog
CWNvbXBhbmlvbiA9IG9mX3BhcnNlX3BoYW5kbGUoZGV2LT5vZl9ub2RlLCAicmVuZXNhcyxjb21w
YW5pb24iLCAwKTsKLQlpZiAoIWNvbXBhbmlvbikgewotCQlkZXZfZXJyKGRldiwgIkNvbXBhbmlv
biBMVkRTIGVuY29kZXIgbm90IGZvdW5kXG4iKTsKLQkJcmV0dXJuIC1FTlhJTzsKLQl9CisJaWYg
KCFjb21wYW5pb24pCisJCXJldHVybiAwOwoKIAkvKgogCSAqIFNhbml0eSBjaGVjazogdGhlIGNv
bXBhbmlvbiBlbmNvZGVyIG11c3QgaGF2ZSB0aGUgc2FtZSBjb21wYXRpYmxlCi0tCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
