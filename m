Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850ADAB80C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 14:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3016E27F;
	Fri,  6 Sep 2019 12:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380DA6E280
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 12:21:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8B7C8AE5C;
 Fri,  6 Sep 2019 12:20:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com, dave@stgolabs.net, kraxel@redhat.com
Subject: [PATCH v4 0/4] Implement lazy unmapping for GEM VRAM buffers
Date: Fri,  6 Sep 2019 14:20:52 +0200
Message-Id: <20190906122056.32018-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
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

R2VuZXJpYyBmYmRldiBlbXVsYXRpb24gbWFwcyBhbmQgdW5tYXBzIHRoZSBjb25zb2xlIEJPIGZv
ciB1cGRhdGluZyBpdCdzCmNvbnRlbnQgZnJvbSB0aGUgc2hhZG93IGJ1ZmZlci4gSWYgdGhpcyBp
bnZvbHZlcyBhbiBhY3R1YWwgbWFwcGluZwpvcGVyYXRpb24gKGluc3RlYWQgb2YgcmV1c2luZyBh
biBleGlzdGluZyBtYXBwaW5nKSwgbG90cyBvZiBkZWJ1ZyBtZXNzYWdlcwptYXkgYmUgcHJpbnRl
ZCwgc3VjaCBhcwoKICB4ODYvUEFUOiBPdmVybGFwIGF0IDB4ZDAwMDAwMDAtMHhkMTAwMDAwMAog
IHg4Ni9QQVQ6IHJlc2VydmVfbWVtdHlwZSBhZGRlZCBbbWVtIDB4ZDAwMDAwMDAtMHhkMDJmZmZm
Zl0sIHRyYWNrIHdyaXRlLWNvbWJpbmluZywgcmVxIHdyaXRlLWNvbWJpbmluZywgcmV0IHdyaXRl
LWNvbWJpbmluZwogIHg4Ni9QQVQ6IGZyZWVfbWVtdHlwZSByZXF1ZXN0IFttZW0gMHhkMDAwMDAw
MC0weGQwMmZmZmZmXQoKYXMgcmVwb3J0ZWQgYXQgWzFdLiBEcml2ZXJzIHVzaW5nIFZSQU0gaGVs
cGVycyBtYXkgYWxzbyBzZWUgcmVkdWNlZApwZXJmb3JtYW5jZSBhcyB0aGUgbWFwcGluZyBvcGVy
YXRpb25zIGNhbiBjcmVhdGUgb3ZlcmhlYWQuCgpJbiB2MyBhbmQgbGF0ZXIgb2YgdGhlIHBhdGNo
IHNldCwgdGhpcyBwcm9ibGVtIGlzIGJlaW5nIHNvbHZlZCBieSBsYXppbHkKdW5tYXBwaW5nIHRo
ZSBidWZmZXIgYXMgc3VnZ2VzdGVkIGJ5IEdlcmQuIFVubWFwcGluZyB3aXRoIGRybV9nZW1fdnJh
bV9rdW5tYXAoKQpvbmx5IGNoYW5nZXMgYSByZWZlcmVuY2UgY291bnRlci4gVlJBTSBoZWxwZXJz
IGxhdGVyIHBlcmZvcm0gdGhlIHVubWFwcGluZwpvcGVyYXRpb24gd2hlbiBUVE0gZXZpY3RzIHRo
ZSBidWZmZXIgb2JqZWN0IGZyb20gaXRzIGN1cnJlbnQgbG9jYXRpb24uIElmCnRoZSBidWZmZXIg
aXMgbmV2ZXIgZXZpY3RlZCwgdGhlIGV4aXN0aW5nIG1hcHBpbmcgaXMgcmV1c2VkIGJ5IGxhdGVy
IGNhbGxzCnRvIGRybV9nZW1fdnJhbV9rbWFwKCkuCgp2NDoKCSogbG9jayBrbWFwIHdpdGggdHRt
X2JvX3Jlc2VydmUoKQoJKiBhY3F1aXJlIGxvY2sgb25seSBvbmNlIGZvciB2bWFwKCkKCSogd2Fy
biBhYm91dCBzdGFsZSBtYXBwaW5ncyBkdXJpbmcgYnVmZmVyIGNsZWFudXAKdjM6CiAgICAgIAkq
IGltcGxlbWVudCBsYXp5IHVubWFwcGluZwp2MjoKCSogZml4ZWQgY29tbWVudCB0eXBvcwoKWzFd
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LVNl
cHRlbWJlci8yMzQzMDguaHRtbAoKVGhvbWFzIFppbW1lcm1hbm4gKDQpOgogIGRybS92cmFtOiBB
ZGQga21hcCByZWYtY291bnRpbmcgdG8gR0VNIFZSQU0gb2JqZWN0cwogIGRybS92cmFtOiBBY3F1
aXJlIGxvY2sgb25seSBvbmNlIHBlciBjYWxsIHRvIHZtYXAoKS92dW5tYXAoKQogIGRybS92cmFt
OiBBZGQgaW5mcmFzdHJ1Y3R1cmUgZm9yIG1vdmVfbm90aWZ5KCkKICBkcm0vdnJhbTogSW1wbGVt
ZW50IGxhenkgdW5tYXBwaW5nIGZvciBHRU0gVlJBTSBidWZmZXJzCgogZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8IDIyOSArKysrKysrKysrKysrKysrKystLS0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL2RybV92cmFtX21tX2hlbHBlci5jICB8ICAxMiArKwogaW5jbHVkZS9k
cm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICB8ICAxOCArKwogaW5jbHVkZS9kcm0vZHJtX3Zy
YW1fbW1faGVscGVyLmggICAgICB8ICAgNCArCiA0IGZpbGVzIGNoYW5nZWQsIDE5OCBpbnNlcnRp
b25zKCspLCA2NSBkZWxldGlvbnMoLSkKCi0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
