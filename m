Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C77392726E6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 16:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292AE6E366;
	Mon, 21 Sep 2020 14:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13FC6E366
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:25:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62FDFAF90;
 Mon, 21 Sep 2020 14:26:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: christian.koenig@amd.com, airlied@redhat.com, daniel@ffwll.ch,
 nirmodas@amd.com
Subject: [PATCH] drm/vram-helper: Fix use of top-down placement
Date: Mon, 21 Sep 2020 16:25:36 +0200
Message-Id: <20200921142536.4392-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IDcwNTNlMGVhYjQ3MyAoImRybS92cmFtLWhlbHBlcjogc3RvcCB1c2luZyBUVE0gcGxh
Y2VtZW50IGZsYWdzIikKY2xlYXJlZCB0aGUgQk8gcGxhY2VtZW50IGZsYWdzIGlmIHRvcC1kb3du
IHBsYWNlbWVudCBoYWQgYmVlbiBzZWxlY3RlZC4KSGVuY2UsIEJPcyB0aGF0IHdlcmUgc3VwcG9z
ZWQgdG8gZ28gaW50byBWUkFNIGFyZSBub3cgcGxhY2VkIGluIGEgZGVmYXVsdApsb2NhdGlvbiBp
biBzeXN0ZW0gbWVtb3J5LgoKVHJ5aW5nIHRvIHNjYW5vdXQgdGhlIGluY29ycmVjdGx5IHBpbm5l
ZCBCTyByZXN1bHRzIGluIGRpc3BsYXllZCBnYXJiYWdlCmFuZCBhbiBlcnJvciBtZXNzYWdlLgoK
WyAgMTQ2LjEwODEyN10gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tClsgIDE0
Ni4xVjA4MTgwXSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxNTIgYXQgZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW1fdnJhbV9oZWxwZXIuYzoyODQgZHJtX2dlbV92cmFtX29mZnNldCsweDU5LzB4NjAgW2Ry
bV92cmFtX2hlbHBlcl0KLi4uClsgIDE0Ni4xMDg1OTFdICBhc3RfY3Vyc29yX3BhZ2VfZmxpcCsw
eDNlLzB4MTUwIFthc3RdClsgIDE0Ni4xMDg2MjJdICBhc3RfY3Vyc29yX3BsYW5lX2hlbHBlcl9h
dG9taWNfdXBkYXRlKzB4OGEvMHhjMCBbYXN0XQpbICAxNDYuMTA4NjU0XSAgZHJtX2F0b21pY19o
ZWxwZXJfY29tbWl0X3BsYW5lcysweDE5Ny8weDRjMApbICAxNDYuMTA4Njk5XSAgZHJtX2F0b21p
Y19oZWxwZXJfY29tbWl0X3RhaWxfcnBtKzB4NTkvMHhhMApbICAxNDYuMTA4NzE4XSAgY29tbWl0
X3RhaWwrMHgxMDMvMHgxYzAKLi4uClsgIDE0Ni4xMDkzMDJdIC0tLVsgZW5kIHRyYWNlIGQ5MDFh
MWJhMWQ5NDkwMzYgXS0tLQoKRml4IHRoZSBidWcgYnkga2VlcGluZyB0aGUgcGxhY2VtZW50IGZs
YWdzLiBUaGUgdG9wLWRvd24gcGxhY2VtZW50IGZsYWcKaXMgc3RvcmVkIGluIGEgc2VwYXJhdGUg
dmFyaWFibGUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRml4ZXM6IDcwNTNlMGVhYjQ3MyAoImRybS92cmFtLWhlbHBlcjogc3RvcCB1c2lu
ZyBUVE0gcGxhY2VtZW50IGZsYWdzIikKQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzog
TWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCmluZGV4IDUwY2FkMGU0YTkyZS4uMzc1
Yzc5ZTIzY2E1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTE0MCw3
ICsxNDAsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZ2VtX3ZyYW1fcGxhY2VtZW50KHN0cnVjdCBkcm1f
Z2VtX3ZyYW1fb2JqZWN0ICpnYm8sCiAJdW5zaWduZWQgaW50IGMgPSAwOwogCiAJaWYgKHBsX2Zs
YWcgJiBEUk1fR0VNX1ZSQU1fUExfRkxBR19UT1BET1dOKQotCQlwbF9mbGFnID0gVFRNX1BMX0ZM
QUdfVE9QRE9XTjsKKwkJaW52YXJpYW50X2ZsYWdzID0gVFRNX1BMX0ZMQUdfVE9QRE9XTjsKIAog
CWdiby0+cGxhY2VtZW50LnBsYWNlbWVudCA9IGdiby0+cGxhY2VtZW50czsKIAlnYm8tPnBsYWNl
bWVudC5idXN5X3BsYWNlbWVudCA9IGdiby0+cGxhY2VtZW50czsKLS0gCjIuMjguMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
