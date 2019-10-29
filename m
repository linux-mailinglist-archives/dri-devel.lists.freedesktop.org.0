Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEDAE81CA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 08:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25776E0CE;
	Tue, 29 Oct 2019 07:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2DA6E0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 07:06:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C513EB47C;
 Tue, 29 Oct 2019 07:06:19 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	noralf@tronnes.org
Subject: [PATCH 1/2] drm/todo: Convert drivers to generic fbdev emulation
Date: Tue, 29 Oct 2019 08:06:15 +0100
Message-Id: <20191029070616.3521-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191029070616.3521-1-tzimmermann@suse.de>
References: <20191029070616.3521-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXBsYWNlcyB0aGUgb3JpZ25hbCBUT0RPIGl0ZW0gZm9yIGRybV9mYl9oZWxwZXJfZmJk
ZXZfc2V0dXAoKSBhbmQKX3RlYXJkb3duKCksIHdoaWNoIGFyZSBkZXByZWNhdGVkLgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogRG9j
dW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgfCAxNSArKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAppbmRleCA2
NzkyZmE5YjZiNmIuLjRhYTc2NzQ2MWUwZSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUv
dG9kby5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKQEAgLTE3MSwxMCArMTcx
LDEwIEBAIENvbnRhY3Q6IE1haW50YWluZXIgb2YgdGhlIGRyaXZlciB5b3UgcGxhbiB0byBjb252
ZXJ0CiAKIExldmVsOiBJbnRlcm1lZGlhdGUKIAotQ29udmVydCBkcml2ZXJzIHRvIHVzZSBkcm1f
ZmJfaGVscGVyX2ZiZGV2X3NldHVwL3RlYXJkb3duKCkKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCitDb252ZXJ0IGRyaXZlcnMgdG8g
dXNlIGRybV9mYmRldl9nZW5lcmljX3NldHVwKCkKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogCi1Nb3N0IGRyaXZlcnMgY2FuIHVzZSBkcm1fZmJfaGVs
cGVyX2ZiZGV2X3NldHVwKCkgZXhjZXB0IG1heWJlOgorTW9zdCBkcml2ZXJzIGNhbiB1c2UgZHJt
X2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSBleGNlcHQgbWF5YmU6CiAKIC0gYW1kZ3B1IHdoaWNoIGhh
cyBzcGVjaWFsIGxvZ2ljIHRvIGRlY2lkZSB3aGV0aGVyIHRvIGNhbGwKICAgZHJtX2hlbHBlcl9k
aXNhYmxlX3VudXNlZF9mdW5jdGlvbnMoKQpAQCAtMTg0LDggKzE4NCwxMCBAQCBNb3N0IGRyaXZl
cnMgY2FuIHVzZSBkcm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwKCkgZXhjZXB0IG1heWJlOgogCiAt
IGk5MTUgd2hpY2ggY2FsbHMgZHJtX2ZiX2hlbHBlcl9pbml0aWFsX2NvbmZpZygpIGluIGEgd29y
a2VyCiAKLURyaXZlcnMgdGhhdCB1c2UgZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZSgpIHRvIGNsZWFu
IHVwIHRoZSBmYmRldiBmcmFtZWJ1ZmZlciBjYW4KLXByb2JhYmx5IHVzZSBkcm1fZmJfaGVscGVy
X2ZiZGV2X3RlYXJkb3duKCkuCitDdXJyZW50IGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIGV4cGVj
dHMgdGhlIGZyYW1lYnVmZmVyIGluIHN5c3RlbQorbWVtb3J5IChvciBzeXN0ZW0tbGlrZSBtZW1v
cnkpLiBUaGlzIG1pZ2h0IGJlIGEgcHJvYmxlbSBmb3IgY2VydGFpbgorZHJpdmVycy4gR2VuZXJp
YyBmYmRldiBlbXVsYXRpb24gc2hvdWxkIGhhdmUgYSB3YXkgb2Ygb3BlcmF0aW5nIG9uCitJL08g
bWVtb3J5LgogCiBDb250YWN0OiBNYWludGFpbmVyIG9mIHRoZSBkcml2ZXIgeW91IHBsYW4gdG8g
Y29udmVydAogCkBAIC0zMjgsOSArMzMwLDYgQEAgZHJtX2ZiX2hlbHBlciB0YXNrcwogICB0aGVz
ZSBpZ3QgdGVzdHMgbmVlZCB0byBiZSBmaXhlZDoga21zX2ZiY29uX2ZidEBwc3IgYW5kCiAgIGtt
c19mYmNvbl9mYnRAcHNyLXN1c3BlbmQuCiAKLS0gVGhlIG1heCBjb25uZWN0b3IgYXJndW1lbnQg
Zm9yIGRybV9mYl9oZWxwZXJfaW5pdCgpIGFuZAotICBkcm1fZmJfaGVscGVyX2ZiZGV2X3NldHVw
KCkgaXNuJ3QgdXNlZCBhbnltb3JlIGFuZCBjYW4gYmUgcmVtb3ZlZC4KLQogLSBUaGUgaGVscGVy
IGRvZXNuJ3Qga2VlcCBhbiBhcnJheSBvZiBjb25uZWN0b3JzIGFueW1vcmUgc28gdGhlc2UgY2Fu
IGJlCiAgIHJlbW92ZWQ6IGRybV9mYl9oZWxwZXJfc2luZ2xlX2FkZF9hbGxfY29ubmVjdG9ycygp
LAogICBkcm1fZmJfaGVscGVyX2FkZF9vbmVfY29ubmVjdG9yKCkgYW5kIGRybV9mYl9oZWxwZXJf
cmVtb3ZlX29uZV9jb25uZWN0b3IoKS4KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
